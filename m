Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D731EE02F
	for <linux-m68k@lists.linux-m68k.org>; Tue, 21 Jan 2025 10:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737456866; cv=none; b=UEkAvilf0m1eb7ISpTKjo+T3P7RLW4WseGiTiEDUUzOQUMkc0ylJuyda4L7MtWHwqzD1CUZ4EgIvb+vODG5TN8XuF89DoyGENvRWaxtiOHvY9Gis1/H2QHzH9QeTpqX53g1GPEB4MBdhDHYcfEp0tUcmzJPIKCoboTgKWI7U/wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737456866; c=relaxed/simple;
	bh=lDw8iApPj68eVXyPTbAmxy75v6PBAhP04SWIBVcMLcI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PxLCf7nEsRxdyC6hXEjzKoBmjIAHBrlad4TH74bvanPxynKHWOUOi83YBiygqspaiQA/olglHFvXvrlXoGWn3ITD9Nd9WU10YYJzWRBo4U50HPbyHjrjffESRtQ8wJoFWH7uDnYbB+CiRfTAFwiv9R8pxugOA4PVg07/nDCjrOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=none smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=Az0xrEpz; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="Az0xrEpz"
Received: by mail.gandi.net (Postfix) with ESMTPSA id A19191C0012;
	Tue, 21 Jan 2025 10:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1737456861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kENU2Jqq+aqgOtn0XMY8jG+Z80/iI1WRzO/OIaBPIbc=;
	b=Az0xrEpziV1SzM19uHILrFecu+HRoacCcD4RucvHtpS1Hfsczcl4mddikxYSF7j/eIJNQn
	APPHOpk1LBotzP5Vu3QcYQAaZj+ff/xDnzAt8zVOYgW625rLVu121YxlRmO5PWQs93wjDh
	nyOfanF0gFY5owSpJ0pNAxY+xQuA2SWhdWuWrdAeMsFJaBLLsO1uQjaDrQFQPyfEE9wiJ6
	rhZ0xR14vl3njLqlkDzBLPlRVbeyPDUs+w7KB8nuI7zzJxVYz/HaP+ZD7uBYBb09Dd3D4v
	1+mcGQy1TPdHQvDIwdbIT36XjjV4pf3auYSHURUSWYXZWKCs++sKYyTrMXtspg==
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Date: Tue, 21 Jan 2025 11:54:14 +0100
Subject: [PATCH 2/2] arch: m68k: Add DMA mapping operations for Coldfire
 M5441x
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-coldfire-global-pool-v1-2-382a7235c2aa@yoseli.org>
References: <20250121-coldfire-global-pool-v1-0-382a7235c2aa@yoseli.org>
In-Reply-To: <20250121-coldfire-global-pool-v1-0-382a7235c2aa@yoseli.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>, 
 Greg Ungerer <gerg@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737456859; l=7822;
 i=jeanmichel.hautbois@yoseli.org; s=20240925; h=from:subject:message-id;
 bh=lDw8iApPj68eVXyPTbAmxy75v6PBAhP04SWIBVcMLcI=;
 b=04vV1O8tySmpC5DC5Tlbv2MMeRxoAxwYBhTcP8TrGlIdYVQyfxpjKVHRNOVWxdYtctx2Shwk4
 LUqi4IY9NhACu4b/ClQ0GGXiEMddnNBVcTlJO6RFxtRQpxRimrZRGdF
X-Developer-Key: i=jeanmichel.hautbois@yoseli.org; a=ed25519;
 pk=MsMTVmoV69wLIlSkHlFoACIMVNQFyvJzvsJSQsn/kq4=
X-GND-Sasl: jeanmichel.hautbois@yoseli.org

Introduce `dma_ops` for the Coldfire M5441x platform, enabling both
coherent and streaming DMA operations. This addition should fill the gap
for DMA support integrates with the existing kernel DMA framework.

The key operations implemented include:
- Custom allocation using the global coherent DMA pool
- Mapping and unmapping functions for pages
- Scatter-gather support
- Resource mapping

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
 arch/m68k/Kconfig.machine    |  19 +++++--
 arch/m68k/coldfire/dma_ops.c | 131 +++++++++++++++++++++++++++++++++++++++++++
 arch/m68k/include/asm/dma.h  |   2 -
 arch/m68k/kernel/dma.c       |   2 +-
 arch/m68k/mm/mcfmmu.c        |   6 +-
 5 files changed, 148 insertions(+), 12 deletions(-)

diff --git a/arch/m68k/Kconfig.machine b/arch/m68k/Kconfig.machine
index 1467d1ff349bb26714a3c99f593a2a71c9ad273d..9cecc5025401976897f815505e0bc74cba28eb0d 100644
--- a/arch/m68k/Kconfig.machine
+++ b/arch/m68k/Kconfig.machine
@@ -406,12 +406,19 @@ config KERNELBASE
 	  for the theoretical maximum number of 256 vectors.
 
 config DMASIZE
-       hex "Size of DRAM (in bytes) reserved pool"
-       default "0x1000000"
-       depends on DMA_GLOBAL_POOL
-       help
-         Define the DMA pool size, allocated at init time, which can then
-         be used by DMA engine. Defaults to 16MB.
+	hex "Size of DRAM (in bytes) reserved pool"
+	default "0x1000000"
+	depends on DMA_GLOBAL_POOL
+	help
+	  Define the DMA pool size, allocated at init time, which can then
+	  be used by DMA engine. Defaults to 16MB.
+
+config DMABASE
+	hex "Address of the base of RAM"
+	default RAMBASE
+	depends on DMA_GLOBAL_POOL
+	help
+	  Define the DMA base address for the global pool.
 
 comment "ROM configuration"
 
diff --git a/arch/m68k/coldfire/dma_ops.c b/arch/m68k/coldfire/dma_ops.c
new file mode 100644
index 0000000000000000000000000000000000000000..e9967adc8821fb06c828e010ef51ef4e9702925b
--- /dev/null
+++ b/arch/m68k/coldfire/dma_ops.c
@@ -0,0 +1,131 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * dma_timer.c -- Freescale ColdFire DMA Ops helpers.
+ *
+ * Copyright (C) 2024 Jean-Michel Hautbois, Yoseli
+ *
+ */
+
+#include <linux/device.h>
+#include <linux/dma-direct.h>
+#include <linux/dma-map-ops.h>
+#include <linux/dma-mapping.h>
+#include <linux/kernel.h>
+#include <linux/scatterlist.h>
+#include <linux/slab.h>
+#include <linux/vmalloc.h>
+#include <linux/pci.h>
+#include <asm/pgalloc.h>
+
+static void *coldfire_alloc_coherent(struct device *dev, size_t size,
+				     dma_addr_t *dma_handle, gfp_t gfp,
+				     unsigned long attrs)
+{
+	void *vaddr;
+
+	vaddr = dma_alloc_from_global_coherent(dev, size, dma_handle);
+	if (!vaddr) {
+		dev_err(dev, "Failed to allocate %zu bytes\n", size);
+		return NULL;
+	}
+
+	dev_dbg(dev, "Allocated %zu bytes at %p (dma %pad)\n", size, vaddr, dma_handle);
+
+	return vaddr;
+}
+
+static void coldfire_free_coherent(struct device *dev, size_t size, void *vaddr,
+				   dma_addr_t dma_handle, unsigned long attrs)
+{
+	unsigned int page_order = get_order(size);
+
+	if (!dma_release_from_global_coherent(page_order, vaddr))
+		WARN_ON_ONCE(1);
+}
+
+static dma_addr_t coldfire_map_page(struct device *dev, struct page *page,
+				    unsigned long offset, size_t size,
+				    enum dma_data_direction dir, unsigned long attrs)
+{
+	phys_addr_t phys = page_to_phys(page) + offset;
+	dma_addr_t dma_addr = phys_to_dma(dev, phys);
+
+	if (!dev_is_dma_coherent(dev) && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
+		arch_sync_dma_for_device(phys, size, dir);
+	return dma_addr;
+}
+
+static void coldfire_unmap_page(struct device *dev, dma_addr_t dma_handle,
+				size_t size, enum dma_data_direction dir,
+				unsigned long attrs)
+{
+	phys_addr_t phys = dma_to_phys(dev, dma_handle);
+
+	if (!dev_is_dma_coherent(dev) && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
+		arch_sync_dma_for_cpu(phys, size, dir);
+}
+
+static int coldfire_map_sg(struct device *dev, struct scatterlist *sg,
+			   int nents, enum dma_data_direction dir,
+			   unsigned long attrs)
+{
+	struct scatterlist *s;
+	dma_addr_t dma_handle;
+	int i;
+
+	if (!sg) {
+		dev_err(dev, "Invalid scatterlist, cannot map memory\n");
+		return 0;
+	}
+
+	for_each_sg(sg, s, nents, i) {
+		dma_handle = page_to_phys(sg_page(s)) + sg->offset;
+		dev_dbg(dev, "Mapped scatterlist %p (offset %u) to DMA address %pad\n",
+			sg_page(s), sg->offset, &dma_handle);
+	}
+
+	return nents;
+}
+
+static void coldfire_unmap_sg(struct device *dev, struct scatterlist *sg,
+			      int nents, enum dma_data_direction dir,
+			      unsigned long attrs)
+{
+}
+
+static dma_addr_t coldfire_map_resource(struct device *dev, phys_addr_t phys,
+					size_t size, enum dma_data_direction dir,
+					unsigned long attrs)
+{
+	dma_addr_t dma_handle;
+
+	if (!phys) {
+		dev_err(dev, "Invalid physical address, cannot map memory\n");
+		return 0;
+	}
+
+	dma_handle = phys;
+	dev_dbg(dev, "Mapped physical address %pa (size %zu) to DMA address %pad\n",
+		&phys, size, &dma_handle);
+	return dma_handle;
+}
+
+static void coldfire_unmap_resource(struct device *dev, dma_addr_t dma_handle,
+				    size_t size, enum dma_data_direction dir,
+				    unsigned long attrs)
+{
+}
+
+const struct dma_map_ops coldfire_dma_ops = {
+	.alloc			= coldfire_alloc_coherent,
+	.free			= coldfire_free_coherent,
+	.map_page		= coldfire_map_page,
+	.unmap_page		= coldfire_unmap_page,
+	.map_sg			= coldfire_map_sg,
+	.unmap_sg		= coldfire_unmap_sg,
+	.map_resource		= coldfire_map_resource,
+	.unmap_resource		= coldfire_unmap_resource,
+	.alloc_pages_op		= dma_common_alloc_pages,
+	.free_pages		= dma_common_free_pages,
+};
+EXPORT_SYMBOL(coldfire_dma_ops);
diff --git a/arch/m68k/include/asm/dma.h b/arch/m68k/include/asm/dma.h
index 53f9c1570ce62ddaa521d85d9ef64523e8ad0919..fc029b710c30bf23f8bf2657ea74a1c146b3f8b1 100644
--- a/arch/m68k/include/asm/dma.h
+++ b/arch/m68k/include/asm/dma.h
@@ -5,6 +5,4 @@
 /* it's useless on the m68k, but unfortunately needed by the new
    bootmem allocator (but this should do it for this) */
 #define MAX_DMA_ADDRESS PAGE_OFFSET
-
-extern size_t dma_coldfire_base;
 #endif /* _M68K_DMA_H */
diff --git a/arch/m68k/kernel/dma.c b/arch/m68k/kernel/dma.c
index bc66b012de79be842b55f3d82726a00c929416b9..6d41fdc4991589c30f9cad783fc43f56e8f8b99b 100644
--- a/arch/m68k/kernel/dma.c
+++ b/arch/m68k/kernel/dma.c
@@ -47,7 +47,7 @@ void arch_sync_dma_for_device(phys_addr_t handle, size_t size,
 #ifdef CONFIG_DMA_GLOBAL_POOL
 static int __init coldfire_dma_init(void)
 {
-	return dma_init_global_coherent(PFN_PHYS(PFN_DOWN(coldfire_dma_base)),
+	return dma_init_global_coherent(PFN_PHYS(PFN_DOWN(CONFIG_DMABASE)),
 					CONFIG_DMASIZE);
 }
 
diff --git a/arch/m68k/mm/mcfmmu.c b/arch/m68k/mm/mcfmmu.c
index f6c560ea17a68ff6546b0683461b6b9ffb587db7..f8006a70e0f58828bedb18690f9eecfa924c8059 100644
--- a/arch/m68k/mm/mcfmmu.c
+++ b/arch/m68k/mm/mcfmmu.c
@@ -156,8 +156,6 @@ int cf_tlb_miss(struct pt_regs *regs, int write, int dtlb, int extension_word)
 	return ret;
 }
 
-size_t coldfire_dma_base = _ramend - CONFIG_DMASIZE;
-
 void __init cf_bootmem_alloc(void)
 {
 	unsigned long memstart;
@@ -181,8 +179,10 @@ void __init cf_bootmem_alloc(void)
 	/* Reserve kernel text/data/bss */
 	memblock_reserve(_rambase, memstart - _rambase);
 
+#ifdef CONFIG_DMA_GLOBAL_POOL
 	/* Reserve DMA */
-	memblock_reserve(coldfire_dma_base, CONFIG_DMASIZE);
+	memblock_reserve(CONFIG_DMABASE, CONFIG_DMASIZE);
+#endif
 
 	m68k_virt_to_node_shift = fls(_ramend - 1) - 6;
 	module_fixup(NULL, __start_fixup, __stop_fixup);

-- 
2.39.5

