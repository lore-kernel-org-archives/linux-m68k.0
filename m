Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DBBEC433F5
	for <linux-m68k@archiver.kernel.org>; Tue, 26 Oct 2021 17:38:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 674F16103C
	for <linux-m68k@archiver.kernel.org>; Tue, 26 Oct 2021 17:38:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237935AbhJZRlW (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 26 Oct 2021 13:41:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237859AbhJZRlC (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 26 Oct 2021 13:41:02 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D580C061225
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Oct 2021 10:38:31 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id bp7so15868500qkb.12
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Oct 2021 10:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=FsG3RHPa8nzkmCz4CSeN655/fUpHviYuTHJ5x2xYTOE=;
        b=Nv7zndmfXqpwhsOq2NLowimWW7GXaMiu53JP5dVwN954EVlkwz8Tr5cPYXYtNfz9el
         7qCuz1q6GvYhXPA9XnGQpvHpNT8Xm2ez00Y2tsd7QPwzy8Yb8WRIJtGxDs13FKiCCrYi
         bKJKHMRNKJMmpbQFvX53gAR2N80OGOKjb4lJtvxgMjpZpghD1wppVtJDtfvK+64K+jHe
         1DLmdlT1CsnEU1OZ/4acs9rW4LqFqMFvmq71gn/CGPB2YxE/YmR4pGzONGc7nbL0+ZOS
         XjedsHGqI1lXDwrxMOLdqR605kZ5hsLgTKcaPT8lGX+q9E0DPnppSc7vANx+fXrVjfDT
         OaZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FsG3RHPa8nzkmCz4CSeN655/fUpHviYuTHJ5x2xYTOE=;
        b=qHZz78rGEgtIQciI/0WigA6BJgMcFN5RHWXXCOC2uHTYDLrIDYAfahTJ2liXFLJu4V
         fsKZWYIm8q/Do3RTDr9Qkt42ewFTHUdrRDx6c6jvW2ov8MhLOYED+QD0lmDWxJOPMFoz
         i2FxAIAhKjOUuRUr57OViwLbzMB0eMXp8esDc3C8vlDyrPagKjkhT3Abr3uiYmAEcEDf
         ea/tnpVtsoo7ckjvCtly9Ufwkqi0NA1hctMEVVdJkKslVmatYHW7PJxflTxYG+YFknql
         5V79mlGlrJziFDG+/91nLKqm2BTOPbKqSDdAWVqwe1eGfpNfFSGKUG5zvONXVyIrBzmh
         nsEw==
X-Gm-Message-State: AOAM532pQgiKzsQuxwnEcPnhcNMmHSsD7QZ23CVHNZ9cP/henz7XH3zI
        p1fuqskreDKMw+N+YN0n9WiI+g==
X-Google-Smtp-Source: ABdhPJygEpowD8ss7FYI0VOb6OcZJOg1pZj4I7OiYUtzVy+Olxa1jiPdn2NiV4eaUKYhA4IIp0sdog==
X-Received: by 2002:a05:620a:4150:: with SMTP id k16mr20202483qko.357.1635269910751;
        Tue, 26 Oct 2021 10:38:30 -0700 (PDT)
Received: from soleen.c.googlers.com.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id bj37sm11001939qkb.49.2021.10.26.10.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 10:38:30 -0700 (PDT)
From:   Pasha Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org,
        anshuman.khandual@arm.com, willy@infradead.org,
        akpm@linux-foundation.org, william.kucharski@oracle.com,
        mike.kravetz@oracle.com, vbabka@suse.cz, geert@linux-m68k.org,
        schmitzmic@gmail.com, rostedt@goodmis.org, mingo@redhat.com,
        hannes@cmpxchg.org, guro@fb.com, songmuchun@bytedance.com,
        weixugc@google.com, gthelen@google.com
Subject: [RFC 6/8] mm: rename init_page_count() -> page_ref_init()
Date:   Tue, 26 Oct 2021 17:38:20 +0000
Message-Id: <20211026173822.502506-7-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
In-Reply-To: <20211026173822.502506-1-pasha.tatashin@soleen.com>
References: <20211026173822.502506-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Now, that set_page_count() is not called from outside anymore and about
to be removed, init_page_count() is the only function that is going to
be used to unconditionally set _refcount, however it is restricted to set
it only to 1.

Make init_page_count() aligned with the other page_ref_*
functions by renaming it.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 arch/m68k/mm/motorola.c  |  2 +-
 include/linux/mm.h       |  2 +-
 include/linux/page_ref.h | 10 +++++++---
 mm/page_alloc.c          |  2 +-
 4 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
index 9f3f77785aa7..0d016c2e390b 100644
--- a/arch/m68k/mm/motorola.c
+++ b/arch/m68k/mm/motorola.c
@@ -133,7 +133,7 @@ void __init init_pointer_table(void *table, int type)
 
 	/* unreserve the page so it's possible to free that page */
 	__ClearPageReserved(PD_PAGE(dp));
-	init_page_count(PD_PAGE(dp));
+	page_ref_init(PD_PAGE(dp));
 
 	return;
 }
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 73a52aba448f..46a25e6a14b8 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2397,7 +2397,7 @@ extern void reserve_bootmem_region(phys_addr_t start, phys_addr_t end);
 static inline void free_reserved_page(struct page *page)
 {
 	ClearPageReserved(page);
-	init_page_count(page);
+	page_ref_init(page);
 	__free_page(page);
 	adjust_managed_page_count(page, 1);
 }
diff --git a/include/linux/page_ref.h b/include/linux/page_ref.h
index db7ccb461c3e..81a628dc9b8b 100644
--- a/include/linux/page_ref.h
+++ b/include/linux/page_ref.h
@@ -80,10 +80,14 @@ static inline void set_page_count(struct page *page, int v)
 }
 
 /*
- * Setup the page count before being freed into the page allocator for
- * the first time (boot or memory hotplug)
+ * Setup the page refcount to one before being freed into the page allocator.
+ * The memory might not be initialized and therefore there cannot be any
+ * assumptions about the current value of page->_refcount. This call should be
+ * done during boot when memory is being initialized, during memory hotplug
+ * when new memory is added, or when a previous reserved memory is unreserved
+ * this is the first time kernel take control of the given memory.
  */
-static inline void init_page_count(struct page *page)
+static inline void page_ref_init(struct page *page)
 {
 	set_page_count(page, 1);
 }
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 9d18e5f9a85a..fcd4c4ce329b 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1561,7 +1561,7 @@ static void __meminit __init_single_page(struct page *page, unsigned long pfn,
 {
 	mm_zero_struct_page(page);
 	set_page_links(page, zone, nid, pfn);
-	init_page_count(page);
+	page_ref_init(page);
 	page_mapcount_reset(page);
 	page_cpupid_reset_last(page);
 	page_kasan_tag_reset(page);
-- 
2.33.0.1079.g6e70778dc9-goog

