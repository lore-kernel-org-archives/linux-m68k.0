Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC9E4B0487
	for <linux-m68k@lists.linux-m68k.org>; Tue,  8 Sep 2026 09:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860444; cv=none; b=chRCFZcm10tTiX6dv96y0rjC9bTpirEvUuv/DNMmmLXllkfclRb2Piug+tsMQ+tfCqUfVeVGYDzyZrCSOU6An2/5OR7eq99FugcwT5K58Q8IhdWdV3wLGvYYxAQk2Yr8Hbnjk/UnmRIpzCcXP9s3xmeovtzIS/N0o2peGuTJxic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860444; c=relaxed/simple;
	bh=SWI63MDFjZNht/c4EEElOt+aKVUKQ3L3CRCdW/g+hoY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ch6WJmgdZqYwUjOdEIYnGAmif4sA3eZkvqhAZpZLxjIGS1BuNa6g/dlxgOMHl5X8HxlJ/uLNN2lLgqcyfzH3/H+/0jUDUWDHXqA9hsw+KX03K41/Dq5KQG0vZKpVKyOAUA2w2OvszKD+s5jpNclcyDZz/p8lMcF0JIavrzb/Di0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iNK1gl9M; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iNK1gl9M"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-398e9698a70so3841054a91.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 08 Sep 2026 02:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788860442; x=1789465242; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BKlva5de7tLauDWwEtkNz/euSCPlj9TGyi6mfKDbnjA=;
        b=iNK1gl9ML69pteSfAwRXqfS78G+dSHTGspM4vsPYjLgqY8TEoYCGUJNkASpHCxveei
         aP4xX43Kq/NisD4OEKARE9VQotpu+ClTlBZsJxUfmIcnY675P+hjz/CZa9BIixtR1Ggn
         dzu2b+LajVzafsEO9tzBt3QAqetO+7TzCRw9fMWM1hIj7Fb99bD5pEov7bu7pJVbGL0w
         WvUoT6dtaD4OA5wEmGkzdjpP3cLYkVeWhJ6qltyvHgUsDHa7IzaNl7HxyMPDCTZbjSym
         a3XcRfP9wNajxgSbWD4UQFHlLeX6qYfpazi1W5/+BqVieeOAee3bV1JbMr55i6i7JHSl
         OLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788860442; x=1789465242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BKlva5de7tLauDWwEtkNz/euSCPlj9TGyi6mfKDbnjA=;
        b=cS77yigCQfSs+EpR2D4U3CxhxQaOE3+DW/zWnckI073iXJP9IcYjoIfUBqeUOsmr73
         06ZYTqpNgEf/uxrnwXvLPdkSywlYtFJoqkKPJIDBvdmmiWX9lkbcbvlHufMyrOU1WQFl
         q4CQaO1zZyNNiVNi7y8AXNY/ej0TyLQrCi92oI2kZaYPGo/di59bxGtK1uA5AAXBGugm
         eaA2NTGnhAnMATWp1vjza2oZ1Zydp6uG8xWqxhdqxNkWVr9EGrH+f8xQ0B4WYlY9hMtf
         pAcGQ3/NqkCUGipk2SqYIELJGE/YkFGYdjQl3wM+wAfrwTsZj6uMgOpUlIIYTzSTMiyO
         xAZw==
X-Forwarded-Encrypted: i=1; AKwUvByKJL3sS8mTM/yeCrAy8mfdRLTQYngcngs2eyqOyK5OBpqY2NA+SeJiSOnt+n72cthe81/hIt5AVHnI@lists.linux-m68k.org
X-Gm-Message-State: AFuF++nJ0LMYgWQt656wrd8WyPrlpGBj55UjL2Dm9SxVi+jfLJk8MeQq
	QTH84E8XzKTDZqlgfndLUVtcOczBAiU2kjEu3dAd2yNMkuEt1bMZ+cJK
X-Gm-Gg: AYBFou2IZdE4bhLECBipc+PiQI4Q9uWF2VowXLXDY3bEeaXHWBFF7SozjrUi+dH7iLJ
	W8NkD4U/XwKmxKIK92cVS6f5g/z0iidvxIRvybIEAkxMgwbzHSjnMGcT5Ap1YiMcfuzRuMS2tsS
	FRuwj5jkc+W+LXkO+K8Ix/ldvvmUhSBjUmGQR0MxEmGghEDuJ+gJ81hOnGmoEaW923fqUb2OGct
	cD00wips4ZITKgAObxHTImbocwcCBpGgxQ0caW9FQvG0jjNaxRExm7mIZC7sg12usIXIjYM4kmH
	HBmm9LWOPNbMWTJf1sGMQF7Yl1wLzqBk8OuB82sS/mztlQorNu0y0OEePmG3DtGG7kuhdrvkxJG
	m1BIinR6nbmRdrvLAlGBwsbExSDdMiQnfQXeFZ9hrGZFNZDW+JqQ+Q5NgElHtmd+u/E/BD1JFwz
	TvoCC2HTePSC1d+tziN3iWGQANrT4NSTNtrwz/7W08pSGxE3Trbex9FiGwZyb5hmimAv4bUm6+6
	pusXesmPs7tkuTWLf0GLPC6Yv27f1FZ840KE3xTKFOg8MTBtP6aRTJE7SdcWtEgxabTMlHEZEhu
	5g==
X-Received: by 2002:a17:90b:1b05:b0:398:9bd1:3210 with SMTP id 98e67ed59e1d1-39b262a89d4mr38336464a91.17.1788860442166;
        Tue, 08 Sep 2026 02:40:42 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (202.176.229.35.bc.googleusercontent.com. [35.229.176.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08cacbb0sm31999240a91.13.2026.09.08.02.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:40:41 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: geert@linux-m68k.org,
	tglx@kernel.org,
	miodrag.dinic@mips.com
Cc: radu@rendec.net,
	zewenchen@google.com,
	jamiechen@google.com,
	edwardwchen@google.com,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 1/6] irqchip/goldfish-pic: Use gf_ioread32/gf_iowrite32 for MMIO access
Date: Tue,  8 Sep 2026 09:40:11 +0000
Message-ID: <20260908094016.1997918-2-visitorckw@gmail.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260908094016.1997918-1-visitorckw@gmail.com>
References: <20260908094016.1997918-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
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
2.55.0.979.g7e5102b832-goog

