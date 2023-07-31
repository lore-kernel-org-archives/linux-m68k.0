Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26222C04E69
	for <linux-m68k@archiver.kernel.org>; Mon, 31 Jul 2023 17:05:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231974AbjGaRFB (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 31 Jul 2023 13:05:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232382AbjGaREV (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 31 Jul 2023 13:04:21 -0400
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B3882683
        for <linux-m68k@lists.linux-m68k.org>; Mon, 31 Jul 2023 10:03:47 -0700 (PDT)
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3490a0bb5cdso15889185ab.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 31 Jul 2023 10:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690823026; x=1691427826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IUMUqbW/uAIHfn0G4toP3JCuPKsaNgXF+JjYaBSaBaw=;
        b=LO7IgtMfV7D/5pieeNhzhX7jbefImFR1TuQgjSMNALZjO7jWhqLJ0NYlGohhp9vNEp
         P7qjRmM9tu3EiZV8IpnwyOsR5oR0G2xN8+6lkb99Xp3Pq2LKGQ1pnDBT3xTub9FDUFeD
         NiuludkMelWGqpPq5Si9scPBohunGQ7wjCbjn1MG6IHkoKqu0G6KIfhUmk1zbCODarzf
         JF+LluYmZmW6+nXXKHPD8kZWEQzzXdWA4gTgt31gpJPirIvHnT+QXlpNT9xuTR/Ob7I2
         6KYVvpK8cyw965ouTwB0qJzxRQ+l2kkvuwks4w7hfsZgPcLfFUXNyqFPQAdsNQn7UH4p
         LAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690823026; x=1691427826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IUMUqbW/uAIHfn0G4toP3JCuPKsaNgXF+JjYaBSaBaw=;
        b=F2b6gLw3WrQnJAOyle8pjcaEbr6yAgfqJ8hXnpE+oCLYTyt2tb9Stel8CbOhmlTFmU
         cxxJ+CzDbWpWb4rXz56rjAdg/xg37sCNp0bhAu/yCK4gTflR/KKgwxrrd96Pu52EYxvq
         2gZj8DxKV6q2qTHIYuTyUI5+iVp67vBIIug7wuF1GxfzuT9kkXjUpZf6FOE76JfaAUcU
         159UC6jxiJtESJBZ8ZD5NfwZzcN9OP/RzdSzK8GCM2nGvvINQp2gQfbFcPScVmFMYY6/
         oZihmUrdow4xnCinKGPnDM0nz656lsKcWJYKFx4pOVbS7TlDxqlpbSzHjlL2wLs5IB/H
         5Nig==
X-Gm-Message-State: ABy/qLb8EYPeI8WA3VBTr28IzuK4uFqDMvjKRq+7gLqkt+uz4LWwLAcC
        kn3EvAJIvifYZ1dwie/z5tA=
X-Google-Smtp-Source: APBJJlEWqZXE1sICWadhT2wO43hXTa2FHUgzTzYXN3XbSpmzVLjVyMFNIil8bQaSo4X4bLn1gewpKQ==
X-Received: by 2002:a05:6e02:924:b0:349:2498:ed90 with SMTP id o4-20020a056e02092400b003492498ed90mr1956382ilt.30.1690823025849;
        Mon, 31 Jul 2023 10:03:45 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id x31-20020a25ac9f000000b00c832ad2e2eesm2511833ybi.60.2023.07.31.10.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 10:03:45 -0700 (PDT)
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
Subject: [PATCH mm-unstable v8 04/31] mm: Convert pmd_pgtable_page() callers to use pmd_ptdesc()
Date:   Mon, 31 Jul 2023 10:03:05 -0700
Message-Id: <20230731170332.69404-5-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230731170332.69404-1-vishal.moola@gmail.com>
References: <20230731170332.69404-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Converts internal pmd_pgtable_page() callers to use pmd_ptdesc(). This
removes some direct accesses to struct page, working towards splitting
out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 include/linux/mm.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 3fda0ad41cf2..bf552a106e4a 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2971,7 +2971,7 @@ static inline struct ptdesc *pmd_ptdesc(pmd_t *pmd)
 
 static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 {
-	return ptlock_ptr(pmd_pgtable_page(pmd));
+	return ptlock_ptr(ptdesc_page(pmd_ptdesc(pmd)));
 }
 
 static inline bool pmd_ptlock_init(struct page *page)
@@ -2990,7 +2990,7 @@ static inline void pmd_ptlock_free(struct page *page)
 	ptlock_free(page);
 }
 
-#define pmd_huge_pte(mm, pmd) (pmd_pgtable_page(pmd)->pmd_huge_pte)
+#define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
 
 #else
 
-- 
2.40.1

