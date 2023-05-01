Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FE95C7EE3A
	for <linux-m68k@archiver.kernel.org>; Mon,  1 May 2023 19:30:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233440AbjEATaJ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 1 May 2023 15:30:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233367AbjEAT3X (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 1 May 2023 15:29:23 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1A542718
        for <linux-m68k@lists.linux-m68k.org>; Mon,  1 May 2023 12:28:57 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1aafa41116fso8341895ad.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 01 May 2023 12:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969328; x=1685561328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHprEtJ9ence/xzqPBz4IJf2z5UW2zl5tMMosQGe/i0=;
        b=PY19zV8eUjDo/XMGG1Fc34r7BzCEZH74vj9MdJuOaMu+i1F5EHabpfUbH5/UkV5r7u
         xDPodd9s+AIKUKlEgX8AIGrVTqPfTCCV19VkI5iB53+1hWJANYdEVCUSRnMghYWfpO7M
         cjlz4mTJKg6lVp3kGic5xzqQRsLBSUE+d02rlXiSiKdYRR/2g0lktCdvpXk87E+WP0bW
         PyWsq2WmVkZLx+/D9I3aZnTNSq5u2Ks8EcfSEB3bP53mV0saqVpK3cKwl8Vm7ptPZTKs
         sMCaD1Y/vK3rtRXkw0c64x6M8sUBtgZ+i4WFX1gLvu6Qtr7y6/c6crVIx9ttRb0VBr94
         CwWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969328; x=1685561328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wHprEtJ9ence/xzqPBz4IJf2z5UW2zl5tMMosQGe/i0=;
        b=HppOBM06qAHWRQfoNwSJzKISdf6HRR8Y+cbd2d1qPAuq6jOuM+zTmq34Apv2g/hz3K
         DJx9CpFBLL0Atzx8KZ3DdSLRycm7kfx1Z9NbA/SR8fQQl8NxikjrIiQeDiSou4DRBSSp
         JaZsIkQa8q/ytBcoQnVdk2+QFIhPLvtGI0pZhi6GG3PLW9jTo5rsB+2z3E1NnwxwrjQR
         VkxNxem5izsKpXQ3WdUTS7mNritDUaCNfq2cOgW2s1AESNlPnY/nAjNM+eqhqbuVSsiJ
         E098c3ie5dV4Rb7wRvbrj3G0SRt1RwiBO/vZ2OhR/6nhWsi6+wnHvOMK1lh+lZXeej0R
         r2FA==
X-Gm-Message-State: AC+VfDy4rx+fygJUcrAnCapskLpUhSZJwYWkVytoamEDzWzdLqOjPEoh
        3pvMtJVNZOX/uZcT1O1DcZ8=
X-Google-Smtp-Source: ACHHUZ7Z//gnFWu5Wh7IVebCi2ECb1TkUFb7V74C+bMLVwpZ6jGbtiv1kPkjLZLQcQGCrs+Dltn26Q==
X-Received: by 2002:a17:902:c745:b0:1a6:6fe3:df91 with SMTP id q5-20020a170902c74500b001a66fe3df91mr11845223plq.50.1682969328214;
        Mon, 01 May 2023 12:28:48 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::9a2c])
        by smtp.googlemail.com with ESMTPSA id u8-20020a170902bf4800b0019c13d032d8sm18175622pls.253.2023.05.01.12.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 12:28:47 -0700 (PDT)
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
Subject: [PATCH v2 10/34] mm: Convert ptlock_init() to use ptdescs
Date:   Mon,  1 May 2023 12:28:05 -0700
Message-Id: <20230501192829.17086-11-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501192829.17086-1-vishal.moola@gmail.com>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

This removes some direct accesses to struct page, working towards
splitting out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/mm.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 044c9f874b47..bbd44f43e375 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2818,7 +2818,7 @@ static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
 	return ptlock_ptr(page_ptdesc(pmd_page(*pmd)));
 }
 
-static inline bool ptlock_init(struct page *page)
+static inline bool ptlock_init(struct ptdesc *ptdesc)
 {
 	/*
 	 * prep_new_page() initialize page->private (and therefore page->ptl)
@@ -2827,10 +2827,10 @@ static inline bool ptlock_init(struct page *page)
 	 * It can happen if arch try to use slab for page table allocation:
 	 * slab code uses page->slab_cache, which share storage with page->ptl.
 	 */
-	VM_BUG_ON_PAGE(*(unsigned long *)&page->ptl, page);
-	if (!ptlock_alloc(page_ptdesc(page)))
+	VM_BUG_ON_PAGE(*(unsigned long *)&ptdesc->ptl, ptdesc_page(ptdesc));
+	if (!ptlock_alloc(ptdesc))
 		return false;
-	spin_lock_init(ptlock_ptr(page_ptdesc(page)));
+	spin_lock_init(ptlock_ptr(ptdesc));
 	return true;
 }
 
@@ -2843,13 +2843,13 @@ static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
 	return &mm->page_table_lock;
 }
 static inline void ptlock_cache_init(void) {}
-static inline bool ptlock_init(struct page *page) { return true; }
+static inline bool ptlock_init(struct ptdesc *ptdesc) { return true; }
 static inline void ptlock_free(struct page *page) {}
 #endif /* USE_SPLIT_PTE_PTLOCKS */
 
 static inline bool pgtable_pte_page_ctor(struct page *page)
 {
-	if (!ptlock_init(page))
+	if (!ptlock_init(page_ptdesc(page)))
 		return false;
 	__SetPageTable(page);
 	inc_lruvec_page_state(page, NR_PAGETABLE);
@@ -2908,7 +2908,7 @@ static inline bool pmd_ptlock_init(struct ptdesc *ptdesc)
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	ptdesc->pmd_huge_pte = NULL;
 #endif
-	return ptlock_init(ptdesc_page(ptdesc));
+	return ptlock_init(ptdesc);
 }
 
 static inline void pmd_ptlock_free(struct page *page)
-- 
2.39.2

