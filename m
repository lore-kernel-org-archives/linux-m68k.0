From: gerg@uclinux.org
Subject: [PATCH 1/2] m68knommu: modify ColdFire 53xx family to use PIT timer
Date: Tue, 27 May 2014 16:28:21 +1000
Message-ID: <1401172102-1599-2-git-send-email-gerg@uclinux.org>
References: <1401172102-1599-1-git-send-email-gerg@uclinux.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nskntqsrv01p.mx.bigpond.com ([61.9.168.231]:25078 "EHLO
	nskntqsrv01p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751607AbaE0Gk6 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Tue, 27 May 2014 02:40:58 -0400
In-Reply-To: <1401172102-1599-1-git-send-email-gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The ColdFire 53xx Family of SoCs (that is the 537x and 532x) contain the
more modern Freescale Programmable Interrupt Timer (PIT) hardware module.
Switch to using it in preference to the older timers.c driving code.

This will allow future clean ups to the old timers.c code that supports
the simple 16bit counter timer. The 53xx family also supports the 32bit
DMA timer hardware module, and we will use that for accurate timing.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/Kconfig.cpu                |  2 ++
 arch/m68k/include/asm/m53xxsim.h     | 19 ++++++++++---------
 arch/m68k/platform/coldfire/Makefile |  2 +-
 3 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index 33013df..a255f65 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -231,6 +231,7 @@ config M532x
 	depends on !MMU
 	select M53xx
 	select HAVE_CACHE_CB
+	select GENERIC_CLOCKEVENTS
 	help
 	  Freescale (Motorola) ColdFire 532x processor support.
 
@@ -239,6 +240,7 @@ config M537x
 	depends on !MMU
 	select M53xx
 	select HAVE_CACHE_CB
+	select GENERIC_CLOCKEVENTS
 	help
 	  Freescale ColdFire 537x processor support.
 
diff --git a/arch/m68k/include/asm/m53xxsim.h b/arch/m68k/include/asm/m53xxsim.h
index faa1a21..5497216 100644
--- a/arch/m68k/include/asm/m53xxsim.h
+++ b/arch/m68k/include/asm/m53xxsim.h
@@ -23,6 +23,7 @@
 #define MCFINT_FECRX0	    36		/* Interrupt number for FEC */
 #define MCFINT_FECTX0	    40		/* Interrupt number for FEC */
 #define MCFINT_FECENTC0	    42		/* Interrupt number for FEC */
+#define MCFINT_PIT1	    43		/* Interrupt number for PIT1 */
 
 #define MCF_IRQ_UART0       (MCFINT_VECBASE + MCFINT_UART0)
 #define MCF_IRQ_UART1       (MCFINT_VECBASE + MCFINT_UART1)
@@ -33,6 +34,7 @@
 #define MCF_IRQ_FECENTC0    (MCFINT_VECBASE + MCFINT_FECENTC0)
 
 #define	MCF_IRQ_QSPI	    (MCFINT_VECBASE + MCFINT_QSPI)
+#define MCF_IRQ_PIT1	    (MCFINT_VECBASE + MCFINT_PIT1)
 
 #define MCF_WTM_WCR		0xFC098000
 
@@ -82,15 +84,6 @@
 #define MCFINTC2_CIMR		(0)
 #define MCFINTC2_ICR0		(0)
 
-#define MCFSIM_ICR_TIMER1	(0xFC048040+32)
-#define MCFSIM_ICR_TIMER2	(0xFC048040+33)
-
-/*
- *	Define system peripheral IRQ usage.
- */
-#define	MCF_IRQ_TIMER		(64 + 32)	/* Timer0 */
-#define	MCF_IRQ_PROFILER	(64 + 33)	/* Timer1 */
-
 /*
  *  UART module.
  */
@@ -115,6 +108,14 @@
 #define	MCFQSPI_CS2		86
 
 /*
+ *  PIT timer module.
+ */
+#define MCFPIT_BASE1		0xFC080000	/* Base address of TIMER1 */
+#define MCFPIT_BASE2		0xFC084000	/* Base address of TIMER2 */
+#define MCFPIT_BASE3		0xFC088000	/* Base address of TIMER3 */
+#define MCFPIT_BASE4		0xFC08C000	/* Base address of TIMER4 */
+
+/*
  *  Timer module.
  */
 #define MCFTIMER_BASE1		0xFC070000	/* Base address of TIMER1 */
diff --git a/arch/m68k/platform/coldfire/Makefile b/arch/m68k/platform/coldfire/Makefile
index 68f0fac..0818f77 100644
--- a/arch/m68k/platform/coldfire/Makefile
+++ b/arch/m68k/platform/coldfire/Makefile
@@ -25,7 +25,7 @@ obj-$(CONFIG_M527x)	+= m527x.o pit.o intc-2.o reset.o
 obj-$(CONFIG_M5272)	+= m5272.o intc-5272.o timers.o
 obj-$(CONFIG_M528x)	+= m528x.o pit.o intc-2.o reset.o
 obj-$(CONFIG_M5307)	+= m5307.o timers.o intc.o reset.o
-obj-$(CONFIG_M53xx)	+= m53xx.o timers.o intc-simr.o reset.o
+obj-$(CONFIG_M53xx)	+= m53xx.o pit.o intc-simr.o reset.o
 obj-$(CONFIG_M5407)	+= m5407.o timers.o intc.o reset.o
 obj-$(CONFIG_M54xx)	+= m54xx.o sltimers.o intc-2.o
 obj-$(CONFIG_M5441x)	+= m5441x.o pit.o intc-simr.o reset.o
-- 
1.8.1.4
