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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F186C432BE
	for <linux-m68k@archiver.kernel.org>; Sun, 29 Aug 2021 03:12:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF46A60C40
	for <linux-m68k@archiver.kernel.org>; Sun, 29 Aug 2021 03:12:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232871AbhH2DNL (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 28 Aug 2021 23:13:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231558AbhH2DNL (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sat, 28 Aug 2021 23:13:11 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5045C061756
        for <linux-m68k@vger.kernel.org>; Sat, 28 Aug 2021 20:12:19 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id fs6so7219742pjb.4
        for <linux-m68k@vger.kernel.org>; Sat, 28 Aug 2021 20:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=V8Ksts3tMGrOohi5UDv9Sgfsz/qkeUxahW9sCfbw1ac=;
        b=fxpkvDLMkd9JURQHWCT0SO8Ts3Yf8mMU69dIY9yifUK9GH5Er3R05/SfLbM4OFkCEf
         X+hXDp1ztZdUIo/abarUYPVlrmiVPS22PjX5HKEo+TuWxTPeFSvLS/jjELBIN8ZuDJrE
         mTQGrD8mf2BeIWeQch0XMetP7T3ljTB2RmAp5R6QpMTtmQJNIWu9fuHxL6e9jkgt8xHn
         28XRiTVTEDT126g8WL3GQUj3bKsSEBwpsMlyYZEws/zZXlXkVphTpmSfCTtX1laFoYbh
         3wuIntv11icxbVvSGn767Jvv63qdrVtvjpPnnpu8HTsSINeDB868H/IntTG2rxYK0I3W
         4Ckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=V8Ksts3tMGrOohi5UDv9Sgfsz/qkeUxahW9sCfbw1ac=;
        b=JoH+flQANwhpA6rgVr2FNCyl6rfGzgsyMLl6bK5Tlp5XQSjCSKVtO0VzI1Fe16w7tm
         BTj2jaZ6LiAzBzMhz9MYuk5oukbDpSpyX+igc5jk8Xn4sGfQtlx+nsX40nsFkgjhouV7
         bl/54nbWKnDu55yv+D+2fMk4kwTtu8+JvHLRmmuVQ69Hy6d0/9Or0CtjbfztC4AAk12S
         L3zqNDDeGJDB7S6ZLFZ+BjSTm0b9oJqR1s/5jcm7ZC9s/+VQiRUGn7xREdJj4STUp3fv
         LYam7Q00uklr6p/dRlUTbMta4GtaVuJ70C7CnyhdbK0NO4HdamOQu4xfJRxNvMFOzxUf
         EJWA==
X-Gm-Message-State: AOAM5308KjYaH+X73l78lduj7M98L/1EobdrSDAELqhhXJHJyMlq9a3P
        xy9/kPWkOWVD8KcQaaQO+fveM4EWlo8=
X-Google-Smtp-Source: ABdhPJx9SnP1EIC//3Wyc0NHIPHTCUFqsVg6lx2huQd4f88JCxBbGNVJgP4p+RzHn56wtIiHOTVnqQ==
X-Received: by 2002:a17:90a:31cf:: with SMTP id j15mr6046039pjf.86.1630206739486;
        Sat, 28 Aug 2021 20:12:19 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-155-6-212-adsl.sparkbb.co.nz. [222.155.6.212])
        by smtp.gmail.com with ESMTPSA id 77sm2591011pfz.118.2021.08.28.20.12.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 28 Aug 2021 20:12:19 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id DC6143603E5; Sun, 29 Aug 2021 15:12:15 +1200 (NZST)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     alex@kazik.de, Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v7 1/4] m68k: Kconfig - select core PCMCIA support module for Amiga PCMCIA
Date:   Sun, 29 Aug 2021 15:11:47 +1200
Message-Id: <1630206710-5954-2-git-send-email-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630206710-5954-1-git-send-email-schmitzmic@gmail.com>
References: <1630206710-5954-1-git-send-email-schmitzmic@gmail.com>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The 16 bit card support test for the apne.c driver needs a whole
lot of hairy parser code which is already present in the core
PCMCIA code - make use of that instead of duplicating it.

Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---
 arch/m68k/Kconfig.bus | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/m68k/Kconfig.bus b/arch/m68k/Kconfig.bus
index a72e0b6..fa3faec 100644
--- a/arch/m68k/Kconfig.bus
+++ b/arch/m68k/Kconfig.bus
@@ -31,6 +31,8 @@ config ZORRO
 config AMIGA_PCMCIA
 	bool "Amiga 1200/600 PCMCIA support"
 	depends on AMIGA
+	select PCCARD
+	select PCMCIA
 	help
 	  Include support in the kernel for pcmcia on Amiga 1200 and Amiga
 	  600. If you intend to use pcmcia cards say Y; otherwise say N.
-- 
2.7.4

