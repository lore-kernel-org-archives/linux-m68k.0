Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B782AC4332F
	for <linux-m68k@archiver.kernel.org>; Wed, 17 Nov 2021 01:21:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B67F63238
	for <linux-m68k@archiver.kernel.org>; Wed, 17 Nov 2021 01:21:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232420AbhKQBYF (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 16 Nov 2021 20:24:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231175AbhKQBYC (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 16 Nov 2021 20:24:02 -0500
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42AF2C061746
        for <linux-m68k@lists.linux-m68k.org>; Tue, 16 Nov 2021 17:21:05 -0800 (PST)
Received: by mail-qv1-xf35.google.com with SMTP id u16so870548qvk.4
        for <linux-m68k@lists.linux-m68k.org>; Tue, 16 Nov 2021 17:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=m0gNmNzkZWVRv6w7da8Aeqi7F4kIW5gL+hhpZ/Xzv/o=;
        b=Oml9J9TSmBupcaKreQn7f7AaxiWOab9NqOgMSRpCdwFjKq1vRO8SFVw0xCjUWh36fK
         ID7GeDWAFEyp6QTjWUO6Qd6yhs7maVhCTbEkQe6x5surd5bOuYo77KnXiy/Xwxb1lsGo
         QBoQjhym9uLxUbMyJyD3SH3A0aYwk3aPdoJjF8EL25b60dEtFQPVSAr6dLSkjZ5VhW6m
         1FnrlUSLA8LCLK2ltFKulS1YGN8F3gb0rxE5DTlo8s4UERjVa9RBGHcEuN9Nu5SY9yas
         1WrwtxT5KJY5a3AJFmMBjRLZ+WUZdGwRoyWgkVqHWyXCO2OZLxghzqSw7oxBkjQJCnDV
         jZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m0gNmNzkZWVRv6w7da8Aeqi7F4kIW5gL+hhpZ/Xzv/o=;
        b=6UYiOR+8sgfgw8gLc4uGup3hNGV798CPRt4V5qvZ6tzE3W0z1974/6ndMWAm82lVpl
         PpdoA1znXlEup2/khdPf39lNcUd0TH18elTlFFy106KMRhbmwtHA3rO2lzq1kw0NBBSs
         ftIplLonRV7GAYfli27WRPR/pJibvEOW+1ny8DhDMFNJw3Xv5Sqf4vajPKw4XBaqzDnY
         SPFApTTrxDZH6FHSP6Jm28bhv8vRcf17poRFPjKWi2Hu+pfQwHJVrYytLHFuIhkfF8Ef
         0YFLHhvGIGcZT0F9vgzWXMRdNfom0UrWvpxW5kG4aWUUT84QWW/cXQ24c38Hr2iqmCmT
         U7yA==
X-Gm-Message-State: AOAM530InrM+vyp51vgIAMKjHCBlPs5q4YoCuwOuwSc0uv9yae+kwZ+p
        prkTAfJhWjAIGqAlrInDjr7jvA==
X-Google-Smtp-Source: ABdhPJw0PBEl5FXxtC6aW72AUuzKgaD7PgHuWSgRVC63Pfy75/BltIYhkTIJgkOC+07BHxbZsDURzg==
X-Received: by 2002:ad4:54ca:: with SMTP id j10mr50057319qvx.2.1637112064465;
        Tue, 16 Nov 2021 17:21:04 -0800 (PST)
Received: from soleen.c.googlers.com.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id i6sm3482289qti.40.2021.11.16.17.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 17:21:04 -0800 (PST)
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
Subject: [RFC v2 03/10] mm: Avoid using set_page_count() in set_page_recounted()
Date:   Wed, 17 Nov 2021 01:20:52 +0000
Message-Id: <20211117012059.141450-4-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.34.0.rc1.387.gb447b232ab-goog
In-Reply-To: <20211117012059.141450-1-pasha.tatashin@soleen.com>
References: <20211117012059.141450-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

set_page_refcounted() converts a non-refcounted page that has
(page->_refcount == 0) into a refcounted page by setting _refcount to
1.

The current apporach uses the following logic:

VM_BUG_ON_PAGE(page_ref_count(page), page);
set_page_count(page, 1);

However, if _refcount changes from 0 to 1 between the VM_BUG_ON_PAGE()
and set_page_count() we can break _refcount, which can cause other
problems such as memory corruptions.

Instead, use a safer method: increment _refcount first and verify
that at increment time it was indeed 1.

refcnt = page_ref_inc_return(page);
VM_BUG_ON_PAGE(refcnt != 1, page);

Use page_ref_inc_return() to avoid unconditionally overwriting
the _refcount value with set_page_count(), and check the return value.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 mm/internal.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index 3b79a5c9427a..f601575b7e5a 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -132,9 +132,11 @@ static inline bool page_evictable(struct page *page)
  */
 static inline void set_page_refcounted(struct page *page)
 {
+	int refcnt;
+
 	VM_BUG_ON_PAGE(PageTail(page), page);
-	VM_BUG_ON_PAGE(page_ref_count(page), page);
-	set_page_count(page, 1);
+	refcnt = page_ref_inc_return(page);
+	VM_BUG_ON_PAGE(refcnt != 1, page);
 }
 
 extern unsigned long highest_memmap_pfn;
-- 
2.34.0.rc1.387.gb447b232ab-goog

