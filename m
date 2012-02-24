From: <gerg@snapgear.com>
Subject: [PATCH 4/7] m68knommu: make 527x QSPI platform addressing consistent
Date: Fri, 24 Feb 2012 15:06:52 +1000
Message-ID: <1330060015-10877-5-git-send-email-gerg@snapgear.com>
References: <1330060015-10877-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:28475 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750912Ab2BXFGH (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 24 Feb 2012 00:06:07 -0500
In-Reply-To: <1330060015-10877-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

If we make all QSPI (SPI protocol) addressing consistent across all ColdFire
family members then we will be able to remove the duplicated plaform data
and code and use a single setup for all.

So modify the ColdFire 527x QSPI addressing so that:

. base addresses are absolute (not relative to MBAR peripheral register)
. use a common name for IRQs used
. move chip select definitions (CS) to appropriate header

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m527xsim.h |   24 ++++++++++++++++++++++++
 arch/m68k/include/asm/mcfqspi.h  |    2 +-
 arch/m68k/platform/527x/config.c |   20 ++++----------------
 3 files changed, 29 insertions(+), 17 deletions(-)

diff --git a/arch/m68k/include/asm/m527xsim.h b/arch/m68k/include/asm/m527xsim.h
index 59bb776..f1c5b2c 100644
--- a/arch/m68k/include/asm/m527xsim.h
+++ b/arch/m68k/include/asm/m527xsim.h
@@ -59,6 +59,8 @@
 #define	MCF_IRQ_FECTX1		(MCFINT2_VECBASE + MCFINT2_FECTX1)
 #define	MCF_IRQ_FECENTC1	(MCFINT2_VECBASE + MCFINT2_FECENTC1)
 
+#define	MCF_IRQ_QSPI		(MCFINT_VECBASE + MCFINT_QSPI)
+
 /*
  *	SDRAM configuration registers.
  */
@@ -103,6 +105,28 @@
 #define	MCFFEC_BASE1		(MCF_IPSBAR + 0x1800)
 #define	MCFFEC_SIZE1		0x800
 
+/*
+ *	QSPI module.
+ */
+#define	MCFQSPI_BASE		(MCF_IPSBAR + 0x340)
+#define	MCFQSPI_SIZE		0x40
+
+#ifdef CONFIG_M5271
+#define	MCFQSPI_CS0		91
+#define	MCFQSPI_CS1		92
+#define	MCFQSPI_CS2		99
+#define	MCFQSPI_CS3		103
+#endif
+#ifdef CONFIG_M5275
+#define	MCFQSPI_CS0		59
+#define	MCFQSPI_CS1		60
+#define	MCFQSPI_CS2		61
+#define	MCFQSPI_CS3		62
+#endif
+
+/*
+ *	GPIO module.
+ */
 #ifdef CONFIG_M5271
 #define MCFGPIO_PODR_ADDR	(MCF_IPSBAR + 0x100000)
 #define MCFGPIO_PODR_DATAH	(MCF_IPSBAR + 0x100001)
diff --git a/arch/m68k/include/asm/mcfqspi.h b/arch/m68k/include/asm/mcfqspi.h
index e9a7e1a..57fcbc2 100644
--- a/arch/m68k/include/asm/mcfqspi.h
+++ b/arch/m68k/include/asm/mcfqspi.h
@@ -21,7 +21,7 @@
 #ifndef mcfqspi_h
 #define mcfqspi_h
 
-#if defined(CONFIG_M527x) || defined(CONFIG_M528x)
+#if defined(CONFIG_M528x)
 #define	MCFQSPI_IOBASE		(MCF_IPSBAR + 0x340)
 #elif defined(CONFIG_M532x)
 #define MCFQSPI_IOBASE         0xFC058000
diff --git a/arch/m68k/platform/527x/config.c b/arch/m68k/platform/527x/config.c
index 9f31c29..cc5311b 100644
--- a/arch/m68k/platform/527x/config.c
+++ b/arch/m68k/platform/527x/config.c
@@ -29,29 +29,17 @@
 #if defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE)
 static struct resource m527x_qspi_resources[] = {
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
 
-#if defined(CONFIG_M5271)
-#define MCFQSPI_CS0    91
-#define MCFQSPI_CS1    92
-#define MCFQSPI_CS2    99
-#define MCFQSPI_CS3    103
-#elif defined(CONFIG_M5275)
-#define MCFQSPI_CS0    59
-#define MCFQSPI_CS1    60
-#define MCFQSPI_CS2    61
-#define MCFQSPI_CS3    62
-#endif
-
 static int m527x_cs_setup(struct mcfqspi_cs_control *cs_control)
 {
 	int status;
-- 
1.7.0.4
