From: <gerg@snapgear.com>
Subject: [PATCH 07/36] m68k: add ColdFire 54xx CPU MMU memory init code
Date: Tue, 25 Oct 2011 17:18:59 +1000
Message-ID: <1319527168-11166-8-git-send-email-gerg@snapgear.com>
References: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:25202 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754559Ab1JYHVF (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 25 Oct 2011 03:21:05 -0400
In-Reply-To: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Add code to the 54xx ColdFire CPU init to setup memory ready for the
m68k paged memory start up.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/platform/54xx/config.c |   52 ++++++++++++++++++++++++++++++++++++++
 1 files changed, 52 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/platform/54xx/config.c b/arch/m68k/platform/54xx/config.c
index 7813098..bc85b98 100644
--- a/arch/m68k/platform/54xx/config.c
+++ b/arch/m68k/platform/54xx/config.c
@@ -13,11 +13,17 @@
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/mm.h>
+#include <linux/bootmem.h>
+#include <asm/pgalloc.h>
 #include <asm/machdep.h>
 #include <asm/coldfire.h>
 #include <asm/m54xxsim.h>
 #include <asm/mcfuart.h>
 #include <asm/m54xxgpt.h>
+#ifdef CONFIG_MMU
+#include <asm/mmu_context.h>
+#endif
 
 /***************************************************************************/
 
@@ -95,8 +101,54 @@ static void mcf54xx_reset(void)
 
 /***************************************************************************/
 
+#ifdef CONFIG_MMU
+
+unsigned long num_pages;
+
+static void __init mcf54xx_bootmem_alloc(void)
+{
+	extern unsigned int _rambase, _ramstart, _ramend;
+	unsigned long start_pfn;
+	unsigned long memstart;
+
+	/* _rambase and _ramend will be natureally page aligned */
+	m68k_memory[0].addr = _rambase;
+	m68k_memory[0].size = _ramend - _rambase;
+
+	/* compute total pages in system */
+	num_pages = (_ramend - _rambase) >> PAGE_SHIFT;
+
+	/* page numbers */
+	memstart = PAGE_ALIGN(_ramstart);
+	min_low_pfn = _rambase >> PAGE_SHIFT;
+	start_pfn = memstart >> PAGE_SHIFT;
+	max_low_pfn = _ramend >> PAGE_SHIFT;
+	high_memory = (void *)_ramend;
+
+	m68k_virt_to_node_shift = fls(_ramend - _rambase - 1) - 6;
+	module_fixup(NULL, __start_fixup, __stop_fixup);
+
+	/* setup bootmem data */
+	m68k_setup_node(0);
+	memstart += init_bootmem_node(NODE_DATA(0), start_pfn,
+		min_low_pfn, max_low_pfn);
+	free_bootmem_node(NODE_DATA(0), memstart, _ramend - memstart);
+}
+
+#endif /* CONFIG_MMU */
+
+/***************************************************************************/
+
 void __init config_BSP(char *commandp, int size)
 {
+#ifdef CONFIG_MMU
+	m68k_cputype = CPU_COLDFIRE;
+	m68k_fputype = FPU_COLDFIRE;
+	m68k_mmutype = MMU_COLDFIRE;
+	m68k_machtype = MACH_M54XX;
+	mcf54xx_bootmem_alloc();
+	mmu_context_init();
+#endif
 	mach_reset = mcf54xx_reset;
 	m54xx_uarts_init();
 }
-- 
1.7.0.4
