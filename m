Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBEBBC7EE2E
	for <linux-m68k@archiver.kernel.org>; Tue, 23 May 2023 14:08:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237236AbjEWOIM (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 23 May 2023 10:08:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237169AbjEWOHP (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 23 May 2023 10:07:15 -0400
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC1B61BD
        for <linux-m68k@lists.linux-m68k.org>; Tue, 23 May 2023 07:06:55 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4f122ff663eso8056427e87.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 23 May 2023 07:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684850754; x=1687442754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UDtU5Jqmt1rhTrWGvrFpFNAhujSWuurCg4wxa03/anU=;
        b=HpmD5IFXXBYh79hB/QdHKbKxuFRZSDMi4b5OZGTylI/XbzqUU0nz4W2BvN6yvKss7I
         K1cwCwlsNLZKWtwDIbEgnBIwLeSRk9MusgogzqpLIGkeV6I3IpHf5ZImCV1dO7TmBmQd
         Jxo5lBjORGSyxFQpYfuSMr3vb6XHB27JbLUYvAKRm5hN6Vx2cqGdrc5nBtxembJzIGb+
         XkA5TOH4FTAGjGGX8LhKx2vDYw5pSIfYWUjWXmA8zVjBOfrxf/vDnuKaKLU2/n/3jNel
         W+4yMbxUSUGgrAJBjS8Un11ko0kSEr5ibGVEHRlBzUWYgh4gIdzzchv9ZLkOCYx4CEzT
         1cyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684850754; x=1687442754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UDtU5Jqmt1rhTrWGvrFpFNAhujSWuurCg4wxa03/anU=;
        b=cqYu9FS6zEPIwF06kAbsnxdcw8B4EHf7HnIIb02qwg/0MPulIuqE7zNQBSXJqtnZyb
         UWgT8vlUfIFzokCz4e3DFt4aRnvc1N5syXuwarfNJMZyYFJb1ibmajPJOoiRdFAeZhLk
         zQoVW3Lw8XJucqjJC9wKRWR2EyqH7BL4oxs+8/KwDzSxELi73fujS6l9FXMROCNFFLbR
         JlizIrwjDPsTQGfmyKANq2DFqXmmF1ktsarumIEbiCm/BxYGV7C447ykq32N3j5Q3GMp
         yI+gJb7CjfxsoYGAJ2NfQZol6mzLrkWs1q21hYBMCNahj3cdm5hGWK/f6lQJgmNKN0Kn
         WHjw==
X-Gm-Message-State: AC+VfDxMkW8X5n17I7z7anWg4ltkyP6f02hcdbkVz1vuQomPQ6zhipzw
        pn0L4yxNF9PMxeRTwPIomH3LiA==
X-Google-Smtp-Source: ACHHUZ7lHZmUmrpa6AszHCZQHgR8jjoC1zWdiC0X3jOoWePtInb6ZlpLCgb3B/kHs0cj9MvDG7f8Ew==
X-Received: by 2002:ac2:51a9:0:b0:4f3:b9bc:9d68 with SMTP id f9-20020ac251a9000000b004f3b9bc9d68mr2955818lfk.18.1684850754250;
        Tue, 23 May 2023 07:05:54 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id h28-20020ac2597c000000b004e9bf853c27sm1346562lfp.70.2023.05.23.07.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 07:05:53 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 23 May 2023 16:05:33 +0200
Subject: [PATCH v3 09/12] asm-generic/page.h: Make pfn accessors static
 inlines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230503-virt-to-pfn-v6-4-rc1-v3-9-a16c19c03583@linaro.org>
References: <20230503-virt-to-pfn-v6-4-rc1-v3-0-a16c19c03583@linaro.org>
In-Reply-To: <20230503-virt-to-pfn-v6-4-rc1-v3-0-a16c19c03583@linaro.org>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Vineet Gupta <vgupta@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Greg Ungerer <gerg@linux-m68k.org>
Cc:     linux-mm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org,
        linux-snps-arc@lists.infradead.org, linux-fsdevel@vger.kernel.org,
        linux-cifs@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arch@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.1
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Making virt_to_pfn() a static inline taking a strongly typed
(const void *) makes the contract of a passing a pointer of that
type to the function explicit and exposes any misuse of the
macro virt_to_pfn() acting polymorphic and accepting many types
such as (void *), (unitptr_t) or (unsigned long) as arguments
without warnings.

For symmetry we do the same change for pfn_to_virt.

Immediately define virt_to_pfn and pfn_to_virt to the static
inline after the static inline since this style of defining
functions is used for the generic helpers.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 include/asm-generic/page.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/include/asm-generic/page.h b/include/asm-generic/page.h
index c0be2edeb484..9773582fd96e 100644
--- a/include/asm-generic/page.h
+++ b/include/asm-generic/page.h
@@ -74,8 +74,16 @@ extern unsigned long memory_end;
 #define __va(x) ((void *)((unsigned long) (x)))
 #define __pa(x) ((unsigned long) (x))
 
-#define virt_to_pfn(kaddr)	(__pa(kaddr) >> PAGE_SHIFT)
-#define pfn_to_virt(pfn)	__va((pfn) << PAGE_SHIFT)
+static inline unsigned long virt_to_pfn(const void *kaddr)
+{
+	return __pa(kaddr) >> PAGE_SHIFT;
+}
+#define virt_to_pfn virt_to_pfn
+static inline void *pfn_to_virt(unsigned long pfn)
+{
+	return __va(pfn) << PAGE_SHIFT;
+}
+#define pfn_to_virt pfn_to_virt
 
 #define virt_to_page(addr)	pfn_to_page(virt_to_pfn(addr))
 #define page_to_virt(page)	pfn_to_virt(page_to_pfn(page))

-- 
2.34.1

