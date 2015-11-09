From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 01/16] dma-mapping: make the generic coherent dma mmap implementation optional
Date: Mon,  9 Nov 2015 19:17:06 +0100
Message-ID: <1447093041-21832-2-git-send-email-hch__45702.5402960882$1447093332$gmane$org@lst.de>
References: <1447093041-21832-1-git-send-email-hch@lst.de>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1447093041-21832-1-git-send-email-hch@lst.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Haavard Skinnemoen <hskinnemoen@gmail.com>, Hans-Christian Egtvedt <egtvedt@samfundet.no>, Steven Miao <realmz6@gmail.com>, Ley Foon Tan <lftan@altera.com>, David Howells <dhowells@redhat.com>, Koichi Yasutake <yasutake.koichi@jp.panasonic.com>, Chris Metcalf <cmetcalf@ezchip.com>, linux-snps-arc@lists.infraded.org, linux-c6x-dev@linux-c6x.org, linux-cris-kernel@axis.com, linux-parisc@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-metag@vger.kernel.org, sparclinux@vger.kernel.org, iommu@lists.linux-foundation.org

We have a couple architectures that do not want to support this code,
so add another Kconfig symbol that disables the code similar to what we
do for the nommu case.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/Kconfig               | 3 +++
 drivers/base/dma-mapping.c | 4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 4e949e5..e47995f 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -564,4 +564,7 @@ config OLD_SIGACTION
 config COMPAT_OLD_SIGACTION
 	bool
 
+config ARCH_NO_COHERENT_DMA_MMAP
+	bool
+
 source "kernel/gcov/Kconfig"
diff --git a/drivers/base/dma-mapping.c b/drivers/base/dma-mapping.c
index d95c597..381e39d 100644
--- a/drivers/base/dma-mapping.c
+++ b/drivers/base/dma-mapping.c
@@ -247,7 +247,7 @@ int dma_common_mmap(struct device *dev, struct vm_area_struct *vma,
 		    void *cpu_addr, dma_addr_t dma_addr, size_t size)
 {
 	int ret = -ENXIO;
-#ifdef CONFIG_MMU
+#if defined(CONFIG_MMU) && !defined(CONFIG_ARCH_NO_COHERENT_DMA_MMAP)
 	unsigned long user_count = (vma->vm_end - vma->vm_start) >> PAGE_SHIFT;
 	unsigned long count = PAGE_ALIGN(size) >> PAGE_SHIFT;
 	unsigned long pfn = page_to_pfn(virt_to_page(cpu_addr));
@@ -264,7 +264,7 @@ int dma_common_mmap(struct device *dev, struct vm_area_struct *vma,
 				      user_count << PAGE_SHIFT,
 				      vma->vm_page_prot);
 	}
-#endif	/* CONFIG_MMU */
+#endif	/* CONFIG_MMU && !CONFIG_ARCH_NO_COHERENT_DMA_MMAP */
 
 	return ret;
 }
-- 
1.9.1
