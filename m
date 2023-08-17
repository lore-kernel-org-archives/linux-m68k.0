Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AC48C0015E
	for <linux-m68k@archiver.kernel.org>; Thu, 17 Aug 2023 03:50:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347907AbjHQDuV (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 16 Aug 2023 23:50:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347926AbjHQDuJ (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 16 Aug 2023 23:50:09 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6456E26AD
        for <linux-m68k@vger.kernel.org>; Wed, 16 Aug 2023 20:50:08 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-68896d7eb1eso645272b3a.3
        for <linux-m68k@vger.kernel.org>; Wed, 16 Aug 2023 20:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692244208; x=1692849008;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2t+qT0b6zki5Ilu+NDHbIR1N8k6T5a8bt5b/GyoqwM8=;
        b=VF+2QFQL2JYvpj8462NhR5miT51ScCSF+jgYDHnHucUBRGKkR1uDe//LLcBJqehvPP
         BlojUjVHSMFzVVlokuiNKhcQnoL1IOYbPuAWsxiI4tKEq3Pu8+kZx4BRXQXr6khyumqJ
         luVj5EEEmD1W1XBQujWi5ZkG7XnYT48/wrRU3DpP5+VDKSG2Q96L5h+iEkPwP/Gif4Gz
         uT7csMkynTflEDGmZOUu6r20dXGgDrCaf2jP6AvYNc8uUSJjsc5dV728h+Fg5C8ivLZa
         DO/uhRVfG2Khw1sl7G1yRAzRUrdvISItMBSWF97ZxuyoFJL6IBTwzYwY2TW/O9OdoGQ3
         aSZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692244208; x=1692849008;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2t+qT0b6zki5Ilu+NDHbIR1N8k6T5a8bt5b/GyoqwM8=;
        b=IjmGAbeE5dQJhpuluMMnVlCgud3ZqihL2xdclA9hu3MwmeGlrwubMQ2f8xhzlOGfz9
         IIDBEecUTzCmefnmWOn5kDRzZjqDp/8E8xa5iBs0tPE4yblMWcP8XsNcFb2r3TjWf49U
         dinKnH5mQVd7oPq9bZvBcUA6+V313lKwIVX1F4ZJhnsINdIryhO43lgc2WOxCEyUnhpE
         kzGrmsSPxp8qJ+ezTh/4ckTVmmcBJCRKWzismfraS1xPI4cN6m/NOQYTrX/FssSzxRkL
         QA+B/o/bc2vKGYp/sxaYEfMNVoEGLvMUGLPRGLiaYR82ejh4XCmUluue1Ke9BPg+fBED
         T8cg==
X-Gm-Message-State: AOJu0YwkT7iv4A5AeZJenTdHGbD1oxf6VsRgdJWbYBv3OAWOJEWGXB1S
        l9hS+kHyccMpUpfXBtCtjVcaCUowcH8=
X-Google-Smtp-Source: AGHT+IEKOD9KSjqgTPU9xEhIQqO79t4QSppCEgVjUORdKOKcoIdHCFDpXto8+rZgbCC7lpO9PiiH9A==
X-Received: by 2002:a05:6a00:1ac6:b0:63d:260d:f9dd with SMTP id f6-20020a056a001ac600b0063d260df9ddmr3962917pfv.33.1692244207740;
        Wed, 16 Aug 2023 20:50:07 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (122-62-141-252-fibre.sparkbb.co.nz. [122.62.141.252])
        by smtp.gmail.com with ESMTPSA id e26-20020aa7825a000000b00686dd062207sm11819863pfn.150.2023.08.16.20.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 20:50:07 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id 8704D3603D9; Thu, 17 Aug 2023 15:50:03 +1200 (NZST)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     will@sowerbutts.com, linux-m68k@vger.kernel.org
Cc:     rz@linux-m68k.org, geert@linux-m68k.org,
        Michael Schmitz <schmitzmic@gmail.com>,
        Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH RFC v3 1/2] m68k/q40: fix IO base selection for Q40 in pata_falcon.c
Date:   Thu, 17 Aug 2023 15:50:00 +1200
Message-Id: <20230817035001.8400-2-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230817035001.8400-1-schmitzmic@gmail.com>
References: <20230817035001.8400-1-schmitzmic@gmail.com>
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

Reported-by: William R Sowerbutts <will@sowerbutts.com>
Closes: https://lore.kernel.org/r/CAMuHMdUU62jjunJh9cqSqHT87B0H0A4udOOPs=WN7WZKpcagVA@mail.gmail.com
Link: https://lore.kernel.org/r/CAMuHMdUU62jjunJh9cqSqHT87B0H0A4udOOPs=WN7WZKpcagVA@mail.gmail.com
Fixes: 44b1fbc0f5f3 ("m68k/q40: Replace q40ide driver with pata_falcon and falconide")
Cc: Finn Thain <fthain@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

---

Changes from v3:

- split off byte swap option into separate patch

Geert Uytterhoeven:
- review comments

Changes from v2:
- add driver parameter 'data_swap' as bit mask for drives to swap

Changes from v1:

Finn Thain:
- take care to supply IO address suitable for ioread8/iowrite8
- use MMIO address for data transfer
---
 drivers/ata/pata_falcon.c | 55 ++++++++++++++++++++++++---------------
 1 file changed, 34 insertions(+), 21 deletions(-)

diff --git a/drivers/ata/pata_falcon.c b/drivers/ata/pata_falcon.c
index 996516e64f13..346259e3bbc8 100644
--- a/drivers/ata/pata_falcon.c
+++ b/drivers/ata/pata_falcon.c
@@ -123,8 +123,8 @@ static int __init pata_falcon_init_one(struct platform_device *pdev)
 	struct resource *base_res, *ctl_res, *irq_res;
 	struct ata_host *host;
 	struct ata_port *ap;
-	void __iomem *base;
-	int irq = 0;
+	void __iomem *base, *ctl_base;
+	int irq = 0, io_offset = 1, reg_scale = 4;
 
 	dev_info(&pdev->dev, "Atari Falcon and Q40/Q60 PATA controller\n");
 
@@ -165,26 +165,39 @@ static int __init pata_falcon_init_one(struct platform_device *pdev)
 	ap->pio_mask = ATA_PIO4;
 	ap->flags |= ATA_FLAG_SLAVE_POSS | ATA_FLAG_NO_IORDY;
 
-	base = (void __iomem *)base_mem_res->start;
 	/* N.B. this assumes data_addr will be used for word-sized I/O only */
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
+	ap->ioaddr.data_addr = (void __iomem *)base_mem_res->start;
+
+	if (base_res) {		/* only Q40 has IO resources */
+		io_offset = 0x10000;
+		reg_scale = 1;
+		base = (void __iomem *)base_res->start;
+		ctl_base = (void __iomem *)ctl_res->start;
+
+		ata_port_desc(ap, "cmd %pa ctl %pa",
+			      &base_res->start,
+			      &ctl_res->start);
+	} else {
+		base = (void __iomem *)base_mem_res->start;
+		ctl_base = (void __iomem *)ctl_mem_res->start;
+
+		ata_port_desc(ap, "cmd %pa ctl %pa",
+			      &base_mem_res->start,
+			      &ctl_mem_res->start);
+	}
+
+	ap->ioaddr.error_addr	= base + io_offset + 1 * reg_scale;
+	ap->ioaddr.feature_addr	= base + io_offset + 1 * reg_scale;
+	ap->ioaddr.nsect_addr	= base + io_offset + 2 * reg_scale;
+	ap->ioaddr.lbal_addr	= base + io_offset + 3 * reg_scale;
+	ap->ioaddr.lbam_addr	= base + io_offset + 4 * reg_scale;
+	ap->ioaddr.lbah_addr	= base + io_offset + 5 * reg_scale;
+	ap->ioaddr.device_addr	= base + io_offset + 6 * reg_scale;
+	ap->ioaddr.status_addr	= base + io_offset + 7 * reg_scale;
+	ap->ioaddr.command_addr	= base + io_offset + 7 * reg_scale;
+
+	ap->ioaddr.altstatus_addr	= ctl_base + io_offset;
+	ap->ioaddr.ctl_addr		= ctl_base + io_offset;
 
 	irq_res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
 	if (irq_res && irq_res->start > 0) {
-- 
2.17.1

