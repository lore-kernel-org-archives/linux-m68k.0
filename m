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
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB9C4C43616
	for <linux-m68k@archiver.kernel.org>; Thu,  1 Apr 2021 00:33:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B355A6109F
	for <linux-m68k@archiver.kernel.org>; Thu,  1 Apr 2021 00:33:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233020AbhDAAc3 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 31 Mar 2021 20:32:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232893AbhDAAcA (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 31 Mar 2021 20:32:00 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1FE8C061574
        for <linux-m68k@lists.linux-m68k.org>; Wed, 31 Mar 2021 17:31:59 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id 7so648877qka.7
        for <linux-m68k@lists.linux-m68k.org>; Wed, 31 Mar 2021 17:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GLaToynb34vCY0WsqTIIvNMqMj7JroWGIPG2ZoVyHKE=;
        b=svkDk5mWqO3glvN3JvTdqGbhsPi1i3X4XIYG7cJ3lkcUxRrO56OK5a8GY9lHQ1GFC7
         t1NyPdS1otoqYLAtMg+kil+wqOyRUYljX8ciwBerwR1q/+iUIMl+V+Cv4sOru3GKvmdU
         te23D4roPnb64Hwg+Cz5t8X0QqDN1/yugozifB5rsRiOpfFFPYxVPYwZ1cUlOAQz4qgw
         70wj4PZ0rW3nfeSUKllDAy5LZ6yg2xyJYR3lXPg6mF8DSiE7d5ew4etnMvXBl0FM5gQB
         kQJC2wf+kKUvdflRzsSNmO8hmTvUQC3V0O+CabwXR6rRyF5agZExh/XDQdJEupAjov9M
         Oqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GLaToynb34vCY0WsqTIIvNMqMj7JroWGIPG2ZoVyHKE=;
        b=ECAl67jRx2ZNHDgXO1uQ9pi9HT8k8hDXphXfQHM2sHXGJ1BrqnQwZ9aOwlrK/VXqcS
         O7vDUVawv7kBV034pcdmHI8lSiSM24jomBPnjbIbcvOy40rfR5ypYfhziyCht9IEiW8M
         gfAVhOhnRRQbvsGlyApPlvkbofc222oRvCz9qaOA5q8fcHoNbUPSg6cJ/dTBDbvWuQ0l
         MYPiW6q04LVrrdrNNyG7H59AdIks3uVljMVbGic0ZoTT402/DO/t32/MlfE+64Gljmw3
         6weSokSxsdg9eXAJLa8+z+l7JhnNhbMV9+ssJpo1QZqZuoU4Kg/Xqt6SEiKU6sCr6RK6
         Vhaw==
X-Gm-Message-State: AOAM531nyCAeoLTTpNS0khXVt91O1JS4o2mfiIVzFGjko9mV3wT/srer
        qbHoczlu9rnLyOwKYCcYl4M=
X-Google-Smtp-Source: ABdhPJw97coW5dsJBqtNTv97nAQBCkwgRk5f6eH1cuZ+xulBrprB+U0oPI85rsK+uupFWl2CK1Gsww==
X-Received: by 2002:a37:42cb:: with SMTP id p194mr5536925qka.213.1617237119002;
        Wed, 31 Mar 2021 17:31:59 -0700 (PDT)
Received: from localhost ([207.98.216.60])
        by smtp.gmail.com with ESMTPSA id q125sm2785567qkf.68.2021.03.31.17.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 17:31:58 -0700 (PDT)
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
Subject: [PATCH 03/12] tools: sync BITMAP_LAST_WORD_MASK() macro with the kernel
Date:   Wed, 31 Mar 2021 17:31:44 -0700
Message-Id: <20210401003153.97325-4-yury.norov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401003153.97325-1-yury.norov@gmail.com>
References: <20210401003153.97325-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Kernel version generates better code.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
Acked-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
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

