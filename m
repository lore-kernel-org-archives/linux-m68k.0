Return-Path: <SRS0=t1u4=6Q=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A870EC47247
	for <linux-m68k@archiver.kernel.org>; Sat,  2 May 2020 04:30:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8817820787
	for <linux-m68k@archiver.kernel.org>; Sat,  2 May 2020 04:30:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oyeay6rF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726809AbgEBEa1 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 2 May 2020 00:30:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726439AbgEBEa1 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 2 May 2020 00:30:27 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35C50C061A0E
        for <linux-m68k@lists.linux-m68k.org>; Fri,  1 May 2020 21:30:27 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id e6so822027pjt.4
        for <linux-m68k@lists.linux-m68k.org>; Fri, 01 May 2020 21:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=vpS36TylFqj6jrIVdVIL/ErFQYh/QXV+DFzSdPvVBVM=;
        b=Oyeay6rF7tCBpvYi5NEt0i6XoQ7t1bedF7CA6WfGvYWUoFTcsrp+AV+rukIb7c8Cje
         ao3ivCHvbqHi5/vxU1bROw6z39ep/3pX3xZH/eL8f4VzQGeBpEfWE4ctxP9LuuR+nRDR
         03wtSUNe4E6/0TJ+7MM0jhzf9m9oog9UIDOIdSxUaAnLatvaPIcyBkFF1K27jRY26CtW
         mrnm0oPga8GpvstXIcFmySfu9+TfVMNeeiYpCQjjbCD4uUXWReL2NrMEkMLozRWWdb0C
         tkwWSLko2jGEOpqfiv9KVF8IKgMcg8XfNrzFCCkbfzhoToLwTiRRTo27vVqDOUBWFbo4
         2afQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=vpS36TylFqj6jrIVdVIL/ErFQYh/QXV+DFzSdPvVBVM=;
        b=YwkI0auqbJYsCtlwm2t3qJLb1/hNCZY6fTsUK95p/ZG6Z/qymjii47GXD7jQNsN+t0
         5Wv/By+AllhR3rwthPsv5RGBSQtq4XW2f7U749b7ugBVqbDIC6QCvcb/IQG4XMeTWe8R
         a4WB9zDQhCU4l+Iha0WDW0NZxFoKGZ2OAztTbvsIKT6hEj9BSLiXxnQ3DIRlzuBQVVaS
         XpxSqUCvZ6mbu4J/QMaIDIf44f9zVFFRsbY8+vOQlEDRCRcZkCCqjL2hfKJDyv3v4/d1
         NhlwFc5PTCOOdXBjmzYnlJhjrWyzymDuY6poYXcEQqmbgu0JXxkgcYz3tiJtzIBuw/lP
         nyUQ==
X-Gm-Message-State: AGi0PuZRWK5DIyEgEbBd5NwIdWhm1tTsGZdxqficPqVlbOmzqXJWqcFD
        GUSM+/XUjTcmWbIK8xfl7Tacnnib
X-Google-Smtp-Source: APiQypJ50mZfXiS8jB3Qg9LIKuQ8dbDrDNeN6Gl5atEhQk55bCHfpPsCa4MaWDcabTHVIEtu3if/qw==
X-Received: by 2002:a17:90a:1b67:: with SMTP id q94mr3666899pjq.84.1588393826471;
        Fri, 01 May 2020 21:30:26 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com. [147.11.224.80])
        by smtp.gmail.com with ESMTPSA id i128sm3516363pfc.149.2020.05.01.21.30.25
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 May 2020 21:30:26 -0700 (PDT)
From:   Bin Meng <bmeng.cn@gmail.com>
To:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Cc:     Bin Meng <bin.meng@windriver.com>
Subject: [PATCH] m68k: Drop CONFIG_MTD_M25P80 in stmark2_defconfig
Date:   Fri,  1 May 2020 21:30:21 -0700
Message-Id: <1588393821-31886-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

From: Bin Meng <bin.meng@windriver.com>

Drop CONFIG_MTD_M25P80 that was removed in
commit b35b9a10362d ("mtd: spi-nor: Move m25p80 code in spi-nor.c")

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 arch/m68k/configs/stmark2_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/m68k/configs/stmark2_defconfig b/arch/m68k/configs/stmark2_defconfig
index 27fa946..2b746f5 100644
--- a/arch/m68k/configs/stmark2_defconfig
+++ b/arch/m68k/configs/stmark2_defconfig
@@ -48,7 +48,6 @@ CONFIG_MTD_CFI_STAA=y
 CONFIG_MTD_ROM=y
 CONFIG_MTD_COMPLEX_MAPPINGS=y
 CONFIG_MTD_PLATRAM=y
-CONFIG_MTD_M25P80=y
 CONFIG_MTD_SPI_NOR=y
 # CONFIG_INPUT_KEYBOARD is not set
 # CONFIG_INPUT_MOUSE is not set
-- 
2.7.4

