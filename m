From: <gerg@snapgear.com>
Subject: [PATCH] m68k: use simpler dma_alloc_coherent() for ColdFire CPUs
Date: Tue, 10 Jul 2012 16:39:38 +1000
Message-ID: <1341902378-8180-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dnvwsmailout1.mcafee.com ([161.69.31.173]:43213 "EHLO
	DNVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751647Ab2GJGmk (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 10 Jul 2012 02:42:40 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

On all ColdFire platforms (whether MMU enabled or not) we want to use the
simple page based dma_alloc_coherent. We don't want the virtual mapping
version that is used on classic m68k setups. So modify the conditionals
to use the existing simpler dma_alloc_coherent on all ColdFire and non-MMU
builds.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/kernel/dma.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/kernel/dma.c b/arch/m68k/kernel/dma.c
index f6daf6e..27b5821 100644
--- a/arch/m68k/kernel/dma.c
+++ b/arch/m68k/kernel/dma.c
@@ -16,7 +16,7 @@
 
 #include <asm/pgalloc.h>
 
-#ifdef CONFIG_MMU
+#if defined(CONFIG_MMU) && !defined(CONFIG_COLDFIRE)
 
 void *dma_alloc_coherent(struct device *dev, size_t size,
 			 dma_addr_t *handle, gfp_t flag)
@@ -96,7 +96,7 @@ void dma_free_coherent(struct device *dev, size_t size,
 	free_pages((unsigned long)vaddr, get_order(size));
 }
 
-#endif /* CONFIG_MMU */
+#endif /* CONFIG_MMU && !CONFIG_COLDFIRE */
 
 EXPORT_SYMBOL(dma_alloc_coherent);
 EXPORT_SYMBOL(dma_free_coherent);
-- 
1.7.0.4
