From: <gerg@snapgear.com>
Subject: [PATCH 2/2] m68knommu: external interrupt support to ColdFire intc-simr controller
Date: Mon, 14 Mar 2011 10:36:19 +1000
Message-ID: <1300062979-3060-3-git-send-email-gerg@snapgear.com>
References: <1300062979-3060-1-git-send-email-gerg@snapgear.com>
 <1300062979-3060-2-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:59869 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756321Ab1CNAhz (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 13 Mar 2011 20:37:55 -0400
In-Reply-To: <1300062979-3060-2-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The EDGE Port module of some ColdFire parts using the intc-simr interrupt
controller provides support for 7 external interrupts. These interrupts
go off-chip (that is they are not for internal peripherals). They need
some special handling and have some extra setup registers. Add code to
support them.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m520xsim.h             |    3 +
 arch/m68knommu/platform/coldfire/intc-simr.c |  114 +++++++++++++++++++++++++-
 2 files changed, 113 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/include/asm/m520xsim.h b/arch/m68k/include/asm/m520xsim.h
index ee89801..55d5a4c 100644
--- a/arch/m68k/include/asm/m520xsim.h
+++ b/arch/m68k/include/asm/m520xsim.h
@@ -63,9 +63,12 @@
 /*
  * EPORT and GPIO registers.
  */
+#define MCFEPORT_EPPAR			0xFC088000
 #define MCFEPORT_EPDDR			0xFC088002
+#define MCFEPORT_EPIER			0xFC088003
 #define MCFEPORT_EPDR			0xFC088004
 #define MCFEPORT_EPPDR			0xFC088005
+#define MCFEPORT_EPFR			0xFC088006
 
 #define MCFGPIO_PODR_BUSCTL		0xFC0A4000
 #define MCFGPIO_PODR_BE			0xFC0A4001
diff --git a/arch/m68knommu/platform/coldfire/intc-simr.c b/arch/m68knommu/platform/coldfire/intc-simr.c
index 8876f43..e642b24 100644
--- a/arch/m68knommu/platform/coldfire/intc-simr.c
+++ b/arch/m68knommu/platform/coldfire/intc-simr.c
@@ -3,7 +3,7 @@
  *
  * Interrupt controller code for the ColdFire 5208, 5207 & 532x parts.
  *
- * (C) Copyright 2009, Greg Ungerer <gerg@snapgear.com>
+ * (C) Copyright 2009-2011, Greg Ungerer <gerg@snapgear.com>
  *
  * This file is subject to the terms and conditions of the GNU General Public
  * License.  See the file COPYING in the main directory of this archive
@@ -21,6 +21,44 @@
 #include <asm/traps.h>
 
 /*
+ *	The EDGE Port interrupts are the fixed 7 external interrupts.
+ *	They need some special treatment, for example they need to be acked.
+ */
+#ifdef CONFIG_M520x
+/*
+ *	The 520x parts only support a limited range of these external
+ *	interrupts, only 1, 4 and 7 (as interrupts 65, 66 and 67).
+ */
+#define	EINT0	64	/* Is not actually used, but spot reserved for it */
+#define	EINT1	65	/* EDGE Port interrupt 1 */
+#define	EINT4	66	/* EDGE Port interrupt 4 */
+#define	EINT7	67	/* EDGE Port interrupt 7 */
+
+static unsigned int irqebitmap[] = { 0, 1, 4, 7 };
+static unsigned int inline irq2ebit(unsigned int irq)
+{
+	return irqebitmap[irq - EINT0];
+}
+
+#else
+
+/*
+ *	Most of the ColdFire parts with the EDGE Port module just have
+ *	a strait direct mapping of the 7 external interrupts. Although
+ *	there is a bit reserved for 0, it is not used.
+ */
+#define	EINT0	64	/* Is not actually used, but spot reserved for it */
+#define	EINT1	65	/* EDGE Port interrupt 1 */
+#define	EINT7	71	/* EDGE Port interrupt 7 */
+
+static unsigned int inline irq2ebit(unsigned int irq)
+{
+	return irq - EINT0;
+}
+
+#endif
+
+/*
  *	There maybe one or two interrupt control units, each has 64
  *	interrupts. If there is no second unit then MCFINTC1_* defines
  *	will be 0 (and code for them optimized away).
@@ -46,21 +84,86 @@ static void intc_irq_unmask(struct irq_data *d)
 		__raw_writeb(irq, MCFINTC0_CIMR);
 }
 
-static int intc_irq_set_type(struct irq_data *d, unsigned int type)
+static void intc_irq_ack(struct irq_data *d)
 {
-	unsigned int irq = d->irq - MCFINT_VECBASE;
+	unsigned int ebit = irq2ebit(d->irq);
 
+	__raw_writeb(0x1 << ebit, MCFEPORT_EPFR);
+}
+
+static unsigned int intc_irq_startup(struct irq_data *d)
+{
+	unsigned int irq = d->irq;
+
+	if ((irq >= EINT1) && (irq <= EINT7)) {
+		unsigned int ebit = irq2ebit(irq);
+		u8 v;
+
+		/* Set EPORT line as input */
+		v = __raw_readb(MCFEPORT_EPDDR);
+		__raw_writeb(v & ~(0x1 << ebit), MCFEPORT_EPDDR);
+
+		/* Set EPORT line as interrupt source */
+		v = __raw_readb(MCFEPORT_EPIER);
+		__raw_writeb(v | (0x1 << ebit), MCFEPORT_EPIER);
+	}
+
+	irq -= MCFINT_VECBASE;
 	if (MCFINTC1_ICR0 && (irq > 64))
 		__raw_writeb(5, MCFINTC1_ICR0 + irq - 64);
 	else
 		__raw_writeb(5, MCFINTC0_ICR0 + irq);
+
+
+	intc_irq_unmask(d);
+	return 0;
+}
+
+static int intc_irq_set_type(struct irq_data *d, unsigned int type)
+{
+	unsigned int ebit, irq = d->irq;
+	u16 pa, tb;
+
+	switch (type) {
+	case IRQ_TYPE_EDGE_RISING:
+		tb = 0x1;
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		tb = 0x2;
+		break;
+	case IRQ_TYPE_EDGE_BOTH:
+		tb = 0x3;
+		break;
+	default:
+		/* Level triggered */
+		tb = 0;
+		break;
+	}
+
+	if (tb)
+		set_irq_handler(irq, handle_edge_irq);
+
+	ebit = irq2ebit(irq) * 2;
+	pa = __raw_readw(MCFEPORT_EPPAR);
+	pa = (pa & ~(0x3 << ebit)) | (tb << ebit);
+	__raw_writew(pa, MCFEPORT_EPPAR);
+	
 	return 0;
 }
 
 static struct irq_chip intc_irq_chip = {
 	.name		= "CF-INTC",
+	.irq_startup	= intc_irq_startup,
+	.irq_mask	= intc_irq_mask,
+	.irq_unmask	= intc_irq_unmask,
+};
+
+static struct irq_chip intc_irq_chip_edge_port = {
+	.name		= "CF-INTC-EP",
+	.irq_startup	= intc_irq_startup,
 	.irq_mask	= intc_irq_mask,
 	.irq_unmask	= intc_irq_unmask,
+	.irq_ack	= intc_irq_ack,
 	.irq_set_type	= intc_irq_set_type,
 };
 
@@ -77,7 +180,10 @@ void __init init_IRQ(void)
 
 	eirq = MCFINT_VECBASE + 64 + (MCFINTC1_ICR0 ? 64 : 0);
 	for (irq = MCFINT_VECBASE; (irq < eirq); irq++) {
-		set_irq_chip(irq, &intc_irq_chip);
+		if ((irq >= EINT1) && (irq <= EINT7))
+			set_irq_chip(irq, &intc_irq_chip_edge_port);
+		else
+			set_irq_chip(irq, &intc_irq_chip);
 		set_irq_type(irq, IRQ_TYPE_LEVEL_HIGH);
 		set_irq_handler(irq, handle_level_irq);
 	}
-- 
1.7.0.4
