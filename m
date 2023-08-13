Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C9DC04A6A
	for <linux-m68k@archiver.kernel.org>; Sun, 13 Aug 2023 02:48:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbjHMCsc (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 12 Aug 2023 22:48:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbjHMCsc (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sat, 12 Aug 2023 22:48:32 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB1EE170A
        for <linux-m68k@vger.kernel.org>; Sat, 12 Aug 2023 19:48:34 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1bc7e65ea44so22261835ad.1
        for <linux-m68k@vger.kernel.org>; Sat, 12 Aug 2023 19:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691894914; x=1692499714;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uH0ESfq+5TAT05/K1myN+B0x662OfGhBt1zb8Q4RCWI=;
        b=SBWVQn7hDboZV6Fe/knRNE/BxqaWwlvYDugMZnbXCXlbncJQCAdaIdeG+cCsR4oqvB
         gHpC25VBdj+ymXRKix5UJEcRjhMaRw6677KZgCKAne0s3XlHBdmfhD1LWYUZau3CcZwt
         TUdIHYs/aXm1La7cuszrofGPsBLPjvepj4Zp7n8YfMEutGj3bVdIsDj3BbbiVLJek14F
         rguVeq9dm8muVk/tiWqE1DTpHHVSoOTWkEkbmda8EFs1Bl7lY49J2fUiX2lDT6vVqt6B
         hzRLI2hst78mIOtAZswP/Ir7Mn1kHpdZ3pbadxxvJxYXhqIs6RCkBTa4Yasu3MsOt2Lt
         ASDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691894914; x=1692499714;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uH0ESfq+5TAT05/K1myN+B0x662OfGhBt1zb8Q4RCWI=;
        b=RUE4HQaEua+Y07kgTxqouXngpCdcJLADTqqeP6f/uob4b+YF6/vKExhRJo7ZTenpPI
         +v0leONXoZ0F3StgoYQkXWLqzLKAWhwaQatYrxMt+lkRBMBdfDq1daR0jafLZ3jVGfFx
         wh7fToOe6MYs5rO6xAb3Ww/UodL7+x9ZGd/eoyoD1X4aBTNQ01hxLyVZKj4hWbFRUsl2
         aMOPlBF/mjlahvKPiM0pm52aNQrTZY7+EpfYbUpYiJRGqgV3wsOWllCzTocrww6lfG5w
         d8nqH4w8LHw6sf4Fxri1R9rdUFBSTDenUpB6y3KHSgXsgUHmkUFre/RGBC+g2rFDkSMc
         DecA==
X-Gm-Message-State: AOJu0Yw1ZFdBhq6r0M3uvIEe8nuOxNpYkfiy/uigaZVhEVCMb/e1zev3
        dYbGGrxD3ayFb1isTOROPCK6c7txsng=
X-Google-Smtp-Source: AGHT+IFf3j6P9CP/F+Uh918YhsSd/JGLNkqO+OBHG4FuGfkoosigODmqQE366KQq3wpVzBc0riH1Gg==
X-Received: by 2002:a17:903:41cb:b0:1b3:b84b:9008 with SMTP id u11-20020a17090341cb00b001b3b84b9008mr7702427ple.5.1691894914095;
        Sat, 12 Aug 2023 19:48:34 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-152-184-54-fibre.sparkbb.co.nz. [222.152.184.54])
        by smtp.gmail.com with ESMTPSA id x3-20020a170902ea8300b001b672af624esm2406530plb.164.2023.08.12.19.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Aug 2023 19:48:33 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id E6D4C360328; Sun, 13 Aug 2023 14:48:29 +1200 (NZST)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     will@sowerbutts.com, linux-m68k@vger.kernel.org
Cc:     geert@linux-m68k.org, Michael Schmitz <schmitzmic@gmail.com>,
        Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH RFC] m68k/q40: fix IO base selection for Q40 in pata_falcon.c
Date:   Sun, 13 Aug 2023 14:48:27 +1200
Message-Id: <20230813024827.31641-1-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

With commit 44b1fbc0f5f30e66, the Q40 IDE driver was replaced
by pata_falcon.c (and the later obsoleted falconide.c).

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

Reported-by: William R Sowerbutts <will@sowerbutts.com>
Link: https://lore.kernel.org/r/CAMuHMdUU62jjunJh9cqSqHT87B0H0A4udOOPs=WN7WZKpcagVA@mail.gmail.com
Cc: Finn Thain <fthain@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---
 drivers/ata/pata_falcon.c | 62 ++++++++++++++++++++++++++-------------
 1 file changed, 42 insertions(+), 20 deletions(-)

diff --git a/drivers/ata/pata_falcon.c b/drivers/ata/pata_falcon.c
index 996516e64f13..9ea5100675c5 100644
--- a/drivers/ata/pata_falcon.c
+++ b/drivers/ata/pata_falcon.c
@@ -165,26 +165,48 @@ static int __init pata_falcon_init_one(struct platform_device *pdev)
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
+		base = (void __iomem *)base_res->start;
+		ap->ioaddr.data_addr		= base + 0;
+		ap->ioaddr.error_addr		= base + 1;
+		ap->ioaddr.feature_addr		= base + 1;
+		ap->ioaddr.nsect_addr		= base + 2;
+		ap->ioaddr.lbal_addr		= base + 3;
+		ap->ioaddr.lbam_addr		= base + 4;
+		ap->ioaddr.lbah_addr		= base + 5;
+		ap->ioaddr.device_addr		= base + 6;
+		ap->ioaddr.status_addr		= base + 7;
+		ap->ioaddr.command_addr		= base + 7;
+
+		base = (void __iomem *)ctl_res->start;
+		ap->ioaddr.altstatus_addr	= base;
+		ap->ioaddr.ctl_addr		= base;
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

