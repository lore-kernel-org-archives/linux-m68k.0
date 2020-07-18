Return-Path: <SRS0=yKKv=A5=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8266C433E3
	for <linux-m68k@archiver.kernel.org>; Sat, 18 Jul 2020 16:27:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A85CE2080D
	for <linux-m68k@archiver.kernel.org>; Sat, 18 Jul 2020 16:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595089628;
	bh=yesiOQL+YnhUUgvcky1bA+VAnQdTKUMfUbn64XdIPuc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=ddqS3qobacknsMirvBymZCVR2A1Q8Qf6kS3Pboh4op34ci8lA6bWMGLuwq1Sf2qKQ
	 E1wryn9ClV+5ljDEEp2btokl92PmVIFSzKuAAbS/klwUBM/biEy8AIyjkeTI+qsfaw
	 cE2UZRFcCq66mRLJqgttHa/o97Ioc9WcLH303K3U=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727780AbgGRQ1I (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 18 Jul 2020 12:27:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:36598 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726346AbgGRQ1I (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 18 Jul 2020 12:27:08 -0400
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 00D6D2083B;
        Sat, 18 Jul 2020 16:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595089627;
        bh=yesiOQL+YnhUUgvcky1bA+VAnQdTKUMfUbn64XdIPuc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XmacWtoMwwoNWLJsCvXSkWQDp7gfoeLKXXekB3RJ9DegTNKKFRAjZDEq7Sm8BYrj2
         wWlYAABoHRxeC0Sii0RBeNFKSNHPuYVtN0aU4toF36y0MU05Pg6AU/RknN6YBarTYl
         kPUlvJFbo4ttCDqVKo+U9YIB3hfUBZmo0zXM0KfU=
From:   Mike Rapoport <rppt@kernel.org>
To:     linux-m68k@lists.linux-m68k.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Andreas Schwab <schwab@linux-m68k.org>,
        Finn Thain <fthain@telegraphics.com.au>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Mike Rapoport <rppt@kernel.org>
Subject: [PATCH v3 3/3] m68k/mm: switch from DISCONTIGMEM to SPARSEMEM
Date:   Sat, 18 Jul 2020 19:26:51 +0300
Message-Id: <20200718162651.26538-4-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200718162651.26538-1-rppt@kernel.org>
References: <20200718162651.26538-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

From: Mike Rapoport <rppt@linux.ibm.com>

Enable SPARSEMEM support for systems with !SINGLE_MEMORY_CHUNK.
With SPARSEMEM there is a single node for the entire physical memory and to
cope with holes in the physical address space it is divided to sections of
up to 4M or 16M, depending on CONFIG_MEMORY_LIMIT_1G.

Each section has it's own memory map which size depends on actual populated
memory.

The DISCONTIGMEM is marked BROKEN and will be removed in a couple of
releases.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/m68k/Kconfig.cpu   | 17 +++++++++++++++++
 arch/m68k/mm/motorola.c | 39 ++++++++++++++++++++++++++++++++++++---
 2 files changed, 53 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index 3af0fca03803..4e8a124741d6 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -21,6 +21,7 @@ choice
 config M68KCLASSIC
 	bool "Classic M68K CPU family support"
 	select NEED_MULTIPLE_NODES if DISCONTIGMEM
+	select SPARSEMEM_STATIC if SPARSEMEM
 
 config COLDFIRE
 	bool "Coldfire CPU family support"
@@ -380,9 +381,25 @@ config SINGLE_MEMORY_CHUNK
 	  purposes.  This will save a few bytes kernel size and may speed up
 	  some operations.  Say N if not sure.
 
+config MEMORY_LIMIT_1G
+	bool "Limit maximal physical memory to 1G"
+	depends on MMU && !SINGLE_MEMORY_CHUNK
+	help
+	  Limit the physical memory addressable by the kernel to 1G.
+	  On systems that have several chunks of physical memory and the
+	  hole between these chunks is less than 16M this will prevent
+	  wasting memory on empty memory map. Say N if not sure.
+
 config ARCH_DISCONTIGMEM_ENABLE
+	def_bool no
+	depends on BROKEN && MMU && !SINGLE_MEMORY_CHUNK
+
+config ARCH_SPARSEMEM_ENABLE
 	def_bool MMU && !SINGLE_MEMORY_CHUNK
 
+config HAVE_ARCH_PFN_VALID
+	def_bool SPARSEMEM
+
 config 060_WRITETHROUGH
 	bool "Use write-through caching for 68060 supervisor accesses"
 	depends on ADVANCED && M68060
diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
index 2bb006bdc31c..6a513b9c919d 100644
--- a/arch/m68k/mm/motorola.c
+++ b/arch/m68k/mm/motorola.c
@@ -384,6 +384,39 @@ static void __init map_node(int node)
 #endif
 }
 
+#ifdef CONFIG_SPARSEMEM
+static void mem_model_init(void)
+{
+	m68k_setup_node(0);
+	node_set_state(0, N_NORMAL_MEMORY);
+
+	/*
+	 * Make sure the memory map is allocated from top of the
+	 * memory.
+	 * Otherwise for systems with both ST-RAM and FastRam, ST-RAM
+	 * gets filled with the memory map leaving no space for
+	 * framebuffer
+	 */
+	memblock_set_bottom_up(false);
+	memblocks_present();
+	sparse_init();
+	memblock_set_bottom_up(true);
+}
+#else
+static void mem_model_init(void)
+{
+	unsigned long zones_size[MAX_NR_ZONES] = { 0, };
+	int i;
+
+	for (i = 0; i < m68k_num_memory; i++) {
+		m68k_setup_node(i);
+		if (node_present_pages(i))
+			node_set_state(i, N_NORMAL_MEMORY);
+	}
+}
+#endif
+
+
 /*
  * paging_init() continues the virtual memory environment setup which
  * was begun by the code in arch/head.S.
@@ -449,10 +482,8 @@ void __init paging_init(void)
 	 */
 	memblock_set_bottom_up(true);
 
-	for (i = 0; i < m68k_num_memory; i++) {
-		m68k_setup_node(i);
+	for (i = 0; i < m68k_num_memory; i++)
 		map_node(i);
-	}
 
 	flush_tlb_all();
 
@@ -477,6 +508,8 @@ void __init paging_init(void)
 		if (node_present_pages(i))
 			node_set_state(i, N_NORMAL_MEMORY);
 
+	mem_model_init();
+
 	max_zone_pfn[ZONE_DMA] = memblock_end_of_DRAM();
 	free_area_init(max_zone_pfn);
 }
-- 
2.26.2

