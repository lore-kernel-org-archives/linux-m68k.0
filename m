From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v5 28/44] m68k: dma-mapping: Use unsigned long for dma_attrs
Date: Thu, 30 Jun 2016 10:25:55 +0200
Message-ID: <1467275171-6298-28-git-send-email-k.kozlowski__27209.8249676221$1467275939$gmane$org@samsung.com>
References: <1467275019-30789-1-git-send-email-k.kozlowski@samsung.com>
 <1467275171-6298-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-reply-to: <1467275171-6298-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, hch@infradead.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org

Split out subsystem specific changes for easier reviews. This will be
squashed with main commit.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
[for m68k]
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/kernel/dma.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/m68k/kernel/dma.c b/arch/m68k/kernel/dma.c
index cbc78b4117b5..8cf97cbadc91 100644
--- a/arch/m68k/kernel/dma.c
+++ b/arch/m68k/kernel/dma.c
@@ -19,7 +19,7 @@
 #if defined(CONFIG_MMU) && !defined(CONFIG_COLDFIRE)
 
 static void *m68k_dma_alloc(struct device *dev, size_t size, dma_addr_t *handle,
-		gfp_t flag, struct dma_attrs *attrs)
+		gfp_t flag, unsigned long attrs)
 {
 	struct page *page, **map;
 	pgprot_t pgprot;
@@ -62,7 +62,7 @@ static void *m68k_dma_alloc(struct device *dev, size_t size, dma_addr_t *handle,
 }
 
 static void m68k_dma_free(struct device *dev, size_t size, void *addr,
-		dma_addr_t handle, struct dma_attrs *attrs)
+		dma_addr_t handle, unsigned long attrs)
 {
 	pr_debug("dma_free_coherent: %p, %x\n", addr, handle);
 	vfree(addr);
@@ -73,7 +73,7 @@ static void m68k_dma_free(struct device *dev, size_t size, void *addr,
 #include <asm/cacheflush.h>
 
 static void *m68k_dma_alloc(struct device *dev, size_t size,
-		dma_addr_t *dma_handle, gfp_t gfp, struct dma_attrs *attrs)
+		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
 {
 	void *ret;
 	/* ignore region specifiers */
@@ -91,7 +91,7 @@ static void *m68k_dma_alloc(struct device *dev, size_t size,
 }
 
 static void m68k_dma_free(struct device *dev, size_t size, void *vaddr,
-		dma_addr_t dma_handle, struct dma_attrs *attrs)
+		dma_addr_t dma_handle, unsigned long attrs)
 {
 	free_pages((unsigned long)vaddr, get_order(size));
 }
@@ -130,7 +130,7 @@ static void m68k_dma_sync_sg_for_device(struct device *dev,
 
 static dma_addr_t m68k_dma_map_page(struct device *dev, struct page *page,
 		unsigned long offset, size_t size, enum dma_data_direction dir,
-		struct dma_attrs *attrs)
+		unsigned long attrs)
 {
 	dma_addr_t handle = page_to_phys(page) + offset;
 
@@ -139,7 +139,7 @@ static dma_addr_t m68k_dma_map_page(struct device *dev, struct page *page,
 }
 
 static int m68k_dma_map_sg(struct device *dev, struct scatterlist *sglist,
-		int nents, enum dma_data_direction dir, struct dma_attrs *attrs)
+		int nents, enum dma_data_direction dir, unsigned long attrs)
 {
 	int i;
 	struct scatterlist *sg;
-- 
1.9.1
