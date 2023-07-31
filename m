Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8216EC07E8C
	for <linux-m68k@archiver.kernel.org>; Mon, 31 Jul 2023 17:08:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230091AbjGaRIp (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 31 Jul 2023 13:08:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231279AbjGaRHM (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 31 Jul 2023 13:07:12 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EFC91BD8
        for <linux-m68k@lists.linux-m68k.org>; Mon, 31 Jul 2023 10:04:48 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-c2cf4e61bc6so4878545276.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 31 Jul 2023 10:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690823080; x=1691427880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JRfRtQSkmDpdaHgWU+x8J8rVDSFtmuGYMRjnXDV0vQY=;
        b=fypnJ8EOp6389G/yrEsdiBw8+ODFJB18UGVsK1WnMmuuyVJGZEMRFzagFIz/t/iUP/
         2hQUC88xrJTr5zC02f819WJdC4SisRLoHgth8vaUsDxgglJhi6MHYK2vk4aVYQFhtjHu
         EJ82jl2MiLVTmBE59Pwb2ZF5o5qt31wsfoof30f3jCxfq5PoYDaunPmGz2hyM4ah/4KD
         ydzqEb1pNZ1YIAh6SsOFxKI8oa6yw/2SpcLuoX5OxyBAJ0szyfenY4ClRYrgeaYLOg5P
         lgJjKay9Zm3G6SxJT2EV+hC0IYmKARvYedORBaKi0opdpa/X1F5LwQzjJG/maSgO9ToG
         3U/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690823080; x=1691427880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JRfRtQSkmDpdaHgWU+x8J8rVDSFtmuGYMRjnXDV0vQY=;
        b=RCCvVQ/SRlXQ88h39LNqCRsra+QQXvWgXCge5GfOoU0EZ6HS4JnmPFrhfftC7rysLI
         JRE4Sfo6plBVqPdeqclMHDX+YSwvpM47eGXvmd8yvkDYNrLRgWL2RSsj5iQnYetWq7Ra
         fGwpiQwB7bSQ0ZZhMISj0nGq0p8XMu4bCCChv9+C6qgvPgm1PrIPJZDXkghN6EtsofFk
         UG2xXCHqi060T8iJ3bKZf2Z4wc6vbiE57PYZQ4/7dwc4bYl3FoUvRPFSSJYRUq28cXUs
         3dADcUnZFgPck5YTskm0xlG3aiM+WkDOFYTxpGeUN73TsmgLHUQtzXvaZoF/PvKfDBkT
         LBHA==
X-Gm-Message-State: ABy/qLZRY7xWddl+FVqeeKRvcKvwzMpDuEBIRjxNLkHi3U/aiuoR551I
        /+FwBHwQ8BMMEUQ+qJ10c7U=
X-Google-Smtp-Source: APBJJlEdwhqcmTMrEtHQGs0fafmxeVWw9ywX+xXLwsxfbs/EAm9tmHsbV10DQDaT24PRZb9zbh9R9w==
X-Received: by 2002:a25:aca8:0:b0:d0b:2ff2:ff8 with SMTP id x40-20020a25aca8000000b00d0b2ff20ff8mr11589261ybi.21.1690823079964;
        Mon, 31 Jul 2023 10:04:39 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id x31-20020a25ac9f000000b00c832ad2e2eesm2511833ybi.60.2023.07.31.10.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 10:04:39 -0700 (PDT)
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
        Richard Weinberger <richard@nod.at>,
        Mike Rapoport <rppt@kernel.org>
Subject: [PATCH mm-unstable v8 30/31] um: Convert {pmd, pte}_free_tlb() to use ptdescs
Date:   Mon, 31 Jul 2023 10:03:31 -0700
Message-Id: <20230731170332.69404-31-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230731170332.69404-1-vishal.moola@gmail.com>
References: <20230731170332.69404-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents. Also cleans up some spacing issues.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/um/include/asm/pgalloc.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/um/include/asm/pgalloc.h b/arch/um/include/asm/pgalloc.h
index 8ec7cd46dd96..de5e31c64793 100644
--- a/arch/um/include/asm/pgalloc.h
+++ b/arch/um/include/asm/pgalloc.h
@@ -25,19 +25,19 @@
  */
 extern pgd_t *pgd_alloc(struct mm_struct *);
 
-#define __pte_free_tlb(tlb,pte, address)		\
-do {							\
-	pgtable_pte_page_dtor(pte);			\
-	tlb_remove_page((tlb),(pte));			\
+#define __pte_free_tlb(tlb, pte, address)			\
+do {								\
+	pagetable_pte_dtor(page_ptdesc(pte));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #ifdef CONFIG_3_LEVEL_PGTABLES
 
-#define __pmd_free_tlb(tlb, pmd, address)		\
-do {							\
-	pgtable_pmd_page_dtor(virt_to_page(pmd));	\
-	tlb_remove_page((tlb),virt_to_page(pmd));	\
-} while (0)						\
+#define __pmd_free_tlb(tlb, pmd, address)			\
+do {								\
+	pagetable_pmd_dtor(virt_to_ptdesc(pmd));			\
+	tlb_remove_page_ptdesc((tlb), virt_to_ptdesc(pmd));	\
+} while (0)
 
 #endif
 
-- 
2.40.1

