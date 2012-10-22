From: <gerg@snapgear.com>
Subject: [PATCH] m68knommu: merge ColdFire 5249 and 525x definitions
Date: Mon, 22 Oct 2012 15:50:31 +1000
Message-ID: <1350885031-21976-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dnvwsmailout1.mcafee.com ([161.69.31.173]:45678 "EHLO
	DNVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752206Ab2JVFp2 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 22 Oct 2012 01:45:28 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The ColdFire 5249 and 525x family of SoCs are very similar. Most of the
internals are the same, and are mapped the same. We can use a single set of
peripheral definitions for all of them.

So merge the current m5249sim.h and m525xsim.h definitions into a single
file. The 5249 is now obsolete, and the 525x parts are current, so I have
chosen to move everything into the existing m525xsim.h file.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m5249sim.h        |  269 -------------------------------
 arch/m68k/include/asm/m525xsim.h        |  116 +++++++++++++-
 arch/m68k/include/asm/mcfsim.h          |    5 +-
 arch/m68k/platform/coldfire/intc-5249.c |    8 +-
 arch/m68k/platform/coldfire/m5249.c     |    8 +-
 5 files changed, 124 insertions(+), 282 deletions(-)
 delete mode 100644 arch/m68k/include/asm/m5249sim.h

diff --git a/arch/m68k/include/asm/m5249sim.h b/arch/m68k/include/asm/m5249sim.h
deleted file mode 100644
index fdf45e6..0000000
--- a/arch/m68k/include/asm/m5249sim.h
+++ /dev/null
@@ -1,269 +0,0 @@
-/****************************************************************************/
-
-/*
- *	m5249sim.h -- ColdFire 5249 System Integration Module support.
- *
- *	(C) Copyright 2002, Greg Ungerer (gerg@snapgear.com)
- */
-
-/****************************************************************************/
-#ifndef	m5249sim_h
-#define	m5249sim_h
-/****************************************************************************/
-
-#define	CPU_NAME		"COLDFIRE(m5249)"
-#define	CPU_INSTR_PER_JIFFY	3
-#define	MCF_BUSCLK		(MCF_CLK / 2)
-
-#include <asm/m52xxacr.h>
-
-/*
- *	The 5249 has a second MBAR region, define its address.
- */
-#define MCF_MBAR2		0x80000000
-
-/*
- *	Define the 5249 SIM register set addresses.
- */
-#define	MCFSIM_RSR		(MCF_MBAR + 0x00)	/* Reset Status */
-#define	MCFSIM_SYPCR		(MCF_MBAR + 0x01)	/* System Protection */
-#define	MCFSIM_SWIVR		(MCF_MBAR + 0x02)	/* SW Watchdog intr */
-#define	MCFSIM_SWSR		(MCF_MBAR + 0x03)	/* SW Watchdog srv */
-#define	MCFSIM_PAR		(MCF_MBAR + 0x04)	/* Pin Assignment */
-#define	MCFSIM_IRQPAR		(MCF_MBAR + 0x06)	/* Intr Assignment */
-#define	MCFSIM_MPARK		(MCF_MBAR + 0x0C)	/* BUS Master Ctrl */
-#define	MCFSIM_IPR		(MCF_MBAR + 0x40)	/* Interrupt Pending */
-#define	MCFSIM_IMR		(MCF_MBAR + 0x44)	/* Interrupt Mask */
-#define	MCFSIM_AVR		(MCF_MBAR + 0x4b)	/* Autovector Ctrl */
-#define	MCFSIM_ICR0		(MCF_MBAR + 0x4c)	/* Intr Ctrl reg 0 */
-#define	MCFSIM_ICR1		(MCF_MBAR + 0x4d)	/* Intr Ctrl reg 1 */
-#define	MCFSIM_ICR2		(MCF_MBAR + 0x4e)	/* Intr Ctrl reg 2 */
-#define	MCFSIM_ICR3		(MCF_MBAR + 0x4f)	/* Intr Ctrl reg 3 */
-#define	MCFSIM_ICR4		(MCF_MBAR + 0x50)	/* Intr Ctrl reg 4 */
-#define	MCFSIM_ICR5		(MCF_MBAR + 0x51)	/* Intr Ctrl reg 5 */
-#define	MCFSIM_ICR6		(MCF_MBAR + 0x52)	/* Intr Ctrl reg 6 */
-#define	MCFSIM_ICR7		(MCF_MBAR + 0x53)	/* Intr Ctrl reg 7 */
-#define	MCFSIM_ICR8		(MCF_MBAR + 0x54)	/* Intr Ctrl reg 8 */
-#define	MCFSIM_ICR9		(MCF_MBAR + 0x55)	/* Intr Ctrl reg 9 */
-#define	MCFSIM_ICR10		(MCF_MBAR + 0x56)	/* Intr Ctrl reg 10 */
-#define	MCFSIM_ICR11		(MCF_MBAR + 0x57)	/* Intr Ctrl reg 11 */
-
-#define	MCFSIM_CSAR0		(MCF_MBAR + 0x80)	/* CS 0 Address reg */
-#define	MCFSIM_CSMR0		(MCF_MBAR + 0x84)	/* CS 0 Mask reg */
-#define	MCFSIM_CSCR0		(MCF_MBAR + 0x8a)	/* CS 0 Control reg */
-#define	MCFSIM_CSAR1		(MCF_MBAR + 0x8c)	/* CS 1 Address reg */
-#define	MCFSIM_CSMR1		(MCF_MBAR + 0x90)	/* CS 1 Mask reg */
-#define	MCFSIM_CSCR1		(MCF_MBAR + 0x96)	/* CS 1 Control reg */
-#define	MCFSIM_CSAR2		(MCF_MBAR + 0x98)	/* CS 2 Address reg */
-#define	MCFSIM_CSMR2		(MCF_MBAR + 0x9c)	/* CS 2 Mask reg */
-#define	MCFSIM_CSCR2		(MCF_MBAR + 0xa2)	/* CS 2 Control reg */
-#define	MCFSIM_CSAR3		(MCF_MBAR + 0xa4)	/* CS 3 Address reg */
-#define	MCFSIM_CSMR3		(MCF_MBAR + 0xa8)	/* CS 3 Mask reg */
-#define	MCFSIM_CSCR3		(MCF_MBAR + 0xae)	/* CS 3 Control reg */
-
-#define MCFSIM_DCR		(MCF_MBAR + 0x100)	/* DRAM Control */
-#define MCFSIM_DACR0		(MCF_MBAR + 0x108)	/* DRAM 0 Addr/Ctrl */
-#define MCFSIM_DMR0		(MCF_MBAR + 0x10c)	/* DRAM 0 Mask */
-#define MCFSIM_DACR1		(MCF_MBAR + 0x110)	/* DRAM 1 Addr/Ctrl */
-#define MCFSIM_DMR1		(MCF_MBAR + 0x114)	/* DRAM 1 Mask */
-
-/*
- *	Timer module.
- */
-#define MCFTIMER_BASE1		(MCF_MBAR + 0x140)	/* Base of TIMER1 */
-#define MCFTIMER_BASE2		(MCF_MBAR + 0x180)	/* Base of TIMER2 */
-
-/*
- *	UART module.
- */
-#define MCFUART_BASE0		(MCF_MBAR + 0x1c0)	/* Base address UART0 */
-#define MCFUART_BASE1		(MCF_MBAR + 0x200)	/* Base address UART1 */
-
-/*
- *	QSPI module.
- */
-#define	MCFQSPI_BASE		(MCF_MBAR + 0x300)	/* Base address QSPI */
-#define	MCFQSPI_SIZE		0x40			/* Register set size */
-
-#define	MCFQSPI_CS0		29
-#define	MCFQSPI_CS1		24
-#define	MCFQSPI_CS2		21
-#define	MCFQSPI_CS3		22
-
-/*
- *	DMA unit base addresses.
- */
-#define MCFDMA_BASE0		(MCF_MBAR + 0x300)	/* Base address DMA 0 */
-#define MCFDMA_BASE1		(MCF_MBAR + 0x340)	/* Base address DMA 1 */
-#define MCFDMA_BASE2		(MCF_MBAR + 0x380)	/* Base address DMA 2 */
-#define MCFDMA_BASE3		(MCF_MBAR + 0x3C0)	/* Base address DMA 3 */
-
-/*
- *	Some symbol defines for the above...
- */
-#define	MCFSIM_SWDICR		MCFSIM_ICR0	/* Watchdog timer ICR */
-#define	MCFSIM_TIMER1ICR	MCFSIM_ICR1	/* Timer 1 ICR */
-#define	MCFSIM_TIMER2ICR	MCFSIM_ICR2	/* Timer 2 ICR */
-#define	MCFSIM_UART1ICR		MCFSIM_ICR4	/* UART 1 ICR */
-#define	MCFSIM_UART2ICR		MCFSIM_ICR5	/* UART 2 ICR */
-#define	MCFSIM_DMA0ICR		MCFSIM_ICR6	/* DMA 0 ICR */
-#define	MCFSIM_DMA1ICR		MCFSIM_ICR7	/* DMA 1 ICR */
-#define	MCFSIM_DMA2ICR		MCFSIM_ICR8	/* DMA 2 ICR */
-#define	MCFSIM_DMA3ICR		MCFSIM_ICR9	/* DMA 3 ICR */
-#define	MCFSIM_QSPIICR		MCFSIM_ICR10	/* QSPI ICR */
-
-/*
- *	Define system peripheral IRQ usage.
- */
-#define	MCF_IRQ_QSPI		28		/* QSPI, Level 4 */
-#define	MCF_IRQ_TIMER		30		/* Timer0, Level 6 */
-#define	MCF_IRQ_PROFILER	31		/* Timer1, Level 7 */
-
-#define	MCF_IRQ_UART0		73		/* UART0 */
-#define	MCF_IRQ_UART1		74		/* UART1 */
-
-/*
- *	General purpose IO registers (in MBAR2).
- */
-#define	MCFSIM2_GPIOREAD	(MCF_MBAR2 + 0x000)	/* GPIO read values */
-#define	MCFSIM2_GPIOWRITE	(MCF_MBAR2 + 0x004)	/* GPIO write values */
-#define	MCFSIM2_GPIOENABLE	(MCF_MBAR2 + 0x008)	/* GPIO enabled */
-#define	MCFSIM2_GPIOFUNC	(MCF_MBAR2 + 0x00C)	/* GPIO function */
-#define	MCFSIM2_GPIO1READ	(MCF_MBAR2 + 0x0B0)	/* GPIO1 read values */
-#define	MCFSIM2_GPIO1WRITE	(MCF_MBAR2 + 0x0B4)	/* GPIO1 write values */
-#define	MCFSIM2_GPIO1ENABLE	(MCF_MBAR2 + 0x0B8)	/* GPIO1 enabled */
-#define	MCFSIM2_GPIO1FUNC	(MCF_MBAR2 + 0x0BC)	/* GPIO1 function */
-
-#define	MCFSIM2_GPIOINTSTAT	(MCF_MBAR2 + 0xc0)	/* GPIO intr status */
-#define	MCFSIM2_GPIOINTCLEAR	(MCF_MBAR2 + 0xc0)	/* GPIO intr clear */
-#define	MCFSIM2_GPIOINTENABLE	(MCF_MBAR2 + 0xc4)	/* GPIO intr enable */
-
-#define	MCFSIM2_INTLEVEL1	(MCF_MBAR2 + 0x140)	/* Intr level reg 1 */
-#define	MCFSIM2_INTLEVEL2	(MCF_MBAR2 + 0x144)	/* Intr level reg 2 */
-#define	MCFSIM2_INTLEVEL3	(MCF_MBAR2 + 0x148)	/* Intr level reg 3 */
-#define	MCFSIM2_INTLEVEL4	(MCF_MBAR2 + 0x14c)	/* Intr level reg 4 */
-#define	MCFSIM2_INTLEVEL5	(MCF_MBAR2 + 0x150)	/* Intr level reg 5 */
-#define	MCFSIM2_INTLEVEL6	(MCF_MBAR2 + 0x154)	/* Intr level reg 6 */
-#define	MCFSIM2_INTLEVEL7	(MCF_MBAR2 + 0x158)	/* Intr level reg 7 */
-#define	MCFSIM2_INTLEVEL8	(MCF_MBAR2 + 0x15c)	/* Intr level reg 8 */
-
-#define	MCFSIM2_DMAROUTE	(MCF_MBAR2 + 0x188)	/* DMA routing */
-
-#define	MCFSIM2_IDECONFIG1	(MCF_MBAR2 + 0x18c)	/* IDEconfig1 */
-#define	MCFSIM2_IDECONFIG2	(MCF_MBAR2 + 0x190)	/* IDEconfig2 */
-
-/*
- * Define the base interrupt for the second interrupt controller.
- * We set it to 128, out of the way of the base interrupts, and plenty
- * of room for its 64 interrupts.
- */
-#define	MCFINTC2_VECBASE	128
-
-#define	MCFINTC2_GPIOIRQ0	(MCFINTC2_VECBASE + 32)
-#define	MCFINTC2_GPIOIRQ1	(MCFINTC2_VECBASE + 33)
-#define	MCFINTC2_GPIOIRQ2	(MCFINTC2_VECBASE + 34)
-#define	MCFINTC2_GPIOIRQ3	(MCFINTC2_VECBASE + 35)
-#define	MCFINTC2_GPIOIRQ4	(MCFINTC2_VECBASE + 36)
-#define	MCFINTC2_GPIOIRQ5	(MCFINTC2_VECBASE + 37)
-#define	MCFINTC2_GPIOIRQ6	(MCFINTC2_VECBASE + 38)
-#define	MCFINTC2_GPIOIRQ7	(MCFINTC2_VECBASE + 39)
-
-/*
- * Generic GPIO support
- */
-#define MCFGPIO_PIN_MAX		64
-#define MCFGPIO_IRQ_MAX		-1
-#define MCFGPIO_IRQ_VECBASE	-1
-
-/****************************************************************************/
-
-#ifdef __ASSEMBLER__
-
-/*
- *	The M5249C3 board needs a little help getting all its SIM devices
- *	initialized at kernel start time. dBUG doesn't set much up, so
- *	we need to do it manually.
- */
-.macro m5249c3_setup
-	/*
-	 *	Set MBAR1 and MBAR2, just incase they are not set.
-	 */
-	movel	#0x10000001,%a0
-	movec	%a0,%MBAR			/* map MBAR region */
-	subql	#1,%a0				/* get MBAR address in a0 */
-
-	movel	#0x80000001,%a1
-	movec	%a1,#3086			/* map MBAR2 region */
-	subql	#1,%a1				/* get MBAR2 address in a1 */
-
-	/*
-	 *      Move secondary interrupts to their base (128).
-	 */
-	moveb	#MCFINTC2_VECBASE,%d0
-	moveb	%d0,0x16b(%a1)			/* interrupt base register */
-
-	/*
-	 *      Work around broken CSMR0/DRAM vector problem.
-	 */
-	movel	#0x001F0021,%d0			/* disable C/I bit */
-	movel	%d0,0x84(%a0)			/* set CSMR0 */
-
-	/*
-	 *	Disable the PLL firstly. (Who knows what state it is
-	 *	in here!).
-	 */
-	movel	0x180(%a1),%d0			/* get current PLL value */
-	andl	#0xfffffffe,%d0			/* PLL bypass first */
-	movel	%d0,0x180(%a1)			/* set PLL register */
-	nop
-
-#if CONFIG_CLOCK_FREQ == 140000000
-	/*
-	 *	Set initial clock frequency. This assumes M5249C3 board
-	 *	is fitted with 11.2896MHz crystal. It will program the
-	 *	PLL for 140MHz. Lets go fast :-)
-	 */
-	movel	#0x125a40f0,%d0			/* set for 140MHz */
-	movel	%d0,0x180(%a1)			/* set PLL register */
-	orl	#0x1,%d0
-	movel	%d0,0x180(%a1)			/* set PLL register */
-#endif
-
-	/*
-	 *	Setup CS1 for ethernet controller.
-	 *	(Setup as per M5249C3 doco).
-	 */
-	movel  #0xe0000000,%d0			/* CS1 mapped at 0xe0000000 */
-	movel  %d0,0x8c(%a0)
-	movel  #0x001f0021,%d0			/* CS1 size of 1Mb */
-	movel  %d0,0x90(%a0)
-	movew  #0x0080,%d0			/* CS1 = 16bit port, AA */
-	movew  %d0,0x96(%a0)
-
-	/*
-	 *	Setup CS2 for IDE interface.
-	 */
-	movel	#0x50000000,%d0			/* CS2 mapped at 0x50000000 */
-	movel	%d0,0x98(%a0)
-	movel	#0x001f0001,%d0			/* CS2 size of 1MB */
-	movel	%d0,0x9c(%a0)
-	movew	#0x0080,%d0			/* CS2 = 16bit, TA */
-	movew	%d0,0xa2(%a0)
-
-	movel	#0x00107000,%d0			/* IDEconfig1 */
-	movel	%d0,0x18c(%a1)
-	movel	#0x000c0400,%d0			/* IDEconfig2 */
-	movel	%d0,0x190(%a1)
-
-	movel	#0x00080000,%d0			/* GPIO19, IDE reset bit */
-	orl	%d0,0xc(%a1)			/* function GPIO19 */
-	orl	%d0,0x8(%a1)			/* enable GPIO19 as output */
-        orl	%d0,0x4(%a1)			/* de-assert IDE reset */
-.endm
-
-#define	PLATFORM_SETUP	m5249c3_setup
-
-#endif /* __ASSEMBLER__ */
-
-/****************************************************************************/
-#endif	/* m5249sim_h */
diff --git a/arch/m68k/include/asm/m525xsim.h b/arch/m68k/include/asm/m525xsim.h
index acab61c..e33f5bb 100644
--- a/arch/m68k/include/asm/m525xsim.h
+++ b/arch/m68k/include/asm/m525xsim.h
@@ -12,6 +12,11 @@
 #define m525xsim_h
 /****************************************************************************/
 
+/*
+ *	This header supports ColdFire 5249, 5251 and 5253. There are a few
+ *	little differences between them, but most of the peripheral support
+ *	can be used by all of them.
+ */
 #define CPU_NAME		"COLDFIRE(m525x)"
 #define CPU_INSTR_PER_JIFFY	3
 #define MCF_BUSCLK		(MCF_CLK / 2)
@@ -65,6 +70,8 @@
 #define MCFSIM_DCR		(MCF_MBAR + 0x100)	/* DRAM Control */
 #define MCFSIM_DACR0		(MCF_MBAR + 0x108)	/* DRAM 0 Addr/Ctrl */
 #define MCFSIM_DMR0		(MCF_MBAR + 0x10c)	/* DRAM 0 Mask */
+#define MCFSIM_DACR1		(MCF_MBAR + 0x110)	/* DRAM 1 Addr/Ctrl */
+#define MCFSIM_DMR1		(MCF_MBAR + 0x114)	/* DRAM 1 Mask */
 
 /*
  * Secondary Interrupt Controller (in MBAR2)
@@ -101,11 +108,17 @@
 #define MCFQSPI_BASE		(MCF_MBAR + 0x300)	/* Base address QSPI */
 #define MCFQSPI_SIZE		0x40			/* Register set size */
 
-
+#ifdef CONFIG_M5249
+#define MCFQSPI_CS0		29
+#define MCFQSPI_CS1		24
+#define MCFQSPI_CS2		21
+#define MCFQSPI_CS3		22
+#else
 #define MCFQSPI_CS0		15
 #define MCFQSPI_CS1		16
 #define MCFQSPI_CS2		24
 #define MCFQSPI_CS3		28
+#endif
 
 /*
  *	I2C module.
@@ -115,6 +128,7 @@
 
 #define MCFI2C_BASE1		(MCF_MBAR2 + 0x440)	/* Base addreess I2C1 */
 #define MCFI2C_SIZE1		0x20			/* Register set size */
+
 /*
  *	DMA unit base addresses.
  */
@@ -163,6 +177,7 @@
 #define MCF_IRQ_GPIO4		(MCFINTC2_VECBASE + 36)
 #define MCF_IRQ_GPIO5		(MCFINTC2_VECBASE + 37)
 #define MCF_IRQ_GPIO6		(MCFINTC2_VECBASE + 38)
+#define MCF_IRQ_GPIO7		(MCFINTC2_VECBASE + 39)
 
 #define MCF_IRQ_USBWUP		(MCFINTC2_VECBASE + 40)
 #define MCF_IRQ_I2C1		(MCFINTC2_VECBASE + 62)
@@ -183,12 +198,111 @@
 #define MCFSIM2_GPIOINTCLEAR	(MCF_MBAR2 + 0xc0)	/* GPIO intr clear */
 #define MCFSIM2_GPIOINTENABLE	(MCF_MBAR2 + 0xc4)	/* GPIO intr enable */
 
+#define MCFSIM2_DMAROUTE	(MCF_MBAR2 + 0x188)     /* DMA routing */
+#define MCFSIM2_IDECONFIG1	(MCF_MBAR2 + 0x18c)	/* IDEconfig1 */
+#define MCFSIM2_IDECONFIG2	(MCF_MBAR2 + 0x190)	/* IDEconfig2 */
+
 /*
  * Generic GPIO support
  */
 #define MCFGPIO_PIN_MAX		64
+#ifdef CONFIG_M5249
+#define MCFGPIO_IRQ_MAX		-1
+#define MCFGPIO_IRQ_VECBASE	-1
+#else
 #define MCFGPIO_IRQ_MAX		7
 #define MCFGPIO_IRQ_VECBASE	MCF_IRQ_GPIO0
+#endif
+
+/****************************************************************************/
+
+#ifdef __ASSEMBLER__
+#ifdef CONFIG_M5249C3
+/*
+ *	The M5249C3 board needs a little help getting all its SIM devices
+ *	initialized at kernel start time. dBUG doesn't set much up, so
+ *	we need to do it manually.
+ */
+.macro m5249c3_setup
+	/*
+	 *	Set MBAR1 and MBAR2, just incase they are not set.
+	 */
+	movel	#0x10000001,%a0
+	movec	%a0,%MBAR			/* map MBAR region */
+	subql	#1,%a0				/* get MBAR address in a0 */
+
+	movel	#0x80000001,%a1
+	movec	%a1,#3086			/* map MBAR2 region */
+	subql	#1,%a1				/* get MBAR2 address in a1 */
+
+	/*
+	 *      Move secondary interrupts to their base (128).
+	 */
+	moveb	#MCFINTC2_VECBASE,%d0
+	moveb	%d0,0x16b(%a1)			/* interrupt base register */
+
+	/*
+	 *      Work around broken CSMR0/DRAM vector problem.
+	 */
+	movel	#0x001F0021,%d0			/* disable C/I bit */
+	movel	%d0,0x84(%a0)			/* set CSMR0 */
+
+	/*
+	 *	Disable the PLL firstly. (Who knows what state it is
+	 *	in here!).
+	 */
+	movel	0x180(%a1),%d0			/* get current PLL value */
+	andl	#0xfffffffe,%d0			/* PLL bypass first */
+	movel	%d0,0x180(%a1)			/* set PLL register */
+	nop
+
+#if CONFIG_CLOCK_FREQ == 140000000
+	/*
+	 *	Set initial clock frequency. This assumes M5249C3 board
+	 *	is fitted with 11.2896MHz crystal. It will program the
+	 *	PLL for 140MHz. Lets go fast :-)
+	 */
+	movel	#0x125a40f0,%d0			/* set for 140MHz */
+	movel	%d0,0x180(%a1)			/* set PLL register */
+	orl	#0x1,%d0
+	movel	%d0,0x180(%a1)			/* set PLL register */
+#endif
+
+	/*
+	 *	Setup CS1 for ethernet controller.
+	 *	(Setup as per M5249C3 doco).
+	 */
+	movel  #0xe0000000,%d0			/* CS1 mapped at 0xe0000000 */
+	movel  %d0,0x8c(%a0)
+	movel  #0x001f0021,%d0			/* CS1 size of 1Mb */
+	movel  %d0,0x90(%a0)
+	movew  #0x0080,%d0			/* CS1 = 16bit port, AA */
+	movew  %d0,0x96(%a0)
+
+	/*
+	 *	Setup CS2 for IDE interface.
+	 */
+	movel	#0x50000000,%d0			/* CS2 mapped at 0x50000000 */
+	movel	%d0,0x98(%a0)
+	movel	#0x001f0001,%d0			/* CS2 size of 1MB */
+	movel	%d0,0x9c(%a0)
+	movew	#0x0080,%d0			/* CS2 = 16bit, TA */
+	movew	%d0,0xa2(%a0)
+
+	movel	#0x00107000,%d0			/* IDEconfig1 */
+	movel	%d0,0x18c(%a1)
+	movel	#0x000c0400,%d0			/* IDEconfig2 */
+	movel	%d0,0x190(%a1)
+
+	movel	#0x00080000,%d0			/* GPIO19, IDE reset bit */
+	orl	%d0,0xc(%a1)			/* function GPIO19 */
+	orl	%d0,0x8(%a1)			/* enable GPIO19 as output */
+        orl	%d0,0x4(%a1)			/* de-assert IDE reset */
+.endm
+
+#define	PLATFORM_SETUP	m5249c3_setup
 
+#endif /* CONFIG_M5249C3 */
+#endif /* __ASSEMBLER__ */
 /****************************************************************************/
 #endif	/* m525xsim_h */
diff --git a/arch/m68k/include/asm/mcfsim.h b/arch/m68k/include/asm/mcfsim.h
index 7a83e61..a04fd9b 100644
--- a/arch/m68k/include/asm/mcfsim.h
+++ b/arch/m68k/include/asm/mcfsim.h
@@ -24,10 +24,7 @@
 #elif defined(CONFIG_M523x)
 #include <asm/m523xsim.h>
 #include <asm/mcfintc.h>
-#elif defined(CONFIG_M5249)
-#include <asm/m5249sim.h>
-#include <asm/mcfintc.h>
-#elif defined(CONFIG_M525x)
+#elif defined(CONFIG_M5249) || defined(CONFIG_M525x)
 #include <asm/m525xsim.h>
 #include <asm/mcfintc.h>
 #elif defined(CONFIG_M527x)
diff --git a/arch/m68k/platform/coldfire/intc-5249.c b/arch/m68k/platform/coldfire/intc-5249.c
index 0864b83..b0d1641 100644
--- a/arch/m68k/platform/coldfire/intc-5249.c
+++ b/arch/m68k/platform/coldfire/intc-5249.c
@@ -21,7 +21,7 @@ static void intc2_irq_gpio_mask(struct irq_data *d)
 {
 	u32 imr;
 	imr = readl(MCFSIM2_GPIOINTENABLE);
-	imr &= ~(0x1 << (d->irq - MCFINTC2_GPIOIRQ0));
+	imr &= ~(0x1 << (d->irq - MCF_IRQ_GPIO0));
 	writel(imr, MCFSIM2_GPIOINTENABLE);
 }
 
@@ -29,13 +29,13 @@ static void intc2_irq_gpio_unmask(struct irq_data *d)
 {
 	u32 imr;
 	imr = readl(MCFSIM2_GPIOINTENABLE);
-	imr |= (0x1 << (d->irq - MCFINTC2_GPIOIRQ0));
+	imr |= (0x1 << (d->irq - MCF_IRQ_GPIO0));
 	writel(imr, MCFSIM2_GPIOINTENABLE);
 }
 
 static void intc2_irq_gpio_ack(struct irq_data *d)
 {
-	writel(0x1 << (d->irq - MCFINTC2_GPIOIRQ0), MCFSIM2_GPIOINTCLEAR);
+	writel(0x1 << (d->irq - MCF_IRQ_GPIO0), MCFSIM2_GPIOINTCLEAR);
 }
 
 static struct irq_chip intc2_irq_gpio_chip = {
@@ -50,7 +50,7 @@ static int __init mcf_intc2_init(void)
 	int irq;
 
 	/* GPIO interrupt sources */
-	for (irq = MCFINTC2_GPIOIRQ0; (irq <= MCFINTC2_GPIOIRQ7); irq++) {
+	for (irq = MCF_IRQ_GPIO0; (irq <= MCF_IRQ_GPIO7); irq++) {
 		irq_set_chip(irq, &intc2_irq_gpio_chip);
 		irq_set_handler(irq, handle_edge_irq);
 	}
diff --git a/arch/m68k/platform/coldfire/m5249.c b/arch/m68k/platform/coldfire/m5249.c
index 23b19cb..8370a57 100644
--- a/arch/m68k/platform/coldfire/m5249.c
+++ b/arch/m68k/platform/coldfire/m5249.c
@@ -28,8 +28,8 @@ static struct resource m5249_smc91x_resources[] = {
 		.flags		= IORESOURCE_MEM,
 	},
 	{
-		.start		= MCFINTC2_GPIOIRQ6,
-		.end		= MCFINTC2_GPIOIRQ6,
+		.start		= MCF_IRQ_GPIO6,
+		.end		= MCF_IRQ_GPIO6,
 		.flags		= IORESOURCE_IRQ,
 	},
 };
@@ -75,8 +75,8 @@ static void __init m5249_smc91x_init(void)
 	gpio = readl(MCFSIM2_GPIOINTENABLE);
 	writel(gpio | 0x40, MCFSIM2_GPIOINTENABLE);
 
-	gpio = readl(MCFSIM2_INTLEVEL5);
-	writel(gpio | 0x04000000, MCFSIM2_INTLEVEL5);
+	gpio = readl(MCFINTC2_INTPRI5);
+	writel(gpio | 0x04000000, MCFINTC2_INTPRI5);
 }
 
 #endif /* CONFIG_M5249C3 */
-- 
1.7.0.4
