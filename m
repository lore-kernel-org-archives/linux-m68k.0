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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31684C433E9
	for <linux-m68k@archiver.kernel.org>; Sun, 21 Mar 2021 21:56:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 128A361944
	for <linux-m68k@archiver.kernel.org>; Sun, 21 Mar 2021 21:56:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231424AbhCUVzh (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 21 Mar 2021 17:55:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231429AbhCUVzF (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 21 Mar 2021 17:55:05 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0628C061762
        for <linux-m68k@lists.linux-m68k.org>; Sun, 21 Mar 2021 14:55:04 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id g15so8759666qkl.4
        for <linux-m68k@lists.linux-m68k.org>; Sun, 21 Mar 2021 14:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DAuTHkwSalBqH8EpHoooy9z28mwSmA5j1f0I3O8Qj8s=;
        b=aWNdkiyG1pnPbHlRbaAr9/G0mrj2MDD7/dCcLcAXV9sC7zJY4HLC0dO6nZ27EhbdCb
         goDlKHanaXmeLSCYIxXB6QsDjfaEzIPF5lS5mVCa8XUiYnK/zubJ9iuM4DMm3lAOrpVY
         n2Kag4YbXxQwjayeXdN2p+oZ1+Oq2lyK442ZZkrc0qE3ImRn0i+ITtzz7XJ0XBPhXDFf
         CagB4ah28FV4y7H2hc/Jt0VQ0dIAA1VM+OdQDFSCzUjSgwro1nrFlxTN3scPuF7mBgav
         qLt46+O2gFKytRr0xWIio/EJ71kIVaWueIcctkJmTB81xPKUQH7hsfinzStw+4FyySIl
         iLoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DAuTHkwSalBqH8EpHoooy9z28mwSmA5j1f0I3O8Qj8s=;
        b=bAVlu0vVhSrsTIj89Q3Qt77egjkMRSC1j7CTSGAaYDPlCJG00O77Jr0Rk+vj7gwTEZ
         iLNRkJaeVXUW6Zf7iRjX+KOLtUt5RgY5TCvg8Ik+xwKm0v46uI5lAjEXWluizhpjFgTH
         jDm/en1rDRlqvI5Vj58moAXmUF0DpP7PV6K7Vc0R10994i7HtfMSpPcnRuv8Vui33Nsn
         5TPHR3iE3qNqydMMvoTc9yzVBh4gmu90FGaOuTWiYud5/rGA49UyG72iqqDQ7H6w4IDM
         B1TfaKmEIEo725AFB37ipYIrlZkhSi1vy2LUQpwtE2ueztULwQ6xR0QR5QifWZ9VVPqy
         +czQ==
X-Gm-Message-State: AOAM530m7cF7YrgwdgdZP66rQtLJCJcsiBECkeeLvM07v4QHEP4iKTlH
        XbA0cGumwBiZjjYf0D08UAc=
X-Google-Smtp-Source: ABdhPJxv5U9VxhI021Y3roE5aLS9UT0amOR8ySPsbHE9GRgTfrypz9UKZMr6B/vS/YSvcPAEQ71/BA==
X-Received: by 2002:ae9:ee07:: with SMTP id i7mr6920243qkg.233.1616363704020;
        Sun, 21 Mar 2021 14:55:04 -0700 (PDT)
Received: from localhost ([76.73.146.210])
        by smtp.gmail.com with ESMTPSA id v5sm7838933qtq.26.2021.03.21.14.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 14:55:03 -0700 (PDT)
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
Subject: [PATCH 04/12] arch: rearrange headers inclusion order in asm/bitops for m68k and sh
Date:   Sun, 21 Mar 2021 14:54:49 -0700
Message-Id: <20210321215457.588554-5-yury.norov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210321215457.588554-1-yury.norov@gmail.com>
References: <20210321215457.588554-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

m68k and sh include bitmap/{find,le}.h prior to ffs/fls headers. New
fast-path implementation in find.h requires ffs/fls. Reordering the
headers inclusion sequence helps to prevent compile-time implicit
function declaration error.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/include/asm/bitops.h | 6 +++---
 arch/sh/include/asm/bitops.h   | 5 +++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/m68k/include/asm/bitops.h b/arch/m68k/include/asm/bitops.h
index 10133a968c8e..7b414099e5fc 100644
--- a/arch/m68k/include/asm/bitops.h
+++ b/arch/m68k/include/asm/bitops.h
@@ -440,8 +440,6 @@ static inline unsigned long ffz(unsigned long word)
 
 #endif
 
-#include <asm-generic/bitops/find.h>
-
 #ifdef __KERNEL__
 
 #if defined(CONFIG_CPU_HAS_NO_BITFIELDS)
@@ -525,10 +523,12 @@ static inline int __fls(int x)
 #define __clear_bit_unlock	clear_bit_unlock
 
 #include <asm-generic/bitops/ext2-atomic.h>
-#include <asm-generic/bitops/le.h>
 #include <asm-generic/bitops/fls64.h>
 #include <asm-generic/bitops/sched.h>
 #include <asm-generic/bitops/hweight.h>
+#include <asm-generic/bitops/le.h>
 #endif /* __KERNEL__ */
 
+#include <asm-generic/bitops/find.h>
+
 #endif /* _M68K_BITOPS_H */
diff --git a/arch/sh/include/asm/bitops.h b/arch/sh/include/asm/bitops.h
index 450b5854d7c6..3b6c7b5b7ec9 100644
--- a/arch/sh/include/asm/bitops.h
+++ b/arch/sh/include/asm/bitops.h
@@ -58,15 +58,16 @@ static inline unsigned long __ffs(unsigned long word)
 	return result;
 }
 
-#include <asm-generic/bitops/find.h>
 #include <asm-generic/bitops/ffs.h>
 #include <asm-generic/bitops/hweight.h>
 #include <asm-generic/bitops/lock.h>
 #include <asm-generic/bitops/sched.h>
-#include <asm-generic/bitops/le.h>
 #include <asm-generic/bitops/ext2-atomic.h>
 #include <asm-generic/bitops/fls.h>
 #include <asm-generic/bitops/__fls.h>
 #include <asm-generic/bitops/fls64.h>
 
+#include <asm-generic/bitops/le.h>
+#include <asm-generic/bitops/find.h>
+
 #endif /* __ASM_SH_BITOPS_H */
-- 
2.25.1

