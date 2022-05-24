Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5365DC433EF
	for <linux-m68k@archiver.kernel.org>; Tue, 24 May 2022 07:59:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235046AbiEXH7I (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 24 May 2022 03:59:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235509AbiEXH6z (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 24 May 2022 03:58:55 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4116487A05
        for <linux-m68k@lists.linux-m68k.org>; Tue, 24 May 2022 00:58:54 -0700 (PDT)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 11BFF3F1EB
        for <linux-m68k@lists.linux-m68k.org>; Tue, 24 May 2022 07:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1653379133;
        bh=KqPEz/cb0PgfDboCOUqKrulSScR7EnJ4x+RLTF0OlLc=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=npxNaCP1s5d5QtY4o4enA5b/sj1svKoH/x9xoC7q68Z1Ff7991uBQ7ag8klIBCgO7
         ejoxdTvAeQzPI32fkc79/r0NtqXP7qLUMkEkidboIBt/UJ1eg1sr43RL4PPBXYyp2i
         iYd5HDHbrj63yCQA8bM2JQR8pHUehpoK7QclZjbJAl6QUYfx8UQObj/ejanBTrfhln
         7JOOrrhhZmzEJRsXqoZzSaHG5//9MouPoS13FiMi5BdnUmbqmq9tP53KOr+vlYVu1g
         wL0wH2FGYZO0Zm8QxDG6AGPhI6nwG+nnKHX8HSkTXOJst8Gv/Uh154wewqXkX7z8/p
         Q7VRj9/OEYs5A==
Received: by mail-ed1-f72.google.com with SMTP id p13-20020aa7c4cd000000b0042ab847aba8so12204730edr.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 24 May 2022 00:58:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KqPEz/cb0PgfDboCOUqKrulSScR7EnJ4x+RLTF0OlLc=;
        b=o6Q6nw2L0k9vRulV0HucB+aNBGnfV0HkL2xPKFXD6K774nO3pbC7W+RjGm4y58rGSI
         fGFfk4tZ0QtLQGx6Oi/UM3AHcyOM4ASKlZVJOrQxZxM1QrXSAcb/Zuf47U5Fqd/sS88e
         vSvpuWhyV3tXuehOulzg/eaBOxkmU3utmYgrlcLOndc9ImsY9moOOd07HNZL2AEg/04h
         t8KgyZdJEeuAgfnjUwZOGtFJmHEOCh6mciwyiaiEgGeVwj2Fz5y7w8fNFdBXiHvEITvU
         sjZS6/feoEVOOggv80HdUIuHGzw7pK3/j2tZ84SuWeCRObmGbSZ+GecDa1aFQMt5ysWp
         yIFw==
X-Gm-Message-State: AOAM531nv6wMHaPtlogHxX+oaWsE2XBn8x93rkHLN08d71XkS0kf2F+x
        VLjGZiuaeHNcUqWbdb5IM9mKjO9bNs4Xx5GxnksHZ8HKt/jKuJT0UWQ1WH+P9CmcuBgs7KsPIBm
        +fFCCo7a6znnKcW4PmRGXktd3od2vliaT7FJv6uFTmDhw+g==
X-Received: by 2002:a17:907:60cf:b0:6f4:4240:849 with SMTP id hv15-20020a17090760cf00b006f442400849mr24064770ejc.566.1653379132699;
        Tue, 24 May 2022 00:58:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzab5I+L4D1VCmrKk/hMk+0LVcWlgoH6zQPNB5toxX1/vqvgTzC/mMfYpUMFmZxRqH/bwzTmA==
X-Received: by 2002:a17:907:60cf:b0:6f4:4240:849 with SMTP id hv15-20020a17090760cf00b006f442400849mr24064756ejc.566.1653379132439;
        Tue, 24 May 2022 00:58:52 -0700 (PDT)
Received: from gollum.fritz.box ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id r17-20020a056402019100b0042abf2affebsm9142442edv.67.2022.05.24.00.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 May 2022 00:58:52 -0700 (PDT)
From:   Juerg Haefliger <juerg.haefliger@canonical.com>
X-Google-Original-From: Juerg Haefliger <juergh@canonical.com>
To:     geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org
Cc:     linux-kernel@vger.kernel.org,
        Juerg Haefliger <juergh@canonical.com>
Subject: [PATCH 1/3] m68k: Kconfig.cpu: Fix indentation and add endif comments
Date:   Tue, 24 May 2022 09:58:46 +0200
Message-Id: <20220524075848.21684-2-juergh@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220524075848.21684-1-juergh@canonical.com>
References: <20220524075848.21684-1-juergh@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The convention for indentation seems to be a single tab. Help text is
further indented by an additional two whitespaces. Fix the lines that
violate these rules.

While add it, add missing trailing endif comments and squeeze multiple
empty lines.

Signed-off-by: Juerg Haefliger <juergh@canonical.com>
---
 arch/m68k/Kconfig.cpu | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index 16ea9a67723c..6f2ec6f07897 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -155,7 +155,7 @@ config M520x
 	select COLDFIRE_PIT_TIMER
 	select HAVE_CACHE_SPLIT
 	help
-	   Freescale Coldfire 5207/5208 processor support.
+	  Freescale Coldfire 5207/5208 processor support.
 
 config M523x
 	bool "MCF523x"
@@ -322,7 +322,6 @@ config COLDFIRE_SLTIMERS
 
 endif # COLDFIRE
 
-
 comment "Processor Specific Options"
 
 config M68KFPU_EMU
@@ -522,7 +521,7 @@ config CACHE_BOTH
 	  Split the ColdFire CPU cache, and use half as an instruction cache
 	  and half as a data cache.
 endchoice
-endif
+endif # HAVE_CACHE_SPLIT
 
 if HAVE_CACHE_CB
 choice
@@ -539,4 +538,4 @@ config CACHE_COPYBACK
 	help
 	  The ColdFire CPU cache is set into Copy-back mode.
 endchoice
-endif
+endif # HAVE_CACHE_CB
-- 
2.32.0

