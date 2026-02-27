Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540B4314D1E
	for <linux-m68k@lists.linux-m68k.org>; Fri, 27 Feb 2026 10:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772187415; cv=none; b=OLsv8nJY4CDtS0z8jjgXWse8e9pKZCyy3YLs0XuLQwhO8xNxPqq40M5gNi112pZoE1hSS/YH0vwKvDGgoqZQxbeJiJptHOmRYx1Zkxj312WPbEg0gttDyf9/SQrk57FjfA7MsXOKuyYGp/JtF0p8hi+7KJhuh6qUQrb7ALGN1k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772187415; c=relaxed/simple;
	bh=DgTC8IVFKOsCitk+Wsq6tCWCZGgu8Aot8CLNSdfr03o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nt94ZgxhUTLHWeGs7o0enovR20vuRRWSys6mOx7YdVswE+mtabdZulvaX0YbvnBjrjh09Hfkj3N+TfHdMD1cJ3gRrjsXhuh0FHHk0Huv2CJJ7cDFN3pEfi/KuBIyUi2BFe4/8NnvaDLCIWi0EbyNmtJDkA/aJA0NWcapU0Ap7W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=KrhIa6Go; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="KrhIa6Go"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a962230847so17900185ad.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 27 Feb 2026 02:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1772187411; x=1772792211; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QfJg30mJUVGYxijzk+lCAk658Lta6KCJk/Tcavup9u0=;
        b=KrhIa6GomhPiMTMeoqizRgdOzFhRQ8MhH1A9BcyIt1qo8OlTZovkJjotOTV/huHoZ7
         +CqXigjevs0uU7QvWrqwN1yZZc53KjKSSkIx/H9HGPWkuiwWWZ01S3BXZbzUWtK/8hhz
         gAkIxuNupRXQNGYcdSlPbePvgk+kYCNdTR6hg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772187411; x=1772792211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfJg30mJUVGYxijzk+lCAk658Lta6KCJk/Tcavup9u0=;
        b=COXzlZA34Vb0cPz5gu46S//IFTPKn253GtEiVTtv6cBjHowwZ3hbxAmctMKfwwgJHk
         FwiSvcskOU5l6idTsZM6FA3zpDNPWb7SgWn8vpWXWp8c5UfJhiAX06OKCaBdc6MGF04E
         E0oa24KBh9zLXSZRHY+tfN9dZctbXZ58M2p8hMnu5zDUxQGqP8TzVVa3M9s01Uw7Nrt8
         5hOJjCHYS+2Gk1XX9BisUfYPJSEPCApdVfKULeiJN9fNoVscmFmptqnZBwKA5t6p7zSf
         tspL+1pFudwmvam+hJYf+0RX5RcFX9IMFVSC5rEyJ2SBAOWg0wg300F7BZkQPTYHX9fE
         CQVw==
X-Forwarded-Encrypted: i=1; AJvYcCUK6VsoyDkC9X8WKQ+0HTG4EWkYlYecRFzkU5A9CqhAhhpAAeK99ok7cmlHsmP/Q1ZHhZ1Xl1IqsQWR@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yx7KW1LgkycymVgk01kecFi2CTEZ1PZ1AIqpYfF+j6RaeTB3oMs
	aDMzAZl4elQ/6wTiDYUustdX8jdS+Lnvter0HOK95KM0ccT+Rj8F6aGPDt/vD2dmI9o=
X-Gm-Gg: ATEYQzxiiv+udkvhLi7Myl2tG/uWMVEl4r7c5/sHmd0pTJA722lf6P9Qtr/lbItjPZe
	l42Enpotl/rHOzhZMP4SzQzmL4Q44R2gJ4BmMSophnYs9IGK18A6n6QrSB2k6Q3VHwDxvEzblz2
	jz2Egt167tC7QawjeM+EAsducSsmffYtsbG5yQqGKetSDcSqZ+HZKq6UUxm6v1b7ZWY8eIdam/H
	21gsGQqNhyK843+gd0VWKTodv1hEGh54AkSbz3JlMkKuee9iFNFl0URF2NcDKYxyCCcaCOZbhlo
	cPvD8Yl5skIIY74RZ2deX82NbUr++p0uCSuTsgDkWmF0ZPj+3UT4qlMrRRms6GtnuPen4s7XA8D
	vX4Jz1ogPju+6WSqc8OG0vEt26pFKkqmbAyCLBlhs/h3og/iNaQ//zD0JETrl3SS6CNdhE9yRpA
	vf+tkr7qUmhEe5ko68A+GvjWKNCWRuAToI+If4Mwu8uJ68XlfArWjbhICASbY1BrA9r/VoxLuHD
	EnqlWlyd3ka7Ns=
X-Received: by 2002:a17:903:3c23:b0:2a3:e7fe:646e with SMTP id d9443c01a7336-2ae2e3ebfa2mr25339525ad.5.1772187411508;
        Fri, 27 Feb 2026 02:16:51 -0800 (PST)
Received: from kinako.work.home.arpa (p1590226-ipxg00c01sizuokaden.shizuoka.ocn.ne.jp. [153.227.10.226])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2adfb5b1035sm74531775ad.7.2026.02.27.02.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 02:16:51 -0800 (PST)
From: Daniel Palmer <daniel@thingy.jp>
To: sudipm.mukherjee@gmail.com,
	joerg@dorchain.net
Cc: geert@linux-m68k.org,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@thingy.jp>
Subject: [PATCH v2] parport: mfc3: Convert to a modern zorro driver
Date: Fri, 27 Feb 2026 19:16:43 +0900
Message-ID: <20260227101643.473010-1-daniel@thingy.jp>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently this driver causes my Amiga 4000 to crash if it
is not a module because it tries to iterate over the zorro
devices before that has been setup.

Convert the driver over to the modern zorro driver API so
it probes like the other zorro drivers and doesn't crash
my machine.

Claude was able to do the manual work of moving the original
code but I had to fix up some mistakes, clean up the
allocations to use devm versions and so on.

Only build, boot, and "checked the driver is registered correctly"
tested as I don't have the card and it seems to be one of the
few things winuae doesn't emulate. Using claude to fix it up
seemed better than just deleting it considering all of the effort
Joerg put in to documenting the hardware etc.

Assisted-by: Claude:claude-4.6-sonnet
Signed-off-by: Daniel Palmer <daniel@thingy.jp>
---

v2: Clean up how the interrupt works a bit and return IRQ_NONE when the
    interrupt wasn't for the card as suggested by Geert.
    I guess this should work but without a way to test it this is best
    effort.

 drivers/parport/parport_mfc3.c | 152 ++++++++++++++++-----------------
 1 file changed, 72 insertions(+), 80 deletions(-)

diff --git a/drivers/parport/parport_mfc3.c b/drivers/parport/parport_mfc3.c
index bb1817218d7b..21210cb2d8d2 100644
--- a/drivers/parport/parport_mfc3.c
+++ b/drivers/parport/parport_mfc3.c
@@ -66,12 +66,8 @@
 #include <asm/irq.h>
 #include <asm/amigaints.h>
 
-/* Maximum Number of Cards supported */
-#define MAX_MFC 5
-
 #undef DEBUG
 
-static struct parport *this_port[MAX_MFC] = {NULL, };
 static volatile int dummy; /* for trigger readds */
 
 #define pia(dev) ((struct pia *)(dev->base))
@@ -169,19 +165,17 @@ static unsigned char mfc3_read_status(struct parport *p)
 	return status;
 }
 
-static int use_cnt;
-
 static irqreturn_t mfc3_interrupt(int irq, void *dev_id)
 {
-	int i;
-
-	for( i = 0; i < MAX_MFC; i++)
-		if (this_port[i] != NULL)
-			if (pia(this_port[i])->crb & 128) { /* Board caused interrupt */
-				dummy = pia(this_port[i])->pprb; /* clear irq bit */
-				parport_generic_irq(this_port[i]);
-			}
-	return IRQ_HANDLED;
+	struct parport *p = dev_id;
+
+	if (pia(p)->crb & 128) { /* Board caused interrupt */
+		dummy = pia(p)->pprb; /* clear irq bit */
+		parport_generic_irq(p);
+		return IRQ_HANDLED;
+	}
+
+	return IRQ_NONE;
 }
 
 static void mfc3_enable_irq(struct parport *p)
@@ -280,85 +274,83 @@ static struct parport_operations pp_mfc3_ops = {
 
 /* ----------- Initialisation code --------------------------------- */
 
-static int __init parport_mfc3_init(void)
+static int mfc3_probe(struct zorro_dev *z, const struct zorro_device_id *ent)
 {
+	unsigned long piabase = z->resource.start + PIABASE;
+	struct device *dev = &z->dev;
 	struct parport *p;
-	int pias = 0;
 	struct pia *pp;
-	struct zorro_dev *z = NULL;
 
-	if (!MACH_IS_AMIGA)
+	if (!devm_request_mem_region(dev, piabase, sizeof(struct pia), "PIA"))
+		return -EBUSY;
+
+	pp = ZTWO_VADDR(piabase);
+	pp->crb = 0;
+	pp->pddrb = 255; /* all data pins output */
+	pp->crb = PIA_DDR | 32 | 8;
+	dummy = pp->pddrb; /* reading clears interrupt */
+	pp->cra = 0;
+	pp->pddra = 0xe0; /* /RESET, /DIR, /AUTO-FEED output */
+	pp->cra = PIA_DDR;
+	pp->ppra = 0; /* reset printer */
+	udelay(10);
+	pp->ppra = 128;
+
+	p = parport_register_port((unsigned long)pp, IRQ_AMIGA_PORTS,
+				  PARPORT_DMA_NONE, &pp_mfc3_ops);
+	if (!p)
 		return -ENODEV;
 
-	while ((z = zorro_find_device(ZORRO_PROD_BSC_MULTIFACE_III, z))) {
-		unsigned long piabase = z->resource.start+PIABASE;
-		if (!request_mem_region(piabase, sizeof(struct pia), "PIA"))
-			continue;
-
-		pp = ZTWO_VADDR(piabase);
-		pp->crb = 0;
-		pp->pddrb = 255; /* all data pins output */
-		pp->crb = PIA_DDR|32|8;
-		dummy = pp->pddrb; /* reading clears interrupt */
-		pp->cra = 0;
-		pp->pddra = 0xe0; /* /RESET,  /DIR ,/AUTO-FEED output */
-		pp->cra = PIA_DDR;
-		pp->ppra = 0; /* reset printer */
-		udelay(10);
-		pp->ppra = 128;
-		p = parport_register_port((unsigned long)pp, IRQ_AMIGA_PORTS,
-					  PARPORT_DMA_NONE, &pp_mfc3_ops);
-		if (!p)
-			goto out_port;
-
-		if (p->irq != PARPORT_IRQ_NONE) {
-			if (use_cnt++ == 0)
-				if (request_irq(IRQ_AMIGA_PORTS, mfc3_interrupt, IRQF_SHARED, p->name, &pp_mfc3_ops))
-					goto out_irq;
-		}
-		p->dev = &z->dev;
-
-		this_port[pias++] = p;
-		pr_info("%s: Multiface III port using irq\n", p->name);
-		/* XXX: set operating mode */
-
-		p->private_data = (void *)piabase;
-		parport_announce_port (p);
-
-		if (pias >= MAX_MFC)
-			break;
-		continue;
-
-	out_irq:
-		parport_put_port(p);
-	out_port:
-		release_mem_region(piabase, sizeof(struct pia));
+	if (p->irq != PARPORT_IRQ_NONE) {
+		if (request_irq(IRQ_AMIGA_PORTS, mfc3_interrupt,
+				IRQF_SHARED, p->name, p))
+			goto err_put_port;
 	}
 
-	return pias ? 0 : -ENODEV;
+	p->dev = dev;
+	p->private_data = (void *)piabase;
+
+	zorro_set_drvdata(z, p);
+
+	pr_info("%s: Multiface III port using irq\n", p->name);
+	/* XXX: set operating mode */
+	parport_announce_port(p);
+
+	return 0;
+
+err_put_port:
+	parport_put_port(p);
+
+	return -ENODEV;
 }
 
-static void __exit parport_mfc3_exit(void)
+static void mfc3_remove(struct zorro_dev *z)
 {
-	int i;
-
-	for (i = 0; i < MAX_MFC; i++) {
-		if (!this_port[i])
-			continue;
-		parport_remove_port(this_port[i]);
-		if (this_port[i]->irq != PARPORT_IRQ_NONE) {
-			if (--use_cnt == 0) 
-				free_irq(IRQ_AMIGA_PORTS, &pp_mfc3_ops);
-		}
-		release_mem_region(ZTWO_PADDR(this_port[i]->private_data), sizeof(struct pia));
-		parport_put_port(this_port[i]);
-	}
+	struct parport *p = zorro_get_drvdata(z);
+
+	parport_remove_port(p);
+
+	if (p->irq != PARPORT_IRQ_NONE)
+		free_irq(IRQ_AMIGA_PORTS, p);
+
+	parport_put_port(p);
 }
 
+static const struct zorro_device_id mfc3_zorro_tbl[] = {
+	{ ZORRO_PROD_BSC_MULTIFACE_III },
+	{ 0 }
+};
+MODULE_DEVICE_TABLE(zorro, mfc3_zorro_tbl);
+
+static struct zorro_driver mfc3_driver = {
+	.name = "parport_mfc3",
+	.id_table = mfc3_zorro_tbl,
+	.probe = mfc3_probe,
+	.remove = mfc3_remove,
+};
+
+module_driver(mfc3_driver, zorro_register_driver, zorro_unregister_driver);
 
 MODULE_AUTHOR("Joerg Dorchain <joerg@dorchain.net>");
 MODULE_DESCRIPTION("Parport Driver for Multiface 3 expansion cards Parallel Port");
 MODULE_LICENSE("GPL");
-
-module_init(parport_mfc3_init)
-module_exit(parport_mfc3_exit)
-- 
2.51.0

