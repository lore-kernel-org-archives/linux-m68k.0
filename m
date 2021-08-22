Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B72FFC4338F
	for <linux-m68k@archiver.kernel.org>; Sun, 22 Aug 2021 01:48:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8949F6127B
	for <linux-m68k@archiver.kernel.org>; Sun, 22 Aug 2021 01:48:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231167AbhHVBsu (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 21 Aug 2021 21:48:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230346AbhHVBsu (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sat, 21 Aug 2021 21:48:50 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F06CC061575
        for <linux-m68k@vger.kernel.org>; Sat, 21 Aug 2021 18:48:10 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id m26so12132919pff.3
        for <linux-m68k@vger.kernel.org>; Sat, 21 Aug 2021 18:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=QANM1qnagH33tAsT0CBS6rpOTJD7KbhkZCVNmXAF3dw=;
        b=CQoXA9KMKbtTenMuKmMxOWX+Ij7dMQAxI0ysiA/b/3lLbYUAFRJQMX+z3073OcDOJw
         PO+0OjPaFFwQWNP0tDJi8AR5do9x1010wL0rvkUGdIz2HkjYV7Z5BTYphBvdWHC+3XBH
         S8CWXVYY9nxIVQa1P4cfjbiuSXfmNs/OTnPgl5wk7Rs80rrchO0e4OdyZRlgrm4mjMrA
         yKzCbToHIwdZhPaADjtEKpMf8ql2v/sOOXHlbQ9wbZUS6FexhRr5VjtCRmfWGy39ec2+
         oMLGtQ+t0K3K9h6SxChC3b3cfZ8YEoEMMRc1A7DNdh6kgpc4vEKdjftiPpADYigMtU08
         jRfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=QANM1qnagH33tAsT0CBS6rpOTJD7KbhkZCVNmXAF3dw=;
        b=bvvxjc4jstg0mjCRE5dPNmQUnBDNuXXsFdnjyHRk3uhroRrImBhbNGNIvJVoxW4blJ
         SdYqfxWvRmC2qeyUAPbVNZADIzMjXPhrRXVpGsTQmXbgArySSJRiHai3dLn5Vr9rAEyB
         +DOYrNsYFMQvYCHKunr5xquCn1DWOd7l8n68aUMfLsO/sZRrxaEzNxNaOQDk0VQmbiGv
         +z8Kl2eYub6+ekhybBNr/8I1GupbZZuaV1e6RPWzMJj4Kq+bLzRnotcz5T+zWl4BA3d+
         cEK6EYMhScnNe7y89ANOAXN8EiAD6fvbeD4OqkekijU8uYwygbloFRh+9WZ+ThdWm82o
         MESg==
X-Gm-Message-State: AOAM530q5in+JisexHrfcpO9L0do9bqk/8hPUyKU3M2eNE4Hgzy6+d4e
        k8GkonhCsWJy+W52OVQoR+8=
X-Google-Smtp-Source: ABdhPJwN0QycW27YfU+cy5o18ZH33pfkVuNm9Q++/y5dVk4ULtdxRBWR+oVXFLDXeNORqgC6dJHBWg==
X-Received: by 2002:a63:790b:: with SMTP id u11mr25388597pgc.71.1629596889107;
        Sat, 21 Aug 2021 18:48:09 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-155-6-212-adsl.sparkbb.co.nz. [222.155.6.212])
        by smtp.gmail.com with ESMTPSA id z7sm12016610pff.177.2021.08.21.18.48.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 21 Aug 2021 18:48:08 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id CC2B4360412; Sun, 22 Aug 2021 13:48:04 +1200 (NZST)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org
Cc:     alex@kazik.de, Michael Schmitz <schmitzmic@gmail.com>,
        Debian/m68k <debian-68k@lists.debian.org>
Subject: [CFT][PATCH] net/8390: apne.c - read out and log PCMCIA cftable entries
Date:   Sun, 22 Aug 2021 13:48:02 +1200
Message-Id: <1629596882-9177-1-git-send-email-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Could someone with a 'normal' Amiga PCMCIA ethernet card (supported
by the current apne driver) please test this patch and send me the
kernel log output relating to the apne driver probe? 

At least for the 16 bit card that Alex tested, the PCMCIA config
tuple data correctly records the 16 bit IO width of the card. I
need to know whether 8 bit cards also report 16 bit IO width, or
only 8 bit.

The IO width from the config table data, iff accurate, would allow
auto-probing of 16 bit cards. That would make it easier to get
a patch to support 16 bit cards accepted.

Thanks,

	Michael


Read the card's CISTPL_CFTABLE_ENTRY tuple, and log to the
kernel log buffer. This tuple ought to hold information
about the IO width of the card memory window that can be used
in autoprobing to detect 16 bit datapath cards.

CC: Debian/m68k <debian-68k@lists.debian.org>
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---
 drivers/net/ethernet/8390/apne.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/ethernet/8390/apne.c b/drivers/net/ethernet/8390/apne.c
index fe6c834..363c1d5 100644
--- a/drivers/net/ethernet/8390/apne.c
+++ b/drivers/net/ethernet/8390/apne.c
@@ -127,6 +127,8 @@ struct net_device * __init apne_probe(int unit)
 
 #ifndef MANUAL_CONFIG
 	char tuple[8];
+	char cftuple[258];
+	int len_cftuple = 0;
 #endif
 	int err;
 
@@ -168,6 +170,20 @@ struct net_device * __init apne_probe(int unit)
 		free_netdev(dev);
 		return ERR_PTR(-ENODEV);
 	}
+
+	if ((len_cftuple = pcmcia_copy_tuple(CISTPL_CFTABLE_ENTRY, cftuple, 256)) < 32) {
+		pr_cont("no cftable entry for card\n");
+		/* XXX: shouldn't we re-enable irq here? */
+	} else {
+		int i;
+
+		pr_info("CFTABLE_ENTRY tuple:\n");
+		for (i=0; i<len_cftuple; i++) {
+			pr_cont("%hhx ", cftuple[i]);
+			if (i > 0 && !(i % 10)) pr_cont("\n");			
+		}
+		pr_cont("\n");
+	}
 #endif
 
 	pr_cont("ethernet PCMCIA card inserted\n");
-- 
2.7.4

