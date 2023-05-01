Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F017C77B7C
	for <linux-m68k@archiver.kernel.org>; Mon,  1 May 2023 19:29:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233478AbjEAT3x (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 1 May 2023 15:29:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233223AbjEAT3X (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 1 May 2023 15:29:23 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 695ACE45
        for <linux-m68k@lists.linux-m68k.org>; Mon,  1 May 2023 12:28:57 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-63b4a64c72bso2020484b3a.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 01 May 2023 12:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969327; x=1685561327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qr6GrFg3nf2tpOD8Orpodgx1J1bZoReYY/j4MOttH8M=;
        b=UIGt4Rxs2HkrsHutpAYaiWsjpykN6YUUd9E7lUyM0xl9pxC5slr+PivAMCf0kJWRtN
         +uixoPZwp4Vkl4YHEUToQjjzNjvIathQteky2ye14eE7NbHDFgUdPJKRNVXQAhEugOmA
         SnKo0+DWLOVbHHUZvAiFOaLnHaj2/1PYZhJmFGNiABpmjR+0nby25eJKrDAKj84VfLsp
         mCPKXur9uRrX02YRe2GBv91KFh4j6FQNTVZMtFBm8+b26dYihW/DQX+FZ7CAta9Gp4QP
         rZEIiymi83HRxeSWeuBi69l3Fo9OQWMSSxYcww0ZzqBAzl9SsUUSi153JEf/pt3dBwk3
         OFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969327; x=1685561327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qr6GrFg3nf2tpOD8Orpodgx1J1bZoReYY/j4MOttH8M=;
        b=Y2SB0wYwBdkV+GjHZparbFl2qttAemKW9osM2a1QpY2YvTscKdNGsOd1vuryIPn7cO
         +R27sPRXAQgMaDbEtXMvVhOIMX32Sny5MS1bpitRlWno9EtV/erJQPWm6Yc/nDYS6ZPC
         k4iYsEprhzM6W1/9CAnO0e7zpJD7O5YlYyz1UrRsgn/fTB7rzh8SFPOi1rZpw8RoEXHi
         ldAAGGdyUUeki7otbJFyO+Yvm+vBz8CbqJFv0smYlOpiShCgADWIit1ltscBHzp9UJvK
         UFhBbe0MDWtLlJuWMM+M6cUPyqvtV470pgXfhfHQvOGATIIWNdr+9+pSHK2m0QPRwLTB
         dLiA==
X-Gm-Message-State: AC+VfDwImLkNyj/qz3DzjIMASSXHjFiRb9ptMncEdVcm8jtsi4jgQTET
        QICIKk6u26csl070La1IM6Y=
X-Google-Smtp-Source: ACHHUZ7U6exPykPvKxCgekHmX9KTHTAx49eIcN0vG+aTw+3qX+uTyRXMYpekTZ9RZqGTjPxZ9ZewtA==
X-Received: by 2002:a17:902:ecca:b0:1a6:4127:857 with SMTP id a10-20020a170902ecca00b001a641270857mr17426348plh.5.1682969326811;
        Mon, 01 May 2023 12:28:46 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::9a2c])
        by smtp.googlemail.com with ESMTPSA id u8-20020a170902bf4800b0019c13d032d8sm18175622pls.253.2023.05.01.12.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 12:28:46 -0700 (PDT)
From:   "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>
Cc:     linux-mm@kvack.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-openrisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-um@lists.infradead.org, xen-devel@lists.xenproject.org,
        kvm@vger.kernel.org,
        "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH v2 09/34] mm: Convert pmd_ptlock_init() to use ptdescs
Date:   Mon,  1 May 2023 12:28:04 -0700
Message-Id: <20230501192829.17086-10-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501192829.17086-1-vishal.moola@gmail.com>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

This removes some direct accesses to struct page, working towards
splitting out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/mm.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 49fdc1199bd4..044c9f874b47 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2903,12 +2903,12 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 	return ptlock_ptr(pmd_ptdesc(pmd));
 }
 
-static inline bool pmd_ptlock_init(struct page *page)
+static inline bool pmd_ptlock_init(struct ptdesc *ptdesc)
 {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
-	page->pmd_huge_pte = NULL;
+	ptdesc->pmd_huge_pte = NULL;
 #endif
-	return ptlock_init(page);
+	return ptlock_init(ptdesc_page(ptdesc));
 }
 
 static inline void pmd_ptlock_free(struct page *page)
@@ -2928,7 +2928,7 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 	return &mm->page_table_lock;
 }
 
-static inline bool pmd_ptlock_init(struct page *page) { return true; }
+static inline bool pmd_ptlock_init(struct ptdesc *ptdesc) { return true; }
 static inline void pmd_ptlock_free(struct page *page) {}
 
 #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
@@ -2944,7 +2944,7 @@ static inline spinlock_t *pmd_lock(struct mm_struct *mm, pmd_t *pmd)
 
 static inline bool pgtable_pmd_page_ctor(struct page *page)
 {
-	if (!pmd_ptlock_init(page))
+	if (!pmd_ptlock_init(page_ptdesc(page)))
 		return false;
 	__SetPageTable(page);
 	inc_lruvec_page_state(page, NR_PAGETABLE);
-- 
2.39.2

