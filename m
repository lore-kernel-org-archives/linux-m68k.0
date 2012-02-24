From: <gerg@snapgear.com>
Subject: [PATCH 3/7] m68knommu: make 5249 QSPI platform addressing consistent
Date: Fri, 24 Feb 2012 15:06:51 +1000
Message-ID: <1330060015-10877-4-git-send-email-gerg@snapgear.com>
References: <1330060015-10877-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:28500 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751176Ab2BXFGb (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 24 Feb 2012 00:06:31 -0500
In-Reply-To: <1330060015-10877-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

If we make all QSPI (SPI protocol) addressing consistent across all ColdFire
family members then we will be able to remove the duplicated plaform data
and code and use a single setup for all.

So modify the ColdFire 5249 QSPI addressing so that:

. base addresses are absolute (not relative to MBAR peripheral register)
. use a common name for IRQs used
. move chip select definitions (CS) to appropriate header

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m5249sim.h |   11 +++++++++++
 arch/m68k/include/asm/mcfqspi.h  |    2 --
 arch/m68k/platform/5249/config.c |    9 ++-------
 3 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/arch/m68k/include/asm/m5249sim.h b/arch/m68k/include/asm/m5249sim.h
index 3e31508..7f0c2c3 100644
--- a/arch/m68k/include/asm/m5249sim.h
+++ b/arch/m68k/include/asm/m5249sim.h
@@ -80,6 +80,17 @@
 #define MCFUART_BASE1		(MCF_MBAR + 0x200)	/* Base address UART1 */
 
 /*
+ *	QSPI module.
+ */
+#define	MCFQSPI_BASE		(MCF_MBAR + 0x300)	/* Base address QSPI */
+#define	MCFQSPI_SIZE		0x40			/* Register set size */
+
+#define	MCFQSPI_CS0		29
+#define	MCFQSPI_CS1		24
+#define	MCFQSPI_CS2		21
+#define	MCFQSPI_CS3		22
+
+/*
  *	DMA unit base addresses.
  */
 #define MCFDMA_BASE0		(MCF_MBAR + 0x300)	/* Base address DMA 0 */
diff --git a/arch/m68k/include/asm/mcfqspi.h b/arch/m68k/include/asm/mcfqspi.h
index 62148b7..e9a7e1a 100644
--- a/arch/m68k/include/asm/mcfqspi.h
+++ b/arch/m68k/include/asm/mcfqspi.h
@@ -23,8 +23,6 @@
 
 #if defined(CONFIG_M527x) || defined(CONFIG_M528x)
 #define	MCFQSPI_IOBASE		(MCF_IPSBAR + 0x340)
-#elif defined(CONFIG_M5249)
-#define MCFQSPI_IOBASE         (MCF_MBAR + 0x300)
 #elif defined(CONFIG_M532x)
 #define MCFQSPI_IOBASE         0xFC058000
 #endif
diff --git a/arch/m68k/platform/5249/config.c b/arch/m68k/platform/5249/config.c
index 3871251..b7feb92 100644
--- a/arch/m68k/platform/5249/config.c
+++ b/arch/m68k/platform/5249/config.c
@@ -48,8 +48,8 @@ static struct platform_device m5249_smc91x = {
 #if defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE)
 static struct resource m5249_qspi_resources[] = {
 	{
-		.start		= MCFQSPI_IOBASE,
-		.end		= MCFQSPI_IOBASE + MCFQSPI_IOSIZE - 1,
+		.start		= MCFQSPI_BASE,
+		.end		= MCFQSPI_BASE + MCFQSPI_SIZE - 1,
 		.flags		= IORESOURCE_MEM,
 	},
 	{
@@ -59,11 +59,6 @@ static struct resource m5249_qspi_resources[] = {
 	},
 };
 
-#define MCFQSPI_CS0    29
-#define MCFQSPI_CS1    24
-#define MCFQSPI_CS2    21
-#define MCFQSPI_CS3    22
-
 static int m5249_cs_setup(struct mcfqspi_cs_control *cs_control)
 {
 	int status;
-- 
1.7.0.4
