From: <gerg@snapgear.com>
Subject: [PATCH 5/9] m68knommu: make ColdFire Interrupt Source register definitions absolute addresses
Date: Wed, 19 Sep 2012 15:08:40 +1000
Message-ID: <1348031324-13228-6-git-send-email-gerg@snapgear.com>
References: <1348031324-13228-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dnvwsmailout1.mcafee.com ([161.69.31.173]:46987 "EHLO
	DNVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754906Ab2ISFHS (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 19 Sep 2012 01:07:18 -0400
In-Reply-To: <1348031324-13228-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Make all definitions of the ColdFire Interrupt Source registers absolute
addresses. Currently some are relative to the MBAR peripheral region.

The various ColdFire parts use different methods to address the internal
registers, some are absolute, some are relative to peripheral regions
which can be mapped at different address ranges (such as the MBAR and IPSBAR
registers). We don't want to deal with this in the code when we are
accessing these registers, so make all register definitions the absolute
address - factoring out whether it is an offset into a peripheral region.

This makes them all consistently defined, and reduces the occasional bugs
caused by inconsistent definition of the register addresses.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m5206sim.h        |   32 +++++++++++++++---------------
 arch/m68k/include/asm/m5249sim.h        |   24 +++++++++++-----------
 arch/m68k/include/asm/m525xsim.h        |   24 +++++++++++-----------
 arch/m68k/include/asm/m5272sim.h        |    8 +++---
 arch/m68k/include/asm/m5307sim.h        |   24 +++++++++++-----------
 arch/m68k/include/asm/m5407sim.h        |   24 +++++++++++-----------
 arch/m68k/platform/coldfire/device.c    |    4 +-
 arch/m68k/platform/coldfire/intc-5272.c |   20 +++++++++---------
 arch/m68k/platform/coldfire/m5249.c     |    2 +-
 arch/m68k/platform/coldfire/m525x.c     |    4 +-
 arch/m68k/platform/coldfire/timers.c    |    4 +-
 11 files changed, 85 insertions(+), 85 deletions(-)

diff --git a/arch/m68k/include/asm/m5206sim.h b/arch/m68k/include/asm/m5206sim.h
index c78ff10..3e86b03 100644
--- a/arch/m68k/include/asm/m5206sim.h
+++ b/arch/m68k/include/asm/m5206sim.h
@@ -21,23 +21,23 @@
 /*
  *	Define the 5206 SIM register set addresses.
  */
-#define	MCFSIM_SIMR		0x03		/* SIM Config reg (r/w) */
-#define	MCFSIM_ICR1		0x14		/* Intr Ctrl reg 1 (r/w) */
-#define	MCFSIM_ICR2		0x15		/* Intr Ctrl reg 2 (r/w) */
-#define	MCFSIM_ICR3		0x16		/* Intr Ctrl reg 3 (r/w) */
-#define	MCFSIM_ICR4		0x17		/* Intr Ctrl reg 4 (r/w) */
-#define	MCFSIM_ICR5		0x18		/* Intr Ctrl reg 5 (r/w) */
-#define	MCFSIM_ICR6		0x19		/* Intr Ctrl reg 6 (r/w) */
-#define	MCFSIM_ICR7		0x1a		/* Intr Ctrl reg 7 (r/w) */
-#define	MCFSIM_ICR8		0x1b		/* Intr Ctrl reg 8 (r/w) */
-#define	MCFSIM_ICR9		0x1c		/* Intr Ctrl reg 9 (r/w) */
-#define	MCFSIM_ICR10		0x1d		/* Intr Ctrl reg 10 (r/w) */
-#define	MCFSIM_ICR11		0x1e		/* Intr Ctrl reg 11 (r/w) */
-#define	MCFSIM_ICR12		0x1f		/* Intr Ctrl reg 12 (r/w) */
-#define	MCFSIM_ICR13		0x20		/* Intr Ctrl reg 13 (r/w) */
+#define	MCFSIM_SIMR		(MCF_MBAR + 0x03)	/* SIM Config reg */
+#define	MCFSIM_ICR1		(MCF_MBAR + 0x14)	/* Intr Ctrl reg 1 */
+#define	MCFSIM_ICR2		(MCF_MBAR + 0x15)	/* Intr Ctrl reg 2 */
+#define	MCFSIM_ICR3		(MCF_MBAR + 0x16)	/* Intr Ctrl reg 3 */
+#define	MCFSIM_ICR4		(MCF_MBAR + 0x17)	/* Intr Ctrl reg 4 */
+#define	MCFSIM_ICR5		(MCF_MBAR + 0x18)	/* Intr Ctrl reg 5 */
+#define	MCFSIM_ICR6		(MCF_MBAR + 0x19)	/* Intr Ctrl reg 6 */
+#define	MCFSIM_ICR7		(MCF_MBAR + 0x1a)	/* Intr Ctrl reg 7 */
+#define	MCFSIM_ICR8		(MCF_MBAR + 0x1b)	/* Intr Ctrl reg 8 */
+#define	MCFSIM_ICR9		(MCF_MBAR + 0x1c)	/* Intr Ctrl reg 9 */
+#define	MCFSIM_ICR10		(MCF_MBAR + 0x1d)	/* Intr Ctrl reg 10 */
+#define	MCFSIM_ICR11		(MCF_MBAR + 0x1e)	/* Intr Ctrl reg 11 */
+#define	MCFSIM_ICR12		(MCF_MBAR + 0x1f)	/* Intr Ctrl reg 12 */
+#define	MCFSIM_ICR13		(MCF_MBAR + 0x20)	/* Intr Ctrl reg 13 */
 #ifdef CONFIG_M5206e
-#define	MCFSIM_ICR14		0x21		/* Intr Ctrl reg 14 (r/w) */
-#define	MCFSIM_ICR15		0x22		/* Intr Ctrl reg 15 (r/w) */
+#define	MCFSIM_ICR14		(MCF_MBAR + 0x21)	/* Intr Ctrl reg 14 */
+#define	MCFSIM_ICR15		(MCF_MBAR + 0x22)	/* Intr Ctrl reg 15 */
 #endif
 
 #define	MCFSIM_IMR		(MCF_MBAR + 0x36)	/* Interrupt Mask */
diff --git a/arch/m68k/include/asm/m5249sim.h b/arch/m68k/include/asm/m5249sim.h
index 6e2bb0c..f8384d3 100644
--- a/arch/m68k/include/asm/m5249sim.h
+++ b/arch/m68k/include/asm/m5249sim.h
@@ -35,18 +35,18 @@
 #define	MCFSIM_IPR		(MCF_MBAR + 0x40)	/* Interrupt Pending */
 #define	MCFSIM_IMR		(MCF_MBAR + 0x44)	/* Interrupt Mask */
 #define	MCFSIM_AVR		(MCF_MBAR + 0x4b)	/* Autovector Ctrl */
-#define	MCFSIM_ICR0		0x4c		/* Intr Ctrl reg 0 (r/w) */
-#define	MCFSIM_ICR1		0x4d		/* Intr Ctrl reg 1 (r/w) */
-#define	MCFSIM_ICR2		0x4e		/* Intr Ctrl reg 2 (r/w) */
-#define	MCFSIM_ICR3		0x4f		/* Intr Ctrl reg 3 (r/w) */
-#define	MCFSIM_ICR4		0x50		/* Intr Ctrl reg 4 (r/w) */
-#define	MCFSIM_ICR5		0x51		/* Intr Ctrl reg 5 (r/w) */
-#define	MCFSIM_ICR6		0x52		/* Intr Ctrl reg 6 (r/w) */
-#define	MCFSIM_ICR7		0x53		/* Intr Ctrl reg 7 (r/w) */
-#define	MCFSIM_ICR8		0x54		/* Intr Ctrl reg 8 (r/w) */
-#define	MCFSIM_ICR9		0x55		/* Intr Ctrl reg 9 (r/w) */
-#define	MCFSIM_ICR10		0x56		/* Intr Ctrl reg 10 (r/w) */
-#define	MCFSIM_ICR11		0x57		/* Intr Ctrl reg 11 (r/w) */
+#define	MCFSIM_ICR0		(MCF_MBAR + 0x4c)	/* Intr Ctrl reg 0 */
+#define	MCFSIM_ICR1		(MCF_MBAR + 0x4d)	/* Intr Ctrl reg 1 */
+#define	MCFSIM_ICR2		(MCF_MBAR + 0x4e)	/* Intr Ctrl reg 2 */
+#define	MCFSIM_ICR3		(MCF_MBAR + 0x4f)	/* Intr Ctrl reg 3 */
+#define	MCFSIM_ICR4		(MCF_MBAR + 0x50)	/* Intr Ctrl reg 4 */
+#define	MCFSIM_ICR5		(MCF_MBAR + 0x51)	/* Intr Ctrl reg 5 */
+#define	MCFSIM_ICR6		(MCF_MBAR + 0x52)	/* Intr Ctrl reg 6 */
+#define	MCFSIM_ICR7		(MCF_MBAR + 0x53)	/* Intr Ctrl reg 7 */
+#define	MCFSIM_ICR8		(MCF_MBAR + 0x54)	/* Intr Ctrl reg 8 */
+#define	MCFSIM_ICR9		(MCF_MBAR + 0x55)	/* Intr Ctrl reg 9 */
+#define	MCFSIM_ICR10		(MCF_MBAR + 0x56)	/* Intr Ctrl reg 10 */
+#define	MCFSIM_ICR11		(MCF_MBAR + 0x57)	/* Intr Ctrl reg 11 */
 
 #define MCFSIM_CSAR0		0x80		/* CS 0 Address 0 reg (r/w) */
 #define MCFSIM_CSMR0		0x84		/* CS 0 Mask 0 reg (r/w) */
diff --git a/arch/m68k/include/asm/m525xsim.h b/arch/m68k/include/asm/m525xsim.h
index b0fccd9..6a1ab49 100644
--- a/arch/m68k/include/asm/m525xsim.h
+++ b/arch/m68k/include/asm/m525xsim.h
@@ -33,18 +33,18 @@
 #define MCFSIM_MPARK		0x0C		/* BUS Master Control Reg*/
 #define MCFSIM_IPR		(MCF_MBAR + 0x40)	/* Interrupt Pending */
 #define MCFSIM_IMR		(MCF_MBAR + 0x44)	/* Interrupt Mask */
-#define MCFSIM_ICR0		0x4c		/* Intr Ctrl reg 0 (r/w) */
-#define MCFSIM_ICR1		0x4d		/* Intr Ctrl reg 1 (r/w) */
-#define MCFSIM_ICR2		0x4e		/* Intr Ctrl reg 2 (r/w) */
-#define MCFSIM_ICR3		0x4f		/* Intr Ctrl reg 3 (r/w) */
-#define MCFSIM_ICR4		0x50		/* Intr Ctrl reg 4 (r/w) */
-#define MCFSIM_ICR5		0x51		/* Intr Ctrl reg 5 (r/w) */
-#define MCFSIM_ICR6		0x52		/* Intr Ctrl reg 6 (r/w) */
-#define MCFSIM_ICR7		0x53		/* Intr Ctrl reg 7 (r/w) */
-#define MCFSIM_ICR8		0x54		/* Intr Ctrl reg 8 (r/w) */
-#define MCFSIM_ICR9		0x55		/* Intr Ctrl reg 9 (r/w) */
-#define MCFSIM_ICR10		0x56		/* Intr Ctrl reg 10 (r/w) */
-#define MCFSIM_ICR11		0x57		/* Intr Ctrl reg 11 (r/w) */
+#define MCFSIM_ICR0		(MCF_MBAR + 0x4c)	/* Intr Ctrl reg 0 */
+#define MCFSIM_ICR1		(MCF_MBAR + 0x4d)	/* Intr Ctrl reg 1 */
+#define MCFSIM_ICR2		(MCF_MBAR + 0x4e)	/* Intr Ctrl reg 2 */
+#define MCFSIM_ICR3		(MCF_MBAR + 0x4f)	/* Intr Ctrl reg 3 */
+#define MCFSIM_ICR4		(MCF_MBAR + 0x50)	/* Intr Ctrl reg 4 */
+#define MCFSIM_ICR5		(MCF_MBAR + 0x51)	/* Intr Ctrl reg 5 */
+#define MCFSIM_ICR6		(MCF_MBAR + 0x52)	/* Intr Ctrl reg 6 */
+#define MCFSIM_ICR7		(MCF_MBAR + 0x53)	/* Intr Ctrl reg 7 */
+#define MCFSIM_ICR8		(MCF_MBAR + 0x54)	/* Intr Ctrl reg 8 */
+#define MCFSIM_ICR9		(MCF_MBAR + 0x55)	/* Intr Ctrl reg 9 */
+#define MCFSIM_ICR10		(MCF_MBAR + 0x56)	/* Intr Ctrl reg 10 */
+#define MCFSIM_ICR11		(MCF_MBAR + 0x57)	/* Intr Ctrl reg 11 */
 
 #define MCFSIM_CSAR0		0x80		/* CS 0 Address 0 reg (r/w) */
 #define MCFSIM_CSMR0		0x84		/* CS 0 Mask 0 reg (r/w) */
diff --git a/arch/m68k/include/asm/m5272sim.h b/arch/m68k/include/asm/m5272sim.h
index 3983404..2b21787 100644
--- a/arch/m68k/include/asm/m5272sim.h
+++ b/arch/m68k/include/asm/m5272sim.h
@@ -27,10 +27,10 @@
 #define	MCFSIM_APMR		0x0e		/* Active Low Power reg (r/w) */
 #define	MCFSIM_DIR		0x10		/* Device Identity reg (r/w) */
 
-#define	MCFSIM_ICR1		0x20		/* Intr Ctrl reg 1 (r/w) */
-#define	MCFSIM_ICR2		0x24		/* Intr Ctrl reg 2 (r/w) */
-#define	MCFSIM_ICR3		0x28		/* Intr Ctrl reg 3 (r/w) */
-#define	MCFSIM_ICR4		0x2c		/* Intr Ctrl reg 4 (r/w) */
+#define	MCFSIM_ICR1		(MCF_MBAR + 0x20)	/* Intr Ctrl reg 1 */
+#define	MCFSIM_ICR2		(MCF_MBAR + 0x24)	/* Intr Ctrl reg 2 */
+#define	MCFSIM_ICR3		(MCF_MBAR + 0x28)	/* Intr Ctrl reg 3 */
+#define	MCFSIM_ICR4		(MCF_MBAR + 0x2c)	/* Intr Ctrl reg 4 */
 
 #define	MCFSIM_ISR		(MCF_MBAR + 0x30)	/* Intr Source */
 #define	MCFSIM_PITR		(MCF_MBAR + 0x34)	/* Intr Transition */
diff --git a/arch/m68k/include/asm/m5307sim.h b/arch/m68k/include/asm/m5307sim.h
index 7d89d86..3f88547 100644
--- a/arch/m68k/include/asm/m5307sim.h
+++ b/arch/m68k/include/asm/m5307sim.h
@@ -34,18 +34,18 @@
 #define	MCFSIM_IPR		(MCF_MBAR + 0x40)	/* Interrupt Pend */
 #define	MCFSIM_IMR		(MCF_MBAR + 0x44)	/* Interrupt Mask */
 #define	MCFSIM_AVR		(MCF_MBAR + 0x4b)	/* Autovector Ctrl */
-#define	MCFSIM_ICR0		0x4c		/* Intr Ctrl reg 0 (r/w) */
-#define	MCFSIM_ICR1		0x4d		/* Intr Ctrl reg 1 (r/w) */
-#define	MCFSIM_ICR2		0x4e		/* Intr Ctrl reg 2 (r/w) */
-#define	MCFSIM_ICR3		0x4f		/* Intr Ctrl reg 3 (r/w) */
-#define	MCFSIM_ICR4		0x50		/* Intr Ctrl reg 4 (r/w) */
-#define	MCFSIM_ICR5		0x51		/* Intr Ctrl reg 5 (r/w) */
-#define	MCFSIM_ICR6		0x52		/* Intr Ctrl reg 6 (r/w) */
-#define	MCFSIM_ICR7		0x53		/* Intr Ctrl reg 7 (r/w) */
-#define	MCFSIM_ICR8		0x54		/* Intr Ctrl reg 8 (r/w) */
-#define	MCFSIM_ICR9		0x55		/* Intr Ctrl reg 9 (r/w) */
-#define	MCFSIM_ICR10		0x56		/* Intr Ctrl reg 10 (r/w) */
-#define	MCFSIM_ICR11		0x57		/* Intr Ctrl reg 11 (r/w) */
+#define	MCFSIM_ICR0		(MCF_MBAR + 0x4c)	/* Intr Ctrl reg 0 */
+#define	MCFSIM_ICR1		(MCF_MBAR + 0x4d)	/* Intr Ctrl reg 1 */
+#define	MCFSIM_ICR2		(MCF_MBAR + 0x4e)	/* Intr Ctrl reg 2 */
+#define	MCFSIM_ICR3		(MCF_MBAR + 0x4f)	/* Intr Ctrl reg 3 */
+#define	MCFSIM_ICR4		(MCF_MBAR + 0x50)	/* Intr Ctrl reg 4 */
+#define	MCFSIM_ICR5		(MCF_MBAR + 0x51)	/* Intr Ctrl reg 5 */
+#define	MCFSIM_ICR6		(MCF_MBAR + 0x52)	/* Intr Ctrl reg 6 */
+#define	MCFSIM_ICR7		(MCF_MBAR + 0x53)	/* Intr Ctrl reg 7 */
+#define	MCFSIM_ICR8		(MCF_MBAR + 0x54)	/* Intr Ctrl reg 8 */
+#define	MCFSIM_ICR9		(MCF_MBAR + 0x55)	/* Intr Ctrl reg 9 */
+#define	MCFSIM_ICR10		(MCF_MBAR + 0x56)	/* Intr Ctrl reg 10 */
+#define	MCFSIM_ICR11		(MCF_MBAR + 0x57)	/* Intr Ctrl reg 11 */
 
 #define MCFSIM_CSAR0		0x80		/* CS 0 Address 0 reg (r/w) */
 #define MCFSIM_CSMR0		0x84		/* CS 0 Mask 0 reg (r/w) */
diff --git a/arch/m68k/include/asm/m5407sim.h b/arch/m68k/include/asm/m5407sim.h
index 51111af..65227bb 100644
--- a/arch/m68k/include/asm/m5407sim.h
+++ b/arch/m68k/include/asm/m5407sim.h
@@ -34,18 +34,18 @@
 #define	MCFSIM_IPR		(MCF_MBAR + 0x40)	/* Interrupt Pending */
 #define	MCFSIM_IMR		(MCF_MBAR + 0x44)	/* Interrupt Mask */
 #define	MCFSIM_AVR		(MCF_MBAR + 0x4b)	/* Autovector Ctrl */
-#define	MCFSIM_ICR0		0x4c		/* Intr Ctrl reg 0 (r/w) */
-#define	MCFSIM_ICR1		0x4d		/* Intr Ctrl reg 1 (r/w) */
-#define	MCFSIM_ICR2		0x4e		/* Intr Ctrl reg 2 (r/w) */
-#define	MCFSIM_ICR3		0x4f		/* Intr Ctrl reg 3 (r/w) */
-#define	MCFSIM_ICR4		0x50		/* Intr Ctrl reg 4 (r/w) */
-#define	MCFSIM_ICR5		0x51		/* Intr Ctrl reg 5 (r/w) */
-#define	MCFSIM_ICR6		0x52		/* Intr Ctrl reg 6 (r/w) */
-#define	MCFSIM_ICR7		0x53		/* Intr Ctrl reg 7 (r/w) */
-#define	MCFSIM_ICR8		0x54		/* Intr Ctrl reg 8 (r/w) */
-#define	MCFSIM_ICR9		0x55		/* Intr Ctrl reg 9 (r/w) */
-#define	MCFSIM_ICR10		0x56		/* Intr Ctrl reg 10 (r/w) */
-#define	MCFSIM_ICR11		0x57		/* Intr Ctrl reg 11 (r/w) */
+#define	MCFSIM_ICR0		(MCF_MBAR + 0x4c)	/* Intr Ctrl reg 0 */
+#define	MCFSIM_ICR1		(MCF_MBAR + 0x4d)	/* Intr Ctrl reg 1 */
+#define	MCFSIM_ICR2		(MCF_MBAR + 0x4e)	/* Intr Ctrl reg 2 */
+#define	MCFSIM_ICR3		(MCF_MBAR + 0x4f)	/* Intr Ctrl reg 3 */
+#define	MCFSIM_ICR4		(MCF_MBAR + 0x50)	/* Intr Ctrl reg 4 */
+#define	MCFSIM_ICR5		(MCF_MBAR + 0x51)	/* Intr Ctrl reg 5 */
+#define	MCFSIM_ICR6		(MCF_MBAR + 0x52)	/* Intr Ctrl reg 6 */
+#define	MCFSIM_ICR7		(MCF_MBAR + 0x53)	/* Intr Ctrl reg 7 */
+#define	MCFSIM_ICR8		(MCF_MBAR + 0x54)	/* Intr Ctrl reg 8 */
+#define	MCFSIM_ICR9		(MCF_MBAR + 0x55)	/* Intr Ctrl reg 9 */
+#define	MCFSIM_ICR10		(MCF_MBAR + 0x56)	/* Intr Ctrl reg 10 */
+#define	MCFSIM_ICR11		(MCF_MBAR + 0x57)	/* Intr Ctrl reg 11 */
 
 #define MCFSIM_CSAR0		0x80		/* CS 0 Address 0 reg (r/w) */
 #define MCFSIM_CSMR0		0x84		/* CS 0 Mask 0 reg (r/w) */
diff --git a/arch/m68k/platform/coldfire/device.c b/arch/m68k/platform/coldfire/device.c
index 81f0fb5..71ea4c0 100644
--- a/arch/m68k/platform/coldfire/device.c
+++ b/arch/m68k/platform/coldfire/device.c
@@ -347,12 +347,12 @@ static void __init mcf_uart_set_irq(void)
 {
 #ifdef MCFUART_UIVR
 	/* UART0 interrupt setup */
-	writeb(MCFSIM_ICR_LEVEL6 | MCFSIM_ICR_PRI1, MCF_MBAR + MCFSIM_UART1ICR);
+	writeb(MCFSIM_ICR_LEVEL6 | MCFSIM_ICR_PRI1, MCFSIM_UART1ICR);
 	writeb(MCF_IRQ_UART0, MCFUART_BASE0 + MCFUART_UIVR);
 	mcf_mapirq2imr(MCF_IRQ_UART0, MCFINTC_UART0);
 
 	/* UART1 interrupt setup */
-	writeb(MCFSIM_ICR_LEVEL6 | MCFSIM_ICR_PRI2, MCF_MBAR + MCFSIM_UART2ICR);
+	writeb(MCFSIM_ICR_LEVEL6 | MCFSIM_ICR_PRI2, MCFSIM_UART2ICR);
 	writeb(MCF_IRQ_UART1, MCFUART_BASE1 + MCFUART_UIVR);
 	mcf_mapirq2imr(MCF_IRQ_UART1, MCFINTC_UART1);
 #endif
diff --git a/arch/m68k/platform/coldfire/intc-5272.c b/arch/m68k/platform/coldfire/intc-5272.c
index 7160e61..d7b6956 100644
--- a/arch/m68k/platform/coldfire/intc-5272.c
+++ b/arch/m68k/platform/coldfire/intc-5272.c
@@ -86,7 +86,7 @@ static void intc_irq_mask(struct irq_data *d)
 		u32 v;
 		irq -= MCFINT_VECBASE;
 		v = 0x8 << intc_irqmap[irq].index;
-		writel(v, MCF_MBAR + intc_irqmap[irq].icr);
+		writel(v, intc_irqmap[irq].icr);
 	}
 }
 
@@ -98,7 +98,7 @@ static void intc_irq_unmask(struct irq_data *d)
 		u32 v;
 		irq -= MCFINT_VECBASE;
 		v = 0xd << intc_irqmap[irq].index;
-		writel(v, MCF_MBAR + intc_irqmap[irq].icr);
+		writel(v, intc_irqmap[irq].icr);
 	}
 }
 
@@ -111,10 +111,10 @@ static void intc_irq_ack(struct irq_data *d)
 		irq -= MCFINT_VECBASE;
 		if (intc_irqmap[irq].ack) {
 			u32 v;
-			v = readl(MCF_MBAR + intc_irqmap[irq].icr);
+			v = readl(intc_irqmap[irq].icr);
 			v &= (0x7 << intc_irqmap[irq].index);
 			v |= (0x8 << intc_irqmap[irq].index);
-			writel(v, MCF_MBAR + intc_irqmap[irq].icr);
+			writel(v, intc_irqmap[irq].icr);
 		}
 	}
 }
@@ -127,12 +127,12 @@ static int intc_irq_set_type(struct irq_data *d, unsigned int type)
 		irq -= MCFINT_VECBASE;
 		if (intc_irqmap[irq].ack) {
 			u32 v;
-			v = readl(MCF_MBAR + MCFSIM_PITR);
+			v = readl(MCFSIM_PITR);
 			if (type == IRQ_TYPE_EDGE_FALLING)
 				v &= ~(0x1 << (32 - irq));
 			else
 				v |= (0x1 << (32 - irq));
-			writel(v, MCF_MBAR + MCFSIM_PITR);
+			writel(v, MCFSIM_PITR);
 		}
 	}
 	return 0;
@@ -163,10 +163,10 @@ void __init init_IRQ(void)
 	int irq, edge;
 
 	/* Mask all interrupt sources */
-	writel(0x88888888, MCF_MBAR + MCFSIM_ICR1);
-	writel(0x88888888, MCF_MBAR + MCFSIM_ICR2);
-	writel(0x88888888, MCF_MBAR + MCFSIM_ICR3);
-	writel(0x88888888, MCF_MBAR + MCFSIM_ICR4);
+	writel(0x88888888, MCFSIM_ICR1);
+	writel(0x88888888, MCFSIM_ICR2);
+	writel(0x88888888, MCFSIM_ICR3);
+	writel(0x88888888, MCFSIM_ICR4);
 
 	for (irq = 0; (irq < NR_IRQS); irq++) {
 		irq_set_chip(irq, &intc_irq_chip);
diff --git a/arch/m68k/platform/coldfire/m5249.c b/arch/m68k/platform/coldfire/m5249.c
index 300e729..df2968d 100644
--- a/arch/m68k/platform/coldfire/m5249.c
+++ b/arch/m68k/platform/coldfire/m5249.c
@@ -57,7 +57,7 @@ static void __init m5249_qspi_init(void)
 {
 	/* QSPI irq setup */
 	writeb(MCFSIM_ICR_AUTOVEC | MCFSIM_ICR_LEVEL4 | MCFSIM_ICR_PRI0,
-	       MCF_MBAR + MCFSIM_QSPIICR);
+	       MCFSIM_QSPIICR);
 	mcf_mapirq2imr(MCF_IRQ_QSPI, MCFINTC_QSPI);
 }
 
diff --git a/arch/m68k/platform/coldfire/m525x.c b/arch/m68k/platform/coldfire/m525x.c
index 8ce905f..fce8f8a 100644
--- a/arch/m68k/platform/coldfire/m525x.c
+++ b/arch/m68k/platform/coldfire/m525x.c
@@ -30,7 +30,7 @@ static void __init m525x_qspi_init(void)
 
 	/* QSPI irq setup */
 	writeb(MCFSIM_ICR_AUTOVEC | MCFSIM_ICR_LEVEL4 | MCFSIM_ICR_PRI0,
-	       MCF_MBAR + MCFSIM_QSPIICR);
+	       MCFSIM_QSPIICR);
 	mcf_mapirq2imr(MCF_IRQ_QSPI, MCFINTC_QSPI);
 #endif /* IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI) */
 }
@@ -42,7 +42,7 @@ static void __init m525x_i2c_init(void)
 
 	/* first I2C controller uses regular irq setup */
 	writeb(MCFSIM_ICR_AUTOVEC | MCFSIM_ICR_LEVEL5 | MCFSIM_ICR_PRI0,
-			MCF_MBAR + MCFSIM_I2CICR);
+		MCFSIM_I2CICR);
 	mcf_mapirq2imr(MCF_IRQ_I2C0, MCFINTC_I2C);
 
 	/* second I2C controller is completely different */
diff --git a/arch/m68k/platform/coldfire/timers.c b/arch/m68k/platform/coldfire/timers.c
index 0a273e7..51f6d2a 100644
--- a/arch/m68k/platform/coldfire/timers.c
+++ b/arch/m68k/platform/coldfire/timers.c
@@ -56,13 +56,13 @@ static void init_timer_irq(void)
 #ifdef MCFSIM_ICR_AUTOVEC
 	/* Timer1 is always used as system timer */
 	writeb(MCFSIM_ICR_AUTOVEC | MCFSIM_ICR_LEVEL6 | MCFSIM_ICR_PRI3,
-		MCF_MBAR + MCFSIM_TIMER1ICR);
+		MCFSIM_TIMER1ICR);
 	mcf_mapirq2imr(MCF_IRQ_TIMER, MCFINTC_TIMER1);
 
 #ifdef CONFIG_HIGHPROFILE
 	/* Timer2 is to be used as a high speed profile timer  */
 	writeb(MCFSIM_ICR_AUTOVEC | MCFSIM_ICR_LEVEL7 | MCFSIM_ICR_PRI3,
-		MCF_MBAR + MCFSIM_TIMER2ICR);
+		MCFSIM_TIMER2ICR);
 	mcf_mapirq2imr(MCF_IRQ_PROFILER, MCFINTC_TIMER2);
 #endif
 #endif /* MCFSIM_ICR_AUTOVEC */
-- 
1.7.0.4
