Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B4A1CA9EC9
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Jun 2023 21:08:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232662AbjFLVIi (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 12 Jun 2023 17:08:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238929AbjFLVIC (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 12 Jun 2023 17:08:02 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57E5D3A9B
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jun 2023 14:05:13 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-56d2ac0d990so21803047b3.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jun 2023 14:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603912; x=1689195912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EpDrDA23aZZSOuD9ECPgZVlXX9wPcibxiFG6a9Pg6kw=;
        b=YrxPmjxN/Qkfa39Za5HTgq4QQ3f9/zju1xoEkMHY76VWuya44wSbPKtXjzKY3v7sqU
         GBxsM+H0usX0mr3+rL1pflvYDpTa44gJOcWxVcOnDkRvcMNiHbLrpt96vvJ6FNwKJltW
         cMJPyFVQ/eSt9EDvrymbmWnro3jKR5HGdt4l2wI6AjCbDnCnt1cg4A0jjRLl9BCzyZ7N
         VzgyM4qBAMmkmToFHzJWSn2lcW28mUGQcMgbZJj1Lk3UeDxgd0pcGGp9/tqybVBUSS6z
         sfRYAsqcMK0gYJ/10nym3sY5+OJ+ZE83bX/QwPKBvH0660Lco3siIL8/QCwpR8viXQgt
         6rfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603912; x=1689195912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EpDrDA23aZZSOuD9ECPgZVlXX9wPcibxiFG6a9Pg6kw=;
        b=DY2VfD9ZqPZVu/EGBSSWoxzxyEB2Jax7EpR1vckQkUkDd5nqsAH84XC1rTjlY/FHG9
         alJvJUsNx/2kDbLD4HoODYAjUTw2U63kTTN5JDkIAF8BhqIB9aVeJVdihZPiIFi3Gb25
         LbfOo3gv8dBarr+6IL3qDmSo1RRFpofSBLTeVIMsJ1LFZhpn2+nPpd+Gu7a5W016dnb+
         9D+gwqRwPu0PPEZjsiGlIPUpxoOsvjeuLXrrTj9JMPVJQ519P6Bwqc8uGUjhvnbZPvps
         DKaQWhyCCSkiX9KwyWWosMTF7th7EF45SfQAK5gXe0iIoI3F4ManlRxoicVQoLoost2x
         y/Wg==
X-Gm-Message-State: AC+VfDzcmwhwXX+39W7CUF1maLdEjxm5YVYXAj1Q8RzzpxxH14hvLS/D
        PNJqEHWq34M9ZATM6PyK/eU=
X-Google-Smtp-Source: ACHHUZ4rEtwsIJS0u8/qiBl+7RQztIv/50rVsQeASCwgplg4IOIGaQtPyW+cRDHUBMrIJvgIE2xULQ==
X-Received: by 2002:a81:4e4b:0:b0:569:e92f:72a with SMTP id c72-20020a814e4b000000b00569e92f072amr14103246ywb.16.1686603912361;
        Mon, 12 Jun 2023 14:05:12 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 14:05:11 -0700 (PDT)
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
        "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH v4 13/34] mm: Create ptdesc equivalents for pgtable_{pte,pmd}_page_{ctor,dtor}
Date:   Mon, 12 Jun 2023 14:04:02 -0700
Message-Id: <20230612210423.18611-14-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612210423.18611-1-vishal.moola@gmail.com>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Creates pagetable_pte_ctor(), pagetable_pmd_ctor(), pagetable_pte_dtor(),
and pagetable_pmd_dtor() and make the original pgtable
constructor/destructors wrappers.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/mm.h | 56 ++++++++++++++++++++++++++++++++++------------
 1 file changed, 42 insertions(+), 14 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index a1af7983e1bd..dc211c43610b 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2886,20 +2886,34 @@ static inline bool ptlock_init(struct ptdesc *ptdesc) { return true; }
 static inline void ptlock_free(struct ptdesc *ptdesc) {}
 #endif /* USE_SPLIT_PTE_PTLOCKS */
 
-static inline bool pgtable_pte_page_ctor(struct page *page)
+static inline bool pagetable_pte_ctor(struct ptdesc *ptdesc)
 {
-	if (!ptlock_init(page_ptdesc(page)))
+	struct folio *folio = ptdesc_folio(ptdesc);
+
+	if (!ptlock_init(ptdesc))
 		return false;
-	__SetPageTable(page);
-	inc_lruvec_page_state(page, NR_PAGETABLE);
+	__folio_set_table(folio);
+	lruvec_stat_add_folio(folio, NR_PAGETABLE);
 	return true;
 }
 
+static inline bool pgtable_pte_page_ctor(struct page *page)
+{
+	return pagetable_pte_ctor(page_ptdesc(page));
+}
+
+static inline void pagetable_pte_dtor(struct ptdesc *ptdesc)
+{
+	struct folio *folio = ptdesc_folio(ptdesc);
+
+	ptlock_free(ptdesc);
+	__folio_clear_table(folio);
+	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
+}
+
 static inline void pgtable_pte_page_dtor(struct page *page)
 {
-	ptlock_free(page_ptdesc(page));
-	__ClearPageTable(page);
-	dec_lruvec_page_state(page, NR_PAGETABLE);
+	pagetable_pte_dtor(page_ptdesc(page));
 }
 
 #define pte_offset_map_lock(mm, pmd, address, ptlp)	\
@@ -2981,20 +2995,34 @@ static inline spinlock_t *pmd_lock(struct mm_struct *mm, pmd_t *pmd)
 	return ptl;
 }
 
-static inline bool pgtable_pmd_page_ctor(struct page *page)
+static inline bool pagetable_pmd_ctor(struct ptdesc *ptdesc)
 {
-	if (!pmd_ptlock_init(page_ptdesc(page)))
+	struct folio *folio = ptdesc_folio(ptdesc);
+
+	if (!pmd_ptlock_init(ptdesc))
 		return false;
-	__SetPageTable(page);
-	inc_lruvec_page_state(page, NR_PAGETABLE);
+	__folio_set_table(folio);
+	lruvec_stat_add_folio(folio, NR_PAGETABLE);
 	return true;
 }
 
+static inline bool pgtable_pmd_page_ctor(struct page *page)
+{
+	return pagetable_pmd_ctor(page_ptdesc(page));
+}
+
+static inline void pagetable_pmd_dtor(struct ptdesc *ptdesc)
+{
+	struct folio *folio = ptdesc_folio(ptdesc);
+
+	pmd_ptlock_free(ptdesc);
+	__folio_clear_table(folio);
+	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
+}
+
 static inline void pgtable_pmd_page_dtor(struct page *page)
 {
-	pmd_ptlock_free(page_ptdesc(page));
-	__ClearPageTable(page);
-	dec_lruvec_page_state(page, NR_PAGETABLE);
+	pagetable_pmd_dtor(page_ptdesc(page));
 }
 
 /*
-- 
2.40.1

