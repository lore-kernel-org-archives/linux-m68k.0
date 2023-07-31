Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAC04C04A94
	for <linux-m68k@archiver.kernel.org>; Mon, 31 Jul 2023 17:04:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229798AbjGaREI (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 31 Jul 2023 13:04:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233793AbjGaRDu (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 31 Jul 2023 13:03:50 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EB641BE5
        for <linux-m68k@lists.linux-m68k.org>; Mon, 31 Jul 2023 10:03:40 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-cfcebc33d04so4865122276.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 31 Jul 2023 10:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690823020; x=1691427820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXYENedStYVsFXpaqy8X3+wmlabVR1q8JHyD5+dxFj0=;
        b=R8qXZOyVQEehD2hSCsZpjQT5/Xf4F/brzByoll1mkB6kHNfXhJ+RcuKFwjYgA2X3Sk
         +7iApdQo4Cg5rRr+JdIoFqDPegtGDiAGRb35thEkDI1bUQUjq4aw+LSTgzrTpSIcmWfL
         bJsnhuf8GiZRZhIc6fFdHQySZ/IskewEUKqkNZ8aYCG1nKX4deKA2DfN9abSC9BVfmNb
         sjmF+khX55fBUw2Vqk+TxqOS6BA3VaGbAlziGVokfw/bjXQRn/YvIXdekpuhXXQ/VglV
         zbi9hIBXyZbJADitdtmejGR4UrX429LImbE9yX5FhLBTl4AmxfHwzr7gnLpRW2zU3ngh
         Rejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690823020; x=1691427820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXYENedStYVsFXpaqy8X3+wmlabVR1q8JHyD5+dxFj0=;
        b=QcgYamb0DQ+Qu0BbreBMpQm0vOUzLMurUaN56IqFq9ynCfHwRFfKztPJDEhBm/AheS
         mQlzw3b6c/Opvn12MinGsnP0hCzKnImxDmN9p7ylv/TryZHcUX6RXmEG46eTzjCBb7zy
         0g+4UXwtc9iN8fm0QuP2QE1KypgBbKakEjWGf70Cgcx3yG4vZ0OnNPKKMWfGUREO5b42
         EJ9HDJzTRgmYNpZ6/6Gyd2riG1Y6t9dgO9APEmRPi4/giWLehej0q3E43N63j779BUL5
         FELLqR5a0BippjfBujJ2A9s0brewi+QpGx5bVv5KnSjqkgFK/vpLZ6njkM+M3oq99s8y
         kMwg==
X-Gm-Message-State: ABy/qLYYoOEa0KRDslcotv0inyxdYOpFVY32hKEgIRh0yCAAZNJV0j2A
        T8Yb8dPD3HJARX5aN4yny5w=
X-Google-Smtp-Source: APBJJlG+a23ZkNAOXVkZypjt9XfAMSGYibV34A8tZ1fqqbfsROXiDspwRbZtJgVYmae4gyEjzVzU0Q==
X-Received: by 2002:a05:6902:18d6:b0:c15:c55d:c26e with SMTP id ck22-20020a05690218d600b00c15c55dc26emr12586459ybb.54.1690823019726;
        Mon, 31 Jul 2023 10:03:39 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id x31-20020a25ac9f000000b00c832ad2e2eesm2511833ybi.60.2023.07.31.10.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 10:03:39 -0700 (PDT)
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
        Mike Rapoport <rppt@kernel.org>
Subject: [PATCH mm-unstable v8 01/31] mm: Add PAGE_TYPE_OP folio functions
Date:   Mon, 31 Jul 2023 10:03:02 -0700
Message-Id: <20230731170332.69404-2-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230731170332.69404-1-vishal.moola@gmail.com>
References: <20230731170332.69404-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

No folio equivalents for page type operations have been defined, so
define them for later folio conversions.

Also changes the Page##uname macros to take in const struct page* since
we only read the memory here.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 include/linux/page-flags.h | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 92a2063a0a23..9218028caf33 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -908,6 +908,8 @@ static inline bool is_page_hwpoison(struct page *page)
 
 #define PageType(page, flag)						\
 	((page->page_type & (PAGE_TYPE_BASE | flag)) == PAGE_TYPE_BASE)
+#define folio_test_type(folio, flag)					\
+	((folio->page.page_type & (PAGE_TYPE_BASE | flag)) == PAGE_TYPE_BASE)
 
 static inline int page_type_has_type(unsigned int page_type)
 {
@@ -919,27 +921,41 @@ static inline int page_has_type(struct page *page)
 	return page_type_has_type(page->page_type);
 }
 
-#define PAGE_TYPE_OPS(uname, lname)					\
-static __always_inline int Page##uname(struct page *page)		\
+#define PAGE_TYPE_OPS(uname, lname, fname)				\
+static __always_inline int Page##uname(const struct page *page)		\
 {									\
 	return PageType(page, PG_##lname);				\
 }									\
+static __always_inline int folio_test_##fname(const struct folio *folio)\
+{									\
+	return folio_test_type(folio, PG_##lname);			\
+}									\
 static __always_inline void __SetPage##uname(struct page *page)		\
 {									\
 	VM_BUG_ON_PAGE(!PageType(page, 0), page);			\
 	page->page_type &= ~PG_##lname;					\
 }									\
+static __always_inline void __folio_set_##fname(struct folio *folio)	\
+{									\
+	VM_BUG_ON_FOLIO(!folio_test_type(folio, 0), folio);		\
+	folio->page.page_type &= ~PG_##lname;				\
+}									\
 static __always_inline void __ClearPage##uname(struct page *page)	\
 {									\
 	VM_BUG_ON_PAGE(!Page##uname(page), page);			\
 	page->page_type |= PG_##lname;					\
-}
+}									\
+static __always_inline void __folio_clear_##fname(struct folio *folio)	\
+{									\
+	VM_BUG_ON_FOLIO(!folio_test_##fname(folio), folio);		\
+	folio->page.page_type |= PG_##lname;				\
+}									\
 
 /*
  * PageBuddy() indicates that the page is free and in the buddy system
  * (see mm/page_alloc.c).
  */
-PAGE_TYPE_OPS(Buddy, buddy)
+PAGE_TYPE_OPS(Buddy, buddy, buddy)
 
 /*
  * PageOffline() indicates that the page is logically offline although the
@@ -963,7 +979,7 @@ PAGE_TYPE_OPS(Buddy, buddy)
  * pages should check PageOffline() and synchronize with such drivers using
  * page_offline_freeze()/page_offline_thaw().
  */
-PAGE_TYPE_OPS(Offline, offline)
+PAGE_TYPE_OPS(Offline, offline, offline)
 
 extern void page_offline_freeze(void);
 extern void page_offline_thaw(void);
@@ -973,12 +989,12 @@ extern void page_offline_end(void);
 /*
  * Marks pages in use as page tables.
  */
-PAGE_TYPE_OPS(Table, table)
+PAGE_TYPE_OPS(Table, table, pgtable)
 
 /*
  * Marks guardpages used with debug_pagealloc.
  */
-PAGE_TYPE_OPS(Guard, guard)
+PAGE_TYPE_OPS(Guard, guard, guard)
 
 extern bool is_free_buddy_page(struct page *page);
 
-- 
2.40.1

