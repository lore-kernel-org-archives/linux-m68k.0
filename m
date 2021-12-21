Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45DEDC433F5
	for <linux-m68k@archiver.kernel.org>; Tue, 21 Dec 2021 15:01:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235861AbhLUPBv (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 21 Dec 2021 10:01:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232308AbhLUPBq (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 21 Dec 2021 10:01:46 -0500
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70B52C06173F
        for <linux-m68k@lists.linux-m68k.org>; Tue, 21 Dec 2021 07:01:46 -0800 (PST)
Received: by mail-qk1-x729.google.com with SMTP id l25so12779923qkl.5
        for <linux-m68k@lists.linux-m68k.org>; Tue, 21 Dec 2021 07:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VWjTX7nyk2kx8oM7xeRq6hwgPVlUZA1U2SvwycLjyC4=;
        b=lgtZiYGORboj3gotQhfaYY0bpKv8j7J53Ax30ReWADNOLR3pP3G9Z7zz0Dj3k7Uk5e
         0ux/jWhBkcDDWZNbsnxvxvWqzhDnWsFJL6QgUavAiI/eka9aWQq8xoxVtqUlS9RGSBUW
         nlTTru8N+9u/o7uUhKBpJshNUteAtIguMa1UgZsfWlJD78EVWpHWIFS2slz+8JXVVG1f
         JLyUy/6E5WopWvHFpq8EHOeA9IBe+56qANZgmDPrZtgk0pC+n3iGJQHqc4n2berXKDeA
         jCzCBlAGXkRImCHI7kzOxNqbzac8AssrtfSH3cOrvGK1iK8PCqdcWvyNr7g3q0q6Tx+5
         tI5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VWjTX7nyk2kx8oM7xeRq6hwgPVlUZA1U2SvwycLjyC4=;
        b=Vu6CpMhly8c7GARglE0DbmLw6X6olWJ7QGcI0tscdbehtODg0QTLMO5kCMP+hjuuW5
         VQc+8UBmitqEacsKVm3rgizVIP5RLq85Cw8SWHFA+1YNLAPbkKyADi58q4y4MLbRpZ4F
         O8nu023f2rYkhU0f7JfFZWbg4sh+HsKf11Ne2H3CflWMHwPa6UwqbI2y6svi8HZUVmmX
         Z8Kp8k8a7IBT/tX/JfV9viWxcurwKEUsc51Pos0CyDCvUsLRxRpR3PLGezZ363RyoVtL
         U8Y0G7+UNVDfl/WJCEy/R9rIDwAWBYgLxgNVUxMpJ6MEb8PymB3+GtYeQMU9FKbhomF5
         MGKw==
X-Gm-Message-State: AOAM530Hhy7BuJNEDNdtSKp4PBmz4ktjvySJ66E4F2FZqeeOIAQCb0bN
        /HaHMKEo6xg+SFLZ6L+fKIb76w==
X-Google-Smtp-Source: ABdhPJw9luqKLc24vjtBqjzZvm0/teGU0ZGMeaGDdyuIHDvuLAMXiYA2USkVhgRDMEYtHXrjRz3seg==
X-Received: by 2002:a37:2c03:: with SMTP id s3mr2285026qkh.83.1640098904994;
        Tue, 21 Dec 2021 07:01:44 -0800 (PST)
Received: from soleen.c.googlers.com.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id d4sm1991371qkn.79.2021.12.21.07.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 07:01:44 -0800 (PST)
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
Subject: [PATCH v2 1/9] mm: add overflow and underflow checks for page->_refcount
Date:   Tue, 21 Dec 2021 15:01:32 +0000
Message-Id: <20211221150140.988298-2-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.34.1.307.g9b7440fafd-goog
In-Reply-To: <20211221150140.988298-1-pasha.tatashin@soleen.com>
References: <20211221150140.988298-1-pasha.tatashin@soleen.com>
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

Use atomic_fetch_* functions to get the old values of the _refcount,
and use it to check for overflow/underflow.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 include/linux/page_ref.h | 59 +++++++++++++++++++++++++++++-----------
 1 file changed, 43 insertions(+), 16 deletions(-)

diff --git a/include/linux/page_ref.h b/include/linux/page_ref.h
index 2e677e6ad09f..fe4864f7f69c 100644
--- a/include/linux/page_ref.h
+++ b/include/linux/page_ref.h
@@ -117,7 +117,10 @@ static inline void init_page_count(struct page *page)
 
 static inline void page_ref_add(struct page *page, int nr)
 {
-	atomic_add(nr, &page->_refcount);
+	int old_val = atomic_fetch_add(nr, &page->_refcount);
+	int new_val = old_val + nr;
+
+	VM_BUG_ON_PAGE((unsigned int)new_val < (unsigned int)old_val, page);
 	if (page_ref_tracepoint_active(page_ref_mod))
 		__page_ref_mod(page, nr);
 }
@@ -129,7 +132,10 @@ static inline void folio_ref_add(struct folio *folio, int nr)
 
 static inline void page_ref_sub(struct page *page, int nr)
 {
-	atomic_sub(nr, &page->_refcount);
+	int old_val = atomic_fetch_sub(nr, &page->_refcount);
+	int new_val = old_val - nr;
+
+	VM_BUG_ON_PAGE((unsigned int)new_val > (unsigned int)old_val, page);
 	if (page_ref_tracepoint_active(page_ref_mod))
 		__page_ref_mod(page, -nr);
 }
@@ -141,11 +147,13 @@ static inline void folio_ref_sub(struct folio *folio, int nr)
 
 static inline int page_ref_sub_return(struct page *page, int nr)
 {
-	int ret = atomic_sub_return(nr, &page->_refcount);
+	int old_val = atomic_fetch_sub(nr, &page->_refcount);
+	int new_val = old_val - nr;
 
+	VM_BUG_ON_PAGE((unsigned int)new_val > (unsigned int)old_val, page);
 	if (page_ref_tracepoint_active(page_ref_mod_and_return))
-		__page_ref_mod_and_return(page, -nr, ret);
-	return ret;
+		__page_ref_mod_and_return(page, -nr, new_val);
+	return new_val;
 }
 
 static inline int folio_ref_sub_return(struct folio *folio, int nr)
@@ -155,7 +163,10 @@ static inline int folio_ref_sub_return(struct folio *folio, int nr)
 
 static inline void page_ref_inc(struct page *page)
 {
-	atomic_inc(&page->_refcount);
+	int old_val = atomic_fetch_inc(&page->_refcount);
+	int new_val = old_val + 1;
+
+	VM_BUG_ON_PAGE((unsigned int)new_val < (unsigned int)old_val, page);
 	if (page_ref_tracepoint_active(page_ref_mod))
 		__page_ref_mod(page, 1);
 }
@@ -167,7 +178,10 @@ static inline void folio_ref_inc(struct folio *folio)
 
 static inline void page_ref_dec(struct page *page)
 {
-	atomic_dec(&page->_refcount);
+	int old_val = atomic_fetch_dec(&page->_refcount);
+	int new_val = old_val - 1;
+
+	VM_BUG_ON_PAGE((unsigned int)new_val > (unsigned int)old_val, page);
 	if (page_ref_tracepoint_active(page_ref_mod))
 		__page_ref_mod(page, -1);
 }
@@ -179,8 +193,11 @@ static inline void folio_ref_dec(struct folio *folio)
 
 static inline int page_ref_sub_and_test(struct page *page, int nr)
 {
-	int ret = atomic_sub_and_test(nr, &page->_refcount);
+	int old_val = atomic_fetch_sub(nr, &page->_refcount);
+	int new_val = old_val - nr;
+	int ret = new_val == 0;
 
+	VM_BUG_ON_PAGE((unsigned int)new_val > (unsigned int)old_val, page);
 	if (page_ref_tracepoint_active(page_ref_mod_and_test))
 		__page_ref_mod_and_test(page, -nr, ret);
 	return ret;
@@ -193,11 +210,13 @@ static inline int folio_ref_sub_and_test(struct folio *folio, int nr)
 
 static inline int page_ref_inc_return(struct page *page)
 {
-	int ret = atomic_inc_return(&page->_refcount);
+	int old_val = atomic_fetch_inc(&page->_refcount);
+	int new_val = old_val + 1;
 
+	VM_BUG_ON_PAGE((unsigned int)new_val < (unsigned int)old_val, page);
 	if (page_ref_tracepoint_active(page_ref_mod_and_return))
-		__page_ref_mod_and_return(page, 1, ret);
-	return ret;
+		__page_ref_mod_and_return(page, 1, new_val);
+	return new_val;
 }
 
 static inline int folio_ref_inc_return(struct folio *folio)
@@ -207,8 +226,11 @@ static inline int folio_ref_inc_return(struct folio *folio)
 
 static inline int page_ref_dec_and_test(struct page *page)
 {
-	int ret = atomic_dec_and_test(&page->_refcount);
+	int old_val = atomic_fetch_dec(&page->_refcount);
+	int new_val = old_val - 1;
+	int ret = new_val == 0;
 
+	VM_BUG_ON_PAGE((unsigned int)new_val > (unsigned int)old_val, page);
 	if (page_ref_tracepoint_active(page_ref_mod_and_test))
 		__page_ref_mod_and_test(page, -1, ret);
 	return ret;
@@ -221,11 +243,13 @@ static inline int folio_ref_dec_and_test(struct folio *folio)
 
 static inline int page_ref_dec_return(struct page *page)
 {
-	int ret = atomic_dec_return(&page->_refcount);
+	int old_val = atomic_fetch_dec(&page->_refcount);
+	int new_val = old_val - 1;
 
+	VM_BUG_ON_PAGE((unsigned int)new_val > (unsigned int)old_val, page);
 	if (page_ref_tracepoint_active(page_ref_mod_and_return))
-		__page_ref_mod_and_return(page, -1, ret);
-	return ret;
+		__page_ref_mod_and_return(page, -1, new_val);
+	return new_val;
 }
 
 static inline int folio_ref_dec_return(struct folio *folio)
@@ -235,8 +259,11 @@ static inline int folio_ref_dec_return(struct folio *folio)
 
 static inline bool page_ref_add_unless(struct page *page, int nr, int u)
 {
-	bool ret = atomic_add_unless(&page->_refcount, nr, u);
+	int old_val = atomic_fetch_add_unless(&page->_refcount, nr, u);
+	int new_val = old_val + nr;
+	int ret = old_val != u;
 
+	VM_BUG_ON_PAGE(ret && (unsigned int)new_val < (unsigned int)old_val, page);
 	if (page_ref_tracepoint_active(page_ref_mod_unless))
 		__page_ref_mod_unless(page, nr, ret);
 	return ret;
-- 
2.34.1.307.g9b7440fafd-goog

