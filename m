From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH] SUN3: Get interrupts working again
Date: Sun, 11 Nov 2012 13:28:33 +0100 (CET)
Message-ID: <20121111122833.B5FB71DBC2@solo.franken.de>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: sammy@sammy.net, geert@linux-m68k.org

SUN3 Intregister is not for enabling individual interrupts, but to enable
special interrupts. So using it for interrupt enable/disable was wrong.
The clock interrupt needs some special treatment to keep ticking.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---

 arch/m68k/sun3/sun3ints.c |   29 ++++-------------------------
 1 files changed, 4 insertions(+), 25 deletions(-)

diff --git a/arch/m68k/sun3/sun3ints.c b/arch/m68k/sun3/sun3ints.c
index 78b60f5..6bbca30 100644
--- a/arch/m68k/sun3/sun3ints.c
+++ b/arch/m68k/sun3/sun3ints.c
@@ -66,6 +66,8 @@ static irqreturn_t sun3_int5(int irq, void *dev_id)
 #ifdef CONFIG_SUN3
 	intersil_clear();
 #endif
+	sun3_disable_irq(5);
+	sun3_enable_irq(5);
 #ifdef CONFIG_SUN3
 	intersil_clear();
 #endif
@@ -79,41 +81,18 @@ static irqreturn_t sun3_int5(int irq, void *dev_id)
 
 static irqreturn_t sun3_vec255(int irq, void *dev_id)
 {
-//	intersil_clear();
 	return IRQ_HANDLED;
 }
 
-static void sun3_irq_enable(struct irq_data *data)
-{
-    sun3_enable_irq(data->irq);
-};
-
-static void sun3_irq_disable(struct irq_data *data)
-{
-    sun3_disable_irq(data->irq);
-};
-
-static struct irq_chip sun3_irq_chip = {
-	.name		= "sun3",
-	.irq_startup	= m68k_irq_startup,
-	.irq_shutdown	= m68k_irq_shutdown,
-	.irq_enable	= sun3_irq_enable,
-	.irq_disable	= sun3_irq_disable,
-	.irq_mask	= sun3_irq_disable,
-	.irq_unmask	= sun3_irq_enable,
-};
-
 void __init sun3_init_IRQ(void)
 {
 	*sun3_intreg = 1;
 
-	m68k_setup_irq_controller(&sun3_irq_chip, handle_level_irq, IRQ_AUTO_1,
-				  7);
 	m68k_setup_user_interrupt(VEC_USER, 128);
 
-	if (request_irq(IRQ_AUTO_5, sun3_int5, 0, "int5", NULL))
+	if (request_irq(IRQ_AUTO_5, sun3_int5, 0, "clock", NULL))
 		pr_err("Couldn't register %s interrupt\n", "int5");
-	if (request_irq(IRQ_AUTO_7, sun3_int7, 0, "int7", NULL))
+	if (request_irq(IRQ_AUTO_7, sun3_int7, 0, "nmi", NULL))
 		pr_err("Couldn't register %s interrupt\n", "int7");
 	if (request_irq(IRQ_USER+127, sun3_vec255, 0, "vec255", NULL))
 		pr_err("Couldn't register %s interrupt\n", "vec255");
