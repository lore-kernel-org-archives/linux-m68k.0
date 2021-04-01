Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 221FAC43618
	for <linux-m68k@archiver.kernel.org>; Thu,  1 Apr 2021 00:33:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 05D6461055
	for <linux-m68k@archiver.kernel.org>; Thu,  1 Apr 2021 00:33:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232903AbhDAAce (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 31 Mar 2021 20:32:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232944AbhDAAcC (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 31 Mar 2021 20:32:02 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40368C061574
        for <linux-m68k@lists.linux-m68k.org>; Wed, 31 Mar 2021 17:32:02 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id 1so396744qtb.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 31 Mar 2021 17:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HxiIrO7CcOWW+YKPCypAlUNqNdBbXqeX5zuWqSw+DMQ=;
        b=mG22wbdhb7xF2gheTlnlQSG5RK/t7zmbLSOc/ZGUjVeU41jGunxWNr7iwBIa/Vs0LN
         rl3FtoUPOWAo0h3PgE7AQX3+Rm7TLAlYxueffRx70dxy9b0w8VcQ2AFVGSIYlhWhlsRU
         64cQLNksvFeag4Xj9uN+Su4AawXhKWG090Ey+v/zablanyWTP+h9VwzkXjEm8mC/mDNI
         blwvi3jx2o4eds0/zY58cUh2xechNeZ0eyBO0DEAOAgHTOwMZAekKeNn7wdk6QYocaz7
         o32AOtGrp2NgFIjyrjY6XCm/C2a3zhhHR87nRREoYOYODOE2Gbm1e6eVaj4aECIvvvrV
         kmTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HxiIrO7CcOWW+YKPCypAlUNqNdBbXqeX5zuWqSw+DMQ=;
        b=achIP9wkT/9uxjob6n5YZwGRb+2UpaG691AmeD2nRgK3FG65phIHI8jA1+Q4mjNumm
         zbc3Bkox0hBpzYrQ6F3DQvc6Hi7FKZAypLYt3xzkTRX4CBEifalbnDjaLvLdU4tJ9Y49
         fJ5qsHukgkHGoTMecQiFDKdJynpht45rUbTG1KTnzI/SbzUlYo6+TtsxnX4agOYMWPZN
         6you8UubFkd5M/0LLs3GtMDkh00OhBSROC8gM/gdmN6kgGmFvoufeIcV+CiORlP0kMV6
         N4uxqEEaMrTzLsfArZE3zJGP/ZnoInhRxAmnZwzhoPOJWgibh2Hh7tdx/eJ+EgoUGnto
         S3uQ==
X-Gm-Message-State: AOAM533JRtMrKSeY+lib78uVf9MYpWkkATDqUT2aXifBsr+WJ6125fxM
        SyxGXQAmDoH4jhLEbNcNBFc=
X-Google-Smtp-Source: ABdhPJyuML+5m6sZfTOHCEwaS3AisYfUUeplssl0OLCVb/nzAAAje0xruiT+nYwBMs7QCiRxzqfGvw==
X-Received: by 2002:ac8:58cb:: with SMTP id u11mr4932645qta.348.1617237121389;
        Wed, 31 Mar 2021 17:32:01 -0700 (PDT)
Received: from localhost ([207.98.216.60])
        by smtp.gmail.com with ESMTPSA id v7sm2297774qtw.51.2021.03.31.17.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 17:32:01 -0700 (PDT)
From:   Yury Norov <yury.norov@gmail.com>
To:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Yury Norov <yury.norov@gmail.com>, linux-m68k@lists.linux-m68k.org,
        linux-arch@vger.kernel.org, linux-sh@vger.kernel.org,
        Alexey Klimov <aklimov@redhat.com>,
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
Subject: [PATCH 05/12] lib: extend the scope of small_const_nbits() macro
Date:   Wed, 31 Mar 2021 17:31:46 -0700
Message-Id: <20210401003153.97325-6-yury.norov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401003153.97325-1-yury.norov@gmail.com>
References: <20210401003153.97325-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

find_bit would also benefit from small_const_nbits() optimizations.
The detailed comment is provided by Rasmus Villemoes.

Suggested-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Signed-off-by: Yury Norov <yury.norov@gmail.com>
Acked-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 include/asm-generic/bitsperlong.h | 12 ++++++++++++
 include/linux/bitmap.h            |  8 --------
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/include/asm-generic/bitsperlong.h b/include/asm-generic/bitsperlong.h
index 3905c1c93dc2..1023e2a4bd37 100644
--- a/include/asm-generic/bitsperlong.h
+++ b/include/asm-generic/bitsperlong.h
@@ -23,4 +23,16 @@
 #define BITS_PER_LONG_LONG 64
 #endif
 
+/*
+ * small_const_nbits(n) is true precisely when it is known at compile-time
+ * that BITMAP_SIZE(n) is 1, i.e. 1 <= n <= BITS_PER_LONG. This allows
+ * various bit/bitmap APIs to provide a fast inline implementation. Bitmaps
+ * of size 0 are very rare, and a compile-time-known-size 0 is most likely
+ * a sign of error. They will be handled correctly by the bit/bitmap APIs,
+ * but using the out-of-line functions, so that the inline implementations
+ * can unconditionally dereference the pointer(s).
+ */
+#define small_const_nbits(nbits) \
+	(__builtin_constant_p(nbits) && (nbits) <= BITS_PER_LONG && (nbits) > 0)
+
 #endif /* __ASM_GENERIC_BITS_PER_LONG */
diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
index 2cb1d7cfe8f9..a36cfcec4e77 100644
--- a/include/linux/bitmap.h
+++ b/include/linux/bitmap.h
@@ -230,14 +230,6 @@ int bitmap_print_to_pagebuf(bool list, char *buf,
 #define BITMAP_FIRST_WORD_MASK(start) (~0UL << ((start) & (BITS_PER_LONG - 1)))
 #define BITMAP_LAST_WORD_MASK(nbits) (~0UL >> (-(nbits) & (BITS_PER_LONG - 1)))
 
-/*
- * The static inlines below do not handle constant nbits==0 correctly,
- * so make such users (should any ever turn up) call the out-of-line
- * versions.
- */
-#define small_const_nbits(nbits) \
-	(__builtin_constant_p(nbits) && (nbits) <= BITS_PER_LONG && (nbits) > 0)
-
 static inline void bitmap_zero(unsigned long *dst, unsigned int nbits)
 {
 	unsigned int len = BITS_TO_LONGS(nbits) * sizeof(unsigned long);
-- 
2.25.1

