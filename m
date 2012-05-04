From: <gerg@snapgear.com>
Subject: [PATCH 2/2] m68k: merge the MMU and non-MMU versions of the arch dma code
Date: Fri, 4 May 2012 16:50:47 +1000
Message-ID: <1336114247-22764-3-git-send-email-gerg@snapgear.com>
References: <1336114247-22764-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:15756 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752867Ab2EDGxg (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 4 May 2012 02:53:36 -0400
In-Reply-To: <1336114247-22764-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The majority of the m68k architecture dma code is the same, so merge the
current separated files dma_no.c and dma_mm.c back into a single dma.c

The main alloc and free routines are a little different, so we keep a
single #ifdef based on CONFIG_MMU for them. All the other support functions
are now identical.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/kernel/{dma_mm.c => dma.c} |   35 +++++++++++++++-
 arch/m68k/kernel/dma_no.c            |   75 ----------------------------------
 2 files changed, 34 insertions(+), 76 deletions(-)
 rename arch/m68k/kernel/{dma_mm.c => dma.c} (83%)
 delete mode 100644 arch/m68k/kernel/dma_no.c

diff --git a/arch/m68k/kernel/dma_mm.c b/arch/m68k/kernel/dma.c
similarity index 83%
rename from arch/m68k/kernel/dma_mm.c
rename to arch/m68k/kernel/dma.c
index a3c471b..f6daf6e 100644
--- a/arch/m68k/kernel/dma_mm.c
+++ b/arch/m68k/kernel/dma.c
@@ -16,6 +16,8 @@
 
 #include <asm/pgalloc.h>
 
+#ifdef CONFIG_MMU
+
 void *dma_alloc_coherent(struct device *dev, size_t size,
 			 dma_addr_t *handle, gfp_t flag)
 {
@@ -58,7 +60,6 @@ void *dma_alloc_coherent(struct device *dev, size_t size,
 
 	return addr;
 }
-EXPORT_SYMBOL(dma_alloc_coherent);
 
 void dma_free_coherent(struct device *dev, size_t size,
 		       void *addr, dma_addr_t handle)
@@ -66,6 +67,38 @@ void dma_free_coherent(struct device *dev, size_t size,
 	pr_debug("dma_free_coherent: %p, %x\n", addr, handle);
 	vfree(addr);
 }
+
+#else
+
+#include <asm/cacheflush.h>
+
+void *dma_alloc_coherent(struct device *dev, size_t size,
+			   dma_addr_t *dma_handle, gfp_t gfp)
+{
+	void *ret;
+	/* ignore region specifiers */
+	gfp &= ~(__GFP_DMA | __GFP_HIGHMEM);
+
+	if (dev == NULL || (*dev->dma_mask < 0xffffffff))
+		gfp |= GFP_DMA;
+	ret = (void *)__get_free_pages(gfp, get_order(size));
+
+	if (ret != NULL) {
+		memset(ret, 0, size);
+		*dma_handle = virt_to_phys(ret);
+	}
+	return ret;
+}
+
+void dma_free_coherent(struct device *dev, size_t size,
+			 void *vaddr, dma_addr_t dma_handle)
+{
+	free_pages((unsigned long)vaddr, get_order(size));
+}
+
+#endif /* CONFIG_MMU */
+
+EXPORT_SYMBOL(dma_alloc_coherent);
 EXPORT_SYMBOL(dma_free_coherent);
 
 void dma_sync_single_for_device(struct device *dev, dma_addr_t handle,
diff --git a/arch/m68k/kernel/dma_no.c b/arch/m68k/kernel/dma_no.c
deleted file mode 100644
index f1dc3fc..0000000
--- a/arch/m68k/kernel/dma_no.c
+++ /dev/null
@@ -1,75 +0,0 @@
-/*
- * Dynamic DMA mapping support.
- *
- * We never have any address translations to worry about, so this
- * is just alloc/free.
- */
-
-#include <linux/types.h>
-#include <linux/gfp.h>
-#include <linux/mm.h>
-#include <linux/device.h>
-#include <linux/dma-mapping.h>
-#include <linux/export.h>
-#include <asm/cacheflush.h>
-
-void *dma_alloc_coherent(struct device *dev, size_t size,
-			   dma_addr_t *dma_handle, gfp_t gfp)
-{
-	void *ret;
-	/* ignore region specifiers */
-	gfp &= ~(__GFP_DMA | __GFP_HIGHMEM);
-
-	if (dev == NULL || (*dev->dma_mask < 0xffffffff))
-		gfp |= GFP_DMA;
-	ret = (void *)__get_free_pages(gfp, get_order(size));
-
-	if (ret != NULL) {
-		memset(ret, 0, size);
-		*dma_handle = virt_to_phys(ret);
-	}
-	return ret;
-}
-
-void dma_free_coherent(struct device *dev, size_t size,
-			 void *vaddr, dma_addr_t dma_handle)
-{
-	free_pages((unsigned long)vaddr, get_order(size));
-}
-
-void dma_sync_single_for_device(struct device *dev, dma_addr_t handle,
-				size_t size, enum dma_data_direction dir)
-{
-	switch (dir) {
-	case DMA_TO_DEVICE:
-		flush_dcache_range(handle, size);
-		break;
-	case DMA_FROM_DEVICE:
-		/* Should be clear already */
-		break;
-	default:
-		if (printk_ratelimit())
-			printk("dma_sync_single_for_device: unsupported dir %u\n", dir);
-		break;
-	}
-}
-
-EXPORT_SYMBOL(dma_sync_single_for_device);
-dma_addr_t dma_map_single(struct device *dev, void *addr, size_t size,
-			  enum dma_data_direction dir)
-{
-	dma_addr_t handle = virt_to_phys(addr);
-	flush_dcache_range(handle, size);
-	return handle;
-}
-EXPORT_SYMBOL(dma_map_single);
-
-dma_addr_t dma_map_page(struct device *dev, struct page *page,
-			unsigned long offset, size_t size,
-			enum dma_data_direction dir)
-{
-	dma_addr_t handle = page_to_phys(page) + offset;
-	dma_sync_single_for_device(dev, handle, size, dir);
-	return handle;
-}
-EXPORT_SYMBOL(dma_map_page);
-- 
1.7.0.4
