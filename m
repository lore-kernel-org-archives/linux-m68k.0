From: Angelo Dureghello <angelo@sysam.it>
Subject: [PATCH] m68k: add Sysam AMCORE open board support
Date: Thu, 29 Sep 2016 01:00:25 +0200
Message-ID: <1475103625-25376-1-git-send-email-angelo@sysam.it>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sysam.it ([5.39.81.93]:59051 "EHLO sysam.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753162AbcI1XHL (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Wed, 28 Sep 2016 19:07:11 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Angelo Dureghello <angelo@sysam.it>

Add support for Sysam AMCORE board, an open hardware embedded Linux
board, see http://sysam.it/openzone/projects/amcore/amcore.html for
any info.

Signed-off-by: Angelo Dureghello <angelo@sysam.it>
---
 arch/m68k/Kconfig.machine        | 6 ++++++
 arch/m68k/coldfire/Makefile      | 1 +
 arch/m68k/include/asm/m5307sim.h | 7 +++++++
 3 files changed, 14 insertions(+)

diff --git a/arch/m68k/Kconfig.machine b/arch/m68k/Kconfig.machine
index 2a5c7ab..9225b4a 100644
--- a/arch/m68k/Kconfig.machine
+++ b/arch/m68k/Kconfig.machine
@@ -259,6 +259,12 @@ config M5407C3
 	help
 	  Support for the Motorola M5407C3 board.
 
+config AMCORE
+	bool "Sysam AMCORE board support"
+	depends on M5307
+	help
+	  Support for the Sysam AMCORE open-hardware generic board.
+
 config FIREBEE
 	bool "FireBee board support"
 	depends on M547x
diff --git a/arch/m68k/coldfire/Makefile b/arch/m68k/coldfire/Makefile
index 68f0fac..4aa2c57 100644
--- a/arch/m68k/coldfire/Makefile
+++ b/arch/m68k/coldfire/Makefile
@@ -34,6 +34,7 @@ obj-$(CONFIG_NETtel)	+= nettel.o
 obj-$(CONFIG_CLEOPATRA)	+= nettel.o
 obj-$(CONFIG_FIREBEE)	+= firebee.o
 obj-$(CONFIG_MCF8390)	+= mcf8390.o
+obj-$(CONFIG_AMCORE)    += amcore.o
 
 obj-$(CONFIG_PCI)	+= pci.o
 
diff --git a/arch/m68k/include/asm/m5307sim.h b/arch/m68k/include/asm/m5307sim.h
index 5d0bb7e..81f1afd 100644
--- a/arch/m68k/include/asm/m5307sim.h
+++ b/arch/m68k/include/asm/m5307sim.h
@@ -131,6 +131,11 @@
 #define MCFGPIO_IRQ_MAX		-1
 #define MCFGPIO_IRQ_VECBASE	-1
 
+/*
+ * I2C module.
+ */
+#define MCFI2C_IOBASE		(MCF_MBAR + 0x280)
+
 
 /* Definition offset address for CS2-7  -- old mask 5307 */
 
@@ -148,6 +153,7 @@
 #define	MCFSIM_SWDICR		MCFSIM_ICR0	/* Watchdog timer ICR */
 #define	MCFSIM_TIMER1ICR	MCFSIM_ICR1	/* Timer 1 ICR */
 #define	MCFSIM_TIMER2ICR	MCFSIM_ICR2	/* Timer 2 ICR */
+#define MCFSIM_I2CICR		MCFSIM_ICR3	/* I2C ICR */
 #define	MCFSIM_UART1ICR		MCFSIM_ICR4	/* UART 1 ICR */
 #define	MCFSIM_UART2ICR		MCFSIM_ICR5	/* UART 2 ICR */
 #define	MCFSIM_DMA0ICR		MCFSIM_ICR6	/* DMA 0 ICR */
@@ -174,6 +180,7 @@
 /*
  *	Define system peripheral IRQ usage.
  */
+#define MCF_IRQ_I2C		29		/* I2C */
 #define	MCF_IRQ_TIMER		30		/* Timer0, Level 6 */
 #define	MCF_IRQ_PROFILER	31		/* Timer1, Level 7 */
 #define	MCF_IRQ_UART0		73		/* UART0 */
-- 
2.8.1
