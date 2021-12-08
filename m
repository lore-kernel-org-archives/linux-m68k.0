Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3FA4C4332F
	for <linux-m68k@archiver.kernel.org>; Wed,  8 Dec 2021 20:35:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240451AbhLHUj3 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 8 Dec 2021 15:39:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240417AbhLHUj1 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 8 Dec 2021 15:39:27 -0500
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36803C0617A1
        for <linux-m68k@lists.linux-m68k.org>; Wed,  8 Dec 2021 12:35:55 -0800 (PST)
Received: by mail-qv1-xf2d.google.com with SMTP id u16so3312288qvk.4
        for <linux-m68k@lists.linux-m68k.org>; Wed, 08 Dec 2021 12:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=XT490YdEcvx9z0HgNAsAe5qbW3nrfSPw0WwmEbFNOgw=;
        b=AwpSSrSlUWBCeB0wLRR7PtFayoe8KDj+bcWA4VpeaSJPeVLs+afKlo+fBN4uyHWygl
         Gs6H03vm3ucbTNrQ0C1YN6WYTcUvTPcxFGXBHLbId/TBX3jQ44L0p0/s16SDkQbvVPtb
         xawRxo2luzu9LIbQWHy3pnY6RIwqeX1ysfsu84MEIi0XI0uhHn0snHKe4GELSSaRkLom
         CHHZwAGaFdjwZqeqTVW20TbY93cgCpzaNudm60ClJEy54FKlsN/k9338zOHFJohcxtk7
         hR0V2uPvPCQGqe4sBi3MyNOmHa6WI1P0FV+0VRxWtWj4qRu3JpDPRb5ehhOxwInRU1P3
         0hZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XT490YdEcvx9z0HgNAsAe5qbW3nrfSPw0WwmEbFNOgw=;
        b=LW/KECI/w3E3JHonIkNxmNWCRZp3KpuQyH9YFzMG6xNepJCcSnBNhpG657hsdjrKSW
         +v5mEZ0Ll0uR6Y0XapO1LgikRdZpbOO7Fvdccc1j2QsTin7pib3+7AX/G8cxZQWDq9vP
         xsTjqpfnoe2t151HqT6bMxZ/p7Bkp2GfNth1ukbDmaLdW8QBZaTYqju5MMAKyLD2n7vg
         I2BFK7mbgXzBgG+5j6cZ5lnlyYjOd7t1aSXLvespUzlp43xpMQ/oSWRrDzlsrW33MSuw
         8QRXdb5q5mJpNOdKxIi/IFBGBYwmgu+x3UbXd/Ug7irWEPFuDKmYsC73C15OGZUaScTE
         MXnw==
X-Gm-Message-State: AOAM5317oxWy2835pJq/te4pL6UBDO3nT8NA77FEx6O82nEpJjV3nx4K
        MbpWZpKYDLhOiHetW93BVnjMKw==
X-Google-Smtp-Source: ABdhPJwvSYL30qk1YT4PriURo05toFD3LbBcz4vfwkQoBpbbQ8Gs0gayxHWb09qautbyrDNsTzh4qw==
X-Received: by 2002:a05:6214:2a84:: with SMTP id jr4mr10883678qvb.35.1638995754427;
        Wed, 08 Dec 2021 12:35:54 -0800 (PST)
Received: from soleen.c.googlers.com.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id 143sm1898710qkg.87.2021.12.08.12.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 12:35:53 -0800 (PST)
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
Subject: [PATCH 05/10] mm: avoid using set_page_count() when pages are freed into allocator
Date:   Wed,  8 Dec 2021 20:35:39 +0000
Message-Id: <20211208203544.2297121-6-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.34.1.400.ga245620fadb-goog
In-Reply-To: <20211208203544.2297121-1-pasha.tatashin@soleen.com>
References: <20211208203544.2297121-1-pasha.tatashin@soleen.com>
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
index b5554767b9de..13d989d62012 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1667,6 +1667,7 @@ void __free_pages_core(struct page *page, unsigned int order)
 	unsigned int nr_pages = 1 << order;
 	struct page *p = page;
 	unsigned int loop;
+	int refcnt;
 
 	/*
 	 * When initializing the memmap, __init_single_page() sets the refcount
@@ -1677,10 +1678,12 @@ void __free_pages_core(struct page *page, unsigned int order)
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
 
@@ -2252,10 +2255,12 @@ void __init init_cma_reserved_pageblock(struct page *page)
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
2.34.1.400.ga245620fadb-goog

