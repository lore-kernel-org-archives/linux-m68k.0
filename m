Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2381C433EF
	for <linux-m68k@archiver.kernel.org>; Tue, 26 Oct 2021 17:39:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CDA0061002
	for <linux-m68k@archiver.kernel.org>; Tue, 26 Oct 2021 17:39:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237939AbhJZRlX (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 26 Oct 2021 13:41:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237868AbhJZRlC (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 26 Oct 2021 13:41:02 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81508C06122A
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Oct 2021 10:38:33 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id bp7so15868595qkb.12
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Oct 2021 10:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=HF6B+ANn807oEjA+4tqKdVdBlJJYmmQDtbry277TkjQ=;
        b=UOWyQLPF0kSv2vshEy+5mKyoiYKfuFaWJXQEAM4Dq5suXZs5nNy8D6u8PIMAb/vTh6
         LixhC1W+oJGXwIkcXzvCtKxzxpViFcoP7Q3E4H7G9tOGaD84tilIoXqYVMMrCDCEsk87
         eHGEWz07VwEKHc8KxWiS3SCx7UvLktRXlwdRBF1vizFzQ35YbkBx5Uk6SB4OWwHoa2O3
         qlXoVx0HtXPJySJmcnHMuCIodzP38uK4FSYI1u3Yb+3vV44Or2DJ1694HJcu8tmNa7tK
         hljvkwRFGVoIIvc7+PNxTNb3vrxlaeDhmK+hYuwgS1ufuLy5Wes2iWmmnreU7k6BDP8F
         xbUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HF6B+ANn807oEjA+4tqKdVdBlJJYmmQDtbry277TkjQ=;
        b=YpuwLfDPdzaK8iiq/VM8ZCcpV0copDjAluFz48mZ+XSS2qkvYJ77LcoX04xIBSr9wF
         7/oaMz7AES3+WgZyP7uU8UmqiN64mtT12co+0xC2cK6ifXFg1YyINNFHNsekJNjps6u6
         eBsCrNQkklEortPMGy1CxCe+jJnvWjM602NsIUelRDkT1ZUrBk6TulIXLP0pV6Ff/Q8r
         qD3KqqcZCnKuIJu8Y2GR0yikdw+7HbASAaxTJ2BUB2f51OuuJcyPDcxFlTpA4ryEFB4x
         as87soTBjGHR/eqCcDHWnqjsO883zZ+CygwkWDqe3K4GaS7H+43rM054jPxhFqfGi9Xg
         8Y2w==
X-Gm-Message-State: AOAM530o+hF2eyq/CreiqXKwKRE5S+50gsRRC3mrtqI1v/hXokEBzhQo
        GYHqAQUgil3MzQ0GO7NoC6wPmQ==
X-Google-Smtp-Source: ABdhPJxx9MFs+/QV/teVroSXPkhUKINhq5aIn3syHlgyXssAgeoP8UjDKqxkaYgieNJDGNNH/dS1LQ==
X-Received: by 2002:a05:620a:288b:: with SMTP id j11mr4071680qkp.257.1635269912637;
        Tue, 26 Oct 2021 10:38:32 -0700 (PDT)
Received: from soleen.c.googlers.com.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id bj37sm11001939qkb.49.2021.10.26.10.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 10:38:32 -0700 (PDT)
From:   Pasha Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org,
        anshuman.khandual@arm.com, willy@infradead.org,
        akpm@linux-foundation.org, william.kucharski@oracle.com,
        mike.kravetz@oracle.com, vbabka@suse.cz, geert@linux-m68k.org,
        schmitzmic@gmail.com, rostedt@goodmis.org, mingo@redhat.com,
        hannes@cmpxchg.org, guro@fb.com, songmuchun@bytedance.com,
        weixugc@google.com, gthelen@google.com
Subject: [RFC 8/8] mm: simplify page_ref_* functions
Date:   Tue, 26 Oct 2021 17:38:22 +0000
Message-Id: <20211026173822.502506-9-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
In-Reply-To: <20211026173822.502506-1-pasha.tatashin@soleen.com>
References: <20211026173822.502506-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Now, that we are using atomic_return variants to add/sub/inc/dec page
_refcount, it makes sense to combined page_ref_* return and non return
functions.

Also remove some extra trace points for non-return  variants. This
improves the tracability by always recording the new _refcount value
after the modifications has occurred.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 include/linux/page_ref.h        | 79 +++++++--------------------------
 include/trace/events/page_ref.h | 26 +++--------
 mm/debug_page_ref.c             | 14 ------
 3 files changed, 22 insertions(+), 97 deletions(-)

diff --git a/include/linux/page_ref.h b/include/linux/page_ref.h
index 06f5760fcd06..2a91dbc33486 100644
--- a/include/linux/page_ref.h
+++ b/include/linux/page_ref.h
@@ -8,8 +8,6 @@
 #include <linux/tracepoint-defs.h>
 
 DECLARE_TRACEPOINT(page_ref_init);
-DECLARE_TRACEPOINT(page_ref_mod);
-DECLARE_TRACEPOINT(page_ref_mod_and_test);
 DECLARE_TRACEPOINT(page_ref_mod_and_return);
 DECLARE_TRACEPOINT(page_ref_mod_unless);
 DECLARE_TRACEPOINT(page_ref_freeze);
@@ -27,8 +25,6 @@ DECLARE_TRACEPOINT(page_ref_unfreeze);
 #define page_ref_tracepoint_active(t) tracepoint_enabled(t)
 
 extern void __page_ref_init(struct page *page);
-extern void __page_ref_mod(struct page *page, int v);
-extern void __page_ref_mod_and_test(struct page *page, int v, int ret);
 extern void __page_ref_mod_and_return(struct page *page, int v, int ret);
 extern void __page_ref_mod_unless(struct page *page, int v, int u);
 extern void __page_ref_freeze(struct page *page, int v, int ret);
@@ -41,12 +37,6 @@ extern void __page_ref_unfreeze(struct page *page, int v);
 static inline void __page_ref_init(struct page *page)
 {
 }
-static inline void __page_ref_mod(struct page *page, int v)
-{
-}
-static inline void __page_ref_mod_and_test(struct page *page, int v, int ret)
-{
-}
 static inline void __page_ref_mod_and_return(struct page *page, int v, int ret)
 {
 }
@@ -102,26 +92,7 @@ static inline int page_ref_add_return(struct page *page, int nr)
 
 static inline void page_ref_add(struct page *page, int nr)
 {
-	int ret;
-
-	VM_BUG_ON(nr <= 0);
-	ret = atomic_add_return(nr, &page->_refcount);
-	VM_BUG_ON_PAGE(ret <= 0, page);
-
-	if (page_ref_tracepoint_active(page_ref_mod))
-		__page_ref_mod(page, nr);
-}
-
-static inline void page_ref_sub(struct page *page, int nr)
-{
-	int ret;
-
-	VM_BUG_ON(nr <= 0);
-	ret = atomic_sub_return(nr, &page->_refcount);
-	VM_BUG_ON_PAGE(ret < 0, page);
-
-	if (page_ref_tracepoint_active(page_ref_mod))
-		__page_ref_mod(page, -nr);
+	page_ref_add_return(page, nr);
 }
 
 static inline int page_ref_sub_return(struct page *page, int nr)
@@ -137,37 +108,14 @@ static inline int page_ref_sub_return(struct page *page, int nr)
 	return ret;
 }
 
-static inline void page_ref_inc(struct page *page)
-{
-	int ret = atomic_inc_return(&page->_refcount);
-
-	VM_BUG_ON_PAGE(ret <= 0, page);
-
-	if (page_ref_tracepoint_active(page_ref_mod))
-		__page_ref_mod(page, 1);
-}
-
-static inline void page_ref_dec(struct page *page)
+static inline void page_ref_sub(struct page *page, int nr)
 {
-	int ret = atomic_dec_return(&page->_refcount);
-
-	VM_BUG_ON_PAGE(ret < 0, page);
-
-	if (page_ref_tracepoint_active(page_ref_mod))
-		__page_ref_mod(page, -1);
+	page_ref_sub_return(page, nr);
 }
 
 static inline int page_ref_sub_and_test(struct page *page, int nr)
 {
-	int ret;
-
-	VM_BUG_ON(nr <= 0);
-	ret = atomic_sub_return(nr, &page->_refcount);
-	VM_BUG_ON_PAGE(ret < 0, page);
-
-	if (page_ref_tracepoint_active(page_ref_mod_and_test))
-		__page_ref_mod_and_test(page, -nr, ret);
-	return ret == 0;
+	return page_ref_sub_return(page, nr) == 0;
 }
 
 static inline int page_ref_inc_return(struct page *page)
@@ -181,15 +129,10 @@ static inline int page_ref_inc_return(struct page *page)
 	return ret;
 }
 
-static inline int page_ref_dec_and_test(struct page *page)
+static inline void page_ref_inc(struct page *page)
 {
-	int ret = atomic_dec_return(&page->_refcount);
 
-	VM_BUG_ON_PAGE(ret < 0, page);
-
-	if (page_ref_tracepoint_active(page_ref_mod_and_test))
-		__page_ref_mod_and_test(page, -1, ret);
-	return ret == 0;
+	page_ref_inc_return(page);
 }
 
 static inline int page_ref_dec_return(struct page *page)
@@ -203,6 +146,16 @@ static inline int page_ref_dec_return(struct page *page)
 	return ret;
 }
 
+static inline void page_ref_dec(struct page *page)
+{
+	page_ref_dec_return(page);
+}
+
+static inline int page_ref_dec_and_test(struct page *page)
+{
+	return page_ref_dec_return(page) == 0;
+}
+
 static inline int page_ref_add_unless(struct page *page, int nr, int u)
 {
 	int ret;
diff --git a/include/trace/events/page_ref.h b/include/trace/events/page_ref.h
index 87551bb1df9e..883d90508ca2 100644
--- a/include/trace/events/page_ref.h
+++ b/include/trace/events/page_ref.h
@@ -49,7 +49,7 @@ DEFINE_EVENT(page_ref_init_template, page_ref_init,
 	TP_ARGS(page)
 );
 
-DECLARE_EVENT_CLASS(page_ref_mod_template,
+DECLARE_EVENT_CLASS(page_ref_unfreeze_template,
 
 	TP_PROTO(struct page *page, int v),
 
@@ -83,14 +83,7 @@ DECLARE_EVENT_CLASS(page_ref_mod_template,
 		__entry->val)
 );
 
-DEFINE_EVENT(page_ref_mod_template, page_ref_mod,
-
-	TP_PROTO(struct page *page, int v),
-
-	TP_ARGS(page, v)
-);
-
-DECLARE_EVENT_CLASS(page_ref_mod_and_test_template,
+DECLARE_EVENT_CLASS(page_ref_mod_template,
 
 	TP_PROTO(struct page *page, int v, int ret),
 
@@ -126,35 +119,28 @@ DECLARE_EVENT_CLASS(page_ref_mod_and_test_template,
 		__entry->val, __entry->ret)
 );
 
-DEFINE_EVENT(page_ref_mod_and_test_template, page_ref_mod_and_test,
-
-	TP_PROTO(struct page *page, int v, int ret),
-
-	TP_ARGS(page, v, ret)
-);
-
-DEFINE_EVENT(page_ref_mod_and_test_template, page_ref_mod_and_return,
+DEFINE_EVENT(page_ref_mod_template, page_ref_mod_and_return,
 
 	TP_PROTO(struct page *page, int v, int ret),
 
 	TP_ARGS(page, v, ret)
 );
 
-DEFINE_EVENT(page_ref_mod_and_test_template, page_ref_mod_unless,
+DEFINE_EVENT(page_ref_mod_template, page_ref_mod_unless,
 
 	TP_PROTO(struct page *page, int v, int ret),
 
 	TP_ARGS(page, v, ret)
 );
 
-DEFINE_EVENT(page_ref_mod_and_test_template, page_ref_freeze,
+DEFINE_EVENT(page_ref_mod_template, page_ref_freeze,
 
 	TP_PROTO(struct page *page, int v, int ret),
 
 	TP_ARGS(page, v, ret)
 );
 
-DEFINE_EVENT(page_ref_mod_template, page_ref_unfreeze,
+DEFINE_EVENT(page_ref_unfreeze_template, page_ref_unfreeze,
 
 	TP_PROTO(struct page *page, int v),
 
diff --git a/mm/debug_page_ref.c b/mm/debug_page_ref.c
index e32149734122..1de9d93cca25 100644
--- a/mm/debug_page_ref.c
+++ b/mm/debug_page_ref.c
@@ -12,20 +12,6 @@ void __page_ref_init(struct page *page)
 EXPORT_SYMBOL(__page_ref_init);
 EXPORT_TRACEPOINT_SYMBOL(page_ref_init);
 
-void __page_ref_mod(struct page *page, int v)
-{
-	trace_page_ref_mod(page, v);
-}
-EXPORT_SYMBOL(__page_ref_mod);
-EXPORT_TRACEPOINT_SYMBOL(page_ref_mod);
-
-void __page_ref_mod_and_test(struct page *page, int v, int ret)
-{
-	trace_page_ref_mod_and_test(page, v, ret);
-}
-EXPORT_SYMBOL(__page_ref_mod_and_test);
-EXPORT_TRACEPOINT_SYMBOL(page_ref_mod_and_test);
-
 void __page_ref_mod_and_return(struct page *page, int v, int ret)
 {
 	trace_page_ref_mod_and_return(page, v, ret);
-- 
2.33.0.1079.g6e70778dc9-goog

