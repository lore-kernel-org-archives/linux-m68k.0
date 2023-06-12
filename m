Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 508CDC88CBE
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Jun 2023 21:08:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238432AbjFLVIb (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 12 Jun 2023 17:08:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232987AbjFLVHy (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 12 Jun 2023 17:07:54 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24C3D1728
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jun 2023 14:04:59 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-56d2ac0d990so21799207b3.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jun 2023 14:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603898; x=1689195898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIxlKckYoNWIlWWgwnqqyBbBSaaTtt3uqS2t74G/Cdc=;
        b=dEzJOtzxLU2ZgnRZWUoqUgX1LkEqjEDlA4j+okrU2e6EDfoTOSvMm21aq2NnoI678R
         /LX1XChQ5Sb6AvjVNxtMPEQadtzbeWOF+8rQnJrR7+vmusoCvLySLO14WPjcNIRUT0dF
         2rQMLU3uAHVNRz0iVUR14QRbNE3w1MtZleas6+gopDWiSHJ7z9AcD/gIo2kO1Qn8dYbq
         016n5ev0Z4+orrxhRkS9jR7LRRnc2lkVCuuqKiR89ABW/c7EVFAaF7NtNMlO51k6MesR
         a4Umst3ZsGaDroxenZAsFOjCXCF1Egq8LClHBVmEapvlxmVVyTvGXFdEnpS3DAZrTLmY
         PBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603898; x=1689195898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yIxlKckYoNWIlWWgwnqqyBbBSaaTtt3uqS2t74G/Cdc=;
        b=Sguw80cJWpyt1lQVgAwCfAH/bvAWraNtNQM1FfLVYuhZWuLnXo6cImTaSw7we6QSnH
         9M3EzWkhBnWOgkMNHJX84i39C+kk6QBbEKmtHmXyT3gU1awq9DSwoKpy7/GENvp9e+SB
         ZPnUFY+HG+oduoC2iW20R+jp+fP5Gv0TmrDhap1i1IDApmfKJ3vD5fDhLVIcAfYo2MIo
         USUGFGsTWcOz8ZV0F+ON9Xxt3ekqF0rSXeA1YYoQ5W+a2P0GST70xgS7wcpz0Dzzdaxn
         b3vYvD3BKXZxwUVWJnMXLDNkG747OlWyACeP0+3qg0MgRE55Ed/fwCIu4DquwTJEmhsX
         fJKQ==
X-Gm-Message-State: AC+VfDxWbV2uml51z7Sib6Kvx5/VeYIz7CF1S2ZbGMQGy8zKEDeSYLcy
        l0GDiyQaWeNkVf3Nd9N7h+A=
X-Google-Smtp-Source: ACHHUZ6/Iw+ntCpwv4qU9urdFcPsYepvqoySZLtVMefOmpx6b7rcyARehfEWJ2myv62OL0MPJVk5RA==
X-Received: by 2002:a81:7287:0:b0:561:b246:77df with SMTP id n129-20020a817287000000b00561b24677dfmr12849071ywc.16.1686603898264;
        Mon, 12 Jun 2023 14:04:58 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 14:04:58 -0700 (PDT)
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
        "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH v4 06/34] mm: Convert pmd_pgtable_page() to pmd_ptdesc()
Date:   Mon, 12 Jun 2023 14:03:55 -0700
Message-Id: <20230612210423.18611-7-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612210423.18611-1-vishal.moola@gmail.com>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Converts pmd_pgtable_page() to pmd_ptdesc() and all its callers. This
removes some direct accesses to struct page, working towards splitting
out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/mm.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index f184f1eba85d..088b7664f897 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2931,15 +2931,15 @@ static inline void pgtable_pte_page_dtor(struct page *page)
 
 #if USE_SPLIT_PMD_PTLOCKS
 
-static inline struct page *pmd_pgtable_page(pmd_t *pmd)
+static inline struct ptdesc *pmd_ptdesc(pmd_t *pmd)
 {
 	unsigned long mask = ~(PTRS_PER_PMD * sizeof(pmd_t) - 1);
-	return virt_to_page((void *)((unsigned long) pmd & mask));
+	return virt_to_ptdesc((void *)((unsigned long) pmd & mask));
 }
 
 static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 {
-	return ptlock_ptr(pmd_pgtable_page(pmd));
+	return ptlock_ptr(ptdesc_page(pmd_ptdesc(pmd)));
 }
 
 static inline bool pmd_ptlock_init(struct page *page)
@@ -2958,7 +2958,7 @@ static inline void pmd_ptlock_free(struct page *page)
 	ptlock_free(page);
 }
 
-#define pmd_huge_pte(mm, pmd) (pmd_pgtable_page(pmd)->pmd_huge_pte)
+#define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
 
 #else
 
-- 
2.40.1

