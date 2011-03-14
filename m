From: <gerg@snapgear.com>
Subject: [PATCH 1/2] m68knommu: external interrupt support to ColdFire intc-2 controller
Date: Mon, 14 Mar 2011 10:36:18 +1000
Message-ID: <1300062979-3060-2-git-send-email-gerg@snapgear.com>
References: <1300062979-3060-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:59826 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753312Ab1CNAg2 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 13 Mar 2011 20:36:28 -0400
In-Reply-To: <1300062979-3060-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The EDGE Port module of some ColdFire parts using the intc-2 interrupt
controller provides support for 7 external interrupts. These interrupts
go off-chip (that is they are not for internal peripherals). They need
some special handling and have some extra setup registers. Add code to
support them.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m523xsim.h          |    3 +
 arch/m68k/include/asm/m527xsim.h          |    3 +
 arch/m68k/include/asm/m54xxsim.h          |   10 ++++
 arch/m68knommu/platform/coldfire/intc-2.c |   85 +++++++++++++++++++++++++++--
 4 files changed, 97 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/include/asm/m523xsim.h b/arch/m68k/include/asm/m523xsim.h
index 3852f07..8996df6 100644
--- a/arch/m68k/include/asm/m523xsim.h
+++ b/arch/m68k/include/asm/m523xsim.h
@@ -139,9 +139,12 @@
 /*
  * EPort
  */
+#define MCFEPORT_EPPAR		(MCF_IPSBAR + 0x130000)
 #define MCFEPORT_EPDDR		(MCF_IPSBAR + 0x130002)
+#define MCFEPORT_EPIER		(MCF_IPSBAR + 0x130003)
 #define MCFEPORT_EPDR		(MCF_IPSBAR + 0x130004)
 #define MCFEPORT_EPPDR		(MCF_IPSBAR + 0x130005)
+#define MCFEPORT_EPFR		(MCF_IPSBAR + 0x130006)
 
 /*
  * Generic GPIO support
diff --git a/arch/m68k/include/asm/m527xsim.h b/arch/m68k/include/asm/m527xsim.h
index c23046e..74855a6 100644
--- a/arch/m68k/include/asm/m527xsim.h
+++ b/arch/m68k/include/asm/m527xsim.h
@@ -259,9 +259,12 @@
 /*
  * EPort
  */
+#define MCFEPORT_EPPAR		(MCF_IPSBAR + 0x130000)
 #define MCFEPORT_EPDDR		(MCF_IPSBAR + 0x130002)
+#define MCFEPORT_EPIER		(MCF_IPSBAR + 0x130003)
 #define MCFEPORT_EPDR		(MCF_IPSBAR + 0x130004)
 #define MCFEPORT_EPPDR		(MCF_IPSBAR + 0x130005)
+#define MCFEPORT_EPFR		(MCF_IPSBAR + 0x130006)
 
 /*
  *	GPIO pins setups to enable the UARTs.
diff --git a/arch/m68k/include/asm/m54xxsim.h b/arch/m68k/include/asm/m54xxsim.h
index daaae27..1ed8bfb 100644
--- a/arch/m68k/include/asm/m54xxsim.h
+++ b/arch/m68k/include/asm/m54xxsim.h
@@ -50,6 +50,16 @@
 #define MCFGPIO_IRQ_VECBASE	-1
 
 /*
+ *	EDGE Port support.
+ */
+#define	MCFEPORT_EPPAR		(MCF_MBAR + 0xf00)	/* Pin assignment */
+#define	MCFEPORT_EPDDR		(MCF_MBAR + 0xf04)	/* Data direction */
+#define	MCFEPORT_EPIER		(MCF_MBAR + 0xf05)	/* Interrupt enable */
+#define	MCFEPORT_EPDR		(MCF_MBAR + 0xf08)	/* Port data (w) */
+#define	MCFEPORT_EPPDR		(MCF_MBAR + 0xf09)	/* Port data (r) */
+#define	MCFEPORT_EPFR		(MCF_MBAR + 0xf0c)	/* Flags */
+
+/*
  *	Some PSC related definitions
  */
 #define MCF_PAR_PSC(x)		(0x000A4F-((x)&0x3))
diff --git a/arch/m68knommu/platform/coldfire/intc-2.c b/arch/m68knommu/platform/coldfire/intc-2.c
index 66d4e47..2cbfbf0 100644
--- a/arch/m68knommu/platform/coldfire/intc-2.c
+++ b/arch/m68knommu/platform/coldfire/intc-2.c
@@ -7,7 +7,10 @@
  * family, the 5270, 5271, 5274, 5275, and the 528x family which have two such
  * controllers, and the 547x and 548x families which have only one of them.
  *
- * (C) Copyright 2009, Greg Ungerer <gerg@snapgear.com>
+ * The external 7 fixed interrupts are part the the Edge Port unit of these
+ * ColdFire parts. They can be configured as level or edge triggered.
+ *
+ * (C) Copyright 2009-2011, Greg Ungerer <gerg@snapgear.com>
  *
  * This file is subject to the terms and conditions of the GNU General Public
  * License.  See the file COPYING in the main directory of this archive
@@ -30,6 +33,14 @@
 #define MCFSIM_ICR_LEVEL(l)	((l)<<3)	/* Level l intr */
 #define MCFSIM_ICR_PRI(p)	(p)		/* Priority p intr */
 
+/*
+ *	The EDGE Port interrupts are the fixed 7 external interrupts.
+ *	They need some special treatment, for example they need to be acked.
+ */
+#define	EINT0	64	/* Is not actually used, but spot reserved for it */
+#define	EINT1	65	/* EDGE Port interrupt 1 */
+#define	EINT7	71	/* EDGE Port interrupt 7 */
+
 #ifdef MCFICM_INTC1
 #define NR_VECS	128
 #else
@@ -76,9 +87,17 @@ static void intc_irq_unmask(struct irq_data *d)
 	__raw_writel(val & ~imrbit, imraddr);
 }
 
-static int intc_irq_set_type(struct irq_data *d, unsigned int type)
+/*
+ *	Only the external (or EDGE Port) interrupts need to be acknowledged
+ *	here, as part of the IRQ handler. They only really need to be ack'ed
+ *	if they are in edge triggered mode, but there is no harm in doing it
+ *	for all types.
+ */
+static void intc_irq_ack(struct irq_data *d)
 {
-	return 0;
+	unsigned int irq = d->irq;
+
+	__raw_writeb(0x1 << (irq - EINT0), MCFEPORT_EPFR);
 }
 
 /*
@@ -104,15 +123,70 @@ static unsigned int intc_irq_startup(struct irq_data *d)
 	if (__raw_readb(icraddr) == 0)
 		__raw_writeb(intc_intpri--, icraddr);
 
+	irq = d->irq;
+	if ((irq >= EINT1) && (irq <= EINT7)) {
+		u8 v;
+
+		irq -= EINT0;
+
+		/* Set EPORT line as input */
+		v = __raw_readb(MCFEPORT_EPDDR);
+		__raw_writeb(v & ~(0x1 << irq), MCFEPORT_EPDDR);
+
+		/* Set EPORT line as interrupt source */
+		v = __raw_readb(MCFEPORT_EPIER);
+		__raw_writeb(v | (0x1 << irq), MCFEPORT_EPIER);
+	}
+
 	intc_irq_unmask(d);
 	return 0;
 }
 
+static int intc_irq_set_type(struct irq_data *d, unsigned int type)
+{
+	unsigned int irq = d->irq;
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
+	irq -= EINT0;
+	pa = __raw_readw(MCFEPORT_EPPAR);
+	pa = (pa & ~(0x3 << (irq * 2))) | (tb << (irq * 2));
+	__raw_writew(pa, MCFEPORT_EPPAR);
+	
+	return 0;
+}
+
 static struct irq_chip intc_irq_chip = {
 	.name		= "CF-INTC",
 	.irq_startup	= intc_irq_startup,
 	.irq_mask	= intc_irq_mask,
 	.irq_unmask	= intc_irq_unmask,
+};
+
+static struct irq_chip intc_irq_chip_edge_port = {
+	.name		= "CF-INTC-EP",
+	.irq_startup	= intc_irq_startup,
+	.irq_mask	= intc_irq_mask,
+	.irq_unmask	= intc_irq_unmask,
+	.irq_ack	= intc_irq_ack,
 	.irq_set_type	= intc_irq_set_type,
 };
 
@@ -129,7 +203,10 @@ void __init init_IRQ(void)
 #endif
 
 	for (irq = MCFINT_VECBASE; (irq < MCFINT_VECBASE + NR_VECS); irq++) {
-		set_irq_chip(irq, &intc_irq_chip);
+		if ((irq >= EINT1) && (irq <=EINT7))
+			set_irq_chip(irq, &intc_irq_chip_edge_port);
+		else
+			set_irq_chip(irq, &intc_irq_chip);
 		set_irq_type(irq, IRQ_TYPE_LEVEL_HIGH);
 		set_irq_handler(irq, handle_level_irq);
 	}
-- 
1.7.0.4
