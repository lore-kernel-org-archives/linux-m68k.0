From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 15/22] m68k/sun3: Modernize printing of kernel messages
Date: Wed,  7 Dec 2016 16:09:13 +0100
Message-ID: <1481123360-10978-16-git-send-email-geert@linux-m68k.org>
References: <1481123360-10978-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1481123360-10978-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@linux-m68k.org>, Sam Creasey <sammy@sammy.net>, Joshua Thompson <funaho@jurai.org>, Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

  - Convert from printk() to pr_*(),
  - Add missing continuations,
  - Do not print nonexistent len variable,
  - Add missing sysname[] variable,
  - Correct printf()-style format specifiers.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/sun3/config.c      |  2 +-
 arch/m68k/sun3/dvma.c        |  3 +--
 arch/m68k/sun3/idprom.c      |  8 ++++---
 arch/m68k/sun3/mmu_emu.c     | 47 ++++++++++++++++++++--------------------
 arch/m68k/sun3/prom/printf.c |  2 +-
 arch/m68k/sun3/sun3dvma.c    | 51 +++++++++++++++++++-------------------------
 6 files changed, 54 insertions(+), 59 deletions(-)

diff --git a/arch/m68k/sun3/config.c b/arch/m68k/sun3/config.c
index 3af34fa3a344ba85..1d28d380e8cc1037 100644
--- a/arch/m68k/sun3/config.c
+++ b/arch/m68k/sun3/config.c
@@ -134,7 +134,7 @@ void __init config_sun3(void)
 {
 	unsigned long memory_start, memory_end;
 
-	printk("ARCH: SUN3\n");
+	pr_info("ARCH: SUN3\n");
 	idprom_init();
 
 	/* Subtract kernel memory from available memory */
diff --git a/arch/m68k/sun3/dvma.c b/arch/m68k/sun3/dvma.c
index d95506e06c2ac42b..ca02ee25894cc4a5 100644
--- a/arch/m68k/sun3/dvma.c
+++ b/arch/m68k/sun3/dvma.c
@@ -31,8 +31,7 @@ static unsigned long dvma_page(unsigned long kaddr, unsigned long vaddr)
 
 	ptep = pfn_pte(virt_to_pfn(kaddr), PAGE_KERNEL);
 	pte = pte_val(ptep);
-//		printk("dvma_remap: addr %lx -> %lx pte %08lx len %x\n",
-//		       kaddr, vaddr, pte, len);
+//	pr_info("dvma_remap: addr %lx -> %lx pte %08lx\n", kaddr, vaddr, pte);
 	if(ptelist[(vaddr & 0xff000) >> PAGE_SHIFT] != pte) {
 		sun3_put_pte(vaddr, pte);
 		ptelist[(vaddr & 0xff000) >> PAGE_SHIFT] = pte;
diff --git a/arch/m68k/sun3/idprom.c b/arch/m68k/sun3/idprom.c
index cfe9aa4223431764..9c23f506d60df450 100644
--- a/arch/m68k/sun3/idprom.c
+++ b/arch/m68k/sun3/idprom.c
@@ -64,12 +64,14 @@ static void __init display_system_type(unsigned char machtype)
 	for (i = 0; i < NUM_SUN_MACHINES; i++) {
 		if(Sun_Machines[i].id_machtype == machtype) {
 			if (machtype != (SM_SUN4M_OBP | 0x00))
-				printk("TYPE: %s\n", Sun_Machines[i].name);
+				pr_info("TYPE: %s\n", Sun_Machines[i].name);
 			else {
 #if 0
+				char sysname[128];
+
 				prom_getproperty(prom_root_node, "banner-name",
 						 sysname, sizeof(sysname));
-				printk("TYPE: %s\n", sysname);
+				pr_info("TYPE: %s\n", sysname);
 #endif
 			}
 			return;
@@ -125,5 +127,5 @@ void __init idprom_init(void)
 
 	display_system_type(idprom->id_machtype);
 
-	printk("Ethernet address: %pM\n", idprom->id_ethaddr);
+	pr_info("Ethernet address: %pM\n", idprom->id_ethaddr);
 }
diff --git a/arch/m68k/sun3/mmu_emu.c b/arch/m68k/sun3/mmu_emu.c
index 3f258e230ba5d0c9..fc672c74ede7b155 100644
--- a/arch/m68k/sun3/mmu_emu.c
+++ b/arch/m68k/sun3/mmu_emu.c
@@ -72,21 +72,21 @@ void print_pte (pte_t pte)
 #if 0
 	/* Verbose version. */
 	unsigned long val = pte_val (pte);
-	printk (" pte=%lx [addr=%lx",
+	pr_cont(" pte=%lx [addr=%lx",
 		val, (val & SUN3_PAGE_PGNUM_MASK) << PAGE_SHIFT);
-	if (val & SUN3_PAGE_VALID)	printk (" valid");
-	if (val & SUN3_PAGE_WRITEABLE)	printk (" write");
-	if (val & SUN3_PAGE_SYSTEM)	printk (" sys");
-	if (val & SUN3_PAGE_NOCACHE)	printk (" nocache");
-	if (val & SUN3_PAGE_ACCESSED)	printk (" accessed");
-	if (val & SUN3_PAGE_MODIFIED)	printk (" modified");
+	if (val & SUN3_PAGE_VALID)	pr_cont(" valid");
+	if (val & SUN3_PAGE_WRITEABLE)	pr_cont(" write");
+	if (val & SUN3_PAGE_SYSTEM)	pr_cont(" sys");
+	if (val & SUN3_PAGE_NOCACHE)	pr_cont(" nocache");
+	if (val & SUN3_PAGE_ACCESSED)	pr_cont(" accessed");
+	if (val & SUN3_PAGE_MODIFIED)	pr_cont(" modified");
 	switch (val & SUN3_PAGE_TYPE_MASK) {
-		case SUN3_PAGE_TYPE_MEMORY: printk (" memory"); break;
-		case SUN3_PAGE_TYPE_IO:     printk (" io");     break;
-		case SUN3_PAGE_TYPE_VME16:  printk (" vme16");  break;
-		case SUN3_PAGE_TYPE_VME32:  printk (" vme32");  break;
+		case SUN3_PAGE_TYPE_MEMORY: pr_cont(" memory"); break;
+		case SUN3_PAGE_TYPE_IO:     pr_cont(" io");     break;
+		case SUN3_PAGE_TYPE_VME16:  pr_cont(" vme16");  break;
+		case SUN3_PAGE_TYPE_VME32:  pr_cont(" vme32");  break;
 	}
-	printk ("]\n");
+	pr_cont("]\n");
 #else
 	/* Terse version. More likely to fit on a line. */
 	unsigned long val = pte_val (pte);
@@ -108,7 +108,7 @@ void print_pte (pte_t pte)
 		default: type = "unknown?"; break;
 	}
 
-	printk (" pte=%08lx [%07lx %s %s]\n",
+	pr_cont(" pte=%08lx [%07lx %s %s]\n",
 		val, (val & SUN3_PAGE_PGNUM_MASK) << PAGE_SHIFT, flags, type);
 #endif
 }
@@ -116,7 +116,7 @@ void print_pte (pte_t pte)
 /* Print the PTE value for a given virtual address. For debugging. */
 void print_pte_vaddr (unsigned long vaddr)
 {
-	printk (" vaddr=%lx [%02lx]", vaddr, sun3_get_segmap (vaddr));
+	pr_cont(" vaddr=%lx [%02lx]", vaddr, sun3_get_segmap (vaddr));
 	print_pte (__pte (sun3_get_pte (vaddr)));
 }
 
@@ -153,7 +153,7 @@ void __init mmu_emu_init(unsigned long bootmem_end)
 
 		if(!pmeg_alloc[i]) {
 #ifdef DEBUG_MMU_EMU
-			printk("freed: ");
+			pr_info("freed:");
 			print_pte_vaddr (seg);
 #endif
 			sun3_put_segmap(seg, SUN3_INVALID_PMEG);
@@ -165,7 +165,7 @@ void __init mmu_emu_init(unsigned long bootmem_end)
 		if (sun3_get_segmap (seg) != SUN3_INVALID_PMEG) {
 #ifdef DEBUG_PROM_MAPS
 			for(i = 0; i < 16; i++) {
-				printk ("mapped:");
+				pr_info("mapped:");
 				print_pte_vaddr (seg + (i*PAGE_SIZE));
 				break;
 			}
@@ -293,8 +293,8 @@ inline void mmu_emu_map_pmeg (int context, int vaddr)
 
 
 #ifdef DEBUG_MMU_EMU
-printk("mmu_emu_map_pmeg: pmeg %x to context %d vaddr %x\n",
-       curr_pmeg, context, vaddr);
+	pr_info("mmu_emu_map_pmeg: pmeg %x to context %d vaddr %x\n",
+		curr_pmeg, context, vaddr);
 #endif
 
 	/* Invalidate old mapping for the pmeg, if any */
@@ -370,7 +370,7 @@ int mmu_emu_handle_fault (unsigned long vaddr, int read_flag, int kernel_fault)
 	}
 
 #ifdef DEBUG_MMU_EMU
-	printk ("mmu_emu_handle_fault: vaddr=%lx type=%s crp=%p\n",
+	pr_info("mmu_emu_handle_fault: vaddr=%lx type=%s crp=%p\n",
 		vaddr, read_flag ? "read" : "write", crp);
 #endif
 
@@ -378,14 +378,15 @@ int mmu_emu_handle_fault (unsigned long vaddr, int read_flag, int kernel_fault)
 	offset  = (vaddr >> SUN3_PTE_SIZE_BITS) & 0xF;
 
 #ifdef DEBUG_MMU_EMU
-	printk ("mmu_emu_handle_fault: segment=%lx offset=%lx\n", segment, offset);
+	pr_info("mmu_emu_handle_fault: segment=%lx offset=%lx\n", segment,
+		offset);
 #endif
 
 	pte = (pte_t *) pgd_val (*(crp + segment));
 
 //todo: next line should check for valid pmd properly.
 	if (!pte) {
-//                printk ("mmu_emu_handle_fault: invalid pmd\n");
+//                pr_info("mmu_emu_handle_fault: invalid pmd\n");
                 return 0;
         }
 
@@ -417,9 +418,9 @@ int mmu_emu_handle_fault (unsigned long vaddr, int read_flag, int kernel_fault)
 		pte_val (*pte) |= SUN3_PAGE_ACCESSED;
 
 #ifdef DEBUG_MMU_EMU
-	printk ("seg:%d crp:%p ->", get_fs().seg, crp);
+	pr_info("seg:%ld crp:%p ->", get_fs().seg, crp);
 	print_pte_vaddr (vaddr);
-	printk ("\n");
+	pr_cont("\n");
 #endif
 
 	return 1;
diff --git a/arch/m68k/sun3/prom/printf.c b/arch/m68k/sun3/prom/printf.c
index df85018f487ac1a5..5b82bea03493e8e3 100644
--- a/arch/m68k/sun3/prom/printf.c
+++ b/arch/m68k/sun3/prom/printf.c
@@ -39,7 +39,7 @@
 
 #ifdef CONFIG_KGDB
 	if (kgdb_initialized) {
-		printk("kgdb_initialized = %d\n", kgdb_initialized);
+		pr_info("kgdb_initialized = %d\n", kgdb_initialized);
 		putpacket(bptr, 1);
 	} else
 #else
diff --git a/arch/m68k/sun3/sun3dvma.c b/arch/m68k/sun3/sun3dvma.c
index b37521a5259ddb7a..d36bd15f9fdcda46 100644
--- a/arch/m68k/sun3/sun3dvma.c
+++ b/arch/m68k/sun3/sun3dvma.c
@@ -62,7 +62,7 @@ static void print_use(void)
 	int i;
 	int j = 0;
 
-	printk("dvma entry usage:\n");
+	pr_info("dvma entry usage:\n");
 
 	for(i = 0; i < IOMMU_TOTAL_ENTRIES; i++) {
 		if(!iommu_use[i])
@@ -70,16 +70,15 @@ static void print_use(void)
 
 		j++;
 
-		printk("dvma entry: %08lx len %08lx\n",
-		       ( i << DVMA_PAGE_SHIFT) + DVMA_START,
-		       iommu_use[i]);
+		pr_info("dvma entry: %08x len %08lx\n",
+			(i << DVMA_PAGE_SHIFT) + DVMA_START, iommu_use[i]);
 	}
 
-	printk("%d entries in use total\n", j);
+	pr_info("%d entries in use total\n", j);
 
-	printk("allocation/free calls: %lu/%lu\n", dvma_allocs, dvma_frees);
-	printk("allocation/free bytes: %Lx/%Lx\n", dvma_alloc_bytes,
-	       dvma_free_bytes);
+	pr_info("allocation/free calls: %lu/%lu\n", dvma_allocs, dvma_frees);
+	pr_info("allocation/free bytes: %Lx/%Lx\n", dvma_alloc_bytes,
+		dvma_free_bytes);
 }
 
 static void print_holes(struct list_head *holes)
@@ -88,18 +87,18 @@ static void print_holes(struct list_head *holes)
 	struct list_head *cur;
 	struct hole *hole;
 
-	printk("listing dvma holes\n");
+	pr_info("listing dvma holes\n");
 	list_for_each(cur, holes) {
 		hole = list_entry(cur, struct hole, list);
 
 		if((hole->start == 0) && (hole->end == 0) && (hole->size == 0))
 			continue;
 
-		printk("hole: start %08lx end %08lx size %08lx\n", hole->start, hole->end, hole->size);
+		pr_info("hole: start %08lx end %08lx size %08lx\n",
+			hole->start, hole->end, hole->size);
 	}
 
-	printk("end of hole listing...\n");
-
+	pr_info("end of hole listing...\n");
 }
 #endif /* DVMA_DEBUG */
 
@@ -137,7 +136,7 @@ static inline struct hole *rmcache(void)
 
 	if(list_empty(&hole_cache)) {
 		if(!refill()) {
-			printk("out of dvma hole cache!\n");
+			pr_crit("out of dvma hole cache!\n");
 			BUG();
 		}
 	}
@@ -157,7 +156,7 @@ static inline unsigned long get_baddr(int len, unsigned long align)
 
 	if(list_empty(&hole_list)) {
 #ifdef DVMA_DEBUG
-		printk("out of dvma holes! (printing hole cache)\n");
+		pr_crit("out of dvma holes! (printing hole cache)\n");
 		print_holes(&hole_cache);
 		print_use();
 #endif
@@ -195,7 +194,7 @@ static inline unsigned long get_baddr(int len, unsigned long align)
 
 	}
 
-	printk("unable to find dvma hole!\n");
+	pr_crit("unable to find dvma hole!\n");
 	BUG();
 	return 0;
 }
@@ -287,15 +286,12 @@ unsigned long dvma_map_align(unsigned long kaddr, int len, int align)
 		len = 0x800;
 
 	if(!kaddr || !len) {
-//		printk("error: kaddr %lx len %x\n", kaddr, len);
+//		pr_err("error: kaddr %lx len %x\n", kaddr, len);
 //		*(int *)4 = 0;
 		return 0;
 	}
 
-#ifdef DEBUG
-	printk("dvma_map request %08lx bytes from %08lx\n",
-	       len, kaddr);
-#endif
+	pr_debug("dvma_map request %08x bytes from %08lx\n", len, kaddr);
 	off = kaddr & ~DVMA_PAGE_MASK;
 	kaddr &= PAGE_MASK;
 	len += off;
@@ -307,12 +303,13 @@ unsigned long dvma_map_align(unsigned long kaddr, int len, int align)
 		align = ((align + (DVMA_PAGE_SIZE-1)) & DVMA_PAGE_MASK);
 
 	baddr = get_baddr(len, align);
-//	printk("using baddr %lx\n", baddr);
+//	pr_info("using baddr %lx\n", baddr);
 
 	if(!dvma_map_iommu(kaddr, baddr, len))
 		return (baddr + off);
 
-	printk("dvma_map failed kaddr %lx baddr %lx len %x\n", kaddr, baddr, len);
+	pr_crit("dvma_map failed kaddr %lx baddr %lx len %x\n", kaddr, baddr,
+	len);
 	BUG();
 	return 0;
 }
@@ -343,9 +340,7 @@ void *dvma_malloc_align(unsigned long len, unsigned long align)
 	if(!len)
 		return NULL;
 
-#ifdef DEBUG
-	printk("dvma_malloc request %lx bytes\n", len);
-#endif
+	pr_debug("dvma_malloc request %lx bytes\n", len);
 	len = ((len + (DVMA_PAGE_SIZE-1)) & DVMA_PAGE_MASK);
 
         if((kaddr = __get_free_pages(GFP_ATOMIC, get_order(len))) == 0)
@@ -364,10 +359,8 @@ void *dvma_malloc_align(unsigned long len, unsigned long align)
 		return NULL;
 	}
 
-#ifdef DEBUG
-	printk("mapped %08lx bytes %08lx kern -> %08lx bus\n",
-	       len, kaddr, baddr);
-#endif
+	pr_debug("mapped %08lx bytes %08lx kern -> %08lx bus\n", len, kaddr,
+		 baddr);
 
 	return (void *)vaddr;
 
-- 
1.9.1
