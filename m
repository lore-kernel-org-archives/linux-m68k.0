Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719097;
	b=ActEK+XakNFBEHhddCejDK+6ZyQqeEqeRXhXcAG7uJXtUS9vIWUQmKsdgihwbOq7VnLW
	 ItrTsD+FJqpjZvCV6DpPloJ5xezgeoaVbH9lL4BYRXtjpLhQwXsY9m8kA44EAu6r5KV5R
	 aqzJngEfgNjHYnfrT2u+RV8C7xcVhH1zTlcNi2XVRBTwPyfm/FgBR4zp3XbXVIlTQO+bv
	 Cnr0eSpYZTlsxx9+EONS3sfL4J0wtSjqL+Av8h2QlRCkpEjdqrAdPOfvaQOf6zUZlI0Ti
	 WZYzbuhZSeuLS6qTIL7AsKrKByLC07+jMF+WBfLX9Oj/QoaD1XGsy0Ub/cQrUMeB6Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Jl8AqubnS4n1475UbhVTokDsZdN8S7Jb0HrKLZ730Vw=;
	b=tyjPsVKINq2D0O8XpceuSCMdAaPNF6QvrXsZm1dnx5Ple0gp9leIfAjxzVxQxk3S2N8A
	 pbMBbdmd9OL/U7GFWoFpQGSrod3Tuz74JZq3pM+sfZ7wuwcfFF4n4bKOOauTtpL5EO4rZ
	 JyqC9J5MoSVO04dRUCmJz9+F8D8pfk3FkfJ/F3XPQAA9I/ybmrwNzxFVYGD5BsoVz0oyI
	 J0oXr8OMqCgIDn8DiuI0j3auxzr9b+kVH6Y+Puvd3gbheRB7MmnNg/uL4oZMtsruSWA5k
	 qUWcYMOI8IRWRfBgqhtB17Etfs4Osc6EcI2UJp5/BDVxCjICcO+4vCrHGTLOMHh3lqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gtikjKgg;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AB2606A31E
	for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Nov 2026 18:51:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2AB2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gtikjKgg
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2f03920c477so61394135ad.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Nov 2026 10:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795719096; x=1796323896; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jl8AqubnS4n1475UbhVTokDsZdN8S7Jb0HrKLZ730Vw=;
        b=gtikjKggQaodP80/0Vun3CIVpLnBSW5pTA6MGOBe250pusHIid367CORuvt1famvaa
         mcqfhVXkfealgfz3GC/vBHP0C8FP+EM2NoLgANuIlZbPxeEHsX/LFIE46BfeBSGWY/Od
         p19URllqSVpDof0nIHfyGTh7XWyXmhrEJMBxDP0feyrZCVGE5zLgcdYIbVAv//hHJWdt
         6Nx+ESOhvDiiXXJ1qpfJChpOshdpDJjQx1nHRD/mUkd7uerX4pANfq3i+UVYGf9CmR2j
         6HA9C8wRPnKMTSGZmQu3IEpRc//6uwyy/WlYLiVtoM/1QuFPi/VxAU+d5phGCTpqNnaf
         cSoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795719096; x=1796323896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jl8AqubnS4n1475UbhVTokDsZdN8S7Jb0HrKLZ730Vw=;
        b=mjbB2HoSJu6CBZBlILOf8E8simoUAx2yA/YBDIvq+nPFPZ/ARMOkIk2Ihug8lWRl6Z
         2reGJZa+4BufZ3yk0s6YFHo9ZBCo0LXy8nPw3rUJeIAlRwki3+Zw6CDwCHp/XugyXE2R
         a6ulvixIwvUOiY8Zqr1Mt+bPWqXj0NQaGJmCSNWReSHWQegJxez2qsp+JbvcaEjU1Yw9
         VZ/KinX52cujszPtnVJMj7B1n+/ctH/0tVPICzGk45IUYj6Is8UPn+HRgYo07kJ2VVYt
         2keyufVECKJC73zCmTbJaACGgZWam+nD5zPujSaMrnIBGALt/XAXbfbIlEywp9OG+hme
         qmHg==
X-Forwarded-Encrypted: i=1; AL+hErFE801i9dGRsIgCj/n2j3i06DYTUx7LbKeElBK9M/2f/SIXJODMU4mBhSJY4epYja73D86UCPaH4yhO@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z/8CU/um1clwywCAt1UWugSV4lBT8Pg944dc3XVZWPwpH94Vl73
	49cKHhdsqM1zQlEcoAj8/OCTIOqTlPhw+whVJvaOZ/lFuoss9kLlibvh
X-Gm-Gg: AZFdTZcg4onalPIdRnbXYUxoZcZeZ+cWZiUtmlblXu6HfoW8OVjCyatDjTxk6jI+nAt
	7kYIGfRmgFm3QCaE/RQDxS+sBTRP7/m0k1BEg0NHnxBSa7aCzANM0qdMKOcTItoLqPRaJ0xmK93
	GcZQ2bMT9qqHfqUH2YF9wAGPDWheiEjdqQ8Ep3+x86Q23PJDpP5w/VO4JZiqWxvcaNs//DBqakn
	mW3sP5KGsf3zDI+iRohtIDQfZKA2DXQN7LBkgdHYb5xf5+mDecdDyL+mj+lijGrCn/iiwmOmv4a
	rYGERyvpcW15T2uyY+F0gptXxbnRkVEQDje2qTycDZrcFkNAPw+YNaXbhBCBxbrrgYHroOBqDje
	xxBtoUZWTLGgWVGC+rPUWof4aLx0bxH8KmrmIClY0MgynCV4C1zcGRSulT+4iDeyhLvAhWkCZqI
	sx7YgejmNr8pY9MVU0l51IknHRrAEhRydDUCftFWBB6AewNnsXWDnMb1rmzgwGxponBKXwV9eUd
	M08gP5aA0HIPotFBaYCiDkvnxf/vIn08VmwtCr7p/mvgYtnPtjU7+Mi/dNRqtNprO7iWgBIap3S
	+2d1Y3Liwe772LoncnGoTckpZcWEmTt+AnsCFM67b0N/5nZs3tcOkNnvM1UT11twhfcwS9gBPs4
	NoAnsjaTlhiL0Cc5sx6f+CRs=
X-Received: by 2002:a17:903:b0e:b0:2ed:205e:eabc with SMTP id d9443c01a7336-2f03f142f86mr228464035ad.32.1795719096152;
        Thu, 26 Nov 2026 10:51:36 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1276c5sm112041665ad.67.2026.11.26.10.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:51:35 -0800 (PST)
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
Subject: [PATCH v2 1/7] irqchip/goldfish-pic: Use gf_ioread32/gf_iowrite32 for MMIO access
Date: Thu, 26 Nov 2026 18:51:14 +0000
Message-ID: <20261126185120.3815699-2-visitorckw@gmail.com>
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

The goldfish PIC driver uses readl() and writel() directly for register
accesses. On big endian architectures, goldfish devices require big
endian MMIO accessors [1].

Switch to gf_ioread32() and gf_iowrite32() to make MMIO accesses endian
safe.

Link: https://gitlab.com/qemu-project/qemu/-/blob/stable-11.1/hw/intc/goldfish_pic.c#L130 [1]
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/irqchip/irq-goldfish-pic.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-goldfish-pic.c b/drivers/irqchip/irq-goldfish-pic.c
index d458cf898f8e..c3c33f066140 100644
--- a/drivers/irqchip/irq-goldfish-pic.c
+++ b/drivers/irqchip/irq-goldfish-pic.c
@@ -7,6 +7,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/goldfish.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/irqchip.h>
@@ -38,7 +39,7 @@ static void goldfish_pic_cascade(struct irq_desc *desc)
 
 	chained_irq_enter(host_chip, desc);
 
-	pending = readl(gfpic->base + GFPIC_REG_IRQ_PENDING);
+	pending = gf_ioread32(gfpic->base + GFPIC_REG_IRQ_PENDING);
 	while (pending) {
 		hwirq = __fls(pending);
 		generic_handle_domain_irq(gfpic->irq_domain, hwirq);
@@ -52,6 +53,16 @@ static const struct irq_domain_ops goldfish_irq_domain_ops = {
 	.xlate = irq_domain_xlate_onecell,
 };
 
+static u32 gfpic_read(void __iomem *addr)
+{
+	return gf_ioread32(addr);
+}
+
+static void gfpic_write(u32 val, void __iomem *addr)
+{
+	gf_iowrite32(val, addr);
+}
+
 static int __init goldfish_pic_of_init(struct device_node *of_node,
 				       struct device_node *parent)
 {
@@ -82,7 +93,7 @@ static int __init goldfish_pic_of_init(struct device_node *of_node,
 	}
 
 	/* Mask interrupts. */
-	writel(1, gfpic->base + GFPIC_REG_IRQ_DISABLE_ALL);
+	gf_iowrite32(1, gfpic->base + GFPIC_REG_IRQ_DISABLE_ALL);
 
 	gc = irq_alloc_generic_chip("GFPIC", 1, GFPIC_IRQ_BASE, gfpic->base,
 				    handle_level_irq);
@@ -92,6 +103,9 @@ static int __init goldfish_pic_of_init(struct device_node *of_node,
 		goto out_iounmap;
 	}
 
+	gc->reg_readl = gfpic_read;
+	gc->reg_writel = gfpic_write;
+
 	ct = gc->chip_types;
 	ct->regs.enable = GFPIC_REG_IRQ_ENABLE;
 	ct->regs.disable = GFPIC_REG_IRQ_DISABLE;
-- 
2.56.1.839.g22a8290db9-goog

