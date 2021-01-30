Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8595FC43381
	for <linux-m68k@archiver.kernel.org>; Sat, 30 Jan 2021 19:18:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E2CD64DE7
	for <linux-m68k@archiver.kernel.org>; Sat, 30 Jan 2021 19:18:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232409AbhA3TS1 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 30 Jan 2021 14:18:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232371AbhA3TSW (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 30 Jan 2021 14:18:22 -0500
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C5CFC0613ED
        for <linux-m68k@lists.linux-m68k.org>; Sat, 30 Jan 2021 11:17:24 -0800 (PST)
Received: by mail-qk1-x72b.google.com with SMTP id a7so12219871qkb.13
        for <linux-m68k@lists.linux-m68k.org>; Sat, 30 Jan 2021 11:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iYiQfFq/A5BR3ytboda9uqIsF/im+3k0MVGIuMp7ujI=;
        b=SWZHt8afF+bUg7hz5AK6ufFfR/vccmv++nacOxTzAUOWuHUzr0NxSRBZ7Nhqv0N/38
         wZFL9lKeCTHsPJiFWQRdv3PQ4q9CCJwbfTBMp33EfZyNA9kKR1NxspUzLVG2FjJ4/5sY
         /eV5UxIjMT6saqoPvlDv6q4y09iP8ysVL+YpPL7ipJf9bySlY5rfFqsozV1CVd6OOupP
         ogFa6HRyZO2UHtiS6ro+YxkKPkgjT7C9o5TCN/pkZ670dvwWf50TuY0i4NhXx/2A9Hwh
         88QRZm6qd8mdiZUDddvd582Qthaqc5245aK8eoJ4R+tuxIZJbZmekNW3ZcXOPUKpp/Es
         45Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iYiQfFq/A5BR3ytboda9uqIsF/im+3k0MVGIuMp7ujI=;
        b=MmewVLyYh56NWED4bfq8ULyS/ar5F38u8PWFcG5MMYE+rmU1o4PG30SCngPj7WSdnR
         d3ag5NhcNtjABpGYHTPY0f2jABmtPAZ6JXFFxCk/WWEHkUaV9yXFF+2yyItRtgnMhvis
         lQc3lpvEA4tFgcYrx4eCZUU+B1JUTI5A+4PetPGTOvVwGb3oXekQKwQ48u9KAVUW7m9M
         S6EzmBiI/bOdkoaJW6fqTJeEtiGhCvX3aE+dRUEC3oX6t2y1Rbo8CKfj5Fo2QVXxo162
         Hbu4XrK7pZD+2VL+Ryib2WAwTWRoAFG9iF6zw3KcKdcjUG949376prRFQJnreUcl9iEt
         XuiQ==
X-Gm-Message-State: AOAM532PlcOvz7eKKtNSDXq41KAOeVhGD9DJpokTJbP5BJ4maIJFGNVO
        zjYBzIkLJJN9UAzeRNWMLYLYUEwUKWqeKKq1
X-Google-Smtp-Source: ABdhPJyhF5sM0r3+bGB/gd20doSeBcG2SJucdkNA81U7bleGmrppTt6Gs7pR5c+MSjB/UgXRTINP7w==
X-Received: by 2002:a37:be04:: with SMTP id o4mr9686463qkf.336.1612034243691;
        Sat, 30 Jan 2021 11:17:23 -0800 (PST)
Received: from localhost (d27-96-190-162.evv.wideopenwest.com. [96.27.162.190])
        by smtp.gmail.com with ESMTPSA id t17sm9130830qtq.57.2021.01.30.11.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jan 2021 11:17:23 -0800 (PST)
From:   Yury Norov <yury.norov@gmail.com>
To:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
Cc:     Yury Norov <yury.norov@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, Arnd Bergmann <arnd@arndb.de>,
        Dennis Zhou <dennis@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        David Sterba <dsterba@suse.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Stefano Brivio <sbrivio@redhat.com>,
        "Ma, Jianpeng" <jianpeng.ma@intel.com>,
        Wei Yang <richard.weiyang@linux.alibaba.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Joe Perches <joe@perches.com>
Subject: [PATCH 1/8] tools: disable -Wno-type-limits
Date:   Sat, 30 Jan 2021 11:17:12 -0800
Message-Id: <20210130191719.7085-2-yury.norov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210130191719.7085-1-yury.norov@gmail.com>
References: <20210130191719.7085-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

GENMASK(h, l) may be passed with unsigned types. In such case,
this warning is generated for example in case GENMASK(h, 0)

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 tools/scripts/Makefile.include | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.include
index 1358e89cdf7d..58bb319624f6 100644
--- a/tools/scripts/Makefile.include
+++ b/tools/scripts/Makefile.include
@@ -38,6 +38,7 @@ EXTRA_WARNINGS += -Wswitch-enum
 EXTRA_WARNINGS += -Wundef
 EXTRA_WARNINGS += -Wwrite-strings
 EXTRA_WARNINGS += -Wformat
+EXTRA_WARNINGS += -Wno-type-limits
 
 CC_NO_CLANG := $(shell $(CC) -dM -E -x c /dev/null | grep -Fq "__clang__"; echo $$?)
 
-- 
2.25.1

