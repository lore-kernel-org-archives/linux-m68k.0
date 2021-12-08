Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C908C433FE
	for <linux-m68k@archiver.kernel.org>; Wed,  8 Dec 2021 20:35:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240423AbhLHUj1 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 8 Dec 2021 15:39:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240429AbhLHUj0 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 8 Dec 2021 15:39:26 -0500
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2F1BC0617A1
        for <linux-m68k@lists.linux-m68k.org>; Wed,  8 Dec 2021 12:35:53 -0800 (PST)
Received: by mail-qv1-xf35.google.com with SMTP id g9so3319368qvd.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 08 Dec 2021 12:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=H8bfJiPx+C1Gj1sLxl+17sC+GHcuXjOENqlet2hUeQ4=;
        b=UASIM45poc9r/hy5Qw0CWMse+e7qE87XjU38rMUffDJREx2nslIqtYJeGf457vZ4lq
         NlUBHHvZPf29YIdXfeZCAZgN0WfJ4JazodUa9v2wUZJ6mzjtKYZU4JhIYhkUARDb0TWk
         mODU2KXoEPx3mU8k7DOB/tbd4lXH/sE2GjSFk5NRxNaOhQpAaDOcHWT4Lc0EAcygT+hp
         TF0/YACFNpoVOEdP6XqLohEJ26Ncks8rjri5se+h9pzz+2pVcMNNlcF8KCdRB9z+g3OQ
         gRfBNZeiPaWUsH3WDt+eciXBRNxy8VS8DuXcomKiKkacDBREm8YmGYyKT7P6j2F8yHpF
         DZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H8bfJiPx+C1Gj1sLxl+17sC+GHcuXjOENqlet2hUeQ4=;
        b=EY+7Umuio+hBNlUlI01JCjwbHlG8wFzgCqjd2jtDTccDY5gqfbgQ+4h+2Tf8YUUHXl
         l3Y210XsHEOC/fHkUYG4YDogmDCQhKZSFa/tJdbZR+FGxl1L0c6Yt54ZhnJHr8Xwsnhv
         Ux/cZHVPbWcQV4ECNimiUsqU7chma4ej5ucVF+xrcgnafSUSYUwHhZHXIHL/cfxretJh
         Cs27jZ/CdZ8OWTHoMm3deOv2eqIMq2yvk87N62yfeXHYgtCW3Fedht6x1E2/i+Eco603
         FtRzbOA8BlclCUe7kaf5a32kfQKlFNxhAgx2Fr35t/vB8ff61qxLH5DHDoLqr8BwEif0
         06nA==
X-Gm-Message-State: AOAM5339R7IV6nj38h5evD3IPm0tXtiQIBrMQtK5mo0LP7hhR9ryPyjm
        NnDfpFINn/QXzeT38cKqaS9HyA==
X-Google-Smtp-Source: ABdhPJxKwmC+cugSIJHXimSTOxZumHky+tRs51kvJketZHKIvDnq1bFR2LPJyWfUzwAp1lD+tToUvg==
X-Received: by 2002:a05:6214:e83:: with SMTP id hf3mr10808149qvb.52.1638995752827;
        Wed, 08 Dec 2021 12:35:52 -0800 (PST)
Received: from soleen.c.googlers.com.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id 143sm1898710qkg.87.2021.12.08.12.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 12:35:52 -0800 (PST)
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
Subject: [PATCH 04/10] mm: remove set_page_count() from page_frag_alloc_align
Date:   Wed,  8 Dec 2021 20:35:38 +0000
Message-Id: <20211208203544.2297121-5-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.34.1.400.ga245620fadb-goog
In-Reply-To: <20211208203544.2297121-1-pasha.tatashin@soleen.com>
References: <20211208203544.2297121-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

set_page_count() unconditionally resets the value of _ref_count and that
is dangerous, as it is not programmatically verified. Instead we rely on
comments like: "OK, page count is 0, we can safely set it".

Add a new refcount function: page_ref_add_return() to return the new
refcount value after adding to it. Use the return value to verify that
the _ref_count was indeed the expected one.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 include/linux/page_ref.h | 11 +++++++++++
 mm/page_alloc.c          |  6 ++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/include/linux/page_ref.h b/include/linux/page_ref.h
index f3c61dc6344a..27880aca2e2f 100644
--- a/include/linux/page_ref.h
+++ b/include/linux/page_ref.h
@@ -115,6 +115,17 @@ static inline void init_page_count(struct page *page)
 	set_page_count(page, 1);
 }
 
+static inline int page_ref_add_return(struct page *page, int nr)
+{
+	int old_val = atomic_fetch_add(nr, &page->_refcount);
+	int new_val = old_val + nr;
+
+	VM_BUG_ON_PAGE((unsigned int)new_val < (unsigned int)old_val, page);
+	if (page_ref_tracepoint_active(page_ref_mod_and_return))
+		__page_ref_mod_and_return(page, nr, new_val);
+	return new_val;
+}
+
 static inline void page_ref_add(struct page *page, int nr)
 {
 	int old_val = atomic_fetch_add(nr, &page->_refcount);
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index edfd6c81af82..b5554767b9de 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -5523,6 +5523,7 @@ void *page_frag_alloc_align(struct page_frag_cache *nc,
 	unsigned int size = PAGE_SIZE;
 	struct page *page;
 	int offset;
+	int refcnt;
 
 	if (unlikely(!nc->va)) {
 refill:
@@ -5561,8 +5562,9 @@ void *page_frag_alloc_align(struct page_frag_cache *nc,
 		/* if size can vary use size else just use PAGE_SIZE */
 		size = nc->size;
 #endif
-		/* OK, page count is 0, we can safely set it */
-		set_page_count(page, PAGE_FRAG_CACHE_MAX_SIZE + 1);
+		/* page count is 0, set it to PAGE_FRAG_CACHE_MAX_SIZE + 1 */
+		refcnt = page_ref_add_return(page, PAGE_FRAG_CACHE_MAX_SIZE + 1);
+		VM_BUG_ON_PAGE(refcnt != PAGE_FRAG_CACHE_MAX_SIZE + 1, page);
 
 		/* reset page count bias and offset to start of new frag */
 		nc->pagecnt_bias = PAGE_FRAG_CACHE_MAX_SIZE + 1;
-- 
2.34.1.400.ga245620fadb-goog

