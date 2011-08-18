From: Ian Campbell <ian.campbell@citrix.com>
Subject: [PATCH] m68k: fix __page_to_pfn for a const struct page argument
Date: Thu, 18 Aug 2011 09:37:02 +0100
Message-ID: <1313656622-25975-1-git-send-email-ian.campbell@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp02.citrix.com ([66.165.176.63]:65068 "EHLO
	SMTP02.CITRIX.COM" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752826Ab1HRIhH (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 18 Aug 2011 04:37:07 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Ian Campbell <ian.campbell@citrix.com>, Andrew Morton <akpm@linux-foundation.org>, Geert Uytterhoeven <geert@linux-m68k.org>

Fixes fallout due to the removal of the cast in
mm-fix-__page_to_pfn-for-a-const-struct-page-argument.patch

(akpm: this should probably be folded into that patch. I glanced over the other
       architectures which appear not to use include/asm-generic/memory_model.h
       and they appear to follow the other pattern (using ptr arithmetic) and
       hence I think aren't susceptible to this issue).

Signed-off-by: Ian Campbell <ian.campbell@citrix.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
---
 arch/m68k/include/asm/page_mm.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/include/asm/page_mm.h b/arch/m68k/include/asm/page_mm.h
index 31d5570..89f2014 100644
--- a/arch/m68k/include/asm/page_mm.h
+++ b/arch/m68k/include/asm/page_mm.h
@@ -162,7 +162,7 @@ static inline __attribute_const__ int __virt_to_node_shift(void)
 	pgdat->node_mem_map + (__pfn - pgdat->node_start_pfn);		\
 })
 #define page_to_pfn(_page) ({						\
-	struct page *__p = (_page);					\
+	const struct page *__p = (_page);				\
 	struct pglist_data *pgdat;					\
 	pgdat = &pg_data_map[page_to_nid(__p)];				\
 	((__p) - pgdat->node_mem_map) + pgdat->node_start_pfn;		\
-- 
1.7.2.5
