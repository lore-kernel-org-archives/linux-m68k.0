Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 217A4C7EE33
	for <linux-m68k@archiver.kernel.org>; Tue, 23 May 2023 14:07:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237172AbjEWOHQ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 23 May 2023 10:07:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237123AbjEWOHM (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 23 May 2023 10:07:12 -0400
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8660133
        for <linux-m68k@lists.linux-m68k.org>; Tue, 23 May 2023 07:06:51 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4f3a9ad31dbso6175214e87.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 23 May 2023 07:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684850750; x=1687442750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b/3885L94lN4KFkmIG4KL0Z1VLtyVywWWWjhcZ8AdCI=;
        b=qhdr9VIeHm3TCAUgvcaHfodtBDTuWxK2iXj6V/SQ66zUErdAk9+DCvdLTF4aCd1ETu
         C+ZAXFKiOs20Y/LEEtHSq1dPudVvh6HRokN0i21bR1zIMcVKbUmCrYz24kNjxTLPVXAa
         cFSvLYM8x6ZBwAnEtC4zHJP9yI7e0Y76rr1w29rfD59OhfMtbLcaAZOSrbcUgEQ+zCmx
         caIJ/LOff8nHxBYzP4GFpPBpy1b42pU47PMbeKWiMmKuOjXR5pkLmpUVwA4W9JWmR+b4
         CDnpYKOJa/b0/Br6Vk3EN6ig9EeMV6vmOvhLsCfhbrFKneL3zoOIRn+iLLV6tfwCA1tP
         yGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684850750; x=1687442750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b/3885L94lN4KFkmIG4KL0Z1VLtyVywWWWjhcZ8AdCI=;
        b=ZDNx+3MMKKJ3+8oU1Z/zNdJ5Jlf56U+4235nrkYfqQGpJAFax4tisouj9yZOAVnpi1
         1KFY6Ne5ZFHRaUCx0uH6tU1UEfaQnP5nWrBIFcPNCtBrhTTCXrDyqPlvsnR+12acTAxR
         w5sOYwXfmsg2JtJ9rSKjyguwArJ3WJwZm5s5ULriZiAslRhAq7m+rV2NjirT80BWdxzG
         0+1KuxFoaTzsJxlshraFcgnO17FnAN65GMxbv/lvP8kh2T5INK54Axm8JQGFDgHzGTR/
         eIP2qf4lFTCZ1m6vrcw/EuzG4tEjtgfjmWxBwwFSVPFfaG2kS44d5fo9Q8F5nY0fooFJ
         yXXQ==
X-Gm-Message-State: AC+VfDyjXGWnZrsM48ijjbg5N6q3Guki2Mp1GVr0nPEMVdY02Qk5XC1c
        4nThm9RI1BgDR2CptKguDycESw==
X-Google-Smtp-Source: ACHHUZ7+n7MNuNF1TIH+E5EiaRwyqYEQK1Dut57yCG9qKprwmGVeigy/nhu/aE9P+Jn/qDJ6+UR8bQ==
X-Received: by 2002:ac2:52aa:0:b0:4ef:d6e2:6530 with SMTP id r10-20020ac252aa000000b004efd6e26530mr4123672lfm.37.1684850750175;
        Tue, 23 May 2023 07:05:50 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id h28-20020ac2597c000000b004e9bf853c27sm1346562lfp.70.2023.05.23.07.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 07:05:49 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 23 May 2023 16:05:29 +0200
Subject: [PATCH v3 05/12] cifs: Pass a pointer to virt_to_page()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230503-virt-to-pfn-v6-4-rc1-v3-5-a16c19c03583@linaro.org>
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
        Linus Walleij <linus.walleij@linaro.org>,
        Tom Talpey <tom@talpey.com>
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

Acked-by: Tom Talpey <tom@talpey.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 fs/cifs/smbdirect.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/cifs/smbdirect.c b/fs/cifs/smbdirect.c
index 0362ebd4fa0f..964f07375a8d 100644
--- a/fs/cifs/smbdirect.c
+++ b/fs/cifs/smbdirect.c
@@ -2500,7 +2500,7 @@ static ssize_t smb_extract_kvec_to_rdma(struct iov_iter *iter,
 			if (is_vmalloc_or_module_addr((void *)kaddr))
 				page = vmalloc_to_page((void *)kaddr);
 			else
-				page = virt_to_page(kaddr);
+				page = virt_to_page((void *)kaddr);
 
 			if (!smb_set_sge(rdma, page, off, seg))
 				return -EIO;

-- 
2.34.1

