Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 041ECC7EE23
	for <linux-m68k@archiver.kernel.org>; Tue, 23 May 2023 14:08:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237224AbjEWOIL (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 23 May 2023 10:08:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237155AbjEWOHN (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 23 May 2023 10:07:13 -0400
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E47671B0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 23 May 2023 07:06:54 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4f37b860173so8188989e87.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 23 May 2023 07:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684850753; x=1687442753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H1mJE8PBb75X4TbUyJXZ6L55Fw+NsuGtTu+nI/l3Cvc=;
        b=sZzbi9Or1ecOkZRiN09Yj29Ot8B7LAVjqlaksWa5mtFSaJfhhAjYBQqCbgu39f00zk
         VK7TpV3BWK7N5disTxsUT+9gEJBxOb/ehtepI30IxdIgZOD7ILx03dfX1U9LUlrqnIxN
         o/DfgylSvuaURfgnFTqAlkk4/e/2QTF/i6nSUNEA8A45JrglmfBlJskn+PBcNSxo8Nax
         UjDkj9kSQQAr49/ra9mfVBiByY1gHuy6vLurVvXWcr3GtGvlt7ps8J70oCU3gREuO2Ow
         Oymkav54lF/OR103ZsyoD4QG8gT0MmmztfsSMu7sHfsLZwHZYwfd4ojLRHaLUm/2afXV
         RLGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684850753; x=1687442753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H1mJE8PBb75X4TbUyJXZ6L55Fw+NsuGtTu+nI/l3Cvc=;
        b=Npyag7iOaaKZhxlZZBcOK/GrMyxsCz2am5RPk0wjfmA/rQ5DsSuG86K07oZWHsEWCr
         xQOkwOmm/ZvBLgbvJKU56fVv5WS9rUXQF7SQ5drUKFgr+K+InWexf+JUYPqZeiW3NKml
         R1Hj1vU8vvoJwbwrqbs4OYVYVDWO+k7bGrCqnO1OXfxgPhFXzrFilpH88+NHfaAbUlcr
         a+yjZaEfeioCUxx9WunLTNYT2HkemezD6MkUBT3jCXb/wPqW2rPlwULJ2g2aFeMHOSgm
         iQoGRfE43SNC+UvHVAdXtLMtYBbAWS/lEZw2h44QMUv2afeGfVxI6kBGiPS44maTrqa2
         7jZg==
X-Gm-Message-State: AC+VfDxFa22PI2YQLT1UplFwRQXGB9I8lK7ZI+ZOKchxRCURzoZwtMWR
        BcDmXTOQGw4Xemg7TKKjtv+waQ==
X-Google-Smtp-Source: ACHHUZ7YlzepS19qIlofP4XlSVUTHmMLxnEQ9ww0qjdX5Jh1QQqAhfZ8W2WtZdVOQzfdgWC9DXghfQ==
X-Received: by 2002:ac2:52ad:0:b0:4f3:8263:cfdb with SMTP id r13-20020ac252ad000000b004f38263cfdbmr3539737lfm.50.1684850753268;
        Tue, 23 May 2023 07:05:53 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id h28-20020ac2597c000000b004e9bf853c27sm1346562lfp.70.2023.05.23.07.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 07:05:52 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 23 May 2023 16:05:32 +0200
Subject: [PATCH v3 08/12] arm64: vdso: Pass (void *) to virt_to_page()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230503-virt-to-pfn-v6-4-rc1-v3-8-a16c19c03583@linaro.org>
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

Like the other calls in this function virt_to_page() expects
a pointer, not an integer.

However since many architectures implement virt_to_pfn() as
a macro, this function becomes polymorphic and accepts both a
(unsigned long) and a (void *).

Fix this up with an explicit cast.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm64/kernel/vdso.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/vdso.c b/arch/arm64/kernel/vdso.c
index 0119dc91abb5..d9e1355730ef 100644
--- a/arch/arm64/kernel/vdso.c
+++ b/arch/arm64/kernel/vdso.c
@@ -288,7 +288,7 @@ static int aarch32_alloc_kuser_vdso_page(void)
 
 	memcpy((void *)(vdso_page + 0x1000 - kuser_sz), __kuser_helper_start,
 	       kuser_sz);
-	aarch32_vectors_page = virt_to_page(vdso_page);
+	aarch32_vectors_page = virt_to_page((void *)vdso_page);
 	return 0;
 }
 

-- 
2.34.1

