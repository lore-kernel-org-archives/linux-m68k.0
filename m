Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5104EC77B76
	for <linux-m68k@archiver.kernel.org>; Mon, 17 Apr 2023 20:55:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230423AbjDQUzI (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 17 Apr 2023 16:55:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231246AbjDQUxb (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 17 Apr 2023 16:53:31 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69FB583C1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 17 Apr 2023 13:53:20 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id cm18-20020a17090afa1200b0024713adf69dso15385791pjb.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 17 Apr 2023 13:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681764800; x=1684356800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kyicI3UFSJTH3R33HGjLFGEyUDrTPXlIkqJCgIfzdrc=;
        b=DwA2KoT+Gkb+TSG9gl3xh2UjcEOrukpYDh0FxXwVNpDTsL49sodGBFe/MxZJLiffh8
         Okfe4RTRfpJn4SFFKcweRaXMogMu3aLJXW8S0ijOu/y8rquyNOCuhOYqIlMfHtHNwFXl
         0RIVF9f99J773/WS0WxWYyLGFniLvieyUAz5torJ7RwCjhPN4iKRxNqBQLtPHzo1HkHq
         UDiYLsTcdIpx6G4pcrHTW0RLQiAILxALX6WF9BC1qxq+9QtqiExh0N2abkWgWZYyYNmB
         dTtZwe83/hP4XI3Q8dsRpB6pTlzqUQszpTQqyb8BBRRnRiGvSruO77w1spjFd7OVj31k
         rIHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681764800; x=1684356800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kyicI3UFSJTH3R33HGjLFGEyUDrTPXlIkqJCgIfzdrc=;
        b=G22SOAtbPvT7j2oUsRkufUfRgMCJy21SGaSTHX3j3imYkQeoSZLidpf2hOV0mIFJrB
         dpCOSmmzb1QdlB3FhDbooTFgRzgm0NOWHCuLws7vr/v1IXXewuVw8YKzvJh6W3LSoPOd
         W0v0l085MX6B8XHMC45zecLbuMDsDcnV0RZ4qx+NpjNn9FoAecV/1kKe+ZS0n1mICy68
         uLTH7bJXpj7dr3o1IBRlwvb8gPCVBvDZikxVIwhEWa4vzZqSt43/AMGLgIIGh1v9qFXE
         AGKoKMz17UX7Ut/lPiXnjfwhyaciR5NTBvOXXi6IrsfaVHyWazM7UFimR5qNvyLP+DTN
         yfWg==
X-Gm-Message-State: AAQBX9fXJP8rq9Wj1MREBdIfpdF+cXZ5KH5FetHT2THH9VwkaUhQ/6Om
        9ePnTzsuYv4WUFXCUgxWpG8=
X-Google-Smtp-Source: AKy350b8thcmecOoaOKiNwMZgeAazmiEiQ9V6nLrivAsLyOgVvPy05KEMe/JXWQl3cGgcJMZ1iU0KA==
X-Received: by 2002:a17:90b:3848:b0:247:4ad1:f69b with SMTP id nl8-20020a17090b384800b002474ad1f69bmr11748993pjb.26.1681764800112;
        Mon, 17 Apr 2023 13:53:20 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::c139])
        by smtp.googlemail.com with ESMTPSA id h7-20020a17090ac38700b0022335f1dae2sm7609707pjt.22.2023.04.17.13.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 13:53:19 -0700 (PDT)
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
Subject: [PATCH 25/33] mips: Convert various functions to use ptdescs
Date:   Mon, 17 Apr 2023 13:50:40 -0700
Message-Id: <20230417205048.15870-26-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417205048.15870-1-vishal.moola@gmail.com>
References: <20230417205048.15870-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

As part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents, convert various page table functions to use ptdescs.

Some of the functions use the *get*page*() helper functions. Convert
these to use ptdesc_alloc() and ptdesc_address() instead to help
standardize page tables further.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/mips/include/asm/pgalloc.h | 31 +++++++++++++++++--------------
 arch/mips/mm/pgtable.c          |  7 ++++---
 2 files changed, 21 insertions(+), 17 deletions(-)

diff --git a/arch/mips/include/asm/pgalloc.h b/arch/mips/include/asm/pgalloc.h
index f72e737dda21..7f7cc3140b27 100644
--- a/arch/mips/include/asm/pgalloc.h
+++ b/arch/mips/include/asm/pgalloc.h
@@ -51,13 +51,13 @@ extern pgd_t *pgd_alloc(struct mm_struct *mm);
 
 static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
 {
-	free_pages((unsigned long)pgd, PGD_TABLE_ORDER);
+	ptdesc_free(virt_to_ptdesc(pgd));
 }
 
-#define __pte_free_tlb(tlb,pte,address)			\
-do {							\
-	pgtable_pte_page_dtor(pte);			\
-	tlb_remove_page((tlb), pte);			\
+#define __pte_free_tlb(tlb, pte, address)			\
+do {								\
+	ptdesc_pte_dtor(page_ptdesc(pte));			\
+	tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));	\
 } while (0)
 
 #ifndef __PAGETABLE_PMD_FOLDED
@@ -65,18 +65,18 @@ do {							\
 static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
 {
 	pmd_t *pmd;
-	struct page *pg;
+	struct ptdesc *ptdesc;
 
-	pg = alloc_pages(GFP_KERNEL_ACCOUNT, PMD_TABLE_ORDER);
-	if (!pg)
+	ptdesc = ptdesc_alloc(GFP_KERNEL_ACCOUNT, PMD_TABLE_ORDER);
+	if (!ptdesc)
 		return NULL;
 
-	if (!pgtable_pmd_page_ctor(pg)) {
-		__free_pages(pg, PMD_TABLE_ORDER);
+	if (!ptdesc_pmd_ctor(ptdesc)) {
+		ptdesc_free(ptdesc);
 		return NULL;
 	}
 
-	pmd = (pmd_t *)page_address(pg);
+	pmd = (pmd_t *)ptdesc_address(ptdesc);
 	pmd_init(pmd);
 	return pmd;
 }
@@ -90,10 +90,13 @@ static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
 static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long address)
 {
 	pud_t *pud;
+	struct ptdesc *ptdesc = ptdesc_alloc(GFP_KERNEL, PUD_TABLE_ORDER);
 
-	pud = (pud_t *) __get_free_pages(GFP_KERNEL, PUD_TABLE_ORDER);
-	if (pud)
-		pud_init(pud);
+	if (!ptdesc)
+		return NULL;
+	pud = (pud_t *)ptdesc_address(ptdesc);
+
+	pud_init(pud);
 	return pud;
 }
 
diff --git a/arch/mips/mm/pgtable.c b/arch/mips/mm/pgtable.c
index b13314be5d0e..d626db9ac224 100644
--- a/arch/mips/mm/pgtable.c
+++ b/arch/mips/mm/pgtable.c
@@ -10,10 +10,11 @@
 
 pgd_t *pgd_alloc(struct mm_struct *mm)
 {
-	pgd_t *ret, *init;
+	pgd_t *init, *ret = NULL;
+	struct ptdesc *ptdesc = ptdesc_alloc(GFP_KERNEL, PGD_TABLE_ORDER);
 
-	ret = (pgd_t *) __get_free_pages(GFP_KERNEL, PGD_TABLE_ORDER);
-	if (ret) {
+	if (ptdesc) {
+		ret = (pgd_t *) ptdesc_address(ptdesc);
 		init = pgd_offset(&init_mm, 0UL);
 		pgd_init(ret);
 		memcpy(ret + USER_PTRS_PER_PGD, init + USER_PTRS_PER_PGD,
-- 
2.39.2

