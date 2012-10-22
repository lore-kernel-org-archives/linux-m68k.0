From: <gerg@snapgear.com>
Subject: [PATCH] m68knommu: make non-MMU page_to_virt() return a void *
Date: Mon, 22 Oct 2012 15:51:30 +1000
Message-ID: <1350885090-5523-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:36538 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752163Ab2JVFrp (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 22 Oct 2012 01:47:45 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The page_to_virt() macro for m68knommu is currently effectively returning
an int type. But the equivilent m68k macro returns a void * virtual address.
Modify the non-MMU macro to return a void * as well (using the __va macro).

This change will remove compiler warnings in common m68k code that use this
macro.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/page_no.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/include/asm/page_no.h b/arch/m68k/include/asm/page_no.h
index 9059572..ef20916 100644
--- a/arch/m68k/include/asm/page_no.h
+++ b/arch/m68k/include/asm/page_no.h
@@ -26,7 +26,7 @@ extern unsigned long memory_end;
 #define pfn_to_virt(pfn)	__va((pfn) << PAGE_SHIFT)
 
 #define virt_to_page(addr)	(mem_map + (((unsigned long)(addr)-PAGE_OFFSET) >> PAGE_SHIFT))
-#define page_to_virt(page)	((((page) - mem_map) << PAGE_SHIFT) + PAGE_OFFSET)
+#define page_to_virt(page)	__va(((((page) - mem_map) << PAGE_SHIFT) + PAGE_OFFSET))
 
 #define pfn_to_page(pfn)	virt_to_page(pfn_to_virt(pfn))
 #define page_to_pfn(page)	virt_to_pfn(page_to_virt(page))
-- 
1.7.0.4
