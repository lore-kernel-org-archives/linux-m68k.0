From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 04/16] blackfin: convert to dma_map_ops
Date: Mon,  9 Nov 2015 19:17:09 +0100
Message-ID: <1447093041-21832-5-git-send-email-hch__15837.1630161584$1447093371$gmane$org@lst.de>
References: <1447093041-21832-1-git-send-email-hch@lst.de>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1447093041-21832-1-git-send-email-hch@lst.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Haavard Skinnemoen <hskinnemoen@gmail.com>, Hans-Christian Egtvedt <egtvedt@samfundet.no>, Steven Miao <realmz6@gmail.com>, Ley Foon Tan <lftan@altera.com>, David Howells <dhowells@redhat.com>, Koichi Yasutake <yasutake.koichi@jp.panasonic.com>, Chris Metcalf <cmetcalf@ezchip.com>, linux-snps-arc@lists.infraded.org, linux-c6x-dev@linux-c6x.org, linux-cris-kernel@axis.com, linux-parisc@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-metag@vger.kernel.org, sparclinux@vger.kernel.org, iommu@lists.linux-foundation.org

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/blackfin/Kconfig                   |   1 +
 arch/blackfin/include/asm/dma-mapping.h | 127 +-------------------------------
 arch/blackfin/kernel/dma-mapping.c      |  52 +++++++++----
 3 files changed, 43 insertions(+), 137 deletions(-)

diff --git a/arch/blackfin/Kconfig b/arch/blackfin/Kconfig
index af76634..d3c68dd 100644
--- a/arch/blackfin/Kconfig
+++ b/arch/blackfin/Kconfig
@@ -40,6 +40,7 @@ config BLACKFIN
 	select HAVE_MOD_ARCH_SPECIFIC
 	select MODULES_USE_ELF_RELA
 	select HAVE_DEBUG_STACKOVERFLOW
+	select HAVE_DMA_ATTRS
 
 config GENERIC_CSUM
 	def_bool y
diff --git a/arch/blackfin/include/asm/dma-mapping.h b/arch/blackfin/include/asm/dma-mapping.h
index 054d9ec..ea5a2e8 100644
--- a/arch/blackfin/include/asm/dma-mapping.h
+++ b/arch/blackfin/include/asm/dma-mapping.h
@@ -8,36 +8,6 @@
 #define _BLACKFIN_DMA_MAPPING_H
 
 #include <asm/cacheflush.h>
-struct scatterlist;
-
-void *dma_alloc_coherent(struct device *dev, size_t size,
-			 dma_addr_t *dma_handle, gfp_t gfp);
-void dma_free_coherent(struct device *dev, size_t size, void *vaddr,
-		       dma_addr_t dma_handle);
-
-/*
- * Now for the API extensions over the pci_ one
- */
-#define dma_alloc_noncoherent(d, s, h, f) dma_alloc_coherent(d, s, h, f)
-#define dma_free_noncoherent(d, s, v, h) dma_free_coherent(d, s, v, h)
-#define dma_supported(d, m)         (1)
-
-static inline int
-dma_set_mask(struct device *dev, u64 dma_mask)
-{
-	if (!dev->dma_mask || !dma_supported(dev, dma_mask))
-		return -EIO;
-
-	*dev->dma_mask = dma_mask;
-
-	return 0;
-}
-
-static inline int
-dma_mapping_error(struct device *dev, dma_addr_t dma_addr)
-{
-	return 0;
-}
 
 extern void
 __dma_sync(dma_addr_t addr, size_t size, enum dma_data_direction dir);
@@ -66,102 +36,13 @@ _dma_sync(dma_addr_t addr, size_t size, enum dma_data_direction dir)
 		__dma_sync(addr, size, dir);
 }
 
-static inline dma_addr_t
-dma_map_single(struct device *dev, void *ptr, size_t size,
-	       enum dma_data_direction dir)
-{
-	_dma_sync((dma_addr_t)ptr, size, dir);
-	return (dma_addr_t) ptr;
-}
-
-static inline dma_addr_t
-dma_map_page(struct device *dev, struct page *page,
-	     unsigned long offset, size_t size,
-	     enum dma_data_direction dir)
-{
-	return dma_map_single(dev, page_address(page) + offset, size, dir);
-}
-
-static inline void
-dma_unmap_single(struct device *dev, dma_addr_t dma_addr, size_t size,
-		 enum dma_data_direction dir)
-{
-	BUG_ON(!valid_dma_direction(dir));
-}
-
-static inline void
-dma_unmap_page(struct device *dev, dma_addr_t dma_addr, size_t size,
-	       enum dma_data_direction dir)
-{
-	dma_unmap_single(dev, dma_addr, size, dir);
-}
-
-extern int dma_map_sg(struct device *dev, struct scatterlist *sg, int nents,
-		      enum dma_data_direction dir);
-
-static inline void
-dma_unmap_sg(struct device *dev, struct scatterlist *sg,
-	     int nhwentries, enum dma_data_direction dir)
-{
-	BUG_ON(!valid_dma_direction(dir));
-}
-
-static inline void
-dma_sync_single_range_for_cpu(struct device *dev, dma_addr_t handle,
-			      unsigned long offset, size_t size,
-			      enum dma_data_direction dir)
-{
-	BUG_ON(!valid_dma_direction(dir));
-}
-
-static inline void
-dma_sync_single_range_for_device(struct device *dev, dma_addr_t handle,
-				 unsigned long offset, size_t size,
-				 enum dma_data_direction dir)
-{
-	_dma_sync(handle + offset, size, dir);
-}
+extern struct dma_map_ops bfin_dma_ops;
 
-static inline void
-dma_sync_single_for_cpu(struct device *dev, dma_addr_t handle, size_t size,
-			enum dma_data_direction dir)
+static inline struct dma_map_ops *get_dma_ops(struct device *dev)
 {
-	dma_sync_single_range_for_cpu(dev, handle, 0, size, dir);
+	return &bfin_dma_ops;
 }
 
-static inline void
-dma_sync_single_for_device(struct device *dev, dma_addr_t handle, size_t size,
-			   enum dma_data_direction dir)
-{
-	dma_sync_single_range_for_device(dev, handle, 0, size, dir);
-}
-
-static inline void
-dma_sync_sg_for_cpu(struct device *dev, struct scatterlist *sg, int nents,
-		    enum dma_data_direction dir)
-{
-	BUG_ON(!valid_dma_direction(dir));
-}
-
-extern void
-dma_sync_sg_for_device(struct device *dev, struct scatterlist *sg,
-		       int nents, enum dma_data_direction dir);
-
-static inline void
-dma_cache_sync(struct device *dev, void *vaddr, size_t size,
-	       enum dma_data_direction dir)
-{
-	_dma_sync((dma_addr_t)vaddr, size, dir);
-}
-
-/* drivers/base/dma-mapping.c */
-extern int dma_common_mmap(struct device *dev, struct vm_area_struct *vma,
-			   void *cpu_addr, dma_addr_t dma_addr, size_t size);
-extern int dma_common_get_sgtable(struct device *dev, struct sg_table *sgt,
-				  void *cpu_addr, dma_addr_t dma_addr,
-				  size_t size);
-
-#define dma_mmap_coherent(d, v, c, h, s) dma_common_mmap(d, v, c, h, s)
-#define dma_get_sgtable(d, t, v, h, s) dma_common_get_sgtable(d, t, v, h, s)
+#include <asm-generic/dma-mapping-common.h>
 
 #endif				/* _BLACKFIN_DMA_MAPPING_H */
diff --git a/arch/blackfin/kernel/dma-mapping.c b/arch/blackfin/kernel/dma-mapping.c
index df437e5..771afe6 100644
--- a/arch/blackfin/kernel/dma-mapping.c
+++ b/arch/blackfin/kernel/dma-mapping.c
@@ -78,8 +78,8 @@ static void __free_dma_pages(unsigned long addr, unsigned int pages)
 	spin_unlock_irqrestore(&dma_page_lock, flags);
 }
 
-void *dma_alloc_coherent(struct device *dev, size_t size,
-			 dma_addr_t *dma_handle, gfp_t gfp)
+static void *bfin_dma_alloc(struct device *dev, size_t size,
+		dma_addr_t *dma_handle, gfp_t gfp, struct dma_attrs *attrs)
 {
 	void *ret;
 
@@ -92,15 +92,12 @@ void *dma_alloc_coherent(struct device *dev, size_t size,
 
 	return ret;
 }
-EXPORT_SYMBOL(dma_alloc_coherent);
 
-void
-dma_free_coherent(struct device *dev, size_t size, void *vaddr,
-		  dma_addr_t dma_handle)
+static void bfin_dma_free(struct device *dev, size_t size, void *vaddr,
+		  dma_addr_t dma_handle, struct dma_attrs *attrs)
 {
 	__free_dma_pages((unsigned long)vaddr, get_pages(size));
 }
-EXPORT_SYMBOL(dma_free_coherent);
 
 /*
  * Streaming DMA mappings
@@ -112,9 +109,9 @@ void __dma_sync(dma_addr_t addr, size_t size,
 }
 EXPORT_SYMBOL(__dma_sync);
 
-int
-dma_map_sg(struct device *dev, struct scatterlist *sg_list, int nents,
-	   enum dma_data_direction direction)
+static int bfin_dma_map_sg(struct device *dev, struct scatterlist *sg_list,
+		int nents, enum dma_data_direction direction,
+		struct dma_attrs *attrs)
 {
 	struct scatterlist *sg;
 	int i;
@@ -126,10 +123,10 @@ dma_map_sg(struct device *dev, struct scatterlist *sg_list, int nents,
 
 	return nents;
 }
-EXPORT_SYMBOL(dma_map_sg);
 
-void dma_sync_sg_for_device(struct device *dev, struct scatterlist *sg_list,
-			    int nelems, enum dma_data_direction direction)
+static void bfin_dma_sync_sg_for_device(struct device *dev,
+		struct scatterlist *sg_list, int nelems,
+		enum dma_data_direction direction)
 {
 	struct scatterlist *sg;
 	int i;
@@ -139,4 +136,31 @@ void dma_sync_sg_for_device(struct device *dev, struct scatterlist *sg_list,
 		__dma_sync(sg_dma_address(sg), sg_dma_len(sg), direction);
 	}
 }
-EXPORT_SYMBOL(dma_sync_sg_for_device);
+
+static dma_addr_t bfin_dma_map_page(struct device *dev, struct page *page,
+		unsigned long offset, size_t size, enum dma_data_direction dir,
+		struct dma_attrs *attrs)
+{
+	dma_addr_t handle = (dma_addr_t)(page_address(page) + offset);
+
+	_dma_sync(handle, size, dir);
+	return handle;
+}
+
+static inline void bfin_dma_sync_single_for_device(struct device *dev,
+		dma_addr_t handle, size_t size, enum dma_data_direction dir)
+{
+	_dma_sync(handle, size, dir);
+}
+
+struct dma_map_ops bfin_dma_ops = {
+	.alloc			= bfin_dma_alloc,
+	.free			= bfin_dma_free,
+
+	.map_page		= bfin_dma_map_page,
+	.map_sg			= bfin_dma_map_sg,
+
+	.sync_single_for_device	= bfin_dma_sync_single_for_device,
+	.sync_sg_for_device	= bfin_dma_sync_sg_for_device,
+};
+EXPORT_SYMBOL(bfin_dma_ops);
-- 
1.9.1
