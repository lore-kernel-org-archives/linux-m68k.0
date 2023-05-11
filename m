Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03B2BC7EE2F
	for <linux-m68k@archiver.kernel.org>; Thu, 11 May 2023 11:59:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237803AbjEKL7z (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 11 May 2023 07:59:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237882AbjEKL7x (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 11 May 2023 07:59:53 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D2BB900A
        for <linux-m68k@lists.linux-m68k.org>; Thu, 11 May 2023 04:59:49 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4efe8b3f3f7so9685694e87.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 11 May 2023 04:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683806387; x=1686398387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hYHNj4xOB3A9+sRrGGyA+CHl8mr8r8wePJEdzxz75NA=;
        b=R4Y4sQ/pkhaXoYZ0Rmd1wl/WLm/7drgJkx1KJxPtPNk0U7/Mys/EiSrRg/aC1csD6H
         9Ih1YKeabZAcuvs/HS424EWEMpleCMYQeT/9LVkHgdtK69kZNs2zwBtMRLphBYzVZ/hs
         aDZyGK/fBqbFH5SMwvxg9nukw0XnauWw2q9+PpZDsge/KbQ2l9ENpY6j04woB9CnctYG
         SPFNfSpIoDlrAPu//AN94SEgou0j1PTsONUBEXvBRqckAwnYGE3ExGqk3OteELdlGjFO
         m/1lITxVQiGV5penGZwLpZYGrjuIrRpYLPFetkUBHAziQ1sTCIuJGSXa/TrJ+B8c4VmB
         RtOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683806387; x=1686398387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hYHNj4xOB3A9+sRrGGyA+CHl8mr8r8wePJEdzxz75NA=;
        b=dB5rxgf/HIJezjcBe5LsE6o1l+N4InBT/qR/kakZzDk3ZQGJJ6OC5vtOx+TIohEbkN
         1lh5Pk5zPMkn6pwP+QK8NDMtCJRMDqohuB8za2cTwuqGlvkvhrjY5W0h/NdJ41oygtbT
         5tpDyDgFMfFCjXrBUCjwJcH256tvWMqRDi1If9FVqbfqO2uJuXMAVTu4H2s0tBRaecmW
         VfUa8oUW5dsGQbHdSyqZ/KCAi/2EIwWJvW5tzJokkuRSDGjRXAjIuMzezYPz80A1zoN0
         +4tmpGizt4yk/cgAkrtZnYWN4xfkPN9uIahfCthj6ZmMWWTGfCBfmqxmJY1U0BwHYtxa
         E7+Q==
X-Gm-Message-State: AC+VfDxEZqUIIfdtIkdOMxqnrR6sLEUnwGJ58smSgCy7X9ucVuG4grEq
        JHIw/a7UNmN+l4AzdQeeR6Q6iA==
X-Google-Smtp-Source: ACHHUZ77sxt7O279jjcWgP97akxP8WNE4SSfCZuV++STuG/v7BFEHGC1ImpffMxABw9Zm5xLGsx0aA==
X-Received: by 2002:a05:6512:48f:b0:4f1:3ca4:a57f with SMTP id v15-20020a056512048f00b004f13ca4a57fmr2625276lfq.54.1683806387473;
        Thu, 11 May 2023 04:59:47 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id f16-20020ac25090000000b004cb23904bd9sm1100841lfm.144.2023.05.11.04.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 04:59:47 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 11 May 2023 13:59:18 +0200
Subject: [PATCH 01/12] fs/proc/kcore.c: Pass a pointer to virt_addr_valid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230503-virt-to-pfn-v6-4-rc1-v1-1-6c4698dcf9c8@linaro.org>
References: <20230503-virt-to-pfn-v6-4-rc1-v1-0-6c4698dcf9c8@linaro.org>
In-Reply-To: <20230503-virt-to-pfn-v6-4-rc1-v1-0-6c4698dcf9c8@linaro.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Vineet Gupta <vgupta@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Greg Ungerer <gerg@linux-m68k.org>
Cc:     linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-snps-arc@lists.infradead.org, linux-fsdevel@vger.kernel.org,
        linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
        linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.1
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The virt_addr_valid() should be passed a pointer, the current
code passing a long unsigned int is just exploiting the
unintentional polymorphism of these calls being implemented
as preprocessor macros.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 fs/proc/kcore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/proc/kcore.c b/fs/proc/kcore.c
index 25b44b303b35..75708c66527f 100644
--- a/fs/proc/kcore.c
+++ b/fs/proc/kcore.c
@@ -199,7 +199,7 @@ kclist_add_private(unsigned long pfn, unsigned long nr_pages, void *arg)
 	ent->addr = (unsigned long)page_to_virt(p);
 	ent->size = nr_pages << PAGE_SHIFT;
 
-	if (!virt_addr_valid(ent->addr))
+	if (!virt_addr_valid((void *)ent->addr))
 		goto free_out;
 
 	/* cut not-mapped area. ....from ppc-32 code. */

-- 
2.34.1

