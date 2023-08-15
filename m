Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B82DC001B0
	for <linux-m68k@archiver.kernel.org>; Tue, 15 Aug 2023 22:33:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235434AbjHOWdB (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 15 Aug 2023 18:33:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240437AbjHOWcc (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 15 Aug 2023 18:32:32 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E513C1FF3
        for <linux-m68k@vger.kernel.org>; Tue, 15 Aug 2023 15:32:19 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-687ca37628eso5611511b3a.1
        for <linux-m68k@vger.kernel.org>; Tue, 15 Aug 2023 15:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692138739; x=1692743539;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GN9aVS2BdFvalpY7e90u3NOpeiDAnR7EK7zHzItrzbA=;
        b=WoCTwDY0WOGbN9nY/6iy6MYeoPHcZtryElXrT9IThKLE7IiWUiOZVt+r2mRLlq48/3
         as1RAdxPYpqICXaND604TpGPeknulEVVTViyAuKFPaOhjNSknfVvLAcsNGX5aGcYmGpN
         G+96VET6gvSYZRGgSrHhpKfUn3ju1Hc5MaB3zljbjZ+ASk/jHty86q5fNPZ9H23GpRf+
         H/DBf1z8rFpFGVK1A7NX0VwEE17Ymm771TeJZBHcLnt16JuBa+9SpYq74cx3+Eb7htLV
         B5DDLu6fpcw5NYxtNZlqFwlVo1nJe5NBijWkKQ5hhzZSwpvuF6gnY7T4HXkkB3cw5CY/
         neKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692138739; x=1692743539;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GN9aVS2BdFvalpY7e90u3NOpeiDAnR7EK7zHzItrzbA=;
        b=jsImph1npcct85eyRfa8fjV9i8aT49nxrsWF2DddgocfW7LCoMj8HK8atN58v+09+j
         itFlHv38oHpQnez4672Vzp3GwzzEfJTyyRaA2dNdbqZf7MwH0kEoHUo/W2xVyuY43r0W
         vJ4pr07+dUe7a1vLNm5qAyFaJAvoFT6yeyB9aSQIbpnKH3z6M/mgl7J2oPFbEg++gHp2
         eiZ9Xkd99CH8COzfgcTzo3wWiBRDeg0jBgcGJEJo8QPax/HqbcHqt+R/wmLuUV1Cw3yr
         C2Z8m8vcMonEdCVs8uS1rJMJq5WDR3xBbFCL6wBXIa7YTYW+pnqsudZ3r+cfxjO1adw4
         4CvQ==
X-Gm-Message-State: AOJu0Yyt47khTN7BlOPb8/uGtCW6AFxGmDcLQAtUNQUuZN3dJ3O3/RgP
        7aElM9dlFlOX2JsFCoe3Ad8=
X-Google-Smtp-Source: AGHT+IGFZQfIMgFCxAKI2/XG9YmO/rIQh6k1KeLOA06k4LbTpBhBeIlMYc/QJlu8GfR+RFCc/Gy5/w==
X-Received: by 2002:a05:6a20:ce8f:b0:140:3aa:e2ce with SMTP id if15-20020a056a20ce8f00b0014003aae2cemr237788pzb.42.1692138739255;
        Tue, 15 Aug 2023 15:32:19 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (122-62-141-252-fibre.sparkbb.co.nz. [122.62.141.252])
        by smtp.gmail.com with ESMTPSA id u9-20020a63a909000000b0056428865aadsm10557644pge.82.2023.08.15.15.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 15:32:18 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id E21E2360370; Wed, 16 Aug 2023 10:32:14 +1200 (NZST)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     will@sowerbutts.com, linux-m68k@vger.kernel.org
Cc:     rz@linux-m68k.org, geert@linux-m68k.org,
        Michael Schmitz <schmitzmic@gmail.com>,
        Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH RFC v3] m68k/q40: fix IO base selection for Q40 in pata_falcon.c
Date:   Wed, 16 Aug 2023 10:32:12 +1200
Message-Id: <20230815223212.13620-1-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

With commit 44b1fbc0f5f3 ("m68k/q40: Replace q40ide driver
with pata_falcon and falconide"), the Q40 IDE driver was
replaced by pata_falcon.c (and the later obsoleted
falconide.c).

Both IO and memory resources were defined for the Q40 IDE
platform device, but definition of the IDE register addresses
was modeled after the Falcon case, both in use of the memory
resources and in including register scale and byte vs. word
offset in the address.

This was correct for the Falcon case, which does not apply
any address translation to the register addresses. In the
Q40 case, all of device base address, byte access offset
and register scaling is included in the platform specific
ISA access translation (in asm/mm_io.h).

As a consequence, such address translation gets applied
twice, and register addresses are mangled.

Use the device base address from the platform IO resource,
and use standard register offsets from that base in order
to calculate register addresses (the IO address translation
will then apply the correct ISA window base and scaling).

Encode PIO_OFFSET into IO port addresses for all registers
except the data transfer register. Encode the MMIO offset
there (pata_falcon_data_xfer() directly uses raw IO with
no address translation).

Add module parameter 'data_swap' to allow connecting drives
with non-native data byte order. Drives selected by the
data_swap bit mask will have their user data swapped to host
byte order, i.e. 'pata_falcon.data_swap=2' will swap all user
data on drive B, leaving data on drive A in native order.

Reported-by: William R Sowerbutts <will@sowerbutts.com>
Closes: https://lore.kernel.org/r/CAMuHMdUU62jjunJh9cqSqHT87B0H0A4udOOPs=WN7WZKpcagVA@mail.gmail.com
Link: https://lore.kernel.org/r/CAMuHMdUU62jjunJh9cqSqHT87B0H0A4udOOPs=WN7WZKpcagVA@mail.gmail.com
Fixes: 44b1fbc0f5f3 ("m68k/q40: Replace q40ide driver with pata_falcon and falconide")
Cc: Finn Thain <fthain@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

---

Changes from v2:

- add driver parameter 'data_swap' as bit mask for drives to swap

Changes from v1:

Finn Thain:
- take care to supply IO address suitable for ioread8/iowrite8
- use MMIO address for data transfer
---
 drivers/ata/pata_falcon.c | 90 ++++++++++++++++++++++++++++++---------
 1 file changed, 69 insertions(+), 21 deletions(-)

diff --git a/drivers/ata/pata_falcon.c b/drivers/ata/pata_falcon.c
index 996516e64f13..e6038eca39d6 100644
--- a/drivers/ata/pata_falcon.c
+++ b/drivers/ata/pata_falcon.c
@@ -33,6 +33,16 @@
 #define DRV_NAME "pata_falcon"
 #define DRV_VERSION "0.1.0"
 
+static int pata_falcon_swap_mask = 0; 
+
+module_param_named(data_swap, pata_falcon_swap_mask, int, 0444);
+MODULE_PARM_DESC(data_swap, "Data byte swap enable/disable (0x1==drive1, 0x2==drive2, default==0)");
+
+struct pata_falcon_priv {
+	unsigned int swap_mask;
+	bool swap_data;
+};
+
 static const struct scsi_host_template pata_falcon_sht = {
 	ATA_PIO_SHT(DRV_NAME),
 };
@@ -44,13 +54,15 @@ static unsigned int pata_falcon_data_xfer(struct ata_queued_cmd *qc,
 	struct ata_device *dev = qc->dev;
 	struct ata_port *ap = dev->link->ap;
 	void __iomem *data_addr = ap->ioaddr.data_addr;
+	struct pata_falcon_priv *priv = ap->private_data;
 	unsigned int words = buflen >> 1;
 	struct scsi_cmnd *cmd = qc->scsicmd;
+	int dev_id = cmd->device->sdev_target->id;
 	bool swap = 1;
 
 	if (dev->class == ATA_DEV_ATA && cmd &&
 	    !blk_rq_is_passthrough(scsi_cmd_to_rq(cmd)))
-		swap = 0;
+		swap = priv->swap_data && (priv->swap_mask & 1<<dev_id);
 
 	/* Transfer multiple of 2 bytes */
 	if (rw == READ) {
@@ -123,6 +135,7 @@ static int __init pata_falcon_init_one(struct platform_device *pdev)
 	struct resource *base_res, *ctl_res, *irq_res;
 	struct ata_host *host;
 	struct ata_port *ap;
+	struct pata_falcon_priv *priv;
 	void __iomem *base;
 	int irq = 0;
 
@@ -165,26 +178,61 @@ static int __init pata_falcon_init_one(struct platform_device *pdev)
 	ap->pio_mask = ATA_PIO4;
 	ap->flags |= ATA_FLAG_SLAVE_POSS | ATA_FLAG_NO_IORDY;
 
-	base = (void __iomem *)base_mem_res->start;
-	/* N.B. this assumes data_addr will be used for word-sized I/O only */
-	ap->ioaddr.data_addr		= base + 0 + 0 * 4;
-	ap->ioaddr.error_addr		= base + 1 + 1 * 4;
-	ap->ioaddr.feature_addr		= base + 1 + 1 * 4;
-	ap->ioaddr.nsect_addr		= base + 1 + 2 * 4;
-	ap->ioaddr.lbal_addr		= base + 1 + 3 * 4;
-	ap->ioaddr.lbam_addr		= base + 1 + 4 * 4;
-	ap->ioaddr.lbah_addr		= base + 1 + 5 * 4;
-	ap->ioaddr.device_addr		= base + 1 + 6 * 4;
-	ap->ioaddr.status_addr		= base + 1 + 7 * 4;
-	ap->ioaddr.command_addr		= base + 1 + 7 * 4;
-
-	base = (void __iomem *)ctl_mem_res->start;
-	ap->ioaddr.altstatus_addr	= base + 1;
-	ap->ioaddr.ctl_addr		= base + 1;
-
-	ata_port_desc(ap, "cmd 0x%lx ctl 0x%lx",
-		      (unsigned long)base_mem_res->start,
-		      (unsigned long)ctl_mem_res->start);
+	priv = devm_kzalloc(&pdev->dev,
+		sizeof(struct pata_falcon_priv), GFP_KERNEL);
+
+	if (!priv)
+		return -ENOMEM;
+
+	ap->private_data = priv;
+
+	priv->swap_mask = pata_falcon_swap_mask;
+	if (priv->swap_mask)
+		priv->swap_data = 1;
+
+	if (MACH_IS_Q40) {
+		base = (void __iomem *)base_mem_res->start;
+		ap->ioaddr.data_addr		= base + 0;
+		base = (void __iomem *)base_res->start;
+		ap->ioaddr.error_addr		= base + 0x10000 + 1;
+		ap->ioaddr.feature_addr		= base + 0x10000 + 1;
+		ap->ioaddr.nsect_addr		= base + 0x10000 + 2;
+		ap->ioaddr.lbal_addr		= base + 0x10000 + 3;
+		ap->ioaddr.lbam_addr		= base + 0x10000 + 4;
+		ap->ioaddr.lbah_addr		= base + 0x10000 + 5;
+		ap->ioaddr.device_addr		= base + 0x10000 + 6;
+		ap->ioaddr.status_addr		= base + 0x10000 + 7;
+		ap->ioaddr.command_addr		= base + 0x10000 + 7;
+
+		base = (void __iomem *)ctl_res->start;
+		ap->ioaddr.altstatus_addr	= base + 0x10000;
+		ap->ioaddr.ctl_addr		= base + 0x10000;
+
+		ata_port_desc(ap, "cmd 0x%lx ctl 0x%lx",
+			      (unsigned long)base_res->start,
+			      (unsigned long)ctl_res->start);
+	} else {
+		base = (void __iomem *)base_mem_res->start;
+		/* N.B. this assumes data_addr will be used for word-sized I/O only */
+		ap->ioaddr.data_addr		= base + 0 + 0 * 4;
+		ap->ioaddr.error_addr		= base + 1 + 1 * 4;
+		ap->ioaddr.feature_addr		= base + 1 + 1 * 4;
+		ap->ioaddr.nsect_addr		= base + 1 + 2 * 4;
+		ap->ioaddr.lbal_addr		= base + 1 + 3 * 4;
+		ap->ioaddr.lbam_addr		= base + 1 + 4 * 4;
+		ap->ioaddr.lbah_addr		= base + 1 + 5 * 4;
+		ap->ioaddr.device_addr		= base + 1 + 6 * 4;
+		ap->ioaddr.status_addr		= base + 1 + 7 * 4;
+		ap->ioaddr.command_addr		= base + 1 + 7 * 4;
+
+		base = (void __iomem *)ctl_mem_res->start;
+		ap->ioaddr.altstatus_addr	= base + 1;
+		ap->ioaddr.ctl_addr		= base + 1;
+
+		ata_port_desc(ap, "cmd 0x%lx ctl 0x%lx",
+			      (unsigned long)base_mem_res->start,
+			      (unsigned long)ctl_mem_res->start);
+	}
 
 	irq_res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
 	if (irq_res && irq_res->start > 0) {
-- 
2.17.1

