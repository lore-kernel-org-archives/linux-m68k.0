From: Steven King <sfking@fdwdc.com>
Subject: [PATCH] m68knommu: Correct page_to_phys when PAGE_OFFSET is non-zero.
Date: Wed, 11 Jun 2014 20:01:10 -0700
Message-ID: <201406112001.10513.sfking@fdwdc.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp106.biz.mail.bf1.yahoo.com ([98.139.244.54]:43791 "HELO
	smtp106.biz.mail.bf1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1755496AbaFLDHx (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Wed, 11 Jun 2014 23:07:53 -0400
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@uclinux.org>, linux-m68k@vger.kernel.org

The definition of page_to_phys for nommu produces an incorrect value when
PAGE_OFFSET is non-zero.  The nommu version of page_to_pfn works correctly
for non-zero PAGE_OFFSET, so use that instead.


Signed-off-by: Steven King <sfking@fdwdc.com>

---
 arch/m68k/include/asm/virtconvert.h |    6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/m68k/include/asm/virtconvert.h b/arch/m68k/include/asm/virtconvert.h
index f35229b..b8a82fb 100644
--- a/arch/m68k/include/asm/virtconvert.h
+++ b/arch/m68k/include/asm/virtconvert.h
@@ -26,16 +26,12 @@ static inline void *phys_to_virt(unsigned long address)
 }
 
 /* Permanent address of a page. */
-#ifdef CONFIG_MMU
-#ifdef CONFIG_SINGLE_MEMORY_CHUNK
+#if defined(CONFIG_MMU) && defined(CONFIG_SINGLE_MEMORY_CHUNK)
 #define page_to_phys(page) \
 	__pa(PAGE_OFFSET + (((page) - pg_data_map[0].node_mem_map) << PAGE_SHIFT))
 #else
 #define page_to_phys(page)	(page_to_pfn(page) << PAGE_SHIFT)
 #endif
-#else
-#define page_to_phys(page)	(((page) - mem_map) << PAGE_SHIFT)
-#endif
 
 /*
  * IO bus memory addresses are 1:1 with the physical address,
