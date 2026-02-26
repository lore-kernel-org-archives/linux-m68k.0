Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9707374166
	for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Feb 2026 14:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772117764; cv=none; b=fev+ngMCVFy5dH45g2WkfXX0W8HI2dBYXMVEnCxSHWPlCX926bhmNNLJamxOp9n0X2XkWIpWOar9nHc+DkPqNVYnFNnIUfrWccLIcHhbkSIBEvU8V0CGqndR+bqitMHmTS20vIYCi992tgmlUFdn6CKcNSKKTM6ttdZ7AcIzoBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772117764; c=relaxed/simple;
	bh=nXVQ53makdg3jwsMBYpdubAWQrSSGP1sXdl2IvF9QoM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Iqiu42675Z+T7K0QVH7g0ZTJA39m867ZhBC1melKHfaAGIFGdtEQCO9ypNoh++l+kIvK4K0gC3ayMvvnf+uQEMQywNvts/z9ffln3FQeKkTFUrIW/RXi6lb1dwVACZ4oFl7Cu+TbFLsH0rlf7t+hVuGfzLmlabIdmUl7izpb4v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=D8WUGFxG; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="D8WUGFxG"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35621ce8a9cso413699a91.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Feb 2026 06:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1772117760; x=1772722560; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W+9DeU24eJjz9tNf9en2Zw19YE84GqsQyUQaagU9Tag=;
        b=D8WUGFxGdDqtET9D3suSL/SAXOtsDQgKPs/HSZ9EdZdgPKjGhDbkrJksHIS7LS4x1x
         PyGTO+ukVQvHeBr4NkvAWyn0K5w9YMmOue3DsfEE1odEPnFg1hiAJ2fEAhzdL5dguk61
         /QNdPCBnJCAwS5UF9NMPhhg/Fkf+aP8crIaCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772117760; x=1772722560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W+9DeU24eJjz9tNf9en2Zw19YE84GqsQyUQaagU9Tag=;
        b=CIxNijhefNS1B8K8YdQz1U/wRzVqdcI65CN3EIehH8T+yEq1sfZJMMlfN1F9nD/ag2
         zwHe58sYFsRWhVfYyj+A8pCGHhY2oM5LgTK3om+M2TrULXeJajW3fqv6SLR8viMY28yQ
         IeG9imDuTdiIYetfvpLfeP1eMbZhf54LfFUgu9js0jOLq+HG5vbweTTjBxWcj9Gl7MEp
         b+PYlroxiy7otKdZ6KjnHmm61krqj1Dz4QknmMBHtqNsAi4odFLMfENh73RA5XucK5J4
         54SNAEctVYZu1z8aTo6dt9CySsSZnIVRvZj3jfCT3Mq+kasYD5yjo/QFNQGHmzol0YIg
         Yneg==
X-Gm-Message-State: AOJu0YxOaLuCmLwAdpuCiqs1VoUMJA+KCgZXVajDsvZmt2Ie/8U1tZRV
	nS/yWOyGgjmIlmxTgBP+mMo1pddUwOk7fmxhYthTHaD5W93yTB6sRdDXn5f1D3h3TWE=
X-Gm-Gg: ATEYQzwxIZFwOQTTjoEyOQIjxPvAcas3/1GsOsOvBIkWxxPy07Ukrka8ky5G8jpHLtu
	bmmkaKd2N4k5nrlmxThyd3zMqyeaQEyzRcDjs5z8KZRJ48JqxiyGgTCOILfc3DIy2KEzfVWv+ce
	QnQYTxhjpxvN+YOpRPgGKsSva1SnVqGkUGXXrw1s+zUA294+Vjiz1Jy+AaiY1TeDqOVqUMKhstH
	KWbMKDCBoWrIuPAaxyBYR5CmOv1IqlMFmPrh+rWnZP2hjQawEOznpDX3dpInM+nBLvMCaChmf78
	kK/TYLn4W40MGDtbs0UJPSsvoHYDQOkgpI51Ty4ZVpzA1V7d1qpbZVBGKIolfBY/eSYZtPMispB
	qCZCl8MpiCD/3RX0pNqI7zIbeAiBQK/hwkTipqpB6HTAL2FGjvfLS1ZbGfUv3+Q5r5qKtDEp6W6
	d55eDaxwtQmZWbpA4oMT8zP84A6ItPtzPdKgqtaWRGLYQGc5B7s+1oom1FbGhiAB3MY9c/fozh4
	O+nCjiChpOIOG8=
X-Received: by 2002:a17:90b:3e82:b0:356:1edc:b71 with SMTP id 98e67ed59e1d1-35928a38e71mr3311421a91.1.1772117760137;
        Thu, 26 Feb 2026 06:56:00 -0800 (PST)
Received: from kinako.work.home.arpa (p1590226-ipxg00c01sizuokaden.shizuoka.ocn.ne.jp. [153.227.10.226])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-35912f5f29fsm3486404a91.1.2026.02.26.06.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 06:55:59 -0800 (PST)
From: Daniel Palmer <daniel@thingy.jp>
To: sudipm.mukherjee@gmail.com,
	joerg@dorchain.net
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@thingy.jp>
Subject: [PATCH] parport: mfc3: Convert to a modern zorro driver
Date: Thu, 26 Feb 2026 23:54:41 +0900
Message-ID: <20260226145441.3606201-1-daniel@thingy.jp>
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
 drivers/parport/parport_mfc3.c | 157 ++++++++++++++++++---------------
 1 file changed, 87 insertions(+), 70 deletions(-)

diff --git a/drivers/parport/parport_mfc3.c b/drivers/parport/parport_mfc3.c
index bb1817218d7b..c77282ba78d3 100644
--- a/drivers/parport/parport_mfc3.c
+++ b/drivers/parport/parport_mfc3.c
@@ -66,17 +66,19 @@
 #include <asm/irq.h>
 #include <asm/amigaints.h>
 
-/* Maximum Number of Cards supported */
-#define MAX_MFC 5
-
 #undef DEBUG
 
-static struct parport *this_port[MAX_MFC] = {NULL, };
 static volatile int dummy; /* for trigger readds */
 
 #define pia(dev) ((struct pia *)(dev->base))
 static struct parport_operations pp_mfc3_ops;
 
+struct mfc3_card {
+	struct parport *port;
+	unsigned long piabase;
+	bool has_irq;
+};
+
 static void mfc3_write_data(struct parport *p, unsigned char data)
 {
 	pr_debug("write_data %c\n", data);
@@ -173,14 +175,18 @@ static int use_cnt;
 
 static irqreturn_t mfc3_interrupt(int irq, void *dev_id)
 {
-	int i;
+	struct zorro_dev *z = NULL;
 
-	for( i = 0; i < MAX_MFC; i++)
-		if (this_port[i] != NULL)
-			if (pia(this_port[i])->crb & 128) { /* Board caused interrupt */
-				dummy = pia(this_port[i])->pprb; /* clear irq bit */
-				parport_generic_irq(this_port[i]);
-			}
+	while ((z = zorro_find_device(ZORRO_PROD_BSC_MULTIFACE_III, z))) {
+		struct mfc3_card *card = zorro_get_drvdata(z);
+
+		if (!card || !card->port)
+			continue;
+		if (pia(card->port)->crb & 128) { /* Board caused interrupt */
+			dummy = pia(card->port)->pprb; /* clear irq bit */
+			parport_generic_irq(card->port);
+		}
+	}
 	return IRQ_HANDLED;
 }
 
@@ -280,85 +286,96 @@ static struct parport_operations pp_mfc3_ops = {
 
 /* ----------- Initialisation code --------------------------------- */
 
-static int __init parport_mfc3_init(void)
+static int mfc3_probe(struct zorro_dev *z, const struct zorro_device_id *ent)
 {
+	unsigned long piabase = z->resource.start + PIABASE;
+	struct device *dev = &z->dev;
+	struct mfc3_card *card;
 	struct parport *p;
-	int pias = 0;
 	struct pia *pp;
-	struct zorro_dev *z = NULL;
 
-	if (!MACH_IS_AMIGA)
+	card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
+	if (!card)
+		return -ENOMEM;
+
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
+	card->port = p;
+	card->piabase = piabase;
 
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
+	if (p->irq != PARPORT_IRQ_NONE) {
+		if (use_cnt++ == 0) {
+			if (request_irq(IRQ_AMIGA_PORTS, mfc3_interrupt,
+					IRQF_SHARED, p->name, &pp_mfc3_ops)) {
+				use_cnt--;
+				goto err_put_port;
+			}
 		}
-		p->dev = &z->dev;
+		card->has_irq = true;
+	}
 
-		this_port[pias++] = p;
-		pr_info("%s: Multiface III port using irq\n", p->name);
-		/* XXX: set operating mode */
+	p->dev = dev;
+	p->private_data = (void *)piabase;
 
-		p->private_data = (void *)piabase;
-		parport_announce_port (p);
+	zorro_set_drvdata(z, card);
 
-		if (pias >= MAX_MFC)
-			break;
-		continue;
+	pr_info("%s: Multiface III port using irq\n", p->name);
+	/* XXX: set operating mode */
+	parport_announce_port(p);
 
-	out_irq:
-		parport_put_port(p);
-	out_port:
-		release_mem_region(piabase, sizeof(struct pia));
-	}
+	return 0;
 
-	return pias ? 0 : -ENODEV;
+err_put_port:
+	parport_put_port(p);
+
+	return -ENODEV;
 }
 
-static void __exit parport_mfc3_exit(void)
+static void mfc3_remove(struct zorro_dev *z)
 {
-	int i;
+	struct mfc3_card *card = zorro_get_drvdata(z);
 
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
+	parport_remove_port(card->port);
+
+	if (card->has_irq && (--use_cnt == 0))
+		free_irq(IRQ_AMIGA_PORTS, &pp_mfc3_ops);
+
+	parport_put_port(card->port);
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

