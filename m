From: <gerg@snapgear.com>
Subject: [PATCH 3/3] m68knommu: limit interrupts supported by
	ColdFire intc-simr driver
Date: Wed, 9 Mar 2011 10:51:36 +1000
Message-ID: <1299631896-31186-4-git-send-email-gerg@snapgear.com>
References: <1299631896-31186-1-git-send-email-gerg@snapgear.com>
	<1299631896-31186-2-git-send-email-gerg@snapgear.com>
	<1299631896-31186-3-git-send-email-gerg@snapgear.com>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <uclinux-dev-bounces@uclinux.org>
In-Reply-To: <1299631896-31186-3-git-send-email-gerg@snapgear.com>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Sender: uclinux-dev-bounces@uclinux.org
Errors-To: uclinux-dev-bounces@uclinux.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>
List-Id: linux-m68k@vger.kernel.org

From: Greg Ungerer <gerg@uclinux.org>

The intc-simr interrupt controller on some ColdFire CPUs has a set range of
interrupts its supports (64 through 128 or 192 depending on model). We
shouldn't be setting this handler for every possible interrupt from 0 to
255. Set more appropriate limits, and this means we can drop the interrupt
number check in the mask and unmask routines.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68knommu/platform/coldfire/intc-simr.c |   47 +++++++++++++------------
 1 files changed, 24 insertions(+), 23 deletions(-)

diff --git a/arch/m68knommu/platform/coldfire/intc-simr.c b/arch/m68knommu/platform/coldfire/intc-simr.c
index 69a3b67..8876f43 100644
--- a/arch/m68knommu/platform/coldfire/intc-simr.c
+++ b/arch/m68knommu/platform/coldfire/intc-simr.c
@@ -20,40 +20,40 @@
 #include <asm/mcfsim.h>
 #include <asm/traps.h>
 
+/*
+ *	There maybe one or two interrupt control units, each has 64
+ *	interrupts. If there is no second unit then MCFINTC1_* defines
+ *	will be 0 (and code for them optimized away).
+ */
+
 static void intc_irq_mask(struct irq_data *d)
 {
-	unsigned int irq = d->irq;
+	unsigned int irq = d->irq - MCFINT_VECBASE;
 
-	if (irq >= MCFINT_VECBASE) {
-		if (irq < MCFINT_VECBASE + 64)
-			__raw_writeb(irq - MCFINT_VECBASE, MCFINTC0_SIMR);
-		else if ((irq < MCFINT_VECBASE + 128) && MCFINTC1_SIMR)
-			__raw_writeb(irq - MCFINT_VECBASE - 64, MCFINTC1_SIMR);
-	}
+	if (MCFINTC1_SIMR && (irq > 64))
+		__raw_writeb(irq - 64, MCFINTC1_SIMR);
+	else
+		__raw_writeb(irq, MCFINTC0_SIMR);
 }
 
 static void intc_irq_unmask(struct irq_data *d)
 {
-	unsigned int irq = d->irq;
+	unsigned int irq = d->irq - MCFINT_VECBASE;
 
-	if (irq >= MCFINT_VECBASE) {
-		if (irq < MCFINT_VECBASE + 64)
-			__raw_writeb(irq - MCFINT_VECBASE, MCFINTC0_CIMR);
-		else if ((irq < MCFINT_VECBASE + 128) && MCFINTC1_CIMR)
-			__raw_writeb(irq - MCFINT_VECBASE - 64, MCFINTC1_CIMR);
-	}
+	if (MCFINTC1_CIMR && (irq > 64))
+		__raw_writeb(irq - 64, MCFINTC1_CIMR);
+	else
+		__raw_writeb(irq, MCFINTC0_CIMR);
 }
 
 static int intc_irq_set_type(struct irq_data *d, unsigned int type)
 {
-	unsigned int irq = d->irq;
+	unsigned int irq = d->irq - MCFINT_VECBASE;
 
-	if (irq >= MCFINT_VECBASE) {
-		if (irq < MCFINT_VECBASE + 64)
-			__raw_writeb(5, MCFINTC0_ICR0 + irq - MCFINT_VECBASE);
-		else if ((irq < MCFINT_VECBASE) && MCFINTC1_ICR0)
-			__raw_writeb(5, MCFINTC1_ICR0 + irq - MCFINT_VECBASE - 64);
-	}
+	if (MCFINTC1_ICR0 && (irq > 64))
+		__raw_writeb(5, MCFINTC1_ICR0 + irq - 64);
+	else
+		__raw_writeb(5, MCFINTC0_ICR0 + irq);
 	return 0;
 }
 
@@ -66,7 +66,7 @@ static struct irq_chip intc_irq_chip = {
 
 void __init init_IRQ(void)
 {
-	int irq;
+	int irq, eirq;
 
 	init_vectors();
 
@@ -75,7 +75,8 @@ void __init init_IRQ(void)
 	if (MCFINTC1_SIMR)
 		__raw_writeb(0xff, MCFINTC1_SIMR);
 
-	for (irq = 0; (irq < NR_IRQS); irq++) {
+	eirq = MCFINT_VECBASE + 64 + (MCFINTC1_ICR0 ? 64 : 0);
+	for (irq = MCFINT_VECBASE; (irq < eirq); irq++) {
 		set_irq_chip(irq, &intc_irq_chip);
 		set_irq_type(irq, IRQ_TYPE_LEVEL_HIGH);
 		set_irq_handler(irq, handle_level_irq);
-- 
1.7.0.4

_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
