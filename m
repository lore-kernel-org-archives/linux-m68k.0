Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431E91F0E44
	for <linux-m68k@lists.linux-m68k.org>; Tue, 21 Jan 2025 10:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737456864; cv=none; b=pvgkICmy9V5Ak9tFMJFZCpOPqMkx7D29mVtIqB0lxH3X3escMmxoz4gU5JXuu1FiJTwK+9Yd/gT/YSq+4xlFNcN6zxCLv2fUhgKcIyxMNeE5xR1AdXA4+8Q5HNlXxumOVfo7XBStWbO/jTiMvJ92T3mU4PJC5g+T+SCouwp/l6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737456864; c=relaxed/simple;
	bh=xNvHGxwSfSqDIZKXejaLr+KpTGqLiTZ/e712/smvfnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c/U7u2Q2R5nBIaX41kuf87ZgYTSmeSQ54LazcXq6lUNBWXfjkMNYbO5Qw7w1XCnj0s2sbop09OUIvCyeyJeGEN/+vN/CY3uFHGZJtARUG6nTGtRXWsQIAUYKjuEQIBL4eXZEmqjVCMx3SWit3SD8T+Pf0oD6a7vQdRBHCGq8UcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=none smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=dE0lHmcb; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="dE0lHmcb"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B8571C0007;
	Tue, 21 Jan 2025 10:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1737456860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eoMWLhM3iDGuRQ9oMTFZDDvzAMlU+XpxLw3TWq5QhN4=;
	b=dE0lHmcbtfZe5mwY3wShXH5UeUfeC/0/OdCy2t05qMiSz2ITVMYxa6Ys3x7lnF8ggtBFM0
	xOC821jCR28jrSVEO7pJBbBLWJL2+mhrfVB9fHrtOhasbpDQncNgYSIyqc1CYsKtWRO5nY
	0o6Q5u3bS8/MNrQ/dvn14cL8cOfwHMcYaQNPkKH8Qzrn29tYiHMz72wkowxpMxbrOFU+lq
	W6uUaEl4hEeAIFv4OUny05FPQGu4UrsAD7I5KUAj/2z+rsuzjfTSz+BCQOgi7wQ0sgrP5x
	KoStuRbm3TNQrE+OOXx3r6joUt7kZZh96dpRVX8H8eeE0IOfidJEwpv+MHBpPA==
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Date: Tue, 21 Jan 2025 11:54:13 +0100
Subject: [PATCH 1/2] m68k: Enable DMA support for Coldfire M5441x
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-coldfire-global-pool-v1-1-382a7235c2aa@yoseli.org>
References: <20250121-coldfire-global-pool-v1-0-382a7235c2aa@yoseli.org>
In-Reply-To: <20250121-coldfire-global-pool-v1-0-382a7235c2aa@yoseli.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>, 
 Greg Ungerer <gerg@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737456859; l=4153;
 i=jeanmichel.hautbois@yoseli.org; s=20240925; h=from:subject:message-id;
 bh=xNvHGxwSfSqDIZKXejaLr+KpTGqLiTZ/e712/smvfnY=;
 b=wFvFmmNWbvdyBHT2gzGXTtoAZz2qV0zcme93k3z1zySlBLUmqEDxvt0C5B8TNF+lHt2XvE4cK
 FFIWV20G6mcCsnRPWDrFVHZRIFN4N7r5wJIYGB+GpgDRGbx+SA4e/wQ
X-Developer-Key: i=jeanmichel.hautbois@yoseli.org; a=ed25519;
 pk=MsMTVmoV69wLIlSkHlFoACIMVNQFyvJzvsJSQsn/kq4=
X-GND-Sasl: jeanmichel.hautbois@yoseli.org

Add DMA support for the Coldfire M5441x platform with a global DMA pool
and coherent DMA operations.

Reserve a configurable DRAM pool (default 16MB with CONFIG_DMASIZE) and
initialize it with the dedicated helper.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
 arch/m68k/Kconfig.cpu       |  2 ++
 arch/m68k/Kconfig.machine   |  8 ++++++++
 arch/m68k/coldfire/Makefile |  2 ++
 arch/m68k/include/asm/dma.h |  1 +
 arch/m68k/kernel/dma.c      | 10 ++++++++++
 arch/m68k/mm/mcfmmu.c       |  5 +++++
 6 files changed, 28 insertions(+)

diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index c9a7e602d8a4da8e5094762e90c7b1a1ab1acfdf..66e5f62a0eb280f6029e7501f4fa152f422b76b4 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -303,6 +303,8 @@ config M5441x
 	select COLDFIRE_PIT_TIMER
 	select MMU_COLDFIRE if MMU
 	select HAVE_CACHE_CB
+	select DMA_GLOBAL_POOL
+	select ARCH_HAS_DMA_OPS
 	help
 	  Freescale Coldfire 54410/54415/54416/54417/54418 processor support.
 
diff --git a/arch/m68k/Kconfig.machine b/arch/m68k/Kconfig.machine
index de39f23b180ee21d3d3a028ad46f815f3690b1ad..1467d1ff349bb26714a3c99f593a2a71c9ad273d 100644
--- a/arch/m68k/Kconfig.machine
+++ b/arch/m68k/Kconfig.machine
@@ -405,6 +405,14 @@ config KERNELBASE
 	  a system with the RAM based at address 0, and leaving enough room
 	  for the theoretical maximum number of 256 vectors.
 
+config DMASIZE
+       hex "Size of DRAM (in bytes) reserved pool"
+       default "0x1000000"
+       depends on DMA_GLOBAL_POOL
+       help
+         Define the DMA pool size, allocated at init time, which can then
+         be used by DMA engine. Defaults to 16MB.
+
 comment "ROM configuration"
 
 config ROM
diff --git a/arch/m68k/coldfire/Makefile b/arch/m68k/coldfire/Makefile
index c56bc0dc7f2e338c8275cfd15656f80e78825254..b30c55ec722401822651cb329a9910cfc2d1d788 100644
--- a/arch/m68k/coldfire/Makefile
+++ b/arch/m68k/coldfire/Makefile
@@ -31,6 +31,8 @@ obj-$(CONFIG_M5407)	+= m5407.o intc.o reset.o
 obj-$(CONFIG_M54xx)	+= m54xx.o intc-2.o
 obj-$(CONFIG_M5441x)	+= m5441x.o intc-simr.o reset.o
 
+obj-$(CONFIG_ARCH_HAS_DMA_OPS) += dma_ops.o
+
 obj-$(CONFIG_COLDFIRE_PIT_TIMER) += pit.o
 obj-$(CONFIG_COLDFIRE_TIMERS)	 += timers.o
 obj-$(CONFIG_COLDFIRE_SLTIMERS)	 += sltimers.o
diff --git a/arch/m68k/include/asm/dma.h b/arch/m68k/include/asm/dma.h
index 1c8d9c5bc2fadeb425965974bdfb497577ebcc3b..53f9c1570ce62ddaa521d85d9ef64523e8ad0919 100644
--- a/arch/m68k/include/asm/dma.h
+++ b/arch/m68k/include/asm/dma.h
@@ -6,4 +6,5 @@
    bootmem allocator (but this should do it for this) */
 #define MAX_DMA_ADDRESS PAGE_OFFSET
 
+extern size_t dma_coldfire_base;
 #endif /* _M68K_DMA_H */
diff --git a/arch/m68k/kernel/dma.c b/arch/m68k/kernel/dma.c
index 16063783aa80c6ef200567543f98f011a2ac4dd2..bc66b012de79be842b55f3d82726a00c929416b9 100644
--- a/arch/m68k/kernel/dma.c
+++ b/arch/m68k/kernel/dma.c
@@ -43,3 +43,13 @@ void arch_sync_dma_for_device(phys_addr_t handle, size_t size,
 		break;
 	}
 }
+
+#ifdef CONFIG_DMA_GLOBAL_POOL
+static int __init coldfire_dma_init(void)
+{
+	return dma_init_global_coherent(PFN_PHYS(PFN_DOWN(coldfire_dma_base)),
+					CONFIG_DMASIZE);
+}
+
+core_initcall(coldfire_dma_init);
+#endif
diff --git a/arch/m68k/mm/mcfmmu.c b/arch/m68k/mm/mcfmmu.c
index 9a6fa342e872e32ca9566ebfe247531c808f49d6..f6c560ea17a68ff6546b0683461b6b9ffb587db7 100644
--- a/arch/m68k/mm/mcfmmu.c
+++ b/arch/m68k/mm/mcfmmu.c
@@ -156,6 +156,8 @@ int cf_tlb_miss(struct pt_regs *regs, int write, int dtlb, int extension_word)
 	return ret;
 }
 
+size_t coldfire_dma_base = _ramend - CONFIG_DMASIZE;
+
 void __init cf_bootmem_alloc(void)
 {
 	unsigned long memstart;
@@ -179,6 +181,9 @@ void __init cf_bootmem_alloc(void)
 	/* Reserve kernel text/data/bss */
 	memblock_reserve(_rambase, memstart - _rambase);
 
+	/* Reserve DMA */
+	memblock_reserve(coldfire_dma_base, CONFIG_DMASIZE);
+
 	m68k_virt_to_node_shift = fls(_ramend - 1) - 6;
 	module_fixup(NULL, __start_fixup, __stop_fixup);
 

-- 
2.39.5

