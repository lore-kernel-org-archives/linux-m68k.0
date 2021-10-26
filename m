Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B012FC4332F
	for <linux-m68k@archiver.kernel.org>; Tue, 26 Oct 2021 17:38:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8F7B8610A5
	for <linux-m68k@archiver.kernel.org>; Tue, 26 Oct 2021 17:38:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237741AbhJZRkw (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 26 Oct 2021 13:40:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236519AbhJZRku (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 26 Oct 2021 13:40:50 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7583C061767
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Oct 2021 10:38:26 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id bi29so1029167qkb.5
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Oct 2021 10:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1MjJIbJlIahDU+iLwwAfOaikWhB3foL3f/r8kdQBxNc=;
        b=lB5z28Fcx2ZBMKy/ZYv4hZAv3ZLMd31iPtufXn202o9yLe6MI1x3qw9X/RNSvtYIew
         uv6uXGo0OC2+G7hCGULnU85/pCy9QKRW8qJD/dytf8dC8XCK36AeNyUL7UHpm53+O9CA
         DU0MsN9PMMOUZ7wItqiRbkpzXWoaFQinJVqxz2VSB2ahBqqcdWGJObKx7fm9OrBZ9vip
         QCHDJiSw2Ez0E746AlEObFg6cd26FPxxQTLmX3S9ktxx0mK0SaOUfz3vFmtZz0YTb4DT
         vMlgFvpJtDayjOOWDAGJZBb7Wmzh8KWypWtb/cHBXLavKpY7RcnSuXRHZy3ygu0/Ttqi
         Y62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1MjJIbJlIahDU+iLwwAfOaikWhB3foL3f/r8kdQBxNc=;
        b=XjBnl9+zsi4xkUacsgrhnEp8XzX1evSJjT32Nxt97zC58STGpiKwPgTy+x2GxL4YM+
         6yt2CGERcDX0v1LSXzDr9OPbNm3WPsV90iSmJHlK6Qr0Evg4wvbEYgVVcd72giiwlC2b
         +536reQc/hRBiwRfT/ZkCgzZsm5h06eWCE2EqMU92OeJ/SRdYO1I9f1sYW/SelFLZOBB
         Npe7a84UZIdfqO7LSYuSMfC/cvez5BhWr8Ny/6+tEiEbHK4+u8dU4o4pYzEqN6bPX86u
         bgebZBH9pu6jXcigGqI0q7+h2hN48ICoj/pdIxbPtqdxYSxE24Ob5L7DnFxn++Im69Pt
         8RzQ==
X-Gm-Message-State: AOAM531LyI20OY/a+AW/maECOJYVDpsQRYZMQiPUJ4DiJtLPPYcBSAzt
        BOcns/1cPq8ttGflyAp2WsCeEQ==
X-Google-Smtp-Source: ABdhPJzM+k476AduvT9DqDoOET4gfPzY9MByvHSnUBjP5xwl3bvdX3hONs7MKtegCmUHu0t+iVRQrA==
X-Received: by 2002:a37:2ec6:: with SMTP id u189mr20159144qkh.466.1635269905910;
        Tue, 26 Oct 2021 10:38:25 -0700 (PDT)
Received: from soleen.c.googlers.com.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id bj37sm11001939qkb.49.2021.10.26.10.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 10:38:25 -0700 (PDT)
From:   Pasha Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org,
        anshuman.khandual@arm.com, willy@infradead.org,
        akpm@linux-foundation.org, william.kucharski@oracle.com,
        mike.kravetz@oracle.com, vbabka@suse.cz, geert@linux-m68k.org,
        schmitzmic@gmail.com, rostedt@goodmis.org, mingo@redhat.com,
        hannes@cmpxchg.org, guro@fb.com, songmuchun@bytedance.com,
        weixugc@google.com, gthelen@google.com
Subject: [RFC 1/8] mm: add overflow and underflow checks for page->_refcount
Date:   Tue, 26 Oct 2021 17:38:15 +0000
Message-Id: <20211026173822.502506-2-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
In-Reply-To: <20211026173822.502506-1-pasha.tatashin@soleen.com>
References: <20211026173822.502506-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The problems with page->_refcount are hard to debug, because usually
when they are detected, the damage has occurred a long time ago. Yet,
the problems with invalid page refcount may be catastrophic and lead to
memory corruptions.

Reduce the scope of when the _refcount problems manifest themselves by
adding checks for underflows and overflows into functions that modify
_refcount.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 include/linux/page_ref.h | 61 ++++++++++++++++++++++++++++++++--------
 1 file changed, 49 insertions(+), 12 deletions(-)

diff --git a/include/linux/page_ref.h b/include/linux/page_ref.h
index 7ad46f45df39..b3ec2b231fc7 100644
--- a/include/linux/page_ref.h
+++ b/include/linux/page_ref.h
@@ -90,21 +90,35 @@ static inline void init_page_count(struct page *page)
 
 static inline void page_ref_add(struct page *page, int nr)
 {
-	atomic_add(nr, &page->_refcount);
+	int ret;
+
+	VM_BUG_ON(nr <= 0);
+	ret = atomic_add_return(nr, &page->_refcount);
+	VM_BUG_ON_PAGE(ret <= 0, page);
+
 	if (page_ref_tracepoint_active(page_ref_mod))
 		__page_ref_mod(page, nr);
 }
 
 static inline void page_ref_sub(struct page *page, int nr)
 {
-	atomic_sub(nr, &page->_refcount);
+	int ret;
+
+	VM_BUG_ON(nr <= 0);
+	ret = atomic_sub_return(nr, &page->_refcount);
+	VM_BUG_ON_PAGE(ret < 0, page);
+
 	if (page_ref_tracepoint_active(page_ref_mod))
 		__page_ref_mod(page, -nr);
 }
 
 static inline int page_ref_sub_return(struct page *page, int nr)
 {
-	int ret = atomic_sub_return(nr, &page->_refcount);
+	int ret;
+
+	VM_BUG_ON(nr <= 0);
+	ret = atomic_sub_return(nr, &page->_refcount);
+	VM_BUG_ON_PAGE(ret < 0, page);
 
 	if (page_ref_tracepoint_active(page_ref_mod_and_return))
 		__page_ref_mod_and_return(page, -nr, ret);
@@ -113,31 +127,43 @@ static inline int page_ref_sub_return(struct page *page, int nr)
 
 static inline void page_ref_inc(struct page *page)
 {
-	atomic_inc(&page->_refcount);
+	int ret = atomic_inc_return(&page->_refcount);
+
+	VM_BUG_ON_PAGE(ret <= 0, page);
+
 	if (page_ref_tracepoint_active(page_ref_mod))
 		__page_ref_mod(page, 1);
 }
 
 static inline void page_ref_dec(struct page *page)
 {
-	atomic_dec(&page->_refcount);
+	int ret = atomic_dec_return(&page->_refcount);
+
+	VM_BUG_ON_PAGE(ret < 0, page);
+
 	if (page_ref_tracepoint_active(page_ref_mod))
 		__page_ref_mod(page, -1);
 }
 
 static inline int page_ref_sub_and_test(struct page *page, int nr)
 {
-	int ret = atomic_sub_and_test(nr, &page->_refcount);
+	int ret;
+
+	VM_BUG_ON(nr <= 0);
+	ret = atomic_sub_return(nr, &page->_refcount);
+	VM_BUG_ON_PAGE(ret < 0, page);
 
 	if (page_ref_tracepoint_active(page_ref_mod_and_test))
 		__page_ref_mod_and_test(page, -nr, ret);
-	return ret;
+	return ret == 0;
 }
 
 static inline int page_ref_inc_return(struct page *page)
 {
 	int ret = atomic_inc_return(&page->_refcount);
 
+	VM_BUG_ON_PAGE(ret <= 0, page);
+
 	if (page_ref_tracepoint_active(page_ref_mod_and_return))
 		__page_ref_mod_and_return(page, 1, ret);
 	return ret;
@@ -145,17 +171,21 @@ static inline int page_ref_inc_return(struct page *page)
 
 static inline int page_ref_dec_and_test(struct page *page)
 {
-	int ret = atomic_dec_and_test(&page->_refcount);
+	int ret = atomic_dec_return(&page->_refcount);
+
+	VM_BUG_ON_PAGE(ret < 0, page);
 
 	if (page_ref_tracepoint_active(page_ref_mod_and_test))
 		__page_ref_mod_and_test(page, -1, ret);
-	return ret;
+	return ret == 0;
 }
 
 static inline int page_ref_dec_return(struct page *page)
 {
 	int ret = atomic_dec_return(&page->_refcount);
 
+	VM_BUG_ON_PAGE(ret < 0, page);
+
 	if (page_ref_tracepoint_active(page_ref_mod_and_return))
 		__page_ref_mod_and_return(page, -1, ret);
 	return ret;
@@ -163,16 +193,23 @@ static inline int page_ref_dec_return(struct page *page)
 
 static inline int page_ref_add_unless(struct page *page, int nr, int u)
 {
-	int ret = atomic_add_unless(&page->_refcount, nr, u);
+	int ret;
+
+	VM_BUG_ON(nr <= 0 || u < 0);
+	ret = atomic_fetch_add_unless(&page->_refcount, nr, u);
+	VM_BUG_ON_PAGE(ret < 0, page);
 
 	if (page_ref_tracepoint_active(page_ref_mod_unless))
 		__page_ref_mod_unless(page, nr, ret);
-	return ret;
+	return ret != u;
 }
 
 static inline int page_ref_freeze(struct page *page, int count)
 {
-	int ret = likely(atomic_cmpxchg(&page->_refcount, count, 0) == count);
+	int ret;
+
+	VM_BUG_ON(count <= 0);
+	ret = likely(atomic_cmpxchg(&page->_refcount, count, 0) == count);
 
 	if (page_ref_tracepoint_active(page_ref_freeze))
 		__page_ref_freeze(page, count, ret);
-- 
2.33.0.1079.g6e70778dc9-goog

