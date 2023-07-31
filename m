Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBF94C001E0
	for <linux-m68k@archiver.kernel.org>; Mon, 31 Jul 2023 17:07:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230509AbjGaRHA (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 31 Jul 2023 13:07:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230342AbjGaRFu (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 31 Jul 2023 13:05:50 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69F2730D5
        for <linux-m68k@lists.linux-m68k.org>; Mon, 31 Jul 2023 10:04:25 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-d124309864dso3747934276.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 31 Jul 2023 10:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690823060; x=1691427860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pBiyp2dfMpzV+NvCt1JbKOh6Ic1GEYp83948mVxRzoc=;
        b=bii0DnnL/zq4pLY7CpjLkMUsgbLkz7gqSGnWBeRCF11X6Ylp3mxYpagQ6993yGA9Tx
         PF2vUUOBG1y7FhGTNnDukjcT3Ipcja9oZIa3sMMxsfLyDTg+j7yc1He0o+q5msktzAqV
         tEhBEj/xq9sJsN95JWUc99ii1gkRP0c7o8rLJ8hSDdwHbsvR56f/IGjyS7Fnu0VAbC0Y
         XK+6J47RwKDDMwgKfIV3AfvnkXmT3IYpyeit/2cro7NXb8YvdXt0tmBkJB7s17jHD/xl
         ll9rO8u6pHah5lpvOsTcALDpgmctRONG81Iwdo4hzXBejIQu1syTEFsJtqvGtUVw0grb
         t9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690823060; x=1691427860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pBiyp2dfMpzV+NvCt1JbKOh6Ic1GEYp83948mVxRzoc=;
        b=WMX9Fa1lkUteGZuAXP0jth2zreHmYdJj+DNSMTIG2Vy3unhxqIhl9vF+5CArIJuFkd
         XckLbwMIo8I0Rs+xgg6hj1/WI/uYlKygCIHwIB7jEtgYamzxm2SzjAFRdNj6ry7Il16i
         X7g4eYJPystTcJGTIxLfiPfpHK5P6BskOYHzKQRA37KIJTwvPii3EFS0UQwzcYPbWWe9
         8pGKIAXZj4zY3yB5MktBQqsId0pYgvaNfG39V5tETXgvq/in/l8Th7LtsDevCwlBuRT7
         yiYAiBvUU/KMxcd7ozWmsLV7ZBPjFORhzUIqpSHa0z6gh90s9YhEOKZf4s4AeLGfaXqs
         7Rzw==
X-Gm-Message-State: ABy/qLaC8pSr1i9MZ++DzUZ/xDU6ICym6TcsTTs/WRDMKs5LlKlpSYP/
        tIfiPc7GjihYz5OdnH33Cfc=
X-Google-Smtp-Source: APBJJlFeS2ogl3m5ezZAcTbxwtfQRoXWWYsAvuudazx+JhR2l/mtz06faRF9RklP+vg5BWBteq8aEQ==
X-Received: by 2002:a25:d18e:0:b0:d07:d88b:4843 with SMTP id i136-20020a25d18e000000b00d07d88b4843mr7628126ybg.20.1690823060256;
        Mon, 31 Jul 2023 10:04:20 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id x31-20020a25ac9f000000b00c832ad2e2eesm2511833ybi.60.2023.07.31.10.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 10:04:20 -0700 (PDT)
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
        kvm@vger.kernel.org, Hugh Dickins <hughd@google.com>,
        "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Mike Rapoport <rppt@kernel.org>
Subject: [PATCH mm-unstable v8 21/31] loongarch: Convert various functions to use ptdescs
Date:   Mon, 31 Jul 2023 10:03:22 -0700
Message-Id: <20230731170332.69404-22-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230731170332.69404-1-vishal.moola@gmail.com>
References: <20230731170332.69404-1-vishal.moola@gmail.com>
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
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/loongarch/include/asm/pgalloc.h | 27 +++++++++++++++------------
 arch/loongarch/mm/pgtable.c          |  7 ++++---
 2 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/arch/loongarch/include/asm/pgalloc.h b/arch/loongarch/include/asm/pgalloc.h
index af1d1e4a6965..23f5b1107246 100644
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
+	pmd = ptdesc_address(ptdesc);
 	pmd_init(pmd);
 	return pmd;
 }
@@ -80,10 +80,13 @@ static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
 static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long address)
 {
 	pud_t *pud;
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL & ~__GFP_HIGHMEM, 0);
 
-	pud = (pud_t *) __get_free_page(GFP_KERNEL);
-	if (pud)
-		pud_init(pud);
+	if (!ptdesc)
+		return NULL;
+	pud = ptdesc_address(ptdesc);
+
+	pud_init(pud);
 	return pud;
 }
 
diff --git a/arch/loongarch/mm/pgtable.c b/arch/loongarch/mm/pgtable.c
index 36a6dc0148ae..5bd102b51f7c 100644
--- a/arch/loongarch/mm/pgtable.c
+++ b/arch/loongarch/mm/pgtable.c
@@ -11,10 +11,11 @@
 
 pgd_t *pgd_alloc(struct mm_struct *mm)
 {
-	pgd_t *ret, *init;
+	pgd_t *init, *ret = NULL;
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL & ~__GFP_HIGHMEM, 0);
 
-	ret = (pgd_t *) __get_free_page(GFP_KERNEL);
-	if (ret) {
+	if (ptdesc) {
+		ret = (pgd_t *)ptdesc_address(ptdesc);
 		init = pgd_offset(&init_mm, 0UL);
 		pgd_init(ret);
 		memcpy(ret + USER_PTRS_PER_PGD, init + USER_PTRS_PER_PGD,
-- 
2.40.1

