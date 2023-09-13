Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09E53EDEC4D
	for <linux-m68k@archiver.kernel.org>; Wed, 13 Sep 2023 13:45:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241002AbjIMNpQ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 13 Sep 2023 09:45:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241055AbjIMNpP (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 13 Sep 2023 09:45:15 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7CA019B6
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Sep 2023 06:45:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 58281B823DF;
        Wed, 13 Sep 2023 13:45:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ABE4C433C7;
        Wed, 13 Sep 2023 13:45:07 +0000 (UTC)
From:   Greg Ungerer <gerg@linux-m68k.org>
To:     linux-m68k@lists.linux-m68k.org
Cc:     geert@linux-m68k.org, Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 5/7] m68knommu: coldfire: remove unused variable in MMU code
Date:   Wed, 13 Sep 2023 23:44:23 +1000
Message-Id: <20230913134425.2610927-6-gerg@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230913134425.2610927-1-gerg@linux-m68k.org>
References: <20230913134425.2610927-1-gerg@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

When building with W=1:

  CC      arch/m68k/mm/mcfmmu.o
arch/m68k/mm/mcfmmu.c: In function ‘paging_init’:
arch/m68k/mm/mcfmmu.c:41:30: warning: variable ‘bootmem_end’ set but not used [-Wunused-but-set-variable]
  unsigned long next_pgtable, bootmem_end;
                              ^~~~~~~~~~~

Remove variable bootmem_end and its unused setting.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/mm/mcfmmu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/m68k/mm/mcfmmu.c b/arch/m68k/mm/mcfmmu.c
index a6efaa7cacde..9a6fa342e872 100644
--- a/arch/m68k/mm/mcfmmu.c
+++ b/arch/m68k/mm/mcfmmu.c
@@ -38,7 +38,7 @@ void __init paging_init(void)
 	pgd_t *pg_dir;
 	pte_t *pg_table;
 	unsigned long address, size;
-	unsigned long next_pgtable, bootmem_end;
+	unsigned long next_pgtable;
 	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0 };
 	int i;
 
@@ -57,7 +57,6 @@ void __init paging_init(void)
 		panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
 		      __func__, size, PAGE_SIZE);
 
-	bootmem_end = (next_pgtable + size + PAGE_SIZE) & PAGE_MASK;
 	pg_dir += PAGE_OFFSET >> PGDIR_SHIFT;
 
 	address = PAGE_OFFSET;
-- 
2.25.1

