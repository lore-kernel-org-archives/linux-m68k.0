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
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0F21C433DB
	for <linux-m68k@archiver.kernel.org>; Thu, 21 Jan 2021 01:47:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C430623788
	for <linux-m68k@archiver.kernel.org>; Thu, 21 Jan 2021 01:47:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731652AbhAUA5H (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 20 Jan 2021 19:57:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392388AbhAUAKV (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 20 Jan 2021 19:10:21 -0500
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DC87C061799
        for <linux-m68k@lists.linux-m68k.org>; Wed, 20 Jan 2021 16:06:43 -0800 (PST)
Received: by mail-qt1-x82e.google.com with SMTP id e17so398404qto.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 20 Jan 2021 16:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EJvVbTcrFXhal00Em+TPrjdhMeNVT/fqvfLLy70dJMA=;
        b=vWXwiNJ+21L5NEAcfTJmnhSL+ca7W/dNzSA0tHOF6ctG1i3z5n4FSbFYnxtaZrR9Kh
         QjVy8Jh2Am8Z92TXHZRypNlqkefGFQtSusL0K++LpxONvZDQo0eFqK0oJ2lEl/45CRM1
         u+pm8Va4XWVGO98mkSD0pse4jEYTHvwGD4OpmsCDndOSgyLTmdLPsYNKy5TQeJKlnZiU
         cOj2LpXcBUQxU9GLNF1y7Ow0FoeuexvQ9aJoIesaEW0rOnSykNBIVw4hcnehcN9f02h3
         4ixz1k+SkNiIJDj6EREawv9zhd17ejqFPmosZtYBPyBNPcps75wadIV5QKB3IX0TgQDW
         n+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EJvVbTcrFXhal00Em+TPrjdhMeNVT/fqvfLLy70dJMA=;
        b=fmXgVOaGGdUKlxphJqlVVeDlxkYi4OdJY/lX7FZkLvWudz1W3+KGu/5K19jg939RqG
         DGn3trXphBY0BH9Y3ZHGO9v/I0YoCiheFuxhun0ZXeThv86/Yxue16nlGSn113foCZJW
         OteEZbIeZcTXuL7ZXO/WQU4QO6LfbMV3k1GpVNCMRmLxgcHzfoIqYwTbkGPr9BHd6fpd
         2Efoqj8ItiNTTWmu+yhZSNV/I3wnk0nzdAUKNAtXmtHJKOQb6a+RilkCEmQwzeiq5e6w
         8/is24X4XB8/3WCFGExWNK9dkhmb/snfJVtnM1h1ntup6sLGnHT3nZayldDQOVlN1fK6
         eO2w==
X-Gm-Message-State: AOAM531K2Mu6vbjX2h/IfEeWeqq18LNw2emNWcgq2ImnaN2o6VUKO966
        34xm2LLBij7p9iJuIWbaSwh1Xo8Q81g7mTwu
X-Google-Smtp-Source: ABdhPJzyA0gTkmmj57pbH5DOx/IkC97OqDS83dP13BmJv9Nnz4vmLR/AQG7HSaZwFjqG70KYKkP4DA==
X-Received: by 2002:ac8:5e83:: with SMTP id r3mr11322397qtx.261.1611187601929;
        Wed, 20 Jan 2021 16:06:41 -0800 (PST)
Received: from localhost (d27-96-190-162.evv.wideopenwest.com. [96.27.162.190])
        by smtp.gmail.com with ESMTPSA id i41sm2421673qtc.33.2021.01.20.16.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 16:06:41 -0800 (PST)
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
        Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [PATCH 5/6] lib: add fast path for find_next_*_bit()
Date:   Wed, 20 Jan 2021 16:06:29 -0800
Message-Id: <20210121000630.371883-6-yury.norov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210121000630.371883-1-yury.norov@gmail.com>
References: <20210121000630.371883-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Similarly to bitmap functions, find_next_*_bit() users will benefit
if we'll handle a case of bitmaps that fit into a single word. In the
very best case, the compiler may replace a function call with a
single ffs or ffz instruction.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 include/asm-generic/bitops/find.h | 39 +++++++++++++++++++++++++++++++
 include/asm-generic/bitops/le.h   | 28 ++++++++++++++++++++++
 2 files changed, 67 insertions(+)

diff --git a/include/asm-generic/bitops/find.h b/include/asm-generic/bitops/find.h
index 7ad70dab8e93..d45096069011 100644
--- a/include/asm-generic/bitops/find.h
+++ b/include/asm-generic/bitops/find.h
@@ -20,6 +20,18 @@ static inline
 unsigned long find_next_bit(const unsigned long *addr, unsigned long size,
 			    unsigned long offset)
 {
+	if (small_const_nbits(size)) {
+		unsigned long val;
+
+		if (unlikely(offset >= size))
+			return size;
+
+		val = *addr & BITMAP_FIRST_WORD_MASK(offset)
+				& BITMAP_LAST_WORD_MASK(size);
+
+		return val ? __ffs(val) : size;
+	}
+
 	return _find_next_bit(addr, NULL, size, offset, 0UL, 0);
 }
 #endif
@@ -40,6 +52,18 @@ unsigned long find_next_and_bit(const unsigned long *addr1,
 		const unsigned long *addr2, unsigned long size,
 		unsigned long offset)
 {
+	if (small_const_nbits(size)) {
+		unsigned long val;
+
+		if (unlikely(offset >= size))
+			return size;
+
+		val = *addr1 & *addr2 & BITMAP_FIRST_WORD_MASK(offset)
+				      & BITMAP_LAST_WORD_MASK(size);
+
+		return val ? __ffs(val) : size;
+	}
+
 	return _find_next_bit(addr1, addr2, size, offset, 0UL, 0);
 }
 #endif
@@ -58,6 +82,21 @@ static inline
 unsigned long find_next_zero_bit(const unsigned long *addr, unsigned long size,
 				 unsigned long offset)
 {
+	if (small_const_nbits(size)) {
+		unsigned long val, idx;
+
+		if (unlikely(offset >= size))
+			return size;
+
+		val = *addr | ~BITMAP_FIRST_WORD_MASK(offset);
+		if (val == ~0UL)
+			return size;
+
+		idx = ffz(val);
+
+		return idx < size ? idx : size;
+	}
+
 	return _find_next_bit(addr, NULL, size, offset, ~0UL, 0);
 }
 #endif
diff --git a/include/asm-generic/bitops/le.h b/include/asm-generic/bitops/le.h
index 4cf44ea16ec0..f4a76d3d145f 100644
--- a/include/asm-generic/bitops/le.h
+++ b/include/asm-generic/bitops/le.h
@@ -5,6 +5,7 @@
 #include <asm/types.h>
 #include <asm/byteorder.h>
 #include <asm-generic/bitops/find.h>
+#include <linux/swab.h>
 
 #if defined(__LITTLE_ENDIAN)
 
@@ -37,6 +38,21 @@ static inline
 unsigned long find_next_zero_bit_le(const void *addr, unsigned
 		long size, unsigned long offset)
 {
+	if (small_const_nbits(size)) {
+		unsigned long val = *(const unsigned long *)addr, idx;
+
+		if (unlikely(offset >= size))
+			return size;
+
+		val = swab(val) | ~BITMAP_FIRST_WORD_MASK(offset);
+		if (val == ~0UL)
+			return size;
+
+		idx = ffz(val);
+
+		return idx < size ? idx : size;
+	}
+
 	return _find_next_bit(addr, NULL, size, offset, ~0UL, 1);
 }
 #endif
@@ -46,6 +62,18 @@ static inline
 unsigned long find_next_bit_le(const void *addr, unsigned
 		long size, unsigned long offset)
 {
+	if (small_const_nbits(size)) {
+		unsigned long val = *(const unsigned long *)addr;
+
+		if (unlikely(offset >= size))
+			return size;
+
+		val = swab(val) & BITMAP_FIRST_WORD_MASK(offset)
+				& BITMAP_LAST_WORD_MASK(size);
+
+		return val ? __ffs(val) : size;
+	}
+
 	return _find_next_bit(addr, NULL, size, offset, 0UL, 1);
 }
 #endif
-- 
2.25.1

