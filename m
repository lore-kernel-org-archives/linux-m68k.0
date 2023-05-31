Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FB11C7EE31
	for <linux-m68k@archiver.kernel.org>; Wed, 31 May 2023 21:34:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231229AbjEaVeW (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 31 May 2023 17:34:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231131AbjEaVdZ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 31 May 2023 17:33:25 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E069171E
        for <linux-m68k@lists.linux-m68k.org>; Wed, 31 May 2023 14:32:24 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-565aa2cc428so863687b3.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 31 May 2023 14:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568717; x=1688160717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GKvAry2ucxH/XDx2KcG3A/KGUGQDtp2kelP1IwoS25g=;
        b=Y3FtUHVtc1fwM5WsLpUiDBg6/rzXML83Sf1SpHo45QrbJM4hkZ47EVZ9Jzx+YqMx//
         BHSo5V7SZU5qK6dRGkjND3aVt+qVlirBx9EWbYVMgnm+L6iMxxMix1wZ5PVLi/ijI+Ey
         kjhf04CYPPVWH8GpyPUK1r6JzDlEPiRQAM9NSrBfw3+VwNYXW3xAcUEWGbHBzHelo4Pu
         bF0T8t1NtshEajz0mqHjS6WkCiELQh858kC5qsY7VIk5maPoFZeAKP9V+myVulhgPyK+
         zsaBkoumThJ6EqDdX5m4PI3pGkx/pRFHiZHFkTEVJ/iNtjtCRgnvofJL1HddDTqxb4fu
         tjHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568717; x=1688160717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GKvAry2ucxH/XDx2KcG3A/KGUGQDtp2kelP1IwoS25g=;
        b=Wc+EHRsR6v4DiWgdmsjRNyAUCeldhAr86HuHM6w9RfwpMLkO2Bi0LbN6Pwgx5jM+ej
         3sVEHii/xE3M2pOzMlMhkb/Rhjjorw3i2v+y7a17h3Shc/yRqY3Zqwe4Tu+t4j1OdUR2
         km9VrT2Jvf4muj1Mljuuazc12vZBIJHbDIUi8c7N0witt3D8iawyi906s5wyGDrRlPJZ
         Vaap8DcYgbIqljNqECdFxS6OG7j59N1Dqi08xj6K46GFjyBHlVRmsx38bY7T4JLpfH5K
         bwgmBa/AIkmtK24L3A9StxepTAcZUld+KckHwYmn0UTVYt1mLVi9xKfsOLQFM0F0Id3m
         Uffg==
X-Gm-Message-State: AC+VfDwlDns+l7x82osm5D5Bhm0a10Jgikvm9blCoJilW6oE4APi4vsO
        Z7Z2s7b4s2SkEDcz+ojcriM=
X-Google-Smtp-Source: ACHHUZ4onSH62Fs1UXCoMXHHySj60ubOs649jT/DcV3u5CJS2oOZodlnCpjMB+cFBzv/roEimAjFGg==
X-Received: by 2002:a0d:df10:0:b0:55a:6100:c0e6 with SMTP id i16-20020a0ddf10000000b0055a6100c0e6mr6709224ywe.47.1685568716762;
        Wed, 31 May 2023 14:31:56 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
        by smtp.googlemail.com with ESMTPSA id t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 14:31:56 -0700 (PDT)
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
        "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>
Subject: [PATCH v3 24/34] loongarch: Convert various functions to use ptdescs
Date:   Wed, 31 May 2023 14:30:22 -0700
Message-Id: <20230531213032.25338-25-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230531213032.25338-1-vishal.moola@gmail.com>
References: <20230531213032.25338-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

As part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents, convert various page table functions to use ptdescs.

Some of the functions use the *get*page*() helper functions. Convert
these to use pagetable_alloc() and ptdesc_address() instead to help
standardize page tables further.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/loongarch/include/asm/pgalloc.h | 27 +++++++++++++++------------
 arch/loongarch/mm/pgtable.c          |  7 ++++---
 2 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/arch/loongarch/include/asm/pgalloc.h b/arch/loongarch/include/asm/pgalloc.h
index af1d1e4a6965..5f5afbf1f10c 100644
--- a/arch/loongarch/include/asm/pgalloc.h
+++ b/arch/loongarch/include/asm/pgalloc.h
@@ -45,9 +45,9 @@ extern void pagetable_init(void);
 extern pgd_t *pgd_alloc(struct mm_struct *mm);
 
 #define __pte_free_tlb(tlb, pte, address)			\
-do {							\
-	pgtable_pte_page_dtor(pte);			\
-	tlb_remove_page((tlb), pte);			\
+do {								\
+	pagetable_pte_dtor(page_ptdesc(pte));			\
+	tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));	\
 } while (0)
 
 #ifndef __PAGETABLE_PMD_FOLDED
@@ -55,18 +55,18 @@ do {							\
 static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
 {
 	pmd_t *pmd;
-	struct page *pg;
+	struct ptdesc *ptdesc;
 
-	pg = alloc_page(GFP_KERNEL_ACCOUNT);
-	if (!pg)
+	ptdesc = pagetable_alloc(GFP_KERNEL_ACCOUNT, 0);
+	if (!ptdesc)
 		return NULL;
 
-	if (!pgtable_pmd_page_ctor(pg)) {
-		__free_page(pg);
+	if (!pagetable_pmd_ctor(ptdesc)) {
+		pagetable_free(ptdesc);
 		return NULL;
 	}
 
-	pmd = (pmd_t *)page_address(pg);
+	pmd = (pmd_t *)ptdesc_address(ptdesc);
 	pmd_init(pmd);
 	return pmd;
 }
@@ -80,10 +80,13 @@ static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
 static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long address)
 {
 	pud_t *pud;
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL, 0);
 
-	pud = (pud_t *) __get_free_page(GFP_KERNEL);
-	if (pud)
-		pud_init(pud);
+	if (!ptdesc)
+		return NULL;
+	pud = (pud_t *)ptdesc_address(ptdesc);
+
+	pud_init(pud);
 	return pud;
 }
 
diff --git a/arch/loongarch/mm/pgtable.c b/arch/loongarch/mm/pgtable.c
index 36a6dc0148ae..cdba10ffc0df 100644
--- a/arch/loongarch/mm/pgtable.c
+++ b/arch/loongarch/mm/pgtable.c
@@ -11,10 +11,11 @@
 
 pgd_t *pgd_alloc(struct mm_struct *mm)
 {
-	pgd_t *ret, *init;
+	pgd_t *init, *ret = NULL;
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL, 0);
 
-	ret = (pgd_t *) __get_free_page(GFP_KERNEL);
-	if (ret) {
+	if (ptdesc) {
+		ret = (pgd_t *)ptdesc_address(ptdesc);
 		init = pgd_offset(&init_mm, 0UL);
 		pgd_init(ret);
 		memcpy(ret + USER_PTRS_PER_PGD, init + USER_PTRS_PER_PGD,
-- 
2.40.1

