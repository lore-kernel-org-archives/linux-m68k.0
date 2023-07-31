Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C04EC04A94
	for <linux-m68k@archiver.kernel.org>; Mon, 31 Jul 2023 17:05:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbjGaRFD (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 31 Jul 2023 13:05:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233821AbjGaRE0 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 31 Jul 2023 13:04:26 -0400
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B933273F
        for <linux-m68k@lists.linux-m68k.org>; Mon, 31 Jul 2023 10:03:57 -0700 (PDT)
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3492c49c649so2038085ab.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 31 Jul 2023 10:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690823036; x=1691427836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iZ7ozcISUSGoixC5UzzNE5tJz0+L18C1Imj6XmV/DYM=;
        b=YpVyYPxPRtPTKHT9+tyvzqfvzCuhkFnhsMCX6nJF7RWviYaDE6pxTcvqFICRytHQ3F
         mk3OEWmycmo6ouKKcTZJZ/J9GI0O0U+IOIhkq6cf5NcWzs3F3Ep7I9wPm/bnxo3IbGbP
         5A5D1El9yg833uJSmp138hZ30DYMCVkIUWUYXAVHfkbTx4hT6PxevukL8QnCpSiv14Rw
         Ab1JsXOoVAvxWjOf0Fsk8pxufrrxg62ZUs/sWVYn8yXcxdG4Ij3aN3bFcjr1GQQkDcpq
         XCDoC5WGNDUaZUPNMTX8kXKJ799hVc0z6s0hq6YfOkQjqMhJ1aFCFD+uKI8XA047G16z
         xszQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690823036; x=1691427836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iZ7ozcISUSGoixC5UzzNE5tJz0+L18C1Imj6XmV/DYM=;
        b=HCw7kvjFJTUyIwFj9+2z9NjEo2+s/XHweLwFzM0iyZHFfNVjUC2hCqtcIZYSSlggIi
         Wn+7OADbkg/KtR27Ds5zLGuoHPoARua4vSkDBl8FJXNGRhe1Hp2QzmK+niS3Qk+bo7I4
         ZVOdTpEtEb5ZsHCMEJUsqIvKoLI07YAF6m8nGXmoOEibMBmpVD6DGRK90yG9baLUPTzx
         hiq1Wfbw/Nh285RAWlTTA0XyCrTdn98rM0cv7WRSW3kLnprQOydOl5+1sNdWst6UGZvv
         rjU2H1yuZAhLpBXZ4zPkiY1Mt/b7h2MGPAehSL8ttoDMcVkf+JB7Ye06bhsRMtNOZmKD
         tOVA==
X-Gm-Message-State: ABy/qLYGRRj1UEk6h5yptnZICiwm8nNJ3KRtjw3h45SZuDZ9Kvdm6TdD
        4ln2Ae8R16eEEKoGZt8emJk=
X-Google-Smtp-Source: APBJJlHoVkOsri9H/NdsUsto2q+Ey0kzzV9aD886+MBagBeourqVjWpbCtZ0aJitRhXpadhn4PaeZQ==
X-Received: by 2002:a05:6e02:1c26:b0:348:b910:313d with SMTP id m6-20020a056e021c2600b00348b910313dmr9675086ilh.14.1690823035707;
        Mon, 31 Jul 2023 10:03:55 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id x31-20020a25ac9f000000b00c832ad2e2eesm2511833ybi.60.2023.07.31.10.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 10:03:55 -0700 (PDT)
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
        kvm@vger.kernel.org, Hugh Dickins <hughd@google.com>,
        "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
        Mike Rapoport <rppt@kernel.org>
Subject: [PATCH mm-unstable v8 09/31] mm: Convert pmd_ptlock_free() to use ptdescs
Date:   Mon, 31 Jul 2023 10:03:10 -0700
Message-Id: <20230731170332.69404-10-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230731170332.69404-1-vishal.moola@gmail.com>
References: <20230731170332.69404-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

This removes some direct accesses to struct page, working towards
splitting out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 include/linux/mm.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 675972d3f7e4..774fe83c0c16 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2982,12 +2982,12 @@ static inline bool pmd_ptlock_init(struct ptdesc *ptdesc)
 	return ptlock_init(ptdesc);
 }
 
-static inline void pmd_ptlock_free(struct page *page)
+static inline void pmd_ptlock_free(struct ptdesc *ptdesc)
 {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
-	VM_BUG_ON_PAGE(page->pmd_huge_pte, page);
+	VM_BUG_ON_PAGE(ptdesc->pmd_huge_pte, ptdesc_page(ptdesc));
 #endif
-	ptlock_free(page);
+	ptlock_free(ptdesc_page(ptdesc));
 }
 
 #define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
@@ -3000,7 +3000,7 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 }
 
 static inline bool pmd_ptlock_init(struct ptdesc *ptdesc) { return true; }
-static inline void pmd_ptlock_free(struct page *page) {}
+static inline void pmd_ptlock_free(struct ptdesc *ptdesc) {}
 
 #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
 
@@ -3024,7 +3024,7 @@ static inline bool pgtable_pmd_page_ctor(struct page *page)
 
 static inline void pgtable_pmd_page_dtor(struct page *page)
 {
-	pmd_ptlock_free(page);
+	pmd_ptlock_free(page_ptdesc(page));
 	__ClearPageTable(page);
 	dec_lruvec_page_state(page, NR_PAGETABLE);
 }
-- 
2.40.1

