From: Luis Alves <ljalvs@gmail.com>
Subject: [PATCH] MC68328 platform code fix
Date: Wed, 20 Feb 2013 23:47:02 +0000
Message-ID: <1361404022-3711-1-git-send-email-ljalvs@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-we0-f182.google.com ([74.125.82.182]:42116 "EHLO
	mail-we0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751143Ab3BTXrA (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 20 Feb 2013 18:47:00 -0500
Received: by mail-we0-f182.google.com with SMTP id t57so7253728wey.27
        for <linux-m68k@vger.kernel.org>; Wed, 20 Feb 2013 15:46:58 -0800 (PST)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: uclinux-dev@uclinux.org, linux-m68k@vger.kernel.org
Cc: gerg@uclinux.org, ljalvs@gmail.com

Hi,

This patch fixes the 68328 platform init code.
I've been able to successefully build the kernel for the Xcopilot (Pilot3) target.

A boot log can be found here: http://pastebin.com/9rT02vVi

Regards,
Luis


Signed-off-by: Luis Alves <ljalvs@gmail.com>
---
 arch/m68k/include/asm/MC68328.h     |   60 +++++++++++++++++------------------
 arch/m68k/platform/68000/m68328.c   |    6 ++--
 arch/m68k/platform/68000/m68EZ328.c |    1 +
 arch/m68k/platform/68000/m68VZ328.c |    1 +
 arch/m68k/platform/68000/timers.c   |   20 +++++++++---
 5 files changed, 49 insertions(+), 39 deletions(-)

diff --git a/arch/m68k/include/asm/MC68328.h b/arch/m68k/include/asm/MC68328.h
index a337e56..b3d7afb 100644
--- a/arch/m68k/include/asm/MC68328.h
+++ b/arch/m68k/include/asm/MC68328.h
@@ -288,12 +288,12 @@
 
 /* '328-compatible definitions */
 #define SPI_IRQ_NUM	SPIM_IRQ_NUM
-#define TMR_IRQ_NUM	TMR1_IRQ_NUM
+#define TMR_IRQ_NUM	TMR2_IRQ_NUM
  
 /*
  * Here go the bitmasks themselves
  */
-#define IMR_MSPIM 	(1 << SPIM _IRQ_NUM)	/* Mask SPI Master interrupt */
+#define IMR_MSPIM 	(1 << SPIM_IRQ_NUM)	/* Mask SPI Master interrupt */
 #define	IMR_MTMR2	(1 << TMR2_IRQ_NUM)	/* Mask Timer 2 interrupt */
 #define IMR_MUART	(1 << UART_IRQ_NUM)	/* Mask UART interrupt */	
 #define	IMR_MWDT	(1 << WDT_IRQ_NUM)	/* Mask Watchdog Timer interrupt */
@@ -327,7 +327,7 @@
 #define IWR_ADDR	0xfffff308
 #define IWR		LONG_REF(IWR_ADDR)
 
-#define IWR_SPIM 	(1 << SPIM _IRQ_NUM)	/* SPI Master interrupt */
+#define IWR_SPIM 	(1 << SPIM_IRQ_NUM)	/* SPI Master interrupt */
 #define	IWR_TMR2	(1 << TMR2_IRQ_NUM)	/* Timer 2 interrupt */
 #define IWR_UART	(1 << UART_IRQ_NUM)	/* UART interrupt */	
 #define	IWR_WDT		(1 << WDT_IRQ_NUM)	/* Watchdog Timer interrupt */
@@ -357,7 +357,7 @@
 #define ISR_ADDR	0xfffff30c
 #define ISR		LONG_REF(ISR_ADDR)
 
-#define ISR_SPIM 	(1 << SPIM _IRQ_NUM)	/* SPI Master interrupt */
+#define ISR_SPIM 	(1 << SPIM_IRQ_NUM)	/* SPI Master interrupt */
 #define	ISR_TMR2	(1 << TMR2_IRQ_NUM)	/* Timer 2 interrupt */
 #define ISR_UART	(1 << UART_IRQ_NUM)	/* UART interrupt */	
 #define	ISR_WDT		(1 << WDT_IRQ_NUM)	/* Watchdog Timer interrupt */
@@ -391,7 +391,7 @@
 #define IPR_ADDR	0xfffff310
 #define IPR		LONG_REF(IPR_ADDR)
 
-#define IPR_SPIM 	(1 << SPIM _IRQ_NUM)	/* SPI Master interrupt */
+#define IPR_SPIM 	(1 << SPIM_IRQ_NUM)	/* SPI Master interrupt */
 #define	IPR_TMR2	(1 << TMR2_IRQ_NUM)	/* Timer 2 interrupt */
 #define IPR_UART	(1 << UART_IRQ_NUM)	/* UART interrupt */	
 #define	IPR_WDT		(1 << WDT_IRQ_NUM)	/* Watchdog Timer interrupt */
@@ -708,8 +708,8 @@
 #define TCTL_FRR		0x0010	/* Free-Run Mode */
 
 /* 'EZ328-compatible definitions */
-#define TCTL_ADDR	TCTL1_ADDR
-#define TCTL		TCTL1
+#define TCTL_ADDR	TCTL2_ADDR
+#define TCTL		TCTL2
 
 /*
  * Timer Unit 1 and 2 Prescaler Registers
@@ -720,8 +720,8 @@
 #define TPRER2		WORD_REF(TPRER2_ADDR)
 
 /* 'EZ328-compatible definitions */
-#define TPRER_ADDR	TPRER1_ADDR
-#define TPRER		TPRER1
+#define TPRER_ADDR	TPRER2_ADDR
+#define TPRER		TPRER2
 
 /*
  * Timer Unit 1 and 2 Compare Registers
@@ -732,8 +732,8 @@
 #define TCMP2		WORD_REF(TCMP2_ADDR)
 
 /* 'EZ328-compatible definitions */
-#define TCMP_ADDR	TCMP1_ADDR
-#define TCMP		TCMP1
+#define TCMP_ADDR	TCMP2_ADDR
+#define TCMP		TCMP2
 
 /*
  * Timer Unit 1 and 2 Capture Registers
@@ -744,8 +744,8 @@
 #define TCR2		WORD_REF(TCR2_ADDR)
 
 /* 'EZ328-compatible definitions */
-#define TCR_ADDR	TCR1_ADDR
-#define TCR		TCR1
+#define TCR_ADDR	TCR2_ADDR
+#define TCR		TCR2
 
 /*
  * Timer Unit 1 and 2 Counter Registers
@@ -756,8 +756,8 @@
 #define TCN2		WORD_REF(TCN2_ADDR)
 
 /* 'EZ328-compatible definitions */
-#define TCN_ADDR	TCN1_ADDR
-#define TCN		TCN
+#define TCN_ADDR	TCN2_ADDR
+#define TCN		TCN2
 
 /*
  * Timer Unit 1 and 2 Status Registers
@@ -771,8 +771,8 @@
 #define TSTAT_CAPT	0x0001		/* Capture Event occurred */
 
 /* 'EZ328-compatible definitions */
-#define TSTAT_ADDR	TSTAT1_ADDR
-#define TSTAT		TSTAT1
+#define TSTAT_ADDR	TSTAT2_ADDR
+#define TSTAT		TSTAT2
 
 /*
  * Watchdog Compare Register 
@@ -973,27 +973,27 @@
 
 /* generalization of uart control registers to support multiple ports: */
 typedef volatile struct {
-  volatile unsigned short int ustcnt;
-  volatile unsigned short int ubaud;
+  volatile u16 ustcnt;
+  volatile u16 ubaud;
   union {
-    volatile unsigned short int w;
+    volatile u16 w;
     struct {
-      volatile unsigned char status;
-      volatile unsigned char rxdata;
+      volatile u8 status;
+      volatile u8 rxdata;
     } b;
   } urx;
   union {
-    volatile unsigned short int w;
+    volatile u16 w;
     struct {
-      volatile unsigned char status;
-      volatile unsigned char txdata;
+      volatile u8 status;
+      volatile u8 txdata;
     } b;
   } utx;
-  volatile unsigned short int umisc;
-  volatile unsigned short int pad1;
-  volatile unsigned short int pad2;
-  volatile unsigned short int pad3;
-} __attribute__((packed)) m68328_uart;
+  volatile u16 umisc;
+  volatile u16 pad1;
+  volatile u16 pad2;
+  volatile u16 pad3;
+} m68328_uart;
 
 
 /**********
diff --git a/arch/m68k/platform/68000/m68328.c b/arch/m68k/platform/68000/m68328.c
index a86eb66..c042e498 100644
--- a/arch/m68k/platform/68000/m68328.c
+++ b/arch/m68k/platform/68000/m68328.c
@@ -20,9 +20,6 @@
 #include <linux/rtc.h>
 #include <asm/machdep.h>
 #include <asm/MC68328.h>
-#if defined(CONFIG_PILOT) || defined(CONFIG_INIT_LCD)
-#include "bootlogo.h"
-#endif
 
 /***************************************************************************/
 
@@ -42,13 +39,14 @@ void m68328_reset (void)
 
 /***************************************************************************/
 
-void config_BSP(char *command, int len)
+void __init config_BSP(char *command, int len)
 {
   printk(KERN_INFO "\n68328 support D. Jeff Dionne <jeff@uclinux.org>\n");
   printk(KERN_INFO "68328 support Kenneth Albanowski <kjahds@kjshds.com>\n");
   printk(KERN_INFO "68328/Pilot support Bernhard Kuhn <kuhn@lpr.e-technik.tu-muenchen.de>\n");
 
   mach_hwclk = m68328_hwclk;
+  mach_sched_init = hw_timer_init;
   mach_reset = m68328_reset;
 }
 
diff --git a/arch/m68k/platform/68000/m68EZ328.c b/arch/m68k/platform/68000/m68EZ328.c
index a6eb72d..84a1a9d 100644
--- a/arch/m68k/platform/68000/m68EZ328.c
+++ b/arch/m68k/platform/68000/m68EZ328.c
@@ -70,6 +70,7 @@ void config_BSP(char *command, int len)
 #endif
  
   mach_hwclk = m68328_hwclk;
+  mach_sched_init = hw_timer_init;
   mach_reset = m68ez328_reset;
 }
 
diff --git a/arch/m68k/platform/68000/m68VZ328.c b/arch/m68k/platform/68000/m68VZ328.c
index eb6964f..8c4ae7a 100644
--- a/arch/m68k/platform/68000/m68VZ328.c
+++ b/arch/m68k/platform/68000/m68VZ328.c
@@ -182,6 +182,7 @@ void config_BSP(char *command, int size)
 	init_hardware(command, size);
 
 	mach_hwclk = m68328_hwclk;
+	mach_sched_init = hw_timer_init;
 	mach_reset = m68vz328_reset;
 }
 
diff --git a/arch/m68k/platform/68000/timers.c b/arch/m68k/platform/68000/timers.c
index ec30acb..49b4b63 100644
--- a/arch/m68k/platform/68000/timers.c
+++ b/arch/m68k/platform/68000/timers.c
@@ -24,7 +24,16 @@
 #include <asm/setup.h>
 #include <asm/pgtable.h>
 #include <asm/machdep.h>
+#if defined(CONFIG_M68EZ328)
+#include <asm/MC68EZ328.h>
+#else
+#if defined(CONFIG_M68VZ328)
 #include <asm/MC68VZ328.h>
+#else
+#include <asm/MC68328.h>
+#endif /* CONFIG_M68VZ328 */
+#endif /* CONFIG_M68EZ328 */
+
 
 /***************************************************************************/
 
@@ -105,18 +114,19 @@ void hw_timer_init(irq_handler_t handler)
 	/* disable timer 1 */
 	TCTL = 0;
 
-	/* set ISR */
-	setup_irq(TMR_IRQ_NUM, &m68328_timer_irq);
-
 	/* Restart mode, Enable int, Set clock source */
 	TCTL = TCTL_OM | TCTL_IRQEN | CLOCK_SOURCE;
 	TPRER = CLOCK_PRE;
 	TCMP = TICKS_PER_JIFFY;
 
-	/* Enable timer 1 */
-	TCTL |= TCTL_TEN;
 	clocksource_register_hz(&m68328_clk, TICKS_PER_JIFFY*HZ);
 	timer_interrupt = handler;
+	
+	/* set ISR */
+	setup_irq(TMR_IRQ_NUM, &m68328_timer_irq);
+
+	/* Enable timer 1 */
+	TCTL |= TCTL_TEN;
 }
 
 /***************************************************************************/
-- 
1.7.10.4
