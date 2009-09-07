From: sfking@fdwdc.com
Subject: [RFC 26/31] proof of concept merge of m68k and m68knommu
Date: Sun,  6 Sep 2009 23:02:29 -0700
Message-ID: <465903f0a328dc0355b41585754da335575049a5.1252222135.git.sfking@fdwdc.com>
References: <0b049a980e0bb00153e690539c9ce623e985e583.1252222135.git.sfking@fdwdc.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp100.biz.mail.mud.yahoo.com ([68.142.201.176]:48493 "HELO
	smtp100.biz.mail.mud.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1758897AbZIGGCy (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 7 Sep 2009 02:02:54 -0400
In-Reply-To: <0b049a980e0bb00153e690539c9ce623e985e583.1252222135.git.sfking@fdwdc.com>
In-Reply-To: <cover.1252222129.git.sfking@fdwdc.com>
References: <cover.1252222129.git.sfking@fdwdc.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: uclinux-dev@uclinux.org
Cc: gerg@snapgear.com, linux-m68k@lists.linux-m68k.org

---
 arch/m68k/kernel/dma.c                             |  134 +-------------------
 arch/m68k/kernel/{dma.c => dma_mm.c}               |    0 
 .../kernel/dma.c => m68k/kernel/dma_no.c}          |    0 
 3 files changed, 5 insertions(+), 129 deletions(-)
 copy arch/m68k/kernel/{dma.c => dma_mm.c} (100%)
 copy arch/{m68knommu/kernel/dma.c => m68k/kernel/dma_no.c} (100%)

diff --git a/arch/m68k/kernel/dma.c b/arch/m68k/kernel/dma.c
index 2bb4245..90e8cb7 100644
--- a/arch/m68k/kernel/dma.c
+++ b/arch/m68k/kernel/dma.c
@@ -1,129 +1,5 @@
-/*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file COPYING in the main directory of this archive
- * for more details.
- */
-
-#undef DEBUG
-
-#include <linux/dma-mapping.h>
-#include <linux/device.h>
-#include <linux/kernel.h>
-#include <linux/scatterlist.h>
-#include <linux/vmalloc.h>
-
-#include <asm/pgalloc.h>
-
-void *dma_alloc_coherent(struct device *dev, size_t size,
-			 dma_addr_t *handle, gfp_t flag)
-{
-	struct page *page, **map;
-	pgprot_t pgprot;
-	void *addr;
-	int i, order;
-
-	pr_debug("dma_alloc_coherent: %d,%x\n", size, flag);
-
-	size = PAGE_ALIGN(size);
-	order = get_order(size);
-
-	page = alloc_pages(flag, order);
-	if (!page)
-		return NULL;
-
-	*handle = page_to_phys(page);
-	map = kmalloc(sizeof(struct page *) << order, flag & ~__GFP_DMA);
-	if (!map) {
-		__free_pages(page, order);
-		return NULL;
-	}
-	split_page(page, order);
-
-	order = 1 << order;
-	size >>= PAGE_SHIFT;
-	map[0] = page;
-	for (i = 1; i < size; i++)
-		map[i] = page + i;
-	for (; i < order; i++)
-		__free_page(page + i);
-	pgprot = __pgprot(_PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_DIRTY);
-	if (CPU_IS_040_OR_060)
-		pgprot_val(pgprot) |= _PAGE_GLOBAL040 | _PAGE_NOCACHE_S;
-	else
-		pgprot_val(pgprot) |= _PAGE_NOCACHE030;
-	addr = vmap(map, size, VM_MAP, pgprot);
-	kfree(map);
-
-	return addr;
-}
-EXPORT_SYMBOL(dma_alloc_coherent);
-
-void dma_free_coherent(struct device *dev, size_t size,
-		       void *addr, dma_addr_t handle)
-{
-	pr_debug("dma_free_coherent: %p, %x\n", addr, handle);
-	vfree(addr);
-}
-EXPORT_SYMBOL(dma_free_coherent);
-
-void dma_sync_single_for_device(struct device *dev, dma_addr_t handle,
-				size_t size, enum dma_data_direction dir)
-{
-	switch (dir) {
-	case DMA_TO_DEVICE:
-		cache_push(handle, size);
-		break;
-	case DMA_FROM_DEVICE:
-		cache_clear(handle, size);
-		break;
-	default:
-		if (printk_ratelimit())
-			printk("dma_sync_single_for_device: unsupported dir %u\n", dir);
-		break;
-	}
-}
-EXPORT_SYMBOL(dma_sync_single_for_device);
-
-void dma_sync_sg_for_device(struct device *dev, struct scatterlist *sg, int nents,
-			    enum dma_data_direction dir)
-{
-	int i;
-
-	for (i = 0; i < nents; sg++, i++)
-		dma_sync_single_for_device(dev, sg->dma_address, sg->length, dir);
-}
-EXPORT_SYMBOL(dma_sync_sg_for_device);
-
-dma_addr_t dma_map_single(struct device *dev, void *addr, size_t size,
-			  enum dma_data_direction dir)
-{
-	dma_addr_t handle = virt_to_bus(addr);
-
-	dma_sync_single_for_device(dev, handle, size, dir);
-	return handle;
-}
-EXPORT_SYMBOL(dma_map_single);
-
-dma_addr_t dma_map_page(struct device *dev, struct page *page,
-			unsigned long offset, size_t size,
-			enum dma_data_direction dir)
-{
-	dma_addr_t handle = page_to_phys(page) + offset;
-
-	dma_sync_single_for_device(dev, handle, size, dir);
-	return handle;
-}
-EXPORT_SYMBOL(dma_map_page);
-
-int dma_map_sg(struct device *dev, struct scatterlist *sg, int nents,
-	       enum dma_data_direction dir)
-{
-	int i;
-
-	for (i = 0; i < nents; sg++, i++) {
-		sg->dma_address = sg_phys(sg);
-		dma_sync_single_for_device(dev, sg->dma_address, sg->length, dir);
-	}
-	return nents;
-}
-EXPORT_SYMBOL(dma_map_sg);
+#ifdef CONFIG_MMU
+#include "dma_mm.c"
+#else
+#include "dma_no.c"
+#endif
diff --git a/arch/m68k/kernel/dma.c b/arch/m68k/kernel/dma_mm.c
similarity index 100%
copy from arch/m68k/kernel/dma.c
copy to arch/m68k/kernel/dma_mm.c
diff --git a/arch/m68knommu/kernel/dma.c b/arch/m68k/kernel/dma_no.c
similarity index 100%
copy from arch/m68knommu/kernel/dma.c
copy to arch/m68k/kernel/dma_no.c
-- 
1.5.6.5

