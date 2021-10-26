Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 726D7C433F5
	for <linux-m68k@archiver.kernel.org>; Tue, 26 Oct 2021 17:38:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5BAA96103C
	for <linux-m68k@archiver.kernel.org>; Tue, 26 Oct 2021 17:38:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237845AbhJZRlE (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 26 Oct 2021 13:41:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237844AbhJZRky (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 26 Oct 2021 13:40:54 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94681C061224
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Oct 2021 10:38:30 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id w2so16599qtn.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Oct 2021 10:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NtsmbIV7d7zHsfeH2swrf3uQXR/7d3oxwiABUKv37gE=;
        b=PNV2XjJVxfXiWSL/tW8PwiWtR53RywlW1cPArNMtx+L/Wf1vtLvbcRfwXNq8iigtmF
         0Ptzle5Oxy3TJccLaUNjqNcJAdOfvgeiZp0MzvZc3G8KohHo/VcPzjODLJx9o9kU/6cX
         GEULhx2Qx0G6F0zgk5YZdLlLLVBpM46DILOs4Xs2fAwaS0fiA5OBvXXrk29N7BMPRklt
         55/AXI++VDHFF17oDDqnobsBMethvmOiV9b4iQbVZl3YnCeFa9nI3XnITsGID9Ki1gP0
         866kW/ymqEYJwdxfD/RQL2NLzj7kKA2duuENsqob/TJ/sveDbLA8v1PgCxyNMzEsUUtN
         DE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NtsmbIV7d7zHsfeH2swrf3uQXR/7d3oxwiABUKv37gE=;
        b=R+xq/Fd7oBppbJFvcj2N067et8Pzgh5c2O77c6pWAlbGeBhUd7UJYwSoc9gQqh4ivb
         FJW+e2U/jfGQjm+HmhiAnwLi5flo5s/Uiheqi10VcRzMZfmPT3T3ggWZbG1Ai653EDLY
         abdoXO1+awkxA+jGoiBHSNs8p9w99N2/SLzARoDGdlqmMzsfe9qW5Fk9c3iOw3tRbYfg
         vIPCuHkdPk1EOKFR4gr17RAiNQ/9/tddjFQ80KxnNM5Y37Y4Zkp1W+UAOBEC6BxlomvH
         oBdYn+JXZyh+ukenBMtkTunxDZLG6JrzsTjPPQcF0QSQjqgFJC4qLOivtxCDlOsWAB7O
         wZmQ==
X-Gm-Message-State: AOAM530O20RAIERGaeNjhpL/TuUGS6Jalm5ODk0pZTq+IAjsUwIMYgYn
        eTBYFuxj6WOZ8YX/w8dbRRqq3A==
X-Google-Smtp-Source: ABdhPJwVq2CNV+SssZKgO5B05WCOSZ3H9k5Rw9dOZSjNBYaCWHeQIFOEPRQdXQLz2oXdhaGZXH612A==
X-Received: by 2002:ac8:5707:: with SMTP id 7mr26700054qtw.397.1635269909790;
        Tue, 26 Oct 2021 10:38:29 -0700 (PDT)
Received: from soleen.c.googlers.com.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id bj37sm11001939qkb.49.2021.10.26.10.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 10:38:29 -0700 (PDT)
From:   Pasha Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org,
        anshuman.khandual@arm.com, willy@infradead.org,
        akpm@linux-foundation.org, william.kucharski@oracle.com,
        mike.kravetz@oracle.com, vbabka@suse.cz, geert@linux-m68k.org,
        schmitzmic@gmail.com, rostedt@goodmis.org, mingo@redhat.com,
        hannes@cmpxchg.org, guro@fb.com, songmuchun@bytedance.com,
        weixugc@google.com, gthelen@google.com
Subject: [RFC 5/8] mm: avoid using set_page_count() when pages are freed into allocator
Date:   Tue, 26 Oct 2021 17:38:19 +0000
Message-Id: <20211026173822.502506-6-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
In-Reply-To: <20211026173822.502506-1-pasha.tatashin@soleen.com>
References: <20211026173822.502506-1-pasha.tatashin@soleen.com>
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
index 6af4596bddc2..9d18e5f9a85a 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1659,6 +1659,7 @@ void __free_pages_core(struct page *page, unsigned int order)
 	unsigned int nr_pages = 1 << order;
 	struct page *p = page;
 	unsigned int loop;
+	int refcnt;
 
 	/*
 	 * When initializing the memmap, __init_single_page() sets the refcount
@@ -1669,10 +1670,12 @@ void __free_pages_core(struct page *page, unsigned int order)
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
 
@@ -2244,10 +2247,12 @@ void __init init_cma_reserved_pageblock(struct page *page)
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
2.33.0.1079.g6e70778dc9-goog

