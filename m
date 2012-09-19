From: <gerg@snapgear.com>
Subject: [PATCH 1/9] m68knommu: make ColdFire IMR and IPR register definitions absolute addresses
Date: Wed, 19 Sep 2012 15:08:36 +1000
Message-ID: <1348031324-13228-2-git-send-email-gerg@snapgear.com>
References: <1348031324-13228-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dnvwsmailout1.mcafee.com ([161.69.31.173]:25406 "EHLO
	DNVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751107Ab2ISFFB (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 19 Sep 2012 01:05:01 -0400
In-Reply-To: <1348031324-13228-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Make all definitions of the ColdFire Interrupt Mask and Pending registers
absolute addresses. Currently some are relative to the MBAR peripheral region.

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
 arch/m68k/include/asm/m5206sim.h   |    4 ++--
 arch/m68k/include/asm/m5249sim.h   |    6 +++---
 arch/m68k/include/asm/m525xsim.h   |    4 ++--
 arch/m68k/include/asm/m5272sim.h   |    8 ++++----
 arch/m68k/include/asm/m5307sim.h   |    6 +++---
 arch/m68k/include/asm/m5407sim.h   |    6 +++---
 arch/m68k/platform/coldfire/intc.c |   28 ++++++++++++++--------------
 7 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/arch/m68k/include/asm/m5206sim.h b/arch/m68k/include/asm/m5206sim.h
index 6972236..e8bae33 100644
--- a/arch/m68k/include/asm/m5206sim.h
+++ b/arch/m68k/include/asm/m5206sim.h
@@ -40,8 +40,8 @@
 #define	MCFSIM_ICR15		0x22		/* Intr Ctrl reg 15 (r/w) */
 #endif
 
-#define MCFSIM_IMR		0x36		/* Interrupt Mask reg (r/w) */
-#define MCFSIM_IPR		0x3a		/* Interrupt Pend reg (r/w) */
+#define	MCFSIM_IMR		(MCF_MBAR + 0x36)	/* Interrupt Mask */
+#define	MCFSIM_IPR		(MCF_MBAR + 0x3a)	/* Interrupt Pending */
 
 #define	MCFSIM_RSR		0x40		/* Reset Status reg (r/w) */
 #define	MCFSIM_SYPCR		0x41		/* System Protection reg (r/w)*/
diff --git a/arch/m68k/include/asm/m5249sim.h b/arch/m68k/include/asm/m5249sim.h
index 7f0c2c3..d0aa7f2 100644
--- a/arch/m68k/include/asm/m5249sim.h
+++ b/arch/m68k/include/asm/m5249sim.h
@@ -32,9 +32,9 @@
 #define	MCFSIM_PAR		0x04		/* Pin Assignment reg (r/w) */
 #define	MCFSIM_IRQPAR		0x06		/* Interrupt Assignment reg (r/w) */
 #define	MCFSIM_MPARK		0x0C		/* BUS Master Control Reg*/
-#define	MCFSIM_IPR		0x40		/* Interrupt Pend reg (r/w) */
-#define	MCFSIM_IMR		0x44		/* Interrupt Mask reg (r/w) */
-#define	MCFSIM_AVR		0x4b		/* Autovector Ctrl reg (r/w) */
+#define	MCFSIM_IPR		(MCF_MBAR + 0x40)	/* Interrupt Pending */
+#define	MCFSIM_IMR		(MCF_MBAR + 0x44)	/* Interrupt Mask */
+#define	MCFSIM_AVR		(MCF_MBAR + 0x4b)	/* Autovector Ctrl */
 #define	MCFSIM_ICR0		0x4c		/* Intr Ctrl reg 0 (r/w) */
 #define	MCFSIM_ICR1		0x4d		/* Intr Ctrl reg 1 (r/w) */
 #define	MCFSIM_ICR2		0x4e		/* Intr Ctrl reg 2 (r/w) */
diff --git a/arch/m68k/include/asm/m525xsim.h b/arch/m68k/include/asm/m525xsim.h
index 6da24f6..0d6d192 100644
--- a/arch/m68k/include/asm/m525xsim.h
+++ b/arch/m68k/include/asm/m525xsim.h
@@ -31,8 +31,8 @@
 #define MCFSIM_SWIVR		0x02		/* SW Watchdog intr reg (r/w) */
 #define MCFSIM_SWSR		0x03		/* SW Watchdog service (r/w) */
 #define MCFSIM_MPARK		0x0C		/* BUS Master Control Reg*/
-#define MCFSIM_IPR		0x40		/* Interrupt Pend reg (r/w) */
-#define MCFSIM_IMR		0x44		/* Interrupt Mask reg (r/w) */
+#define MCFSIM_IPR		(MCF_MBAR + 0x40)	/* Interrupt Pending */
+#define MCFSIM_IMR		(MCF_MBAR + 0x44)	/* Interrupt Mask */
 #define MCFSIM_ICR0		0x4c		/* Intr Ctrl reg 0 (r/w) */
 #define MCFSIM_ICR1		0x4d		/* Intr Ctrl reg 1 (r/w) */
 #define MCFSIM_ICR2		0x4e		/* Intr Ctrl reg 2 (r/w) */
diff --git a/arch/m68k/include/asm/m5272sim.h b/arch/m68k/include/asm/m5272sim.h
index a58f176..378a6d9 100644
--- a/arch/m68k/include/asm/m5272sim.h
+++ b/arch/m68k/include/asm/m5272sim.h
@@ -32,10 +32,10 @@
 #define	MCFSIM_ICR3		0x28		/* Intr Ctrl reg 3 (r/w) */
 #define	MCFSIM_ICR4		0x2c		/* Intr Ctrl reg 4 (r/w) */
 
-#define MCFSIM_ISR		0x30		/* Interrupt Source reg (r/w) */
-#define MCFSIM_PITR		0x34		/* Interrupt Transition (r/w) */
-#define	MCFSIM_PIWR		0x38		/* Interrupt Wakeup reg (r/w) */
-#define	MCFSIM_PIVR		0x3f		/* Interrupt Vector reg (r/w( */
+#define	MCFSIM_ISR		(MCF_MBAR + 0x30)	/* Intr Source */
+#define	MCFSIM_PITR		(MCF_MBAR + 0x34)	/* Intr Transition */
+#define	MCFSIM_PIWR		(MCF_MBAR + 0x38)	/* Intr Wakeup */
+#define	MCFSIM_PIVR		(MCF_MBAR + 0x3f)	/* Intr Vector */
 
 #define	MCFSIM_WRRR		0x280		/* Watchdog reference (r/w) */
 #define	MCFSIM_WIRR		0x284		/* Watchdog interrupt (r/w) */
diff --git a/arch/m68k/include/asm/m5307sim.h b/arch/m68k/include/asm/m5307sim.h
index 3bc3ada..255f7f3 100644
--- a/arch/m68k/include/asm/m5307sim.h
+++ b/arch/m68k/include/asm/m5307sim.h
@@ -31,9 +31,9 @@
 #define	MCFSIM_IRQPAR		0x06		/* Interrupt Assignment reg (r/w) */
 #define	MCFSIM_PLLCR		0x08		/* PLL Control Reg*/
 #define	MCFSIM_MPARK		0x0C		/* BUS Master Control Reg*/
-#define	MCFSIM_IPR		0x40		/* Interrupt Pend reg (r/w) */
-#define	MCFSIM_IMR		0x44		/* Interrupt Mask reg (r/w) */
-#define	MCFSIM_AVR		0x4b		/* Autovector Ctrl reg (r/w) */
+#define	MCFSIM_IPR		(MCF_MBAR + 0x40)	/* Interrupt Pend */
+#define	MCFSIM_IMR		(MCF_MBAR + 0x44)	/* Interrupt Mask */
+#define	MCFSIM_AVR		(MCF_MBAR + 0x4b)	/* Autovector Ctrl */
 #define	MCFSIM_ICR0		0x4c		/* Intr Ctrl reg 0 (r/w) */
 #define	MCFSIM_ICR1		0x4d		/* Intr Ctrl reg 1 (r/w) */
 #define	MCFSIM_ICR2		0x4e		/* Intr Ctrl reg 2 (r/w) */
diff --git a/arch/m68k/include/asm/m5407sim.h b/arch/m68k/include/asm/m5407sim.h
index 79f58dd..afdd563 100644
--- a/arch/m68k/include/asm/m5407sim.h
+++ b/arch/m68k/include/asm/m5407sim.h
@@ -31,9 +31,9 @@
 #define	MCFSIM_IRQPAR		0x06		/* Interrupt Assignment reg (r/w) */
 #define	MCFSIM_PLLCR		0x08		/* PLL Control Reg*/
 #define	MCFSIM_MPARK		0x0C		/* BUS Master Control Reg*/
-#define	MCFSIM_IPR		0x40		/* Interrupt Pend reg (r/w) */
-#define	MCFSIM_IMR		0x44		/* Interrupt Mask reg (r/w) */
-#define	MCFSIM_AVR		0x4b		/* Autovector Ctrl reg (r/w) */
+#define	MCFSIM_IPR		(MCF_MBAR + 0x40)	/* Interrupt Pending */
+#define	MCFSIM_IMR		(MCF_MBAR + 0x44)	/* Interrupt Mask */
+#define	MCFSIM_AVR		(MCF_MBAR + 0x4b)	/* Autovector Ctrl */
 #define	MCFSIM_ICR0		0x4c		/* Intr Ctrl reg 0 (r/w) */
 #define	MCFSIM_ICR1		0x4d		/* Intr Ctrl reg 1 (r/w) */
 #define	MCFSIM_ICR2		0x4e		/* Intr Ctrl reg 2 (r/w) */
diff --git a/arch/m68k/platform/coldfire/intc.c b/arch/m68k/platform/coldfire/intc.c
index 5c0c150..cce2574 100644
--- a/arch/m68k/platform/coldfire/intc.c
+++ b/arch/m68k/platform/coldfire/intc.c
@@ -45,23 +45,23 @@ unsigned char mcf_irq2imr[NR_IRQS];
 void mcf_setimr(int index)
 {
 	u16 imr;
-	imr = __raw_readw(MCF_MBAR + MCFSIM_IMR);
-	__raw_writew(imr | (0x1 << index), MCF_MBAR + MCFSIM_IMR);
+	imr = __raw_readw(MCFSIM_IMR);
+	__raw_writew(imr | (0x1 << index), MCFSIM_IMR);
 }
 
 void mcf_clrimr(int index)
 {
 	u16 imr;
-	imr = __raw_readw(MCF_MBAR + MCFSIM_IMR);
-	__raw_writew(imr & ~(0x1 << index), MCF_MBAR + MCFSIM_IMR);
+	imr = __raw_readw(MCFSIM_IMR);
+	__raw_writew(imr & ~(0x1 << index), MCFSIM_IMR);
 }
 
 void mcf_maskimr(unsigned int mask)
 {
 	u16 imr;
-	imr = __raw_readw(MCF_MBAR + MCFSIM_IMR);
+	imr = __raw_readw(MCFSIM_IMR);
 	imr |= mask;
-	__raw_writew(imr, MCF_MBAR + MCFSIM_IMR);
+	__raw_writew(imr, MCFSIM_IMR);
 }
 
 #else
@@ -69,23 +69,23 @@ void mcf_maskimr(unsigned int mask)
 void mcf_setimr(int index)
 {
 	u32 imr;
-	imr = __raw_readl(MCF_MBAR + MCFSIM_IMR);
-	__raw_writel(imr | (0x1 << index), MCF_MBAR + MCFSIM_IMR);
+	imr = __raw_readl(MCFSIM_IMR);
+	__raw_writel(imr | (0x1 << index), MCFSIM_IMR);
 }
 
 void mcf_clrimr(int index)
 {
 	u32 imr;
-	imr = __raw_readl(MCF_MBAR + MCFSIM_IMR);
-	__raw_writel(imr & ~(0x1 << index), MCF_MBAR + MCFSIM_IMR);
+	imr = __raw_readl(MCFSIM_IMR);
+	__raw_writel(imr & ~(0x1 << index), MCFSIM_IMR);
 }
 
 void mcf_maskimr(unsigned int mask)
 {
 	u32 imr;
-	imr = __raw_readl(MCF_MBAR + MCFSIM_IMR);
+	imr = __raw_readl(MCFSIM_IMR);
 	imr |= mask;
-	__raw_writel(imr, MCF_MBAR + MCFSIM_IMR);
+	__raw_writel(imr, MCFSIM_IMR);
 }
 
 #endif
@@ -104,9 +104,9 @@ void mcf_autovector(int irq)
 #ifdef MCFSIM_AVR
 	if ((irq >= EIRQ1) && (irq <= EIRQ7)) {
 		u8 avec;
-		avec = __raw_readb(MCF_MBAR + MCFSIM_AVR);
+		avec = __raw_readb(MCFSIM_AVR);
 		avec |= (0x1 << (irq - EIRQ1 + 1));
-		__raw_writeb(avec, MCF_MBAR + MCFSIM_AVR);
+		__raw_writeb(avec, MCFSIM_AVR);
 	}
 #endif
 }
-- 
1.7.0.4
