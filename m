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
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBFBBC433DB
	for <linux-m68k@archiver.kernel.org>; Sat, 30 Jan 2021 19:19:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8950464E11
	for <linux-m68k@archiver.kernel.org>; Sat, 30 Jan 2021 19:19:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232462AbhA3TSy (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 30 Jan 2021 14:18:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232453AbhA3TSl (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 30 Jan 2021 14:18:41 -0500
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7746C0617AB
        for <linux-m68k@lists.linux-m68k.org>; Sat, 30 Jan 2021 11:17:31 -0800 (PST)
Received: by mail-qt1-x835.google.com with SMTP id t14so9290982qto.8
        for <linux-m68k@lists.linux-m68k.org>; Sat, 30 Jan 2021 11:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CrAmvRDdAl33DSpHjA5XcZUSXoY21DiogAG2ynD5om4=;
        b=L+wtCVRFdftJyNxjUlUwxHuQlSPoxvr5f2BonNocXlpsvaf/fvDLsiMHi9/7BF3FGR
         fHu6SEBjHfH8sfr/JaSox1NriSUIomGNYee4IpTGDot1p0gKtEWupimgUcsq+szRfhMr
         4SMOqF7Bon6i2dh+bAA7Ysw8t0USZuAuTvkwoY1N37RocgQKZJbyN+AY3IQcBRTc2nsr
         Kix1n0bx94WY/AsEmbZiniBZEhmY+4vCCMIgFPXx89BnBhqxuXW5+pLzQS8OJufuSaCC
         yXaVWiChJiEhRR+u6YLCtcSNTngngB3P++/hy2e4cmyMN21K6Qnmm0CaLPxqVo6m0Ug9
         5+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CrAmvRDdAl33DSpHjA5XcZUSXoY21DiogAG2ynD5om4=;
        b=GzV0j7DmupebNfW1n31tHYSNkoIeZGwBNAjHnMFBFt0bu/nR5zLG5NLQAFh/ml7wBr
         EwIuYvTPQEtyqr6qPUwJP3xtuLWVuWnJAsxCknLDDtWaaHoh91KSlRjosbf9xBgrfvwh
         f3f+m6J7DbFUv0X02KsG2MW5P/UkRo4lI8QIFt6dg3BhoidY+D9//6IK5vbdf3MR76bH
         /Bt4J7jYF6f3Btkq0ttapwzcvh/vinWpQH9ZjmjACuqLxg2KHibHYjQtDN5bNbp/oAIx
         HtIUAiwiJXXQIVQCatOlTaUPaDo0kXL4qSh7ZrO+7iVWU3mvwk5dF5qhhM9JvzQT0Lst
         lbvw==
X-Gm-Message-State: AOAM530K8pKcgrDd26pIV8aMXPn1M7RXRzGyqF7d8aAbUhpXkYp9eHiB
        n0VAjTI6pMlqwwhgtv3rPf8aIPQgrOP3fEzA
X-Google-Smtp-Source: ABdhPJxa36sZmDJPtqezzoP0XV3lQt1JIdIaV55LPu5GsSt6faVQkre3cX+Co4z+sh8UeZZYW8rJww==
X-Received: by 2002:a05:622a:303:: with SMTP id q3mr9077138qtw.235.1612034250704;
        Sat, 30 Jan 2021 11:17:30 -0800 (PST)
Received: from localhost (d27-96-190-162.evv.wideopenwest.com. [96.27.162.190])
        by smtp.gmail.com with ESMTPSA id u65sm9498777qkb.58.2021.01.30.11.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jan 2021 11:17:30 -0800 (PST)
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
Subject: [PATCH 7/8] lib: add fast path for find_next_*_bit()
Date:   Sat, 30 Jan 2021 11:17:18 -0800
Message-Id: <20210130191719.7085-8-yury.norov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210130191719.7085-1-yury.norov@gmail.com>
References: <20210130191719.7085-1-yury.norov@gmail.com>
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
 include/asm-generic/bitops/find.h       | 30 +++++++++++++++++++++++++
 include/asm-generic/bitops/le.h         | 21 +++++++++++++++++
 tools/include/asm-generic/bitops/find.h | 30 +++++++++++++++++++++++++
 3 files changed, 81 insertions(+)

diff --git a/include/asm-generic/bitops/find.h b/include/asm-generic/bitops/find.h
index 7ad70dab8e93..8bd7a33a889d 100644
--- a/include/asm-generic/bitops/find.h
+++ b/include/asm-generic/bitops/find.h
@@ -20,6 +20,16 @@ static inline
 unsigned long find_next_bit(const unsigned long *addr, unsigned long size,
 			    unsigned long offset)
 {
+	if (SMALL_CONST(size - 1)) {
+		unsigned long val;
+
+		if (unlikely(offset >= size))
+			return size;
+
+		val = *addr & GENMASK(size - 1, offset);
+		return val ? __ffs(val) : size;
+	}
+
 	return _find_next_bit(addr, NULL, size, offset, 0UL, 0);
 }
 #endif
@@ -40,6 +50,16 @@ unsigned long find_next_and_bit(const unsigned long *addr1,
 		const unsigned long *addr2, unsigned long size,
 		unsigned long offset)
 {
+	if (SMALL_CONST(size - 1)) {
+		unsigned long val;
+
+		if (unlikely(offset >= size))
+			return size;
+
+		val = *addr1 & *addr2 & GENMASK(size - 1, offset);
+		return val ? __ffs(val) : size;
+	}
+
 	return _find_next_bit(addr1, addr2, size, offset, 0UL, 0);
 }
 #endif
@@ -58,6 +78,16 @@ static inline
 unsigned long find_next_zero_bit(const unsigned long *addr, unsigned long size,
 				 unsigned long offset)
 {
+	if (SMALL_CONST(size - 1)) {
+		unsigned long val;
+
+		if (unlikely(offset >= size))
+			return size;
+
+		val = *addr | ~GENMASK(size - 1, offset);
+		return val == ~0UL ? size : ffz(val);
+	}
+
 	return _find_next_bit(addr, NULL, size, offset, ~0UL, 0);
 }
 #endif
diff --git a/include/asm-generic/bitops/le.h b/include/asm-generic/bitops/le.h
index 21305f6cea0b..18ebcf639d7f 100644
--- a/include/asm-generic/bitops/le.h
+++ b/include/asm-generic/bitops/le.h
@@ -5,6 +5,7 @@
 #include <asm-generic/bitops/find.h>
 #include <asm/types.h>
 #include <asm/byteorder.h>
+#include <linux/swab.h>
 
 #if defined(__LITTLE_ENDIAN)
 
@@ -37,6 +38,16 @@ static inline
 unsigned long find_next_zero_bit_le(const void *addr, unsigned
 		long size, unsigned long offset)
 {
+	if (SMALL_CONST(size)) {
+		unsigned long val = *(const unsigned long *)addr;
+
+		if (unlikely(offset >= size))
+			return size;
+
+		val = swab(val) | ~GENMASK(size - 1, offset);
+		return val == ~0UL ? size : ffz(val);
+	}
+
 	return _find_next_bit(addr, NULL, size, offset, ~0UL, 1);
 }
 #endif
@@ -46,6 +57,16 @@ static inline
 unsigned long find_next_bit_le(const void *addr, unsigned
 		long size, unsigned long offset)
 {
+	if (SMALL_CONST(size)) {
+		unsigned long val = *(const unsigned long *)addr;
+
+		if (unlikely(offset >= size))
+			return size;
+
+		val = swab(val) & GENMASK(size - 1, offset);
+		return val ? __ffs(val) : size;
+	}
+
 	return _find_next_bit(addr, NULL, size, offset, 0UL, 1);
 }
 #endif
diff --git a/tools/include/asm-generic/bitops/find.h b/tools/include/asm-generic/bitops/find.h
index 9fe62d10b084..eff868bd22f8 100644
--- a/tools/include/asm-generic/bitops/find.h
+++ b/tools/include/asm-generic/bitops/find.h
@@ -20,6 +20,16 @@ static inline
 unsigned long find_next_bit(const unsigned long *addr, unsigned long size,
 			    unsigned long offset)
 {
+	if (SMALL_CONST(size - 1)) {
+		unsigned long val;
+
+		if (unlikely(offset >= size))
+			return size;
+
+		val = *addr & GENMASK(size - 1, offset);
+		return val ? __ffs(val) : size;
+	}
+
 	return _find_next_bit(addr, NULL, size, offset, 0UL, 0);
 }
 #endif
@@ -40,6 +50,16 @@ unsigned long find_next_and_bit(const unsigned long *addr1,
 		const unsigned long *addr2, unsigned long size,
 		unsigned long offset)
 {
+	if (SMALL_CONST(size - 1)) {
+		unsigned long val;
+
+		if (unlikely(offset >= size))
+			return size;
+
+		val = *addr1 & *addr2 & GENMASK(size - 1, offset);
+		return val ? __ffs(val) : size;
+	}
+
 	return _find_next_bit(addr1, addr2, size, offset, 0UL, 0);
 }
 #endif
@@ -58,6 +78,16 @@ static inline
 unsigned long find_next_zero_bit(const unsigned long *addr, unsigned long size,
 				 unsigned long offset)
 {
+	if (SMALL_CONST(size - 1)) {
+		unsigned long val;
+
+		if (unlikely(offset >= size))
+			return size;
+
+		val = *addr | ~GENMASK(size - 1, offset);
+		return val == ~0UL ? size : ffz(val);
+	}
+
 	return _find_next_bit(addr, NULL, size, offset, ~0UL, 0);
 }
 #endif
-- 
2.25.1

