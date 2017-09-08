From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 2/3] m68k: fix ColdFire node shift size calculation
Date: Fri,  8 Sep 2017 17:01:00 +1000
Message-ID: <1504854061-12830-3-git-send-email-gerg@linux-m68k.org>
References: <1504854061-12830-1-git-send-email-gerg@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out6.external.iinet.net.au ([203.59.1.106]:28539
        "EHLO icp-osb-irony-out6.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1754870AbdIHHKt (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 8 Sep 2017 03:10:49 -0400
In-Reply-To: <1504854061-12830-1-git-send-email-gerg@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org, Greg Ungerer <gerg@linux-m68k.org>

The m68k pg_data_table is a fix size array defined in arch/m68k/mm/init.c.
Index numbers within it are defined based on memory size. But for Coldfire
these don't take into account a non-zero physical RAM base address, and this
causes us to access past the end of this array at system start time.

Change the node shift calculation so that we keep the index inside its range.

Reported-by: Angelo Dureghello <angelo@sysam.it>
Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/mm/mcfmmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/mm/mcfmmu.c b/arch/m68k/mm/mcfmmu.c
index 12fe55b..61e148e 100644
--- a/arch/m68k/mm/mcfmmu.c
+++ b/arch/m68k/mm/mcfmmu.c
@@ -169,7 +169,7 @@ void __init cf_bootmem_alloc(void)
 	max_pfn = max_low_pfn = PFN_DOWN(_ramend);
 	high_memory = (void *)_ramend;
 
-	m68k_virt_to_node_shift = fls(_ramend - _rambase - 1) - 6;
+	m68k_virt_to_node_shift = fls(_ramend - 1) - 6;
 	module_fixup(NULL, __start_fixup, __stop_fixup);
 
 	/* setup bootmem data */
-- 
1.9.1
