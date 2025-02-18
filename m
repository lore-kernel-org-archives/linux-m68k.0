Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9492475E3
	for <linux-m68k@lists.linux-m68k.org>; Tue, 18 Feb 2025 12:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.75.193.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739883177; cv=none; b=R0uueudqW5bwgD9c+vJGN51cVmZjcfDnxhKrcoW9yAniPe8t0BgaSZH2UqRHfVhR7MGaSusGM2OthfwROLgbPWxw3M7Wl1Jrl6WM4KLq3yp4bT/RG3Te8vylFH5usW1wrOg/mZgfaOnf4JLN3F7acN7YaiqcrCPBMytu0jZRfJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739883177; c=relaxed/simple;
	bh=L23iGo1Fz0pmkI1QHRNeZ9HNq/R7VMoiWGhVNok/PCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bjsCQfi+k+X5N7ntZb3XncNKU0g3pd0Zxl9mYO+gxOIuizslfF3Y3Sm/+W85MkoWbzgP2W9etOL6VrLd2Zvy1MzYdu5LTfs6nwn/7MkG9dt6+akeKC7yxzos3aq15srJqP/Wf9q+fD8Q0fIkfmzVGznwN2DpXxoiuhZN6cK0F0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=147.75.193.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B9D0EA40BA3;
	Tue, 18 Feb 2025 12:51:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90F9FC4CEE7;
	Tue, 18 Feb 2025 12:52:54 +0000 (UTC)
From: Greg Ungerer <gerg@linux-m68k.org>
To: linux-m68k@lists.linux-m68k.org
Cc: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 06/13] m68k: coldfire: support devicetree binding for intc controller
Date: Tue, 18 Feb 2025 22:46:26 +1000
Message-ID: <20250218125124.2692982-7-gerg@linux-m68k.org>
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
 arch/m68k/coldfire/intc.c | 50 +++++++++++++++++++++++++++++++++------
 1 file changed, 43 insertions(+), 7 deletions(-)

diff --git a/arch/m68k/coldfire/intc.c b/arch/m68k/coldfire/intc.c
index b434371e2b99..1b7f23a425d7 100644
--- a/arch/m68k/coldfire/intc.c
+++ b/arch/m68k/coldfire/intc.c
@@ -12,8 +12,11 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/interrupt.h>
-#include <linux/irq.h>
 #include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/irqchip.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
 #include <asm/traps.h>
 #include <asm/coldfire.h>
 #include <asm/mcfsim.h>
@@ -113,14 +116,14 @@ void mcf_autovector(int irq)
 
 static void intc_irq_mask(struct irq_data *d)
 {
-	if (mcf_irq2imr[d->irq])
-		mcf_setimr(mcf_irq2imr[d->irq]);
+	if (mcf_irq2imr[d->hwirq])
+		mcf_setimr(mcf_irq2imr[d->hwirq]);
 }
 
 static void intc_irq_unmask(struct irq_data *d)
 {
-	if (mcf_irq2imr[d->irq])
-		mcf_clrimr(mcf_irq2imr[d->irq]);
+	if (mcf_irq2imr[d->hwirq])
+		mcf_clrimr(mcf_irq2imr[d->hwirq]);
 }
 
 static int intc_irq_set_type(struct irq_data *d, unsigned int type)
@@ -137,14 +140,47 @@ static struct irq_chip intc_irq_chip = {
 
 void __init init_IRQ(void)
 {
-	int irq;
-
 	mcf_maskimr(0xffffffff);
 
+#ifdef CONFIG_IRQCHIP
+	irqchip_init();
+#else
+	int irq;
 	for (irq = 0; (irq < NR_IRQS); irq++) {
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
+	irq_set_chip_and_handler(irq, &intc_irq_chip, handle_level_irq);
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
+	const unsigned int num = MCFINT_VECBASE + 64;
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
 
+IRQCHIP_DECLARE(intc, "fsl,intc", intc_of_init);
+#endif /* CONFIG_IRQ_DOMAIN */
-- 
2.43.0

