Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A29F51A733
	for <linux-m68k@lists.linux-m68k.org>; Tue,  8 Sep 2026 09:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860449; cv=none; b=Tq3EnuvNLCylny7OroWE8zqOfO6gnViwL1zISNM2/Hz9F5qG2VbLkdsTvL4wB3ASRxJ4M0yVZwiov4h0gPBtTaNp0zRMxXrxH3omxN6FbRFfCkySGq5+1Zf2TwHENx6PT67qCzLF5i8UPVDHdFhZOEquxT37oeMeH3oNLNFYapc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860449; c=relaxed/simple;
	bh=QpFNHjfVXgJC/IwKsByobIapsXNmXN32X/aqquhMSYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ut0I9WwK6hdlwugurNBsJCeCVxG3I5FFclt82Iqbm88MgrtvzwieIULadwYIMoamuNjkZAUblKGjEoWH00DQ04FZNhbX6zCjRgWZ3b1GolKJJ1UebE4ZQayfpKe7ynajeNaXSOUrIKSe2KJA2pDccdS/0KSlM1clnRxE1TvgEYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LGAuS3iK; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LGAuS3iK"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc48fe04342so802506a12.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 08 Sep 2026 02:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788860448; x=1789465248; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yyeW8+b7nlSV0Lt9JCJpKIAuOzaL31bvQxWWs5y+0bM=;
        b=LGAuS3iKBFIRkGi9GHC7LRWtoYd3NQsOAx/ZkM/norDHrrRNibbXw0R4Vp/U5lILBK
         7U3xEyWNQM7+5DIk/Xcr/lNR0HG8xq18lwrdgnYXNdJ1twBrPx1pbLIoB6J296WPpZpR
         AcJHc4x+oZp8x9ja+rGSdpIP+xUasf3k/p/v15ATM7sNryPfEmh8GEqmKCVRvJnnjSeX
         YJgsnO42tTDP7JOC0oKL5Irjou6x5ZxOELvvjTLAJXB5kTzRui+e4FIcLVzP1fRfFT0q
         dEir8Fy2sqNmesbFZ2F58uDvAO1C2qQJFqhH3l2LntrFPryVANtoPDrNeI3RNk88p7VP
         Gmgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788860448; x=1789465248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yyeW8+b7nlSV0Lt9JCJpKIAuOzaL31bvQxWWs5y+0bM=;
        b=Puo0Xh0G/46Frx6Hy25i5gLKZx/NvJyGkpgb39nFO3rGJoPFNDyYzZhGA2SZi3uv6X
         HW6v9Q1lViKgVBsu9XQptoAy8JtM44uYVpixbVBzlaS/6VbQ7pM1c+0VYOL/eN8bojet
         4qgJafI5PeFoM74Kjt3Xx+aYOHp5gheekHPdFP5xaEN6dWg9DfMxFy6fTbc6oFODflfg
         Z75PhHJYnT6BKVs/oV+UQxVOjKunb5vj3gU/rz3yofR/6XYCNXQCBaBA5m//gKBGkcQm
         TDn7sfAEZyhsdPpPnXT+uqKedMUr72rhAPd9CZz8+7eJECytopzWu/hRrxkYCDa7d2T/
         AybQ==
X-Forwarded-Encrypted: i=1; AKwUvBw4xKU6N380k+dDexqC58wwZmDROzVmGB5Hnwaj+nBP0r2YWb2LkLHvwq4J59qTZHrGngaXUtNR8hv1@lists.linux-m68k.org
X-Gm-Message-State: AFuF++lbNPCx2JlYfQMCTkYZfIA5q1uDqp94LOyW5mEKE3dNIW6HKYol
	Tx9celSTOSVmT3rr67yDj6U6sYYEhMhyarSqsMntye8UjpXkkhnDMRRb
X-Gm-Gg: AYBFou2qbIz9aeDdCVOb6AyBQyUK94Kd7DYcT/7eYRtg9z3Imi4UeSsydnAXYAZm/Te
	0bMCf0XH2NcgPDvUTI8MWpZpfdeZgHXbgkaaxjR2Uydr3jTbki0xo/9ukO3L8ngqYNFwoIvfHZY
	jyA8nXNSmzZKingQ8ffEQOlYicMW/LKPq8xSNDPP+F/9SQ1/TMoH/UFDMd+frQiTDa/Ym1UEWJh
	R6V4IkQxElbWLVqS/NRD6J1oQt2SINyJcWtRKXB+KeV5fNSyGJpr8mbTpUuFb9o8+TsLuxuz1I/
	Q/9Yltpk9HQAbj/BSknDS2Ywnfg8WiKwNBMvBOvYj+UZSRyyS2O0w4Q45hDex7MQFXvFHjavPF8
	Jf6g/6oNKZvzd4r8EI5FG3nWf9w5In3WnOJ/OhFx1AWT/0+J445UiQGc703Y3NHMVw87pxHCK0A
	yyw989RIxm4K3/S3gX2D/dB2oDQXXNbXdqi83jRET0q0VMorKIUrWvmP4AKh3bTREQCK3pWs7QK
	MLb+ifZPc70jDpyYXA99XjNJ7LoFro9ji/Atem60K5oAgzQQZ+N29+xZNWEymaqJg==
X-Received: by 2002:a17:90a:e703:b0:398:d843:cad9 with SMTP id 98e67ed59e1d1-39b26226de8mr44201364a91.19.1788860447592;
        Tue, 08 Sep 2026 02:40:47 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (202.176.229.35.bc.googleusercontent.com. [35.229.176.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08cacbb0sm31999240a91.13.2026.09.08.02.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:40:47 -0700 (PDT)
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
Subject: [PATCH 2/6] irqchip/goldfish-pic: Use for_each_set_bit() to iterate pending IRQ
Date: Tue,  8 Sep 2026 09:40:12 +0000
Message-ID: <20260908094016.1997918-3-visitorckw@gmail.com>
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

Use for_each_set_bit() instead of open-coding the loop with __fls()
in goldfish_pic_cascade() to simplify the code.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/irqchip/irq-goldfish-pic.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-goldfish-pic.c b/drivers/irqchip/irq-goldfish-pic.c
index c3c33f066140..12113ca90872 100644
--- a/drivers/irqchip/irq-goldfish-pic.c
+++ b/drivers/irqchip/irq-goldfish-pic.c
@@ -7,6 +7,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/bitops.h>
 #include <linux/goldfish.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
@@ -35,16 +36,14 @@ static void goldfish_pic_cascade(struct irq_desc *desc)
 {
 	struct goldfish_pic_data *gfpic = irq_desc_get_handler_data(desc);
 	struct irq_chip *host_chip = irq_desc_get_chip(desc);
-	u32 pending, hwirq;
+	unsigned long pending;
+	u32 hwirq;
 
 	chained_irq_enter(host_chip, desc);
 
 	pending = gf_ioread32(gfpic->base + GFPIC_REG_IRQ_PENDING);
-	while (pending) {
-		hwirq = __fls(pending);
+	for_each_set_bit(hwirq, &pending, GFPIC_NR_IRQS)
 		generic_handle_domain_irq(gfpic->irq_domain, hwirq);
-		pending &= ~(1 << hwirq);
-	}
 
 	chained_irq_exit(host_chip, desc);
 }
-- 
2.55.0.979.g7e5102b832-goog

