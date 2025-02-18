Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B6A25A620
	for <linux-m68k@lists.linux-m68k.org>; Tue, 18 Feb 2025 12:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739883179; cv=none; b=ScuvBbk2DRIOwsBwbVEWFMcm6Cets4JsX53fTSr7FBhyrb1ftLob4+K9D1aCIR9jAtmlOL6L/JaKAxM5ZM6cQzyKNj7+OX/8FmEnHlsUaAVPt9qajO7wWsl0IL/8cLLJDEGgXj/2YjJe6qvnbs5kDWZIHo7fKzuiJNvpe7hmLDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739883179; c=relaxed/simple;
	bh=zroVdeOVB0mwE3bl40Edspk2ZtophIHYnKBaNLsHEkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NoBSuwja0QWZMEbxoUnpJM+UqUooBXOnSV1qNB9oI9o7lhbQ01h38OQjVbB68ackzNyuFpBl9Rf9XRbGnc58XLeIZrEelGYeESemvhCt0WUnC+ERp8PFBbE01sR/05+GNaMZskUfwFEce6lXTVetsSYIUEeAQi2OCbF2EU9wRDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0AFF25C5CED;
	Tue, 18 Feb 2025 12:52:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42635C4CEE7;
	Tue, 18 Feb 2025 12:52:56 +0000 (UTC)
From: Greg Ungerer <gerg@linux-m68k.org>
To: linux-m68k@lists.linux-m68k.org
Cc: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 07/13] m68k: coldfire: support devicetree binding for intc-2 controller
Date: Tue, 18 Feb 2025 22:46:27 +1000
Message-ID: <20250218125124.2692982-8-gerg@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250218125124.2692982-1-gerg@linux-m68k.org>
References: <20250218125124.2692982-1-gerg@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add code support to the ColdFire intc-2 interrupt controller so that
it can be mapped via a devicetree binding.

This is implemented by adding IRQCHIP and IRQ_DOMAIN support. This first
version does not completely setup the interrupt controller using the IO
mapping binding passed in via the devicetree. Future changes will add
that.

Devicetree support is not yet enabled for ColdFire targets so this
interrupt controller code still supports the legacy setup for now.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/coldfire/intc-2.c | 59 ++++++++++++++++++++++++++++++-------
 1 file changed, 49 insertions(+), 10 deletions(-)

diff --git a/arch/m68k/coldfire/intc-2.c b/arch/m68k/coldfire/intc-2.c
index f74f0e473119..ac29106dc166 100644
--- a/arch/m68k/coldfire/intc-2.c
+++ b/arch/m68k/coldfire/intc-2.c
@@ -21,8 +21,11 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/interrupt.h>
-#include <linux/irq.h>
 #include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/irqchip.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
 #include <asm/coldfire.h>
 #include <asm/mcfsim.h>
 #include <asm/traps.h>
@@ -49,7 +52,7 @@
 
 static void intc_irq_mask(struct irq_data *d)
 {
-	unsigned int irq = d->irq - MCFINT_VECBASE;
+	unsigned int irq = d->hwirq - MCFINT_VECBASE;
 	unsigned long imraddr;
 	u32 val, imrbit;
 
@@ -67,7 +70,7 @@ static void intc_irq_mask(struct irq_data *d)
 
 static void intc_irq_unmask(struct irq_data *d)
 {
-	unsigned int irq = d->irq - MCFINT_VECBASE;
+	unsigned int irq = d->hwirq - MCFINT_VECBASE;
 	unsigned long imraddr;
 	u32 val, imrbit;
 
@@ -95,7 +98,7 @@ static void intc_irq_unmask(struct irq_data *d)
  */
 static void intc_irq_ack(struct irq_data *d)
 {
-	unsigned int irq = d->irq;
+	unsigned int irq = d->hwirq;
 
 	__raw_writeb(0x1 << (irq - EINT0), MCFEPORT_EPFR);
 }
@@ -111,7 +114,7 @@ static u8 intc_intpri = MCFSIM_ICR_LEVEL(6) | MCFSIM_ICR_PRI(6);
 
 static unsigned int intc_irq_startup(struct irq_data *d)
 {
-	unsigned int irq = d->irq - MCFINT_VECBASE;
+	unsigned int irq = d->hwirq - MCFINT_VECBASE;
 	unsigned long icraddr;
 
 #ifdef MCFICM_INTC1
@@ -123,7 +126,7 @@ static unsigned int intc_irq_startup(struct irq_data *d)
 	if (__raw_readb(icraddr) == 0)
 		__raw_writeb(intc_intpri--, icraddr);
 
-	irq = d->irq;
+	irq = d->hwirq;
 	if ((irq >= EINT1) && (irq <= EINT7)) {
 		u8 v;
 
@@ -144,7 +147,7 @@ static unsigned int intc_irq_startup(struct irq_data *d)
 
 static int intc_irq_set_type(struct irq_data *d, unsigned int type)
 {
-	unsigned int irq = d->irq;
+	unsigned int irq = d->hwirq;
 	u16 pa, tb;
 
 	switch (type) {
@@ -192,21 +195,57 @@ static struct irq_chip intc_irq_chip_edge_port = {
 
 void __init init_IRQ(void)
 {
-	int irq;
-
 	/* Mask all interrupt sources */
 	__raw_writel(0x1, MCFICM_INTC0 + MCFINTC_IMRL);
 #ifdef MCFICM_INTC1
 	__raw_writel(0x1, MCFICM_INTC1 + MCFINTC_IMRL);
 #endif
 
+#ifdef CONFIG_IRQCHIP
+	irqchip_init();
+#else
+	int irq;
 	for (irq = MCFINT_VECBASE; (irq < MCFINT_VECBASE + NR_VECS); irq++) {
-		if ((irq >= EINT1) && (irq <=EINT7))
+		if ((irq >= EINT1) && (irq <= EINT7))
 			irq_set_chip(irq, &intc_irq_chip_edge_port);
 		else
 			irq_set_chip(irq, &intc_irq_chip);
 		irq_set_irq_type(irq, IRQ_TYPE_LEVEL_HIGH);
 		irq_set_handler(irq, handle_level_irq);
 	}
+#endif
+}
+
+#ifdef CONFIG_IRQ_DOMAIN
+static int intc_domain_map(struct irq_domain *d,
+			   unsigned int irq,
+			   irq_hw_number_t hw)
+{
+	if ((irq >= EINT1) && (irq <= EINT7))
+		irq_set_chip_and_handler(irq, &intc_irq_chip_edge_port, handle_level_irq);
+	else
+		irq_set_chip_and_handler(irq, &intc_irq_chip, handle_level_irq);
+	return 0;
+}
+
+static const struct irq_domain_ops intc_irqdomain_ops = {
+	.map = intc_domain_map,
+};
+
+static int __init intc_of_init(struct device_node *np,
+			       struct device_node *parent)
+{
+	const unsigned int num = MCFINT_VECBASE + NR_IRQS;
+	struct irq_domain *domain;
+	int irq;
+
+	domain = irq_domain_add_linear(np, num, &intc_irqdomain_ops, NULL);
+
+	for (irq = MCFINT_VECBASE; irq < num; irq++)
+		irq_create_mapping(domain, irq);
+
+	return 0;
 }
 
+IRQCHIP_DECLARE(intc, "fsl,intc-2", intc_of_init);
+#endif /* CONFIG_IRQ_DOMAIN */
-- 
2.43.0

