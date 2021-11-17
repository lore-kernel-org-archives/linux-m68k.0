Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D360C46467
	for <linux-m68k@archiver.kernel.org>; Wed, 17 Nov 2021 01:21:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 21F946323A
	for <linux-m68k@archiver.kernel.org>; Wed, 17 Nov 2021 01:21:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231438AbhKQBYK (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 16 Nov 2021 20:24:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232372AbhKQBYE (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 16 Nov 2021 20:24:04 -0500
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B03B6C061570
        for <linux-m68k@lists.linux-m68k.org>; Tue, 16 Nov 2021 17:21:06 -0800 (PST)
Received: by mail-qv1-xf2f.google.com with SMTP id b11so860440qvm.7
        for <linux-m68k@lists.linux-m68k.org>; Tue, 16 Nov 2021 17:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=J8t8/DAeGEfEe9FXtdVuqeJ/w6uUdirh+zG61soSWRk=;
        b=m7lwyDdY5JEt5J4salxVkCRGEvAo/Xfj1AA1cSCFEEWRHlZasz/HAm8SRcbXNaX2rY
         6u4Mm12NUwmroUqOhPU7o1A3v1aDxV+cH1YLwWtP3pRbUR69S/Ct4FKNWqDl8N3vDKp5
         bRenHIu8lumSyXwNNivwqpG4lLKsVrvl3UKOddfW456KHnTHqXLNFmlF6qjmzrziwvWe
         O5B6rRS8yFgxBHtIdvlihBULfMj0x5IyL5QkU9ITXIDMQ97mGH4n8hqueRCzOjJjpA6Y
         3jlAGFCtEnmpNx+DDA9t35TzThm9F8lQB/QA7v21MONSmO7MoxJAE99JvOKPW6Tgo8NY
         iaEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J8t8/DAeGEfEe9FXtdVuqeJ/w6uUdirh+zG61soSWRk=;
        b=QrHjlEesR/4Bj+BUfQKo5+OlzaYEQRN0nHxCFiy/kS08hb8xL3nHHzLrdKEtNphPYU
         V5GGMObI8tnXYorFZzNXGH1paQtd4a+UVX2IgWBM+Wj1ugxtuMr9MAXZwzA7MX6YW+1o
         +WwXoYYYBAHNsz3LA7xCSfpZqXSK44dS8PZBiGBh1BObMkIsy+3Q1Gl/RJxU0PyEk1sH
         PEOLuFmbNpDvuQ57aLPvgh0br6I7VCo4kAoFwnudWxi6/aJIrPkc/JVPQL/G5pItJkjV
         RSJ7Q2AJ/VC6AJa1W08T0cedQDCYBcTxK9W/XW9Rx9vTh2+eqUSXS3dyxo+tRTXarYpO
         st+A==
X-Gm-Message-State: AOAM531NU5aoo8ta6+lBnMhf+rmmkHf74oQdfqo52tyDeHVRgB3I4eec
        xFdF7ElK/SYHWstxRc3IQYak7w==
X-Google-Smtp-Source: ABdhPJweN0Koe+NSGCchxfIxbPIwK5yv6IUG0vo2LeP7GrAt89KSEBALSQCo8fN7ZP+NoS+MC4ovjA==
X-Received: by 2002:ad4:5c6c:: with SMTP id i12mr51951710qvh.42.1637112065960;
        Tue, 16 Nov 2021 17:21:05 -0800 (PST)
Received: from soleen.c.googlers.com.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id i6sm3482289qti.40.2021.11.16.17.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 17:21:05 -0800 (PST)
From:   Pasha Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org,
        anshuman.khandual@arm.com, willy@infradead.org,
        akpm@linux-foundation.org, william.kucharski@oracle.com,
        mike.kravetz@oracle.com, vbabka@suse.cz, geert@linux-m68k.org,
        schmitzmic@gmail.com, rostedt@goodmis.org, mingo@redhat.com,
        hannes@cmpxchg.org, guro@fb.com, songmuchun@bytedance.com,
        weixugc@google.com, gthelen@google.com, rientjes@google.com,
        pjt@google.com
Subject: [RFC v2 05/10] mm: avoid using set_page_count() when pages are freed into allocator
Date:   Wed, 17 Nov 2021 01:20:54 +0000
Message-Id: <20211117012059.141450-6-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.34.0.rc1.387.gb447b232ab-goog
In-Reply-To: <20211117012059.141450-1-pasha.tatashin@soleen.com>
References: <20211117012059.141450-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

When struct pages are first initialized the page->_refcount field is
set 1. However, later when pages are freed into allocator we set
_refcount to 0 via set_page_count(). Unconditionally resetting
_refcount is dangerous.

Instead use page_ref_dec_return(), and verify that the _refcount is
what is expected.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 mm/page_alloc.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index e8e88111028a..217c0c9fa25b 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1653,6 +1653,7 @@ void __free_pages_core(struct page *page, unsigned int order)
 	unsigned int nr_pages = 1 << order;
 	struct page *p = page;
 	unsigned int loop;
+	int refcnt;
 
 	/*
 	 * When initializing the memmap, __init_single_page() sets the refcount
@@ -1663,10 +1664,12 @@ void __free_pages_core(struct page *page, unsigned int order)
 	for (loop = 0; loop < (nr_pages - 1); loop++, p++) {
 		prefetchw(p + 1);
 		__ClearPageReserved(p);
-		set_page_count(p, 0);
+		refcnt = page_ref_dec_return(p);
+		VM_BUG_ON_PAGE(refcnt, p);
 	}
 	__ClearPageReserved(p);
-	set_page_count(p, 0);
+	refcnt = page_ref_dec_return(p);
+	VM_BUG_ON_PAGE(refcnt, p);
 
 	atomic_long_add(nr_pages, &page_zone(page)->managed_pages);
 
@@ -2238,10 +2241,12 @@ void __init init_cma_reserved_pageblock(struct page *page)
 {
 	unsigned i = pageblock_nr_pages;
 	struct page *p = page;
+	int refcnt;
 
 	do {
 		__ClearPageReserved(p);
-		set_page_count(p, 0);
+		refcnt = page_ref_dec_return(p);
+		VM_BUG_ON_PAGE(refcnt, p);
 	} while (++p, --i);
 
 	set_pageblock_migratetype(page, MIGRATE_CMA);
-- 
2.34.0.rc1.387.gb447b232ab-goog

