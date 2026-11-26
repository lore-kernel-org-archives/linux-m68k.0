Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719107;
	b=BpTwObSu2iHbHA+oRIcA9+jbMnwjFHCnh7iPCiIX/1ynNYtnFX/zYkhyGVB4GKedQbpF
	 xze80MATwHox/quNjkk6RH0if3K0DVWlk5NpsIePKNIagVzj7hdOEHqneslXhT7r7M6no
	 cE0NQ0L3VYHLpI+aK+vPfx/SjSSu08Ys20kTaK/nP69zQ9myPluUH1aVqpgszpCrOXBdt
	 +Z3VmdeXjuY6mlEZpm5olzphEV6g+D2fVZmwwfQ3SzRPvbMGM6RRbhWAffSWFsmWebzss
	 wVVQXzC6aKAfww+Yd/hsQ+7vADlw/FIaelp6aMWKB+gAYnEhUOzc/Wg8qo2Z+DeS7MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719107;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AtfB1y+1D43pRF0P7rl8TPNDCw62a+VOaCDIrJU7rHI=;
	b=yyJNiVQ7st7BRuIuXYATlF3uHDg69qI3WeYICvqpoat+faD3PpWU1sViXXBLl7OFaXaV
	 p4juY010yAG5428vISDhFJ5E2kF/cx6/9JgVBztww9qwqhcGjh8Bab9kHPdSBB2UDEunh
	 giuB+NZ91CBa/wA7mmf4SlZH35m6+hN4nLUJrzvPzbLtzCc2D/aTquuv8OBwk7iu3+mS5
	 7w5pfMyqxeBp4JJzg/7EWVREx4Q5gbdiOzikdwSO+rxt1CpRyoVkYz1dZYDiX0paxLCnZ
	 WiuvsJYXsCLfF7xPVzu1sNkiiwpo9LN6pDxoJBcKe/elh64lJHbWwRgT39PZDH98lcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tOqJz2T7;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BA6606A321
	for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Nov 2026 18:51:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93BA6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tOqJz2T7
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2f0458cc9easo58349055ad.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Nov 2026 10:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795719107; x=1796323907; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AtfB1y+1D43pRF0P7rl8TPNDCw62a+VOaCDIrJU7rHI=;
        b=tOqJz2T7iI5HdwZ9Z6mcYnl9VvnGqV85yaOTzwmnlgyZNcjGzTO+RmfXurI+67rnyC
         Mmb4I0AgSVH1ZD6qvja9T3LVuE4yQItPRGsczF5jbA4dYEojBo40hEA2hZk7/mUpvrV4
         un5Zjt+wQRQzOD/ZXjH2eSr5BJtdhx8ykpTgQREADhV9er214bkMPngOFq3Hz8k+FB+B
         kvs6p2z5fsvDOoSNvxcYp0SAHsP3SB3g3uA9mrzlIK04aoqzwOuhz8lEiuFxPQwHK9t+
         04Fl890JQO+2FpnzVYp8Q9MYSwirXpofxJM1aOJRJDa65wGfryH+jRfTk8nkfqxVUi0l
         BkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795719107; x=1796323907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AtfB1y+1D43pRF0P7rl8TPNDCw62a+VOaCDIrJU7rHI=;
        b=xJsUOoLAe71QlowFcUsqc5+hJL032PFcvRfDBKloj6Nx0U4z4Vr/HVckl4TQMdaAIQ
         8tnMRBy+ETs58MAVCiwtalILMcYbEyc6laqO4GBCxbtelpV6PQWcSDyJSSoeoa6Qhez+
         J5VZAhcIBxGrkm+Xjn6UL6sIU0RuezMBt/Pd4o6fB0jHIzOAe1r3NdoVYDVbzYU9+RUB
         TD4WhecJCgqHwWJBrTWsBdckRpRsMyU235zy97zNPxAdlN8Fyx+xxg5/iNrfuM79OGcX
         TbLoJu05pQJNP222ephv3FSS5NClyyxHmclVQy7IA1bFNMueJ/1QxKP45gAEsBMvbloL
         KuQw==
X-Forwarded-Encrypted: i=1; AL+hErGvAiH4xfxcJoY3M5929e93JmLxGtwMpKQTFThaj2/oaB0/N0WTuM2cYS+mskLJ5L2n4Si3JOx107Lv@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z+4IxYRbbWO+o9mygZa/V3QBR2QHgo3DHW3VPlbjdi4dkowdAol
	lNWyWtKd8duSsshtZoolHEGbFjJIs6IBbUVAxpaSKeoZ1fGmBhOhWGE0
X-Gm-Gg: AZFdTZd/org0vjmhwPY25yDxjyrGlcCciu937d+vFNX/0ox97T4UXc6MfSRnZq5B7u1
	SMhUeNEAg4pvrsAJdWxJopdMQINUjsnvLv3ULGZ+OM6ebF08yb8QTDyOfFY0nI0x9fQbyp6CVkC
	4eaBILQQuJmk2adWocUfXuWpFDAptV+dN2ystylHnb7P3oAwM9Ox/4+NbDW0ZLxjwfe1EnhbEie
	TBFv4ozkqlaFjvyT92PQyGJMUxPNLI+7KTa3KdfXY5pvUA2Yv8deHtHsva2Xk0C7FxOYZxCw5mb
	p5LtvEK3+X1AJ4qNNsp/omsBJVlGekgdOH67pfVcHDgGu+4sXzqNamI5KkOvPwxfpWrJq802GT+
	Bhr+QenfITvAGVJiRvRSh03KX3vB7k+eO0uXqLU+MVbTATffJgmabA8QRWqC2G7rmyeMvOKTsBz
	0iAqYiXQbvtsGLeFxUDnanaCO48kndk9DUomO0/Fh3NHk1pAV/Y2J4pIRNIVa1sqAN7mVLRF+t4
	saN9dJWMxOInp4xJ4g/G9UvPrvTOMK6HHfeiZs+mIXaXxMW8pMlTDRInsxlPIuzUZLacD2OuTDM
	RdKf0wPYN/ysjDLw2qe80Xft5vnNY49kgE2MDRiSkUk94fvyU8CjNiVYaDbXFLd3e0Fihlf3uKV
	KRSFnDI0xFw9eta4M2r10Idg=
X-Received: by 2002:a17:903:40d1:b0:2f0:b599:8c98 with SMTP id d9443c01a7336-2f0b5998f1emr116831065ad.42.1795719106809;
        Thu, 26 Nov 2026 10:51:46 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1276c5sm112041665ad.67.2026.11.26.10.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:51:46 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: geert@linux-m68k.org,
	tglx@kernel.org
Cc: radu@rendec.net,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v2 4/7] irqchip/goldfish-pic: Add goldfish_pic_init() for non DT platforms
Date: Thu, 26 Nov 2026 18:51:17 +0000
Message-ID: <20261126185120.3815699-5-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261126185120.3815699-1-visitorckw@gmail.com>
References: <20261126185120.3815699-1-visitorckw@gmail.com>
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver currently only supports device tree initialization and
hardcodes the IRQ base to 8, which prevents non DT platforms from using
it.

Split the core controller setup out of goldfish_pic_of_init() into a
new exported helper goldfish_pic_init() that accepts a mapped base
address, parent IRQ, IRQ base, and fwnode.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 MAINTAINERS                              |  1 +
 drivers/irqchip/irq-goldfish-pic.c       | 84 ++++++++++++++----------
 include/linux/irqchip/irq-goldfish-pic.h | 15 +++++
 3 files changed, 67 insertions(+), 33 deletions(-)
 create mode 100644 include/linux/irqchip/irq-goldfish-pic.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 6215fcb07770..f6c37e1dbee7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2004,6 +2004,7 @@ M:	Miodrag Dinic <miodrag.dinic@mips.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/interrupt-controller/google,goldfish-pic.yaml
 F:	drivers/irqchip/irq-goldfish-pic.c
+F:	include/linux/irqchip/irq-goldfish-pic.h
 
 ANDROID GOLDFISH RTC DRIVER
 M:	Jiaxun Yang <jiaxun.yang@flygoat.com>
diff --git a/drivers/irqchip/irq-goldfish-pic.c b/drivers/irqchip/irq-goldfish-pic.c
index 8d40df0e3a88..a3e9d4672ffd 100644
--- a/drivers/irqchip/irq-goldfish-pic.c
+++ b/drivers/irqchip/irq-goldfish-pic.c
@@ -13,15 +13,13 @@
 #include <linux/irq.h>
 #include <linux/irqchip.h>
 #include <linux/irqchip/chained_irq.h>
+#include <linux/irqchip/irq-goldfish-pic.h>
 #include <linux/irqdomain.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 
 #define GFPIC_NR_IRQS			32
 
-/* 8..39 Cascaded Goldfish PIC interrupts */
-#define GFPIC_IRQ_BASE			8
-
 #define GFPIC_REG_IRQ_PENDING		0x04
 #define GFPIC_REG_IRQ_DISABLE_ALL	0x08
 #define GFPIC_REG_IRQ_DISABLE		0x0c
@@ -62,44 +60,29 @@ static void gfpic_write(u32 val, void __iomem *addr)
 	gf_iowrite32(val, addr);
 }
 
-static int __init goldfish_pic_of_init(struct device_node *of_node,
-				       struct device_node *parent)
+int __init goldfish_pic_init(void __iomem *base, unsigned int parent_irq,
+			     unsigned int irq_base, struct fwnode_handle *fwnode)
 {
 	struct goldfish_pic_data *gfpic;
 	struct irq_chip_generic *gc;
 	struct irq_chip_type *ct;
-	unsigned int parent_irq;
-	int ret = 0;
+	int ret;
 
 	gfpic = kzalloc_obj(*gfpic);
-	if (!gfpic) {
-		ret = -ENOMEM;
-		goto out_err;
-	}
+	if (!gfpic)
+		return -ENOMEM;
 
-	parent_irq = irq_of_parse_and_map(of_node, 0);
-	if (!parent_irq) {
-		pr_err("Failed to map parent IRQ!\n");
-		ret = -EINVAL;
-		goto out_free;
-	}
-
-	gfpic->base = of_iomap(of_node, 0);
-	if (!gfpic->base) {
-		pr_err("Failed to map base address!\n");
-		ret = -ENOMEM;
-		goto out_unmap_irq;
-	}
+	gfpic->base = base;
 
 	/* Mask interrupts. */
 	gf_iowrite32(1, gfpic->base + GFPIC_REG_IRQ_DISABLE_ALL);
 
-	gc = irq_alloc_generic_chip("GFPIC", 1, GFPIC_IRQ_BASE, gfpic->base,
+	gc = irq_alloc_generic_chip("GFPIC", 1, irq_base, gfpic->base,
 				    handle_level_irq);
 	if (!gc) {
 		pr_err("Failed to allocate chip structures!\n");
 		ret = -ENOMEM;
-		goto out_iounmap;
+		goto out_free;
 	}
 
 	gc->reg_readl = gfpic_read;
@@ -114,8 +97,9 @@ static int __init goldfish_pic_of_init(struct device_node *of_node,
 	irq_setup_generic_chip(gc, IRQ_MSK(GFPIC_NR_IRQS), 0,
 			       IRQ_NOPROBE | IRQ_LEVEL, 0);
 
-	gfpic->irq_domain = irq_domain_create_legacy(of_fwnode_handle(of_node), GFPIC_NR_IRQS,
-						     GFPIC_IRQ_BASE, 0, &goldfish_irq_domain_ops,
+	gfpic->irq_domain = irq_domain_create_legacy(fwnode, GFPIC_NR_IRQS,
+						     irq_base, 0,
+						     &goldfish_irq_domain_ops,
 						     NULL);
 	if (!gfpic->irq_domain) {
 		pr_err("Failed to add irqdomain!\n");
@@ -132,15 +116,49 @@ static int __init goldfish_pic_of_init(struct device_node *of_node,
 out_destroy_generic_chip:
 	irq_destroy_generic_chip(gc, IRQ_MSK(GFPIC_NR_IRQS),
 				 IRQ_NOPROBE | IRQ_LEVEL, 0);
-out_iounmap:
-	iounmap(gfpic->base);
-out_unmap_irq:
-	irq_dispose_mapping(parent_irq);
 out_free:
 	kfree(gfpic);
-out_err:
 	pr_err("Failed to initialize! (errno = %d)\n", ret);
 	return ret;
 }
 
+#ifdef CONFIG_OF
+/* 8..39 Cascaded Goldfish PIC interrupts */
+#define GFPIC_OF_IRQ_BASE		8
+
+static int __init goldfish_pic_of_init(struct device_node *of_node,
+				       struct device_node *parent)
+{
+	unsigned int parent_irq;
+	void __iomem *base;
+	int ret;
+
+	parent_irq = irq_of_parse_and_map(of_node, 0);
+	if (!parent_irq) {
+		pr_err("Failed to map parent IRQ!\n");
+		return -EINVAL;
+	}
+
+	base = of_iomap(of_node, 0);
+	if (!base) {
+		pr_err("Failed to map base address!\n");
+		ret = -ENOMEM;
+		goto out_unmap_irq;
+	}
+
+	ret = goldfish_pic_init(base, parent_irq, GFPIC_OF_IRQ_BASE,
+				of_fwnode_handle(of_node));
+	if (ret)
+		goto out_iounmap;
+
+	return 0;
+
+out_iounmap:
+	iounmap(base);
+out_unmap_irq:
+	irq_dispose_mapping(parent_irq);
+	return ret;
+}
+
 IRQCHIP_DECLARE(google_gf_pic, "google,goldfish-pic", goldfish_pic_of_init);
+#endif
diff --git a/include/linux/irqchip/irq-goldfish-pic.h b/include/linux/irqchip/irq-goldfish-pic.h
new file mode 100644
index 000000000000..f2e8762aec88
--- /dev/null
+++ b/include/linux/irqchip/irq-goldfish-pic.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Goldfish Programmable Interrupt Controller support
+ */
+
+#ifndef __LINUX_IRQCHIP_IRQ_GOLDFISH_PIC_H
+#define __LINUX_IRQCHIP_IRQ_GOLDFISH_PIC_H
+
+#include <linux/fwnode.h>
+#include <linux/types.h>
+
+int goldfish_pic_init(void __iomem *base, unsigned int parent_irq,
+		      unsigned int irq_base, struct fwnode_handle *fwnode);
+
+#endif /* __LINUX_IRQCHIP_IRQ_GOLDFISH_PIC_H */
-- 
2.56.1.839.g22a8290db9-goog

