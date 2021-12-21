Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0BC5C433EF
	for <linux-m68k@archiver.kernel.org>; Tue, 21 Dec 2021 15:01:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238779AbhLUPB5 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 21 Dec 2021 10:01:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235839AbhLUPBu (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 21 Dec 2021 10:01:50 -0500
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8204C061757
        for <linux-m68k@lists.linux-m68k.org>; Tue, 21 Dec 2021 07:01:49 -0800 (PST)
Received: by mail-qk1-x733.google.com with SMTP id p4so12779574qkm.7
        for <linux-m68k@lists.linux-m68k.org>; Tue, 21 Dec 2021 07:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=SsQjilbSmtOxN4/+kaclrIIaX0+LAsp7vHqyKiKMlRY=;
        b=gcBvZoUtrYF3NYCTKHXzdceQiMgG3aqp8QQC/1YCPMu//H6PPmBh6cbnqiASj5UIOO
         2wJEeGwU4eOhh4IP+XQ974yhSApwdUidA9SYQadh0fRVAuP4IbUKVo6lqjggb2oOK5lq
         DM9iFM+R8v7OAN4Xa6Lb1xPTsXCEgta3V/iUyRbPzgcSGntUN2RXWivv3j6pSrJn7CpH
         Pmj2c2F8EET1EyM0FQ3c/4EfrGh5jpd71L68gnn3IL+M+OT4a47k1HGc4YJWxVgW0tYd
         njGijwXT7U5gG64oLXvjZ4CFri64I8WnnI91/PXtSVFrpKzw5l/A1IG64P1bXl6rX+p8
         uPcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SsQjilbSmtOxN4/+kaclrIIaX0+LAsp7vHqyKiKMlRY=;
        b=Va5rFSDQQrYcpXd8pcjXlldOEv53dzrHG8KjH6bkw+ahAnuscZTo7j6UadgxHbOhiG
         iIEQBeFXFxbD3KSKe/MFGgeE6XLdxqTHe8R/KebRrW8oHXcpKsjktvvHu4OBvrDfsDgb
         qD9eGTX7B7MkypHTbtCfgZakGd0Zg38wqEyXa98GayeEhpqFnopBkf9hgegKBniy0PeP
         65av3Q5/X95lggQ/pNxmKEKHx+nUB0u/vEn0954Z+qgnbTfT9ySYiiWR2LTfY3+nciS/
         g1UCqcxPs8NEzcr1Tn/7h90nWKhZCxliI4uD2uRJcjNkMAnfOL4GK0iDts/XoRI6XkHg
         XfkQ==
X-Gm-Message-State: AOAM531Lnvv7kvdET9JRgdEMh23YpHmRHeZb/9gfAhd5/dG2ZcK3g1FS
        SFOF/se6T6yQJaKMonnNX19nuQ==
X-Google-Smtp-Source: ABdhPJzRSE2PQv8kZTNTCLI9TYbronVdzGDNuPGOGxLks2rlUw8onAlSVNgM6PFYon6DnS7EEo9SMg==
X-Received: by 2002:a05:620a:2989:: with SMTP id r9mr2208491qkp.630.1640098908598;
        Tue, 21 Dec 2021 07:01:48 -0800 (PST)
Received: from soleen.c.googlers.com.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id d4sm1991371qkn.79.2021.12.21.07.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 07:01:48 -0800 (PST)
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
Subject: [PATCH v2 5/9] mm: rename init_page_count() -> page_ref_init()
Date:   Tue, 21 Dec 2021 15:01:36 +0000
Message-Id: <20211221150140.988298-6-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.34.1.307.g9b7440fafd-goog
In-Reply-To: <20211221150140.988298-1-pasha.tatashin@soleen.com>
References: <20211221150140.988298-1-pasha.tatashin@soleen.com>
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
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/mm/motorola.c  |  2 +-
 include/linux/mm.h       |  2 +-
 include/linux/page_ref.h | 10 +++++++---
 mm/page_alloc.c          |  2 +-
 4 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
index ecbe948f4c1a..dd3b77d03d5c 100644
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
index d211a06784d5..fae3b6ef66a5 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2451,7 +2451,7 @@ extern void reserve_bootmem_region(phys_addr_t start, phys_addr_t end);
 static inline void free_reserved_page(struct page *page)
 {
 	ClearPageReserved(page);
-	init_page_count(page);
+	page_ref_init(page);
 	__free_page(page);
 	adjust_managed_page_count(page, 1);
 }
diff --git a/include/linux/page_ref.h b/include/linux/page_ref.h
index 03e21ce2f1bd..1af12a0d7ba1 100644
--- a/include/linux/page_ref.h
+++ b/include/linux/page_ref.h
@@ -107,10 +107,14 @@ static inline void folio_set_count(struct folio *folio, int v)
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
index 13d989d62012..000c057a2d24 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1569,7 +1569,7 @@ static void __meminit __init_single_page(struct page *page, unsigned long pfn,
 {
 	mm_zero_struct_page(page);
 	set_page_links(page, zone, nid, pfn);
-	init_page_count(page);
+	page_ref_init(page);
 	page_mapcount_reset(page);
 	page_cpupid_reset_last(page);
 	page_kasan_tag_reset(page);
-- 
2.34.1.307.g9b7440fafd-goog

