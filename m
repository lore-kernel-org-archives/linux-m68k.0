Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E52A5C4332E
	for <linux-m68k@archiver.kernel.org>; Thu, 18 Feb 2021 04:08:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B51D26023B
	for <linux-m68k@archiver.kernel.org>; Thu, 18 Feb 2021 04:08:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230313AbhBREI2 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 17 Feb 2021 23:08:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229953AbhBREHF (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 17 Feb 2021 23:07:05 -0500
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB04BC061225
        for <linux-m68k@lists.linux-m68k.org>; Wed, 17 Feb 2021 20:05:29 -0800 (PST)
Received: by mail-qk1-x72e.google.com with SMTP id v206so979212qkb.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 17 Feb 2021 20:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=auV1FihgL+Hhe6KeCKrfxhfgLAMurMRXz5BY3NK/J34=;
        b=aTN8lBtMBfgtXr1E5UkK1ODJRv0vE/TNJGnP/PvBflL29hUH8Z6lg/2JkNiP62uxC7
         JYRNq3ljbtFtYm2puoe4qidur9uf8FPGXl1EVnYkhVV+xLQYJJTsGp0vsnUxB8HbydCu
         MfHYa0+9dUmIV/Tf9fuDKu7dAsKv+8/ymRi+E+4lSJ+MwCj9vS6D4OmWG2QmnPmlQfHH
         dUHWtF2/qsU+uUafErQTFLj8iz2DgwgCzKHOmVv7C3mO7d4yl+TAFfiIAvbbFlHHMkVy
         RKojnHHs++zXLrCHrwoSvLus0MduZgIydlQYc/8jDNyk2yqX3LsEK36YRhkpwx0N0lRN
         aTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=auV1FihgL+Hhe6KeCKrfxhfgLAMurMRXz5BY3NK/J34=;
        b=OnqVAscHdxlCMQysW/APuZBmBiaZWp2632w3SC31JtCYgNhShumP+BZHqPeUaFNh9L
         v27hLaaP3El3BHBYC9Xh1WzJBgIJdWLv4xlKoXGk98XuArL+pL+tCqEK/opQlBHKV+e9
         jxUNnPpjqj1JXqX+5pS1z7+8gXUzIVBLAL8KxnnOy637ecaAeJsjewTlIgpmMeye9i4y
         vJm69wSqe+KmJ/PAStAsJdLuAP0DZ6QeGy4MDd2+MkStVpEZVVwjh2yf8x3U2iC2cwp1
         Xlr3khlDO0vcfHkO/Y4NOJfsCJWRvQrVe5UreJ8HZtdqnlDCkadGRadbKrTM9PxNb4od
         6n6w==
X-Gm-Message-State: AOAM531UP6jOLcIGX46oM6vi7nHH1MIyg5zHWvGtjf9XmXkvAeeIt61+
        Vc3Uyz5ANnrP2oXrQQM19qk=
X-Google-Smtp-Source: ABdhPJylLFSAFCKQxD+ogvR0tRAyrg0nQlTyagQmOXjvcxoWOP3VHx9Swx8Wtz/fn9p2rbli9lTCcQ==
X-Received: by 2002:a37:445:: with SMTP id 66mr2535679qke.345.1613621128947;
        Wed, 17 Feb 2021 20:05:28 -0800 (PST)
Received: from localhost (d27-96-190-162.evv.wideopenwest.com. [96.27.162.190])
        by smtp.gmail.com with ESMTPSA id o3sm3048179qke.132.2021.02.17.20.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 20:05:28 -0800 (PST)
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
Subject: [PATCH 12/14] lib: add fast path for find_first_*_bit() and find_last_bit()
Date:   Wed, 17 Feb 2021 20:05:10 -0800
Message-Id: <20210218040512.709186-13-yury.norov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210218040512.709186-1-yury.norov@gmail.com>
References: <20210218040512.709186-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Similarly to bitmap functions, users would benefit if we'll handle
a case of small-size bitmaps that fit into a single word.

While here, move the find_last_bit() declaration to bitops/find.h
where other find_*_bit() functions sit.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 include/asm-generic/bitops/find.h | 50 ++++++++++++++++++++++++++++---
 include/linux/bitops.h            | 12 --------
 lib/find_bit.c                    | 12 ++++----
 3 files changed, 52 insertions(+), 22 deletions(-)

diff --git a/include/asm-generic/bitops/find.h b/include/asm-generic/bitops/find.h
index 8bd7a33a889d..3633a37cec38 100644
--- a/include/asm-generic/bitops/find.h
+++ b/include/asm-generic/bitops/find.h
@@ -5,6 +5,9 @@
 extern unsigned long _find_next_bit(const unsigned long *addr1,
 		const unsigned long *addr2, unsigned long nbits,
 		unsigned long start, unsigned long invert, unsigned long le);
+extern unsigned long _find_first_bit(const unsigned long *addr, unsigned long size);
+extern unsigned long _find_first_zero_bit(const unsigned long *addr, unsigned long size);
+extern unsigned long _find_last_bit(const unsigned long *addr, unsigned long size);
 
 #ifndef find_next_bit
 /**
@@ -102,8 +105,17 @@ unsigned long find_next_zero_bit(const unsigned long *addr, unsigned long size,
  * Returns the bit number of the first set bit.
  * If no bits are set, returns @size.
  */
-extern unsigned long find_first_bit(const unsigned long *addr,
-				    unsigned long size);
+static inline
+unsigned long find_first_bit(const unsigned long *addr, unsigned long size)
+{
+	if (SMALL_CONST(size - 1)) {
+		unsigned long val = *addr & BITS_FIRST(size - 1);
+
+		return val ? __ffs(val) : size;
+	}
+
+	return _find_first_bit(addr, size);
+}
 
 /**
  * find_first_zero_bit - find the first cleared bit in a memory region
@@ -113,8 +125,17 @@ extern unsigned long find_first_bit(const unsigned long *addr,
  * Returns the bit number of the first cleared bit.
  * If no bits are zero, returns @size.
  */
-extern unsigned long find_first_zero_bit(const unsigned long *addr,
-					 unsigned long size);
+static inline
+unsigned long find_first_zero_bit(const unsigned long *addr, unsigned long size)
+{
+	if (SMALL_CONST(size - 1)) {
+		unsigned long val = *addr | ~BITS_FIRST(size - 1);
+
+		return val == ~0UL ? size : ffz(val);
+	}
+
+	return _find_first_zero_bit(addr, size);
+}
 #else /* CONFIG_GENERIC_FIND_FIRST_BIT */
 
 #ifndef find_first_bit
@@ -126,6 +147,27 @@ extern unsigned long find_first_zero_bit(const unsigned long *addr,
 
 #endif /* CONFIG_GENERIC_FIND_FIRST_BIT */
 
+#ifndef find_last_bit
+/**
+ * find_last_bit - find the last set bit in a memory region
+ * @addr: The address to start the search at
+ * @size: The number of bits to search
+ *
+ * Returns the bit number of the last set bit, or size.
+ */
+static inline
+unsigned long find_last_bit(const unsigned long *addr, unsigned long size)
+{
+	if (SMALL_CONST(size - 1)) {
+		unsigned long val = *addr & BITS_FIRST(size - 1);
+
+		return val ? __fls(val) : size;
+	}
+
+	return _find_last_bit(addr, size);
+}
+#endif
+
 /**
  * find_next_clump8 - find next 8-bit clump with set bits in a memory region
  * @clump: location to store copy of found clump
diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index a5a48303b0f1..26bf15e6cd35 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -286,17 +286,5 @@ static __always_inline void __assign_bit(long nr, volatile unsigned long *addr,
 })
 #endif
 
-#ifndef find_last_bit
-/**
- * find_last_bit - find the last set bit in a memory region
- * @addr: The address to start the search at
- * @size: The number of bits to search
- *
- * Returns the bit number of the last set bit, or size.
- */
-extern unsigned long find_last_bit(const unsigned long *addr,
-				   unsigned long size);
-#endif
-
 #endif /* __KERNEL__ */
 #endif
diff --git a/lib/find_bit.c b/lib/find_bit.c
index 2470ae390f3c..e2c301d28568 100644
--- a/lib/find_bit.c
+++ b/lib/find_bit.c
@@ -75,7 +75,7 @@ EXPORT_SYMBOL(_find_next_bit);
 /*
  * Find the first set bit in a memory region.
  */
-unsigned long find_first_bit(const unsigned long *addr, unsigned long size)
+unsigned long _find_first_bit(const unsigned long *addr, unsigned long size)
 {
 	unsigned long idx;
 
@@ -86,14 +86,14 @@ unsigned long find_first_bit(const unsigned long *addr, unsigned long size)
 
 	return size;
 }
-EXPORT_SYMBOL(find_first_bit);
+EXPORT_SYMBOL(_find_first_bit);
 #endif
 
 #ifndef find_first_zero_bit
 /*
  * Find the first cleared bit in a memory region.
  */
-unsigned long find_first_zero_bit(const unsigned long *addr, unsigned long size)
+unsigned long _find_first_zero_bit(const unsigned long *addr, unsigned long size)
 {
 	unsigned long idx;
 
@@ -104,11 +104,11 @@ unsigned long find_first_zero_bit(const unsigned long *addr, unsigned long size)
 
 	return size;
 }
-EXPORT_SYMBOL(find_first_zero_bit);
+EXPORT_SYMBOL(_find_first_zero_bit);
 #endif
 
 #ifndef find_last_bit
-unsigned long find_last_bit(const unsigned long *addr, unsigned long size)
+unsigned long _find_last_bit(const unsigned long *addr, unsigned long size)
 {
 	if (size) {
 		unsigned long val = BITS_FIRST_MASK(size - 1);
@@ -124,7 +124,7 @@ unsigned long find_last_bit(const unsigned long *addr, unsigned long size)
 	}
 	return size;
 }
-EXPORT_SYMBOL(find_last_bit);
+EXPORT_SYMBOL(_find_last_bit);
 #endif
 
 unsigned long find_next_clump8(unsigned long *clump, const unsigned long *addr,
-- 
2.25.1

