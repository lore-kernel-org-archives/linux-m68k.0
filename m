From: Yannick GICQUEL <yannick.gicquel@open.eurogiciel.org>
Subject: [RFC 4/8] m68k: m5441x: add ColdFire 5441x CPU MMU memory init code
Date: Wed,  8 Jul 2015 11:51:28 +0200
Message-ID: <1436349092-2214-5-git-send-email-yannick.gicquel@gmail.com>
References: <1436349092-2214-1-git-send-email-yannick.gicquel@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:33885 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933086AbbGHJvw (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 8 Jul 2015 05:51:52 -0400
Received: by wifm2 with SMTP id m2so84011439wif.1
        for <linux-m68k@vger.kernel.org>; Wed, 08 Jul 2015 02:51:51 -0700 (PDT)
Received: from PCL140005.eurogiciel.fr (130.167.26.109.rev.sfr.net. [109.26.167.130])
        by smtp.gmail.com with ESMTPSA id k16sm2551260wjr.7.2015.07.08.02.51.50
        for <linux-m68k@vger.kernel.org>
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 08 Jul 2015 02:51:50 -0700 (PDT)
In-Reply-To: <1436349092-2214-1-git-send-email-yannick.gicquel@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

This is same code as currently present in m54xx.c file which
was initially integrated in 88be3515.
This is not very elegant because of source code duplication
but this do the job.

Signed-off-by: Yannick GICQUEL <yannick.gicquel@gmail.com>
---
 arch/m68k/coldfire/m5441x.c | 47 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
index 98a13cc..5924a21 100644
--- a/arch/m68k/coldfire/m5441x.c
+++ b/arch/m68k/coldfire/m5441x.c
@@ -16,6 +16,13 @@
 #include <asm/mcfdma.h>
 #include <asm/mcfclk.h>
 
+#ifdef CONFIG_MMU
+#include <linux/mm.h>
+#include <linux/bootmem.h>
+#include <asm/pgalloc.h>
+#include <asm/mmu_context.h>
+#endif
+
 DEFINE_CLK(0, "flexbus", 2, MCF_CLK);
 DEFINE_CLK(0, "mcfcan.0", 8, MCF_CLK);
 DEFINE_CLK(0, "mcfcan.1", 9, MCF_CLK);
@@ -215,8 +222,48 @@ static void __init m5441x_fec_init(void)
 	__raw_writeb(0x03, MCFGPIO_PAR_FEC);
 }
 
+
+#ifdef CONFIG_MMU
+
+unsigned long num_pages;
+
+static void __init mcf54xx_bootmem_alloc(void)
+{
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
+#endif /* CONFIG_MMU */
+
+
 void __init config_BSP(char *commandp, int size)
 {
+#ifdef CONFIG_MMU
+	mcf54xx_bootmem_alloc();
+	mmu_context_init();
+#endif
 	m5441x_clk_init();
 	mach_sched_init = hw_timer_init;
 	m5441x_uarts_init();
-- 
1.9.1.286.g5172cb3
