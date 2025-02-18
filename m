Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21512475E3
	for <linux-m68k@lists.linux-m68k.org>; Tue, 18 Feb 2025 12:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.75.193.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739883176; cv=none; b=GH2gJGsizBV+eqLRlM8hg4CSfJrxOSJrj2AJ1vHBpARH/F7xiQpytK5lCQcX5znWqEC11NO6sP3u0KP2ia739CqZ7sPky/KwCaadiaZs/dmwsovc/CdvC+PtMqalKVbmqfcB6dVjaaVVTNr+JUpZxCVgdq3PnucQGFHoA+rGR9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739883176; c=relaxed/simple;
	bh=qIzSlvb1zYGvtljfBxwkt3sxtL9CZseu8AH/huteSFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BuZai0yECqV2RZUswAqbPtcXoXXNc5kkdeaLN3d2Q3mmk7W3elZULPY+9suKCyA8Q5wPIvlZiiRgm1g/9boPnqE+ioCRFH9aG5ODOI9rIvh182yZfkFROI6S6Z+/fnrYt5Eo6oBwtvDV64M7pJ8LJuDvPRVmiBNAgdk+896+B1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=147.75.193.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 24CB2A40B1F;
	Tue, 18 Feb 2025 12:51:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1865C4CEE7;
	Tue, 18 Feb 2025 12:52:52 +0000 (UTC)
From: Greg Ungerer <gerg@linux-m68k.org>
To: linux-m68k@lists.linux-m68k.org
Cc: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 05/13] m68k: coldfire: support devicetree binding for intc-simr
Date: Tue, 18 Feb 2025 22:46:25 +1000
Message-ID: <20250218125124.2692982-6-gerg@linux-m68k.org>
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

Add code support to the ColdFire intc-simr interrupt controller so that
it can be mapped via a devicetree binding.

This is implemented by adding IRQCHIP and IRQ_DOMAIN support. This first
version does not completely setup the interrupt controller using the IO
mapping binding passed in via the devicetree. Furture changes will add
that.

Devicetree support is not yet enabled for ColdFire targets so this
interrupt controller code still supports the legacy setup for now.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/coldfire/intc-simr.c | 61 +++++++++++++++++++++++++++++-----
 1 file changed, 52 insertions(+), 9 deletions(-)

diff --git a/arch/m68k/coldfire/intc-simr.c b/arch/m68k/coldfire/intc-simr.c
index f7c2c41b3156..bdc6dfac68f5 100644
--- a/arch/m68k/coldfire/intc-simr.c
+++ b/arch/m68k/coldfire/intc-simr.c
@@ -14,8 +14,11 @@
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
@@ -66,7 +69,7 @@ static inline unsigned int irq2ebit(unsigned int irq)
 
 static void intc_irq_mask(struct irq_data *d)
 {
-	unsigned int irq = d->irq - MCFINT_VECBASE;
+	unsigned int irq = d->hwirq - MCFINT_VECBASE;
 
 	if (MCFINTC2_SIMR && (irq > 127))
 		__raw_writeb(irq - 128, MCFINTC2_SIMR);
@@ -78,7 +81,7 @@ static void intc_irq_mask(struct irq_data *d)
 
 static void intc_irq_unmask(struct irq_data *d)
 {
-	unsigned int irq = d->irq - MCFINT_VECBASE;
+	unsigned int irq = d->hwirq - MCFINT_VECBASE;
 
 	if (MCFINTC2_CIMR && (irq > 127))
 		__raw_writeb(irq - 128, MCFINTC2_CIMR);
@@ -90,14 +93,16 @@ static void intc_irq_unmask(struct irq_data *d)
 
 static void intc_irq_ack(struct irq_data *d)
 {
-	unsigned int ebit = irq2ebit(d->irq);
+	unsigned int irq = d->hwirq;
+	unsigned int ebit;
 
+	ebit = irq2ebit(irq);
 	__raw_writeb(0x1 << ebit, MCFEPORT_EPFR);
 }
 
 static unsigned int intc_irq_startup(struct irq_data *d)
 {
-	unsigned int irq = d->irq;
+	unsigned int irq = d->hwirq;
 
 	if ((irq >= EINT1) && (irq <= EINT7)) {
 		unsigned int ebit = irq2ebit(irq);
@@ -128,7 +133,7 @@ static unsigned int intc_irq_startup(struct irq_data *d)
 
 static int intc_irq_set_type(struct irq_data *d, unsigned int type)
 {
-	unsigned int ebit, irq = d->irq;
+	unsigned int ebit, irq = d->hwirq;
 	u16 pa, tb;
 
 	switch (type) {
@@ -176,8 +181,6 @@ static struct irq_chip intc_irq_chip_edge_port = {
 
 void __init init_IRQ(void)
 {
-	int irq, eirq;
-
 	/* Mask all interrupt sources */
 	__raw_writeb(0xff, MCFINTC0_SIMR);
 	if (MCFINTC1_SIMR)
@@ -185,8 +188,14 @@ void __init init_IRQ(void)
 	if (MCFINTC2_SIMR)
 		__raw_writeb(0xff, MCFINTC2_SIMR);
 
+#ifdef CONFIG_IRQCHIP
+	irqchip_init();
+#else
+	int irq, eirq;
+
 	eirq = MCFINT_VECBASE + 64 + (MCFINTC1_ICR0 ? 64 : 0) +
-						(MCFINTC2_ICR0 ? 64 : 0);
+		(MCFINTC2_ICR0 ? 64 : 0);
+
 	for (irq = MCFINT_VECBASE; (irq < eirq); irq++) {
 		if ((irq >= EINT1) && (irq <= EINT7))
 			irq_set_chip(irq, &intc_irq_chip_edge_port);
@@ -195,5 +204,39 @@ void __init init_IRQ(void)
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
+	const unsigned int num = MCFINT_VECBASE + 64 + (MCFINTC1_ICR0 ? 64 : 0) + (MCFINTC2_ICR0 ? 64 : 0);
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
 
+IRQCHIP_DECLARE(intc_simr, "fsl,intc-simr", intc_of_init);
+#endif /* CONFIG_IRQ_DOMAIN */
-- 
2.43.0

