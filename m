Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ABD1C41513
	for <linux-m68k@archiver.kernel.org>; Thu, 17 Aug 2023 03:50:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347906AbjHQDuV (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 16 Aug 2023 23:50:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347927AbjHQDuK (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 16 Aug 2023 23:50:10 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB60A26B6
        for <linux-m68k@vger.kernel.org>; Wed, 16 Aug 2023 20:50:08 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-564af0ac494so4537309a12.0
        for <linux-m68k@vger.kernel.org>; Wed, 16 Aug 2023 20:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692244208; x=1692849008;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cILQNjttj7WiCQm5ntZk9pL5w3DpZQHuDnfcQPVplmU=;
        b=ErRhYD0wQ65ss+MkH4B6zU6MpDQ3YvT4SpOKztvZVAcwUzO5KMaj6xA4w62he2Q7xm
         yIME0YCVBxk6qdSt7fHTozFqcdYw3dNbpz7wO1gErrTIwzEQldI++cCtuLFMeES1sJR/
         JGLAM14vsg+I+5cMc2KRVHGwSq6p1oBLC5Xlyh+oJGjS9RMj3YHQmUtCigPe3wDIFkBg
         WaUlZrQXTaUd5iFbTZzjhX8ysHyus9L5cyAFXwCDOjVa/XzEYJrDp/34bAP6h2gaFwdC
         r6Rth8g+1zbP8JEgymPK+kofJP1NyCBTbG/u1OFYRXks+jFwfem0Wra1LuAyA3+8K4r2
         jREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692244208; x=1692849008;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cILQNjttj7WiCQm5ntZk9pL5w3DpZQHuDnfcQPVplmU=;
        b=FlPg7Ed78SNvFYR8ELaqoXkehe7gOXSqrXCNyIMIE62jo3skhgdrOXeXyGQJmlxl/9
         w7NRKMG6m9DPIKoQZ0nA3eRNllG7mh4uj2i1FhyI5pxEGyVpvrqY71L1fbW+i5gfTPjW
         Ydk7zgg4Xpm5SexfrRfzM3+rtpwyN2oIlS2yulJ/wVYZDIPa3B4z9ac98MVdKLvStLqI
         pMrcafdj6FHqolDHGRFXEflQvTwK8f0FKppT2P/fJt2O9tN+5fPv3+2EhjtA5S9qDTgs
         bdCoznyrf75y0okpE/+0R245hGz7UKkB6QfRJOi1djWSDDMBeAeKW53gzuwdjLStReLY
         JMcw==
X-Gm-Message-State: AOJu0YzU2SBHAtjgbZA/QIj6MedOrLS/Tc9rYSI1PqTEwUd7lPMc/V8g
        QoQSDcK36i77wRms4+WGX4k=
X-Google-Smtp-Source: AGHT+IFYI+SckoVZvHzgfRD7PsYripAnJ+IrbAGtv5Cn7AM8B7mt5rwux3F5hk5QwxtJrg8I2G2SKg==
X-Received: by 2002:a05:6a20:3d0a:b0:13e:8ce5:cacd with SMTP id y10-20020a056a203d0a00b0013e8ce5cacdmr5137826pzi.26.1692244208165;
        Wed, 16 Aug 2023 20:50:08 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (122-62-141-252-fibre.sparkbb.co.nz. [122.62.141.252])
        by smtp.gmail.com with ESMTPSA id a20-20020a62bd14000000b00686e00313easm11767419pff.157.2023.08.16.20.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 20:50:07 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id 25C4A360439; Thu, 17 Aug 2023 15:50:04 +1200 (NZST)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     will@sowerbutts.com, linux-m68k@vger.kernel.org
Cc:     rz@linux-m68k.org, geert@linux-m68k.org,
        Michael Schmitz <schmitzmic@gmail.com>,
        Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH RFC v3 2/2] m68k/q40: add data_swab option for pata_falcon to byte-swap disk data
Date:   Thu, 17 Aug 2023 15:50:01 +1200
Message-Id: <20230817035001.8400-3-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230817035001.8400-1-schmitzmic@gmail.com>
References: <20230817035001.8400-1-schmitzmic@gmail.com>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Some users of pata_falcon on Q40 have IDE disks in classic
little endian byte order, whereas legacy disks use native
big-endian byte order as on the Atari Falcon.

Add module parameter 'data_swab' to allow connecting drives
with non-native data byte order. Drives selected by the
data_swap bit mask will have their user data byte-swapped to
host byte order, i.e. 'pata_falcon.data_swab=2' will byte-swap
all user data on drive B, leaving data on drive A in native
byte order. On Q40, drives on a second IDE interface may be
added to the bit mask as bits 3 and 4.

Default setting is no byte swapping, i.e. compatibility with
the native Falcon or Q40 operating system disk format.

Cc: William R Sowerbutts <will@sowerbutts.com>
Cc: Finn Thain <fthain@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

---

Changes since v3:

- split off this byte swap handling into separate patch

- add hint regarding third and fourth drive on Q40

Finn Thain:
- rename module parameter to 'data_swab' to better reflect its use

William Sowerbutts:
- correct IDE drive number used in data swap conditional
---
 drivers/ata/pata_falcon.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/ata/pata_falcon.c b/drivers/ata/pata_falcon.c
index 346259e3bbc8..cec3c3a6eed9 100644
--- a/drivers/ata/pata_falcon.c
+++ b/drivers/ata/pata_falcon.c
@@ -33,6 +33,16 @@
 #define DRV_NAME "pata_falcon"
 #define DRV_VERSION "0.1.0"
 
+static int pata_falcon_swap_mask;
+
+module_param_named(data_swab, pata_falcon_swap_mask, int, 0444);
+MODULE_PARM_DESC(data_swab, "Data byte swap enable/disable bitmap (0x1==drive1, 0x2==drive2, 0x4==drive3, 0x8==drive4, default==0)");
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
+	int dev_id = dev->devno;
 	bool swap = 1;
 
 	if (dev->class == ATA_DEV_ATA && cmd &&
 	    !blk_rq_is_passthrough(scsi_cmd_to_rq(cmd)))
-		swap = 0;
+		swap = priv->swap_data && (priv->swap_mask & BIT(dev_id));
 
 	/* Transfer multiple of 2 bytes */
 	if (rw == READ) {
@@ -123,6 +135,7 @@ static int __init pata_falcon_init_one(struct platform_device *pdev)
 	struct resource *base_res, *ctl_res, *irq_res;
 	struct ata_host *host;
 	struct ata_port *ap;
+	struct pata_falcon_priv *priv;
 	void __iomem *base, *ctl_base;
 	int irq = 0, io_offset = 1, reg_scale = 4;
 
@@ -165,10 +178,20 @@ static int __init pata_falcon_init_one(struct platform_device *pdev)
 	ap->pio_mask = ATA_PIO4;
 	ap->flags |= ATA_FLAG_SLAVE_POSS | ATA_FLAG_NO_IORDY;
 
+	priv = devm_kzalloc(&pdev->dev,
+		sizeof(struct pata_falcon_priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	ap->private_data = priv;
+
 	/* N.B. this assumes data_addr will be used for word-sized I/O only */
 	ap->ioaddr.data_addr = (void __iomem *)base_mem_res->start;
 
 	if (base_res) {		/* only Q40 has IO resources */
+		if (pdev->id)
+			pata_falcon_swap_mask >>= 2;
+		priv->swap_mask = pata_falcon_swap_mask;
 		io_offset = 0x10000;
 		reg_scale = 1;
 		base = (void __iomem *)base_res->start;
@@ -178,6 +201,7 @@ static int __init pata_falcon_init_one(struct platform_device *pdev)
 			      &base_res->start,
 			      &ctl_res->start);
 	} else {
+		priv->swap_mask = pata_falcon_swap_mask;
 		base = (void __iomem *)base_mem_res->start;
 		ctl_base = (void __iomem *)ctl_mem_res->start;
 
@@ -199,6 +223,9 @@ static int __init pata_falcon_init_one(struct platform_device *pdev)
 	ap->ioaddr.altstatus_addr	= ctl_base + io_offset;
 	ap->ioaddr.ctl_addr		= ctl_base + io_offset;
 
+	if (priv->swap_mask)
+		priv->swap_data = 1;
+
 	irq_res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
 	if (irq_res && irq_res->start > 0) {
 		irq = irq_res->start;
-- 
2.17.1

