Return-Path: <SRS0=2kwO=74=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78548C433E4
	for <linux-m68k@archiver.kernel.org>; Mon, 15 Jun 2020 07:25:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 618F7206E2
	for <linux-m68k@archiver.kernel.org>; Mon, 15 Jun 2020 07:25:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728568AbgFOHZ4 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 15 Jun 2020 03:25:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:39824 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728717AbgFOHZq (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Mon, 15 Jun 2020 03:25:46 -0400
Received: from goober.digi.com (unknown [103.48.210.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B093D206E2;
        Mon, 15 Jun 2020 07:25:44 +0000 (UTC)
From:   Greg Ungerer <gerg@linux-m68k.org>
To:     linux-m68k@vger.kernel.org
Cc:     Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 3/5] m68k: fix ColdFire mmu init compile warning
Date:   Mon, 15 Jun 2020 17:25:31 +1000
Message-Id: <20200615072531.2598963-1-gerg@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Compiling for MMU enabled ColdFire targets gives a warning:

  CC      arch/m68k/mm/mcfmmu.o
arch/m68k/mm/mcfmmu.c: In function ‘paging_init’:
arch/m68k/mm/mcfmmu.c:42:17: warning: unused variable ‘zone’ [-Wunused-variable]
  enum zone_type zone;
                 ^~~~

This was caused by changes in commit fa3354e4ea39 ("mm: free_area_init:
use maximal zone PFNs rather than zone sizes") leaving around a now
unused variable declaration. Remove the unused variable.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/mm/mcfmmu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/m68k/mm/mcfmmu.c b/arch/m68k/mm/mcfmmu.c
index 29f47923aa46..9d3549a16509 100644
--- a/arch/m68k/mm/mcfmmu.c
+++ b/arch/m68k/mm/mcfmmu.c
@@ -39,7 +39,6 @@ void __init paging_init(void)
 	unsigned long address, size;
 	unsigned long next_pgtable, bootmem_end;
 	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0 };
-	enum zone_type zone;
 	int i;
 
 	empty_zero_page = (void *) memblock_alloc(PAGE_SIZE, PAGE_SIZE);
-- 
2.25.1

