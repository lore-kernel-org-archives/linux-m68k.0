Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3785AC04A6A
	for <linux-m68k@archiver.kernel.org>; Thu, 22 Jun 2023 20:59:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231530AbjFVU7M (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 22 Jun 2023 16:59:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231271AbjFVU7B (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 22 Jun 2023 16:59:01 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D3462940
        for <linux-m68k@lists.linux-m68k.org>; Thu, 22 Jun 2023 13:58:24 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-6b46f27f562so5805a34.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 22 Jun 2023 13:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687467487; x=1690059487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5MMx6i8bJUxARp5QNqsq1CJUY3hOxlwkAEMcUNtK7dI=;
        b=UdIEW49a6VlVFdeDO40XUMIhkzu0TZbzMPBM/WacFFYU0Mf2IMmAOz+NL1cV98Ton4
         4zQ7N3mgDzFH/zAeyyuA7dsXAtz6L9a3ryBLZR0keuhq84g9s5CyaVK84D28lhUtpY1k
         n1Pbrc0aBtOd2I2lssPU62Gn+t4FuAK2YSMld5ItzYd2Gb7upO15jx4dCKR0ZoMoveD4
         fYCQ1IFYfK8OlRQ+gZ/yAiK4LxmWYPlg8lrZ4XnMaYZEtLSmgFLWfXItXcddGU79r9OH
         9d/82j8McTJZKyaaoZkqZMldnjmKIChpQ0nH7tpNr90msjJzxK9KTHEvxYDWGujERLdc
         e96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687467487; x=1690059487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5MMx6i8bJUxARp5QNqsq1CJUY3hOxlwkAEMcUNtK7dI=;
        b=VC7XI/qbj1BeEAOqeStejKRWK7vJn1buIoAX1Z+FbTloRjfQRWj8+RU6gB/gXfg1Nj
         sNjrf29/zVww9j+pXp5dgqgo0uPAL9j9eZOXZBF8EAoS2hlpRr7aPQEVr5vRifvGHo7G
         CjXhcv4XSIR5Zu+hnrV0CfNFsPZIvTUah5qLs0hUnKLxsKBHNf8+WuvU58LlJvkKUvYD
         ctE+rbQpnQ3etrDcFCVwvjky7DjUi23Rg49CQxcdeaMNBlHtYHBgBlH2/N7fYfnXoZEq
         yOWSeOiOuqvH0nqb6ZA884bZuIDbzA+v+M1smyVmoOXJbm9VLwmagYWmL2meiX8Yg3S6
         9zkQ==
X-Gm-Message-State: AC+VfDy1L74IBTxnqLAefaHl36cHmZxrtAc0CiL00upy19UDfqyibS2E
        zT+mO7YxN4CCShLhegL0Qec=
X-Google-Smtp-Source: ACHHUZ5msoxCs4WtHFESbyMK1EuaDf4wukFNhVJUOVId63qr2aSW3HXx+zFK0CBZB4PkAluxQSVOjw==
X-Received: by 2002:a05:6359:2ea4:b0:12b:e5b1:1c9c with SMTP id rp36-20020a0563592ea400b0012be5b11c9cmr10630381rwb.14.1687467486510;
        Thu, 22 Jun 2023 13:58:06 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::36])
        by smtp.googlemail.com with ESMTPSA id d18-20020a5b0c52000000b00bc501a1b062sm1684937ybr.42.2023.06.22.13.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 13:58:06 -0700 (PDT)
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
Subject: [PATCH v5 05/33] mm: Convert pmd_pgtable_page() to pmd_ptdesc()
Date:   Thu, 22 Jun 2023 13:57:17 -0700
Message-Id: <20230622205745.79707-6-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230622205745.79707-1-vishal.moola@gmail.com>
References: <20230622205745.79707-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Converts pmd_pgtable_page() to pmd_ptdesc() and all its callers. This
removes some direct accesses to struct page, working towards splitting
out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 include/linux/mm.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 14d95d494958..1511faf0263c 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2915,15 +2915,15 @@ pte_t *pte_offset_map_nolock(struct mm_struct *mm, pmd_t *pmd,
 
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
@@ -2942,7 +2942,7 @@ static inline void pmd_ptlock_free(struct page *page)
 	ptlock_free(page);
 }
 
-#define pmd_huge_pte(mm, pmd) (pmd_pgtable_page(pmd)->pmd_huge_pte)
+#define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
 
 #else
 
-- 
2.40.1

