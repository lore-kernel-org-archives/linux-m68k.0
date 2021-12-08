Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DEA0C433EF
	for <linux-m68k@archiver.kernel.org>; Wed,  8 Dec 2021 20:36:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240455AbhLHUjd (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 8 Dec 2021 15:39:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240402AbhLHUj3 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 8 Dec 2021 15:39:29 -0500
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3717BC0617A2
        for <linux-m68k@lists.linux-m68k.org>; Wed,  8 Dec 2021 12:35:57 -0800 (PST)
Received: by mail-qv1-xf2e.google.com with SMTP id i13so3325482qvm.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 08 Dec 2021 12:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=fl012lbYwxHxKLRGEaFCBukqf325ONY6vMrvhFzajc4=;
        b=Om3EKJa9JkBQ3/exYw2B3y8QcQXr3XLHAWmrsf1qrbGoMy+A2cGu5jReBvGVCPkR4+
         hDBjqch1JjgL2dikAiy5MOULE1bwntbfSVyT4+pceFLvXwveMW3o+Af3gExKwl068JS8
         nMaKnEQUNNnHWgl27+yFR+aLuie6VxwdMa2Twg6vh9I/RhI9u9ewOILF8ekONEAKfdOy
         n0U8XSXFs1uRKi/7Y4+a2EmEqIHl/h6UuyQk/KCCT29WCO5RX6Jb4/SwhT1lY6YMkO3c
         n5jqn+4cKGoNBN4nHw0Hm0EHXkQzfjvDQQ1+mkDUNr82JvE/5Tr304ypL3ylLkxC9Ztp
         hG5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fl012lbYwxHxKLRGEaFCBukqf325ONY6vMrvhFzajc4=;
        b=RZneOBl7+lbDMJ4Np+cGQuxaPc+GZnNOB4I2NArmr+lXg0lQQZ4cY1p1UbcZ+7wu4+
         91FSF9O5ilt2WlH8b6tGvlcYCU0Pxk+oYcS3UKeTu6km1LqGGwkiItLgdFnSMB7XCAQg
         uvhRVSbIlAZU6GidIAb3Kfx5qgXKrrN7RdTKaQTo0CtzyPyKO+hao64zHJ5gsgTDgVlv
         gvtAAxnjBCpEsgYj8NwgCzBryQecfWrjL1TjFhp6FxoyxMkTXifi4Ko/0a0NT9Tz4B3O
         L+W2g9J/xej9WNmHEbOKKpOejFyuwz0qZhuJ3wiNjWmZVLSskdYfBRPOf3MdvYQzAe60
         L8Sw==
X-Gm-Message-State: AOAM530L/pL1KkKcgfXEx77ot9MyZyWoBYNATYf1KzURzXy08e1JzLZx
        yNjSoupgFkP+RChJooCb1xp8Eg==
X-Google-Smtp-Source: ABdhPJz0AXqWQx1xH0f1dHb3b35gcDCp0zKrnLcKzYEmnuKLPzBR55Tmt/GsDZa4yfAJbxQLl1V2kA==
X-Received: by 2002:a05:6214:21ae:: with SMTP id t14mr10996719qvc.66.1638995756224;
        Wed, 08 Dec 2021 12:35:56 -0800 (PST)
Received: from soleen.c.googlers.com.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id 143sm1898710qkg.87.2021.12.08.12.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 12:35:55 -0800 (PST)
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
Subject: [PATCH 06/10] mm: rename init_page_count() -> page_ref_init()
Date:   Wed,  8 Dec 2021 20:35:40 +0000
Message-Id: <20211208203544.2297121-7-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.34.1.400.ga245620fadb-goog
In-Reply-To: <20211208203544.2297121-1-pasha.tatashin@soleen.com>
References: <20211208203544.2297121-1-pasha.tatashin@soleen.com>
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
index 44d75a8d1b92..9a0ba44d4cde 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2470,7 +2470,7 @@ extern void reserve_bootmem_region(phys_addr_t start, phys_addr_t end);
 static inline void free_reserved_page(struct page *page)
 {
 	ClearPageReserved(page);
-	init_page_count(page);
+	page_ref_init(page);
 	__free_page(page);
 	adjust_managed_page_count(page, 1);
 }
diff --git a/include/linux/page_ref.h b/include/linux/page_ref.h
index 27880aca2e2f..ff946d753df8 100644
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
2.34.1.400.ga245620fadb-goog

