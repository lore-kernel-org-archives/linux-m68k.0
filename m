From: <gerg@snapgear.com>
Subject: [PATCH 09/35] m68k: add ColdFire 54xx CPU MMU memory init code
Date: Fri, 16 Dec 2011 22:36:06 +1000
Message-ID: <1324038992-31222-10-git-send-email-gerg@snapgear.com>
References: <1324038992-31222-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:49381 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759271Ab1LPMgw (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 16 Dec 2011 07:36:52 -0500
In-Reply-To: <1324038992-31222-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Add code to the 54xx ColdFire CPU init to setup memory ready for the m68k
paged memory start up.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Matt Waddel <mwaddel@yahoo.com>
Acked-by: Kurt Mahan <kmahan@xmission.com>
---
 arch/m68k/platform/54xx/config.c |   48 ++++++++++++++++++++++++++++++++++++++
 1 files changed, 48 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/platform/54xx/config.c b/arch/m68k/platform/54xx/config.c
index 7813098..09be59c 100644
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
 
@@ -95,8 +101,50 @@ static void mcf54xx_reset(void)
 
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
+	/* _rambase and _ramend will be naturally page aligned */
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
+	mcf54xx_bootmem_alloc();
+	mmu_context_init();
+#endif
 	mach_reset = mcf54xx_reset;
 	m54xx_uarts_init();
 }
-- 
1.7.0.4
