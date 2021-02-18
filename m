Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDF71C43381
	for <linux-m68k@archiver.kernel.org>; Thu, 18 Feb 2021 04:06:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E5DF6023B
	for <linux-m68k@archiver.kernel.org>; Thu, 18 Feb 2021 04:06:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230258AbhBREGl (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 17 Feb 2021 23:06:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230184AbhBREGj (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 17 Feb 2021 23:06:39 -0500
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D871CC06178B
        for <linux-m68k@lists.linux-m68k.org>; Wed, 17 Feb 2021 20:05:19 -0800 (PST)
Received: by mail-qv1-xf2e.google.com with SMTP id 2so385434qvd.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 17 Feb 2021 20:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JJENUVTTVrzVSsRoDJyoUWRsHsS22gYzvu4pIcEBs2g=;
        b=cNJUvLFqphk0K/lqrq0Qjn312xs1KS/3LK1bGTa2ELl9lD7az5WCGmCXVfKWK+5r7c
         ZtT/USGeWcVn+HKxgmLxPOP6UQFVJa0PNXbaO2nRqBjcowYlIBCFPW+Wm2l9qlhw77u1
         wuWJqmcMjZkG/GtkEqRpgYv3CHz5W1SqXk/E8aHXvVIEqht/2dCNBJo/HaIJgBI3bD8V
         7iyCFP+tN1/YPyLgotriolwMI25DHmzh7EEBv5kFZXhMHrYOaTOA4EyqiED4CbbuCdgB
         rnw6Qc4epf9pIxgL22Qq6Ml0RJxgZXdCSZC3ssNnoYSlLO/wxAIUBmo8ZDv9P2bxhu8o
         eEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JJENUVTTVrzVSsRoDJyoUWRsHsS22gYzvu4pIcEBs2g=;
        b=R6m+BfxbhPXFcN7ka+SjFYNFqooOdZea8cAR5+nrTlBVWtvWbYxBk7AbZtWhDVyNec
         2IMNdCUWreC3v0Zb7kaEFeNESoG752JpzHkwUyPUH70mVYZBr55iENVEYKmb+Njb1dVF
         PbxXcRYUqxb//yExNj+Bd3T0LFigt/SmBjYRhgMZ1pJfQ0wCmiSN5cG9H03xZBzybGlr
         GzPIk0XDFy4tN7j6SJQxE64U4o6BRYzYpD9JDKAk1zYdVSaX9OGizIrO9n5UhaVAS9Lm
         c3dkF+cWsB5v5aytG9f5UPNrv9uHOeTafcFrUPn4Uu21lvLxZLy2aad034oq7ILwpAmH
         jpwQ==
X-Gm-Message-State: AOAM532pKfYwA32vGqtE6C6N7OVK7VI+2dvFdF7grVTwiXt+BWsEgQmH
        kBMdxBTwn48xjxjxySTgqRg=
X-Google-Smtp-Source: ABdhPJy0+QbSdvRColmCZHyYPmh/qO2RwqalAYB5I6htKRTN4sc2ZFQ9tkLgGhBq4G8GGqGf5zkcMg==
X-Received: by 2002:a0c:fb41:: with SMTP id b1mr2589507qvq.26.1613621119021;
        Wed, 17 Feb 2021 20:05:19 -0800 (PST)
Received: from localhost (d27-96-190-162.evv.wideopenwest.com. [96.27.162.190])
        by smtp.gmail.com with ESMTPSA id e92sm2554283qtd.96.2021.02.17.20.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 20:05:18 -0800 (PST)
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
Subject: [PATCH 03/14] arch: rearrange headers inclusion order in asm/bitops for m68k and sh
Date:   Wed, 17 Feb 2021 20:05:01 -0800
Message-Id: <20210218040512.709186-4-yury.norov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210218040512.709186-1-yury.norov@gmail.com>
References: <20210218040512.709186-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

m68k and sh include bitmap/find.h prior to ffs/fls headers. New fast-path
implementation in find.h requires ffs/fls. Reordering the headers inclusion
sequence helps to prevent compile-time implicit-function-declaration error.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/include/asm/bitops.h | 4 ++--
 arch/sh/include/asm/bitops.h   | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/include/asm/bitops.h b/arch/m68k/include/asm/bitops.h
index 10133a968c8e..093590c9e70f 100644
--- a/arch/m68k/include/asm/bitops.h
+++ b/arch/m68k/include/asm/bitops.h
@@ -440,8 +440,6 @@ static inline unsigned long ffz(unsigned long word)
 
 #endif
 
-#include <asm-generic/bitops/find.h>
-
 #ifdef __KERNEL__
 
 #if defined(CONFIG_CPU_HAS_NO_BITFIELDS)
@@ -531,4 +529,6 @@ static inline int __fls(int x)
 #include <asm-generic/bitops/hweight.h>
 #endif /* __KERNEL__ */
 
+#include <asm-generic/bitops/find.h>
+
 #endif /* _M68K_BITOPS_H */
diff --git a/arch/sh/include/asm/bitops.h b/arch/sh/include/asm/bitops.h
index 450b5854d7c6..792bbe1237dc 100644
--- a/arch/sh/include/asm/bitops.h
+++ b/arch/sh/include/asm/bitops.h
@@ -58,7 +58,6 @@ static inline unsigned long __ffs(unsigned long word)
 	return result;
 }
 
-#include <asm-generic/bitops/find.h>
 #include <asm-generic/bitops/ffs.h>
 #include <asm-generic/bitops/hweight.h>
 #include <asm-generic/bitops/lock.h>
@@ -69,4 +68,6 @@ static inline unsigned long __ffs(unsigned long word)
 #include <asm-generic/bitops/__fls.h>
 #include <asm-generic/bitops/fls64.h>
 
+#include <asm-generic/bitops/find.h>
+
 #endif /* __ASM_SH_BITOPS_H */
-- 
2.25.1

