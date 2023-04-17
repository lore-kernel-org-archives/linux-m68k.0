Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E53A6C77B72
	for <linux-m68k@archiver.kernel.org>; Mon, 17 Apr 2023 20:55:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231324AbjDQUzu (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 17 Apr 2023 16:55:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231320AbjDQUxs (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 17 Apr 2023 16:53:48 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4100059C7
        for <linux-m68k@lists.linux-m68k.org>; Mon, 17 Apr 2023 13:53:26 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id kx14so7224526pjb.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 17 Apr 2023 13:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681764806; x=1684356806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1imWRfaXT28Tln454VWhUpR4BzNKR6UHESFdZqWEUY0=;
        b=bMzg27GqJpInZYbq5g7DlCbGyMQLVTO8/WaIXUjb9+Y1sP2Yg8U4pzTwcvHRDHiFNW
         xnksAVwNdJxrKURy2fgxnULAI227N9ToKvbiocqPRvOKs7RzP8ExmOpSZqrcqZUrdfu0
         Ly3bYv1kY3GNKQVg3ZctvJCnyIezYAOXblSfIzPoK3U4x0lQOFf2Xm+WIvk4tnnJrN+1
         YHPfjXznGMNehBha6m//o8BZSI/Chio1eErrXl3QeUgRmQPwnQk3cvQT2roiB3zkJZil
         tzHED45+1PigKvsFpmle9q7jl79yHSt/NZKlZjrviShfr3b19IL3cewZ6zZfWBjcahF9
         kN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681764806; x=1684356806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1imWRfaXT28Tln454VWhUpR4BzNKR6UHESFdZqWEUY0=;
        b=M9nbskvpGpGvAGjqzDwEO9DPCsOYyX7504zJeKS42LJjXjpYxhK8gvybVgHoZ3Mp73
         IVQNRo1Q3+Wk8Ynms+C9ZVOrLi1xA6VskevZBCRlHW/h5fAHZy+ji/vtLa66xgJ6CaSM
         Jy3OqvfqlS7WmIe5ew1sKDAymsnGhs/hNPus+bIIrpz/Nyht5nvLHoD6flD7JirZw9Ev
         wDOUiyvyyzXAsfYZdHRGcrTWFD78XgSAyeYv5Fnw+9toa17PDW2e6TgBh5xwfAiMW4BK
         Jqov7MYY3vDjR1BOkRkiuNN2z1g0H2U00qv0XFzxxQVQDlSGJpUNn9/fsWH47uG5rwyl
         Vo6w==
X-Gm-Message-State: AAQBX9eRpzS3BLOrbP4Qv4dUJ9a8Tsx6y2GmIhfAorLR+gozGq5Diw+o
        EeOL1+JEdeXFezxrxrFyxUxT2UyM8iBtxQ==
X-Google-Smtp-Source: AKy350Z5+qBQNd0Z/JNfcMKaitdnDjfxbnOB0qE080qoviMZywL0T3VtP+5OcGBInDjHaerFJSFHYg==
X-Received: by 2002:a17:90a:d142:b0:246:5fbb:43bf with SMTP id t2-20020a17090ad14200b002465fbb43bfmr15902207pjw.4.1681764805699;
        Mon, 17 Apr 2023 13:53:25 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::c139])
        by smtp.googlemail.com with ESMTPSA id h7-20020a17090ac38700b0022335f1dae2sm7609707pjt.22.2023.04.17.13.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 13:53:25 -0700 (PDT)
From:   "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>
Cc:     linux-mm@kvack.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-openrisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-um@lists.infradead.org, xen-devel@lists.xenproject.org,
        kvm@vger.kernel.org,
        "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH 29/33] sh: Convert pte_free_tlb() to use ptdescs
Date:   Mon, 17 Apr 2023 13:50:44 -0700
Message-Id: <20230417205048.15870-30-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417205048.15870-1-vishal.moola@gmail.com>
References: <20230417205048.15870-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents. Also cleans up some spacing issues.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/sh/include/asm/pgalloc.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/sh/include/asm/pgalloc.h b/arch/sh/include/asm/pgalloc.h
index a9e98233c4d4..30e1823d2347 100644
--- a/arch/sh/include/asm/pgalloc.h
+++ b/arch/sh/include/asm/pgalloc.h
@@ -31,10 +31,10 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
 	set_pmd(pmd, __pmd((unsigned long)page_address(pte)));
 }
 
-#define __pte_free_tlb(tlb,pte,addr)			\
-do {							\
-	pgtable_pte_page_dtor(pte);			\
-	tlb_remove_page((tlb), (pte));			\
+#define __pte_free_tlb(tlb, pte, addr)				\
+do {								\
+	ptdesc_pte_dtor(page_ptdesc(pte));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #endif /* __ASM_SH_PGALLOC_H */
-- 
2.39.2

