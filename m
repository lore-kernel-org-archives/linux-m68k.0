Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E4BC7EE2E
	for <linux-m68k@archiver.kernel.org>; Mon, 22 May 2023 07:01:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232133AbjEVHBq (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 22 May 2023 03:01:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232146AbjEVHBE (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 22 May 2023 03:01:04 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5868AFA
        for <linux-m68k@lists.linux-m68k.org>; Mon, 22 May 2023 00:00:49 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2af316b4515so17193811fa.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 22 May 2023 00:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684738847; x=1687330847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H1mJE8PBb75X4TbUyJXZ6L55Fw+NsuGtTu+nI/l3Cvc=;
        b=FMR+Qlxwuc8HLvz2Un+03lMzADefhZtZYcE4XHeTZEM0NlyayLDLr/ghrIPr4wOfsn
         hd18jrfSt0sSLwyi2R+kpdFTUKZrJ+BZ/C8tqM3Dro15MT0Bz2r43LqkO6JTuURAVyjo
         Hb5ibuaMMZUbyrbu0TGj+c4eZkPKyBY2Q7Hmx1HpmabTY9nj/7nqGyXR7uNb2h4G+5o+
         IbpEDIbdkQb08eN8cpfyD7jW1r5UTuEKzmsjHWQMxcDTMqfGNaZaaT25Z3ATIrIWcChT
         9UniGw6vl1lHpSHdcRd6BKV3duDmePJf14FnN89u8aN1cFzRNUW+g2/WjLxXlTSI3LHB
         9xcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684738847; x=1687330847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H1mJE8PBb75X4TbUyJXZ6L55Fw+NsuGtTu+nI/l3Cvc=;
        b=HNA2ZvYIt3OWL+AzFqoUBzZjOHLYgOCrrui2O5NftKSFgO3zo+pQ9JDHMidGGmHDnD
         O/1nIGS+qsbWjBzhaAGmY/bL7VoAGZmheu3h+p7HSNnZ2CVSS1g16ctxH7du88oepVJg
         bvC7uSN+gvV6m+CH11VympZmqReZCHi7ROL9Qed5szZuod8r/sNzRaIoAASVTk8mWciI
         DV1c+uTpogcIgKUXYXCJLuoRDrXKQBn1UrsbSUP/tZdJ7nXMVmF6560c0a+T+8e2Qtv5
         NacDrSVEyTx3rLu0f3swViTGCCa0oAW4V27QsiUKmWceKYh2GoG4eVvGYvBdEy16tmNL
         1rKA==
X-Gm-Message-State: AC+VfDz3U+Qkmv9ws1PMfp/dq1MN3fdLqppYUOKkaptpPUrWYxS+5BR7
        faC8lhe/BTWaQK4SEtU3fPmivQ==
X-Google-Smtp-Source: ACHHUZ7XAOeJkx3YfYjjDjWz6wE7VkRRqoG7K82VPNW1yh4/nnHy6HvJwsWKnI+O4aT1Pb2S2e5j6A==
X-Received: by 2002:a2e:a40d:0:b0:2a8:a5b8:184a with SMTP id p13-20020a2ea40d000000b002a8a5b8184amr3297249ljn.40.1684738847083;
        Mon, 22 May 2023 00:00:47 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id q4-20020a2e8744000000b002adb98fdf81sm1010187ljj.7.2023.05.22.00.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 00:00:46 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 22 May 2023 09:00:43 +0200
Subject: [PATCH v2 08/12] arm64: vdso: Pass (void *) to virt_to_page()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230503-virt-to-pfn-v6-4-rc1-v2-8-0948d38bddab@linaro.org>
References: <20230503-virt-to-pfn-v6-4-rc1-v2-0-0948d38bddab@linaro.org>
In-Reply-To: <20230503-virt-to-pfn-v6-4-rc1-v2-0-0948d38bddab@linaro.org>
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
        linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
        linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org,
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

