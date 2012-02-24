From: <gerg@snapgear.com>
Subject: [PATCH 1/7] m68knommu: make 520x QSPI platform addressing consistent
Date: Fri, 24 Feb 2012 15:06:49 +1000
Message-ID: <1330060015-10877-2-git-send-email-gerg@snapgear.com>
References: <1330060015-10877-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:28499 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750912Ab2BXFGa (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 24 Feb 2012 00:06:30 -0500
In-Reply-To: <1330060015-10877-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

If we make all QSPI (SPI protocol) addressing consistent across all ColdFire
family members then we will be able to remove the duplicated plaform data
and code and use a single setup for all.

So modify the ColdFire 520x QSPI addressing so that:

. base addresses are absolute (not relative to MBAR peripheral register)
. use a common name for IRQs used
. move chip select definitions (CS) to appropriate header

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m520xsim.h |   12 ++++++++++++
 arch/m68k/include/asm/mcfqspi.h  |    2 --
 arch/m68k/platform/520x/config.c |   12 ++++--------
 3 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/arch/m68k/include/asm/m520xsim.h b/arch/m68k/include/asm/m520xsim.h
index b83cee2..17f2aab 100644
--- a/arch/m68k/include/asm/m520xsim.h
+++ b/arch/m68k/include/asm/m520xsim.h
@@ -61,6 +61,8 @@
 #define MCF_IRQ_FECTX0	    (MCFINT_VECBASE + MCFINT_FECTX0)
 #define MCF_IRQ_FECENTC0    (MCFINT_VECBASE + MCFINT_FECENTC0)
 
+#define	MCF_IRQ_QSPI	    (MCFINT_VECBASE + MCFINT_QSPI)
+
 /*
  *  SDRAM configuration registers.
  */
@@ -166,6 +168,16 @@
 #define	MCFFEC_SIZE0		0x800		/* Register set size */
 
 /*
+ *  QSPI module.
+ */
+#define	MCFQSPI_BASE		0xFC05C000	/* Base of QSPI module */
+#define	MCFQSPI_SIZE		0x40		/* Register set size */
+
+#define	MCFQSPI_CS0		46
+#define	MCFQSPI_CS1		47
+#define	MCFQSPI_CS2		27
+
+/*
  *  Reset Control Unit.
  */
 #define	MCF_RCR			0xFC0A0000
diff --git a/arch/m68k/include/asm/mcfqspi.h b/arch/m68k/include/asm/mcfqspi.h
index 7fe6319..34a531e 100644
--- a/arch/m68k/include/asm/mcfqspi.h
+++ b/arch/m68k/include/asm/mcfqspi.h
@@ -25,8 +25,6 @@
 #define	MCFQSPI_IOBASE		(MCF_IPSBAR + 0x340)
 #elif defined(CONFIG_M5249)
 #define MCFQSPI_IOBASE         (MCF_MBAR + 0x300)
-#elif defined(CONFIG_M520x)
-#define MCFQSPI_IOBASE         0xFC05C000
 #elif defined(CONFIG_M532x)
 #define MCFQSPI_IOBASE         0xFC058000
 #endif
diff --git a/arch/m68k/platform/520x/config.c b/arch/m68k/platform/520x/config.c
index 709291d..9b7dad9 100644
--- a/arch/m68k/platform/520x/config.c
+++ b/arch/m68k/platform/520x/config.c
@@ -28,21 +28,17 @@
 #if defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE)
 static struct resource m520x_qspi_resources[] = {
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
 
-#define MCFQSPI_CS0    46
-#define MCFQSPI_CS1    47
-#define MCFQSPI_CS2    27
-
 static int m520x_cs_setup(struct mcfqspi_cs_control *cs_control)
 {
 	int status;
-- 
1.7.0.4
