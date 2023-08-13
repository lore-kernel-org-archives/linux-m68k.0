Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 913FFEB64DD
	for <linux-m68k@archiver.kernel.org>; Sun, 13 Aug 2023 21:19:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229754AbjHMVTn (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 13 Aug 2023 17:19:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjHMVTm (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 13 Aug 2023 17:19:42 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD8B610D0
        for <linux-m68k@vger.kernel.org>; Sun, 13 Aug 2023 14:19:44 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-687087d8ddaso3771586b3a.1
        for <linux-m68k@vger.kernel.org>; Sun, 13 Aug 2023 14:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691961584; x=1692566384;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xPR98VUvcrt+SSYL3lf3JoW6kZ7nLI04LUAwOe5K1ko=;
        b=oswLrkuRln8zXfnwnQ3seaBfXEwJGz57Hs0IJ4eI13yX2lv2p9lVVeVku2f9EiOVFy
         a1kqs6e9jiT/Lr1u3xNCmugSv2I6igXDXN2kxDftR1nV9dajEajfnh6ZDsgCVorUhLr5
         TipVMs0UcCMZXGwNisO4qhQPsZA4CtuSo7nSVuEegvA5r8udI3I+q/A5kXPK3WV+m/IA
         ibb7ic17SyPdeAWHEIAVlUZHdOEscm1xnWi+0MMMQY0q4hRIYZX7gsGH8N378j4lAXni
         3HOsbtkWFiB98/OpafgD5cQLgrT3FM1W4nmn5rDzh+b+RKL+qQejNqlvZZsd2xOy8167
         /FlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691961584; x=1692566384;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xPR98VUvcrt+SSYL3lf3JoW6kZ7nLI04LUAwOe5K1ko=;
        b=NL6g+Ht5Bu8Z4WZ4i4qOuFAmpqQa9ASKVDN60DNs4e3LR+kvI8fsiCE0hLw49+SabJ
         kcmLgivORyCjVmGQz4QfjsTJKIf+r4gmVR7Y61AZYeweMk9q92BEmomrKs2xpxIA6zSI
         Le8f2tF8/L3DSFWi8TG76/8JGsp0oKPBWXsvU3m3loYItV3dhUecQWVC8nvJYFPCC9j9
         7NXuQkTezfmfJrTo8+sckW4X3oiqDc2e6dlLaZJb/DnqpQL1//CpBSLV7IpWOQgn1OLs
         5IQGiAJo3juai8+XMh5bupDvQOmd7agjb/L0dM/oGQ/c2TRt8EEj5itrx08DBTUwbEQV
         Hkcw==
X-Gm-Message-State: AOJu0YwEYRoq9NEC2nE/pzv1D7PBWWuHN7hQ+nuaZh/dwaxLLtF2i6x5
        dDMwekZ60Yfz7PGmi6ySHek3KS806rw=
X-Google-Smtp-Source: AGHT+IGRf2h466BG3156m/B7peT354PsyAh8dFE9XrbS3hAYqX3/msffq+5IvvlqlTZ/XcmPl9PEnA==
X-Received: by 2002:a05:6a00:3919:b0:682:537f:2cb8 with SMTP id fh25-20020a056a00391900b00682537f2cb8mr9017576pfb.26.1691961584175;
        Sun, 13 Aug 2023 14:19:44 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-152-184-54-fibre.sparkbb.co.nz. [222.152.184.54])
        by smtp.gmail.com with ESMTPSA id m19-20020aa78a13000000b006871dad3e74sm6641518pfa.65.2023.08.13.14.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 14:19:43 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id BA1DE360328; Mon, 14 Aug 2023 09:19:39 +1200 (NZST)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     will@sowerbutts.com, linux-m68k@vger.kernel.org
Cc:     geert@linux-m68k.org, Michael Schmitz <schmitzmic@gmail.com>,
        Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH RFC v2] m68k/q40: fix IO base selection for Q40 in pata_falcon.c
Date:   Mon, 14 Aug 2023 09:19:37 +1200
Message-Id: <20230813211937.10352-1-schmitzmic@gmail.com>
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

Reported-by: William R Sowerbutts <will@sowerbutts.com>
Closes: https://lore.kernel.org/r/CAMuHMdUU62jjunJh9cqSqHT87B0H0A4udOOPs=WN7WZKpcagVA@mail.gmail.com
Link: https://lore.kernel.org/r/CAMuHMdUU62jjunJh9cqSqHT87B0H0A4udOOPs=WN7WZKpcagVA@mail.gmail.com
Fixes: 44b1fbc0f5f3 ("m68k/q40: Replace q40ide driver with pata_falcon and falconide")
Cc: Finn Thain <fthain@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

---

Changes from v1:

Finn Thain:
- take care to supply IO address suitable for ioread8/iowrite8
- use MMIO address for data transfer
---
 drivers/ata/pata_falcon.c | 63 ++++++++++++++++++++++++++-------------
 1 file changed, 43 insertions(+), 20 deletions(-)

diff --git a/drivers/ata/pata_falcon.c b/drivers/ata/pata_falcon.c
index 996516e64f13..831cf0a25e80 100644
--- a/drivers/ata/pata_falcon.c
+++ b/drivers/ata/pata_falcon.c
@@ -165,26 +165,49 @@ static int __init pata_falcon_init_one(struct platform_device *pdev)
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

