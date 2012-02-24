From: <gerg@snapgear.com>
Subject: [PATCH 6/7] m68knommu: make 532x QSPI platform addressing consistent
Date: Fri, 24 Feb 2012 15:06:54 +1000
Message-ID: <1330060015-10877-7-git-send-email-gerg@snapgear.com>
References: <1330060015-10877-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:17065 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751176Ab2BXFHg (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 24 Feb 2012 00:07:36 -0500
In-Reply-To: <1330060015-10877-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

If we make all QSPI (SPI protocol) addressing consistent across all ColdFire
family members then we will be able to remove the duplicated plaform data
and code and use a single setup for all.

So modify the ColdFire 532x QSPI addressing so that:

. base addresses are absolute (not relative to MBAR peripheral register)
. use a common name for IRQs used
. move chip select definitions (CS) to appropriate header

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m532xsim.h |   12 ++++++++++++
 arch/m68k/include/asm/mcfqspi.h  |    5 -----
 arch/m68k/platform/532x/config.c |   12 ++++--------
 3 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/arch/m68k/include/asm/m532xsim.h b/arch/m68k/include/asm/m532xsim.h
index f1c4fa8..29b66e2 100644
--- a/arch/m68k/include/asm/m532xsim.h
+++ b/arch/m68k/include/asm/m532xsim.h
@@ -36,6 +36,8 @@
 #define MCF_IRQ_FECTX0	    (MCFINT_VECBASE + MCFINT_FECTX0)
 #define MCF_IRQ_FECENTC0    (MCFINT_VECBASE + MCFINT_FECENTC0)
 
+#define	MCF_IRQ_QSPI	    (MCFINT_VECBASE + MCFINT_QSPI)
+
 #define MCF_WTM_WCR	MCF_REG16(0xFC098000)
 
 /*
@@ -104,6 +106,16 @@
 #define	MCFFEC_SIZE0		0x800		/* Size of FEC0 region */
 
 /*
+ *  QSPI module.
+ */
+#define	MCFQSPI_BASE		0xFC058000	/* Base address of QSPI */
+#define	MCFQSPI_SIZE		0x40		/* Size of QSPI region */
+
+#define	MCFQSPI_CS0		84
+#define	MCFQSPI_CS1		85
+#define	MCFQSPI_CS2		86
+
+/*
  *  Timer module.
  */
 #define MCFTIMER_BASE1		0xFC070000	/* Base address of TIMER1 */
diff --git a/arch/m68k/include/asm/mcfqspi.h b/arch/m68k/include/asm/mcfqspi.h
index f3d9640..7b51416 100644
--- a/arch/m68k/include/asm/mcfqspi.h
+++ b/arch/m68k/include/asm/mcfqspi.h
@@ -21,11 +21,6 @@
 #ifndef mcfqspi_h
 #define mcfqspi_h
 
-#if defined(CONFIG_M532x)
-#define MCFQSPI_IOBASE         0xFC058000
-#endif
-#define MCFQSPI_IOSIZE		0x40
-
 /**
  * struct mcfqspi_cs_control - chip select control for the coldfire qspi driver
  * @setup: setup the control; allocate gpio's, etc. May be NULL.
diff --git a/arch/m68k/platform/532x/config.c b/arch/m68k/platform/532x/config.c
index e340dac..058ba5d 100644
--- a/arch/m68k/platform/532x/config.c
+++ b/arch/m68k/platform/532x/config.c
@@ -36,21 +36,17 @@
 #if defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE)
 static struct resource m532x_qspi_resources[] = {
 	{
-		.start		= MCFQSPI_IOBASE,
-		.end		= MCFQSPI_IOBASE + MCFQSPI_IOSIZE - 1,
+		.start		= MCFQSPI_BASE,
+		.end		= MCFQSPI_BASE + MCFQSPI_SIZE - 1,
 		.flags		= IORESOURCE_MEM,
 	},
 	{
-		.start		= MCFINT_VECBASE + MCFINT_QSPI,
-		.end		= MCFINT_VECBASE + MCFINT_QSPI,
+		.start		= MCF_IRQ_QSPI,
+		.end		= MCF_IRQ_QSPI,
 		.flags		= IORESOURCE_IRQ,
 	},
 };
 
-#define MCFQSPI_CS0    84
-#define MCFQSPI_CS1    85
-#define MCFQSPI_CS2    86
-
 static int m532x_cs_setup(struct mcfqspi_cs_control *cs_control)
 {
 	int status;
-- 
1.7.0.4
