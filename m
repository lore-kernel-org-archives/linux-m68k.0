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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C87EC433E5
	for <linux-m68k@archiver.kernel.org>; Sun, 21 Mar 2021 21:56:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2277861943
	for <linux-m68k@archiver.kernel.org>; Sun, 21 Mar 2021 21:56:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231465AbhCUVzg (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 21 Mar 2021 17:55:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231424AbhCUVzE (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 21 Mar 2021 17:55:04 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E00F3C061574
        for <linux-m68k@lists.linux-m68k.org>; Sun, 21 Mar 2021 14:55:03 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id y5so7193428qkl.9
        for <linux-m68k@lists.linux-m68k.org>; Sun, 21 Mar 2021 14:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NvWIjd4skNqWEETdEjzpZ2tC0PHOwPqhgZwMIfQRVT0=;
        b=gygst6e6OzjxxG0tm7Q6v/mOApXmmwxuNIfrGfeVpdV/RARH0MtRZsfDvBaoT7XDfj
         gNshGuh3j1Nv2UMQCilK/XBXhxiUQxYdWNQMlLYYGqwRDCfRpoL1Y82JFhSP9rEqxWcq
         lnu/R1m9BLLvkOlU1khb0Ro0i6qF3ziw5gHdiKv3dsS7f6F0/jK6Bq80ZZN52UerQnfp
         ilfKSN0yop5uryKIQQ11aV7KbVoBWjrIckuhDZHXo0x7RHqawqseCFdzBkdHOORX633e
         /PG2lhGYOT7jRT5/XWhvuBZc6BzNY5Uox5I3CbqbASEvQqpDBgZwvV1rXMtlCXbfTqKy
         9jKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NvWIjd4skNqWEETdEjzpZ2tC0PHOwPqhgZwMIfQRVT0=;
        b=BS1u073SBN2HH//xAUYQPotJkCSmsiKQyZIDfeee4M27nn5WbTSxHk0t9SBF20NCjZ
         AJKHtaNQTVjXxkakJHZQnaxEUoo5EsNGdAM0AFpwzA+6qm6gJO5CVSHlueJXp8llujHF
         L6J8QKVs6E7W1aS0OKd4S+yfu+o0Z6j+q1KHn3F2nN4FoK4vKy1yKprP3ywYSPIt0NNP
         7JtcTRa+bH7MWR6nX9kbiC0TDVMX2G7bx7EwLMGGS1duZ8LJCTHtWLE4OkZ7TjU/HKbb
         X0doOS+mIeARiTT94Q2iM/OcIiYXcYFTQk2XmlMIF+yXbQdp5fkERCJFXAg5xsZZOmT8
         Cu5Q==
X-Gm-Message-State: AOAM532SEDnXzoqgtWsPQMz/6myDmrIVIjvRhcqfliqt8L5L0EDPTi6j
        WqAv0e742fjmAbcnJvDBP9Q=
X-Google-Smtp-Source: ABdhPJzA+Z7qKEEkJtDFD/IuGE+l6ZW0/peFytdrb6ziic9Si9Z6+O5AIy2+9Vlc8kuFnF6iDWHfdQ==
X-Received: by 2002:a05:620a:1292:: with SMTP id w18mr7991286qki.400.1616363703099;
        Sun, 21 Mar 2021 14:55:03 -0700 (PDT)
Received: from localhost ([76.73.146.210])
        by smtp.gmail.com with ESMTPSA id y1sm9234561qki.9.2021.03.21.14.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 14:55:02 -0700 (PDT)
From:   Yury Norov <yury.norov@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Yury Norov <yury.norov@gmail.com>, linux-m68k@lists.linux-m68k.org,
        linux-arch@vger.kernel.org, linux-sh@vger.kernel.org,
        Alexey Klimov <aklimov@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>, David Sterba <dsterba@suse.com>,
        Dennis Zhou <dennis@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jianpeng Ma <jianpeng.ma@intel.com>,
        Joe Perches <joe@perches.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Rich Felker <dalias@libc.org>,
        Stefano Brivio <sbrivio@redhat.com>,
        Wei Yang <richard.weiyang@linux.alibaba.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [PATCH 03/12] tools: sync BITMAP_LAST_WORD_MASK() macro with the kernel
Date:   Sun, 21 Mar 2021 14:54:48 -0700
Message-Id: <20210321215457.588554-4-yury.norov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210321215457.588554-1-yury.norov@gmail.com>
References: <20210321215457.588554-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Kernel version generates better code.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 tools/include/linux/bitmap.h | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/tools/include/linux/bitmap.h b/tools/include/linux/bitmap.h
index 7cbd23e56d48..4aabc23ec747 100644
--- a/tools/include/linux/bitmap.h
+++ b/tools/include/linux/bitmap.h
@@ -20,12 +20,7 @@ int __bitmap_equal(const unsigned long *bitmap1,
 void bitmap_clear(unsigned long *map, unsigned int start, int len);
 
 #define BITMAP_FIRST_WORD_MASK(start) (~0UL << ((start) & (BITS_PER_LONG - 1)))
-
-#define BITMAP_LAST_WORD_MASK(nbits)					\
-(									\
-	((nbits) % BITS_PER_LONG) ?					\
-		(1UL<<((nbits) % BITS_PER_LONG))-1 : ~0UL		\
-)
+#define BITMAP_LAST_WORD_MASK(nbits) (~0UL >> (-(nbits) & (BITS_PER_LONG - 1)))
 
 #define small_const_nbits(nbits) \
 	(__builtin_constant_p(nbits) && (nbits) <= BITS_PER_LONG)
-- 
2.25.1

