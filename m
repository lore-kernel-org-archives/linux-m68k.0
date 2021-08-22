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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A4E5C4338F
	for <linux-m68k@archiver.kernel.org>; Sun, 22 Aug 2021 03:11:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2EE026120C
	for <linux-m68k@archiver.kernel.org>; Sun, 22 Aug 2021 03:11:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232176AbhHVDLx (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 21 Aug 2021 23:11:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231336AbhHVDLx (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sat, 21 Aug 2021 23:11:53 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C839C061575
        for <linux-m68k@vger.kernel.org>; Sat, 21 Aug 2021 20:11:13 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id w6so8177239plg.9
        for <linux-m68k@vger.kernel.org>; Sat, 21 Aug 2021 20:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=WIFTPPgFqoA1wrFsMsPmReHokoVnTxKEt6q0K1NlDCo=;
        b=Ifdsk1xuC9th1oCwMxOkGRbSic4/brUs9NjEzPFSjXE79qOIPV1bFb+EG/IgSszzSo
         R7bnWMrbWRiTrut77bR3w9/LwtzmHJm8NcR7ku8I9SiPUkPqKHWQM6gySdUMFORdV1LE
         RjNBl8fY6Ow8xfyxfyAsotCwTxrVtpmnqKCDOLqWbrBw3Vyd+cSv/zaP/spq7MkEYWz5
         61JPly5/7ewYpqM7j5MEeEwQbJ0Y0LWd+fD8IA1o/x1WCTq0gMd5YVuuE0FOuKru1gpM
         VzPwpV1CAgKHvnVDMpMqkVefSrRg0+IuuVCFS+ErPoor8D2jNjp4ewChrBTo93M66qz9
         q/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=WIFTPPgFqoA1wrFsMsPmReHokoVnTxKEt6q0K1NlDCo=;
        b=ro3rQq9UROGAjDz3mlnl9zUdTGmCPSj29UfllFm4wW8+qj3zssQnSJT1PBzpg7cjWv
         FVPp46kZDT73UZCthbjBy7KxKQrk8E/NCrVZrljRQ++JEKwm+iOCWJAOL1UnE7sewNne
         RQG2TOlINzOFI5dXUeYl2Iv505aX8fjuo04Y7APF3GDNHh3LWv07JtoAieaYzvueKveX
         ozzfYbpjOBOyV5TPdOlTkbeQh9Gq2PIm4TrrSt1qU4hwJ7LKDB7hiVdHYhrgBf7eOZjh
         esCZcg8+yoWgLeC92+TdkRH45Nw8AMk7rOqUKuilcO/CXvoKavhYZ9P1bAfEVU5Ra0Hh
         FDSg==
X-Gm-Message-State: AOAM5328d8tYradMzajQlBqypetgynH9Yv8qy8IklaeUL4g+QbojcpUD
        9j7d4Mnv7d+b1wvl4MZ36wo=
X-Google-Smtp-Source: ABdhPJzSqH/o29Wl7FXEYzIQBi9bHAd3kEsjsvc+3jtfFO04ZQGtRy4kbv6fsR/bNDbn6Eqc232YCQ==
X-Received: by 2002:a17:902:e20a:b029:12d:76cd:6721 with SMTP id u10-20020a170902e20ab029012d76cd6721mr22391045plb.43.1629601872302;
        Sat, 21 Aug 2021 20:11:12 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-155-6-212-adsl.sparkbb.co.nz. [222.155.6.212])
        by smtp.gmail.com with ESMTPSA id y23sm11977822pfb.130.2021.08.21.20.11.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 21 Aug 2021 20:11:11 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id 4A80B360412; Sun, 22 Aug 2021 15:11:08 +1200 (NZST)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org
Cc:     alex@kazik.de, Michael Schmitz <schmitzmic@gmail.com>,
        Debian/m68k <debian-68k@lists.debian.org>
Subject: [CFT][PATCH v2] net/8390: apne.c - read out and log PCMCIA cftable entries
Date:   Sun, 22 Aug 2021 15:11:06 +1200
Message-Id: <1629601866-4410-1-git-send-email-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

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
index fe6c834..dd71b10 100644
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
+	if ((len_cftuple = pcmcia_copy_tuple(CISTPL_CFTABLE_ENTRY, cftuple, 256)) < 3) {
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

