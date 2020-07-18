Return-Path: <SRS0=yKKv=A5=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD5A5C433E2
	for <linux-m68k@archiver.kernel.org>; Sat, 18 Jul 2020 16:27:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA2412080D
	for <linux-m68k@archiver.kernel.org>; Sat, 18 Jul 2020 16:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595089625;
	bh=agDIr7jXigLTmuksasu1JTGAMYgcAul/JJMSKvu6yG8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=XZ6xm9mXdA3k/QCkj1TSSlEftQo3EFwBuFm9e3Sa/qTlLbAsNfMiAePbnhHbZtkcF
	 plQJQ6gbTvdsPYFcdEzj7s3PsZHs5rjs2NvvCUFlNa5ze7kByM4TPTmjxT/iNNa+q1
	 Jvljt3edjDxM8Fpl83AwSYtPK67V6b+Raov5Ht+g=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727037AbgGRQ1F (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 18 Jul 2020 12:27:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:36564 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726346AbgGRQ1F (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 18 Jul 2020 12:27:05 -0400
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EDD3020829;
        Sat, 18 Jul 2020 16:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595089624;
        bh=agDIr7jXigLTmuksasu1JTGAMYgcAul/JJMSKvu6yG8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aw35WWbgZi+tPMk25mB85PUjKy2+IIu/4kDVwwPEEuPjofl4p46YQcb+1t9i1qz88
         eLdU80kChA2+fBcgPfCyuUjjsbL8z+GZA+VCV9nKOSj8qj2b2LYAlq58SYBe47GDE3
         sEb3VvL4SOz3TtcF9syLkaIZlhhnDD99KdtfbYLw=
From:   Mike Rapoport <rppt@kernel.org>
To:     linux-m68k@lists.linux-m68k.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Andreas Schwab <schwab@linux-m68k.org>,
        Finn Thain <fthain@telegraphics.com.au>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Mike Rapoport <rppt@kernel.org>
Subject: [PATCH v3 2/3] m68k/mm: enable use of generic memory_model.h for !DISCONTIGMEM
Date:   Sat, 18 Jul 2020 19:26:50 +0300
Message-Id: <20200718162651.26538-3-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200718162651.26538-1-rppt@kernel.org>
References: <20200718162651.26538-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

From: Mike Rapoport <rppt@linux.ibm.com>

The pg_data_map and pg_data_table arrays as well as page_to_pfn() and
pfn_to_page() are required only for DISCONTIGMEM. Other memory models can
use the generic definitions in asm-generic/memory_model.h.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/m68k/include/asm/page.h        | 2 ++
 arch/m68k/include/asm/page_mm.h     | 5 +++++
 arch/m68k/include/asm/virtconvert.h | 2 +-
 arch/m68k/mm/init.c                 | 6 +++---
 4 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/include/asm/page.h b/arch/m68k/include/asm/page.h
index 2614a1206f2f..6116d7094292 100644
--- a/arch/m68k/include/asm/page.h
+++ b/arch/m68k/include/asm/page.h
@@ -62,8 +62,10 @@ extern unsigned long _ramend;
 #include <asm/page_no.h>
 #endif
 
+#ifdef CONFIG_DISCONTIGMEM
 #define __phys_to_pfn(paddr)	((unsigned long)((paddr) >> PAGE_SHIFT))
 #define __pfn_to_phys(pfn)	PFN_PHYS(pfn)
+#endif
 
 #include <asm-generic/getorder.h>
 
diff --git a/arch/m68k/include/asm/page_mm.h b/arch/m68k/include/asm/page_mm.h
index 0e794051d3bb..7f5912af2a52 100644
--- a/arch/m68k/include/asm/page_mm.h
+++ b/arch/m68k/include/asm/page_mm.h
@@ -153,6 +153,7 @@ static inline __attribute_const__ int __virt_to_node_shift(void)
 	pfn_to_virt(page_to_pfn(page));					\
 })
 
+#ifdef CONFIG_DISCONTIGMEM
 #define pfn_to_page(pfn) ({						\
 	unsigned long __pfn = (pfn);					\
 	struct pglist_data *pgdat;					\
@@ -165,6 +166,10 @@ static inline __attribute_const__ int __virt_to_node_shift(void)
 	pgdat = &pg_data_map[page_to_nid(__p)];				\
 	((__p) - pgdat->node_mem_map) + pgdat->node_start_pfn;		\
 })
+#else
+#define ARCH_PFN_OFFSET (m68k_memory[0].addr)
+#include <asm-generic/memory_model.h>
+#endif
 
 #define virt_addr_valid(kaddr)	((void *)(kaddr) >= (void *)PAGE_OFFSET && (void *)(kaddr) < high_memory)
 #define pfn_valid(pfn)		virt_addr_valid(pfn_to_virt(pfn))
diff --git a/arch/m68k/include/asm/virtconvert.h b/arch/m68k/include/asm/virtconvert.h
index dfe43083b579..751bb6f4aaf6 100644
--- a/arch/m68k/include/asm/virtconvert.h
+++ b/arch/m68k/include/asm/virtconvert.h
@@ -31,7 +31,7 @@ static inline void *phys_to_virt(unsigned long address)
 /* Permanent address of a page. */
 #if defined(CONFIG_MMU) && defined(CONFIG_SINGLE_MEMORY_CHUNK)
 #define page_to_phys(page) \
-	__pa(PAGE_OFFSET + (((page) - pg_data_map[0].node_mem_map) << PAGE_SHIFT))
+	__pa(PAGE_OFFSET + (((page) - mem_map) << PAGE_SHIFT))
 #else
 #define page_to_phys(page)	(page_to_pfn(page) << PAGE_SHIFT)
 #endif
diff --git a/arch/m68k/mm/init.c b/arch/m68k/mm/init.c
index 4b46ceace3d3..14c1e541451c 100644
--- a/arch/m68k/mm/init.c
+++ b/arch/m68k/mm/init.c
@@ -42,12 +42,12 @@ EXPORT_SYMBOL(empty_zero_page);
 
 #ifdef CONFIG_MMU
 
-pg_data_t pg_data_map[MAX_NUMNODES];
-EXPORT_SYMBOL(pg_data_map);
-
 int m68k_virt_to_node_shift;
 
 #ifdef CONFIG_DISCONTIGMEM
+pg_data_t pg_data_map[MAX_NUMNODES];
+EXPORT_SYMBOL(pg_data_map);
+
 pg_data_t *pg_data_table[65];
 EXPORT_SYMBOL(pg_data_table);
 #endif
-- 
2.26.2

