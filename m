From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 16/22] m68k/sun3x: Modernize printing of kernel messages
Date: Wed,  7 Dec 2016 16:09:14 +0100
Message-ID: <1481123360-10978-17-git-send-email-geert__27363.5921221741$1481123895$gmane$org@linux-m68k.org>
References: <1481123360-10978-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1481123360-10978-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@linux-m68k.org>, Sam Creasey <sammy@sammy.net>, Joshua Thompson <funaho@jurai.org>, Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

  - Convert from printk() to pr_*(),
  - Remove #undef DEBUG,
  - Drop useless Warning prefix,
  - Use TABs for indentation while at it.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/include/asm/sun3xflop.h | 14 +++++++-------
 arch/m68k/sun3x/dvma.c            | 35 +++++++++++++----------------------
 arch/m68k/sun3x/prom.c            |  4 ++--
 3 files changed, 22 insertions(+), 31 deletions(-)

diff --git a/arch/m68k/include/asm/sun3xflop.h b/arch/m68k/include/asm/sun3xflop.h
index a02ea3a7bb20a029..159269b7f2e8d61e 100644
--- a/arch/m68k/include/asm/sun3xflop.h
+++ b/arch/m68k/include/asm/sun3xflop.h
@@ -48,7 +48,7 @@ static unsigned char sun3x_82072_fd_inb(int port)
 //	udelay(5);
 	switch(port & 7) {
 	default:
-		printk("floppy: Asked to read unknown port %d\n", port);
+		pr_crit("floppy: Asked to read unknown port %d\n", port);
 		panic("floppy: Port bolixed.");
 	case 4: /* FD_STATUS */
 		return (*sun3x_fdc.status_r) & ~STATUS_DMA;
@@ -70,7 +70,7 @@ static void sun3x_82072_fd_outb(unsigned char value, int port)
 //	udelay(5);
 	switch(port & 7) {
 	default:
-		printk("floppy: Asked to write to unknown port %d\n", port);
+		pr_crit("floppy: Asked to write to unknown port %d\n", port);
 		panic("floppy: Port bolixed.");
 	case 2: /* FD_DOR */
 		/* Oh geese, 82072 on the Sun has no DOR register,
@@ -127,7 +127,7 @@ asmlinkage irqreturn_t sun3xflop_hardint(int irq, void *dev_id)
 		return IRQ_HANDLED;
 	}
 
-//	printk("doing pdma\n");// st %x\n", sun_fdc->status_82072);
+//	pr_info("doing pdma\n");// st %x\n", sun_fdc->status_82072);
 
 #ifdef TRACE_FLPY_INT
 	if(!calls)
@@ -171,7 +171,7 @@ asmlinkage irqreturn_t sun3xflop_hardint(int irq, void *dev_id)
 #ifdef TRACE_FLPY_INT
 	calls++;
 #endif
-//	printk("st=%02x\n", st);
+//	pr_info("st=%02x\n", st);
 	if(st == 0x20)
 		return IRQ_HANDLED;
 	if(!(st & 0x20)) {
@@ -180,9 +180,9 @@ asmlinkage irqreturn_t sun3xflop_hardint(int irq, void *dev_id)
 		doing_pdma = 0;
 
 #ifdef TRACE_FLPY_INT
-		printk("count=%x, residue=%x calls=%d bytes=%x dma_wait=%d\n",
-		       virtual_dma_count, virtual_dma_residue, calls, bytes,
-		       dma_wait);
+		pr_info("count=%x, residue=%x calls=%d bytes=%x dma_wait=%d\n",
+			virtual_dma_count, virtual_dma_residue, calls, bytes,
+			dma_wait);
 		calls = 0;
 		dma_wait=0;
 #endif
diff --git a/arch/m68k/sun3x/dvma.c b/arch/m68k/sun3x/dvma.c
index d5ddcdaa23473561..9413c8724b0d3372 100644
--- a/arch/m68k/sun3x/dvma.c
+++ b/arch/m68k/sun3x/dvma.c
@@ -58,21 +58,17 @@
 					 ((addr & 0x03c00000) >>     \
 						(DVMA_PAGE_SHIFT+4)))
 
-#undef DEBUG
-
 #ifdef DEBUG
 /* code to print out a dvma mapping for debugging purposes */
 void dvma_print (unsigned long dvma_addr)
 {
 
-        unsigned long index;
-
-        index = dvma_addr >> DVMA_PAGE_SHIFT;
-
-        printk("idx %lx dvma_addr %08lx paddr %08lx\n", index, dvma_addr,
-               dvma_entry_paddr(index));
+	unsigned long index;
 
+	index = dvma_addr >> DVMA_PAGE_SHIFT;
 
+	pr_info("idx %lx dvma_addr %08lx paddr %08lx\n", index, dvma_addr,
+		dvma_entry_paddr(index));
 }
 #endif
 
@@ -91,10 +87,7 @@ inline int dvma_map_cpu(unsigned long kaddr,
 
 	end = PAGE_ALIGN(vaddr + len);
 
-#ifdef DEBUG
-	printk("dvma: mapping kern %08lx to virt %08lx\n",
-	       kaddr, vaddr);
-#endif
+	pr_debug("dvma: mapping kern %08lx to virt %08lx\n", kaddr, vaddr);
 	pgd = pgd_offset_k(vaddr);
 
 	do {
@@ -126,10 +119,8 @@ inline int dvma_map_cpu(unsigned long kaddr,
 				end3 = end2;
 
 			do {
-#ifdef DEBUG
-				printk("mapping %08lx phys to %08lx\n",
-				       __pa(kaddr), vaddr);
-#endif
+				pr_debug("mapping %08lx phys to %08lx\n",
+					 __pa(kaddr), vaddr);
 				set_pte(pte, pfn_pte(virt_to_pfn(kaddr),
 						     PAGE_KERNEL));
 				pte++;
@@ -162,7 +153,8 @@ inline int dvma_map_iommu(unsigned long kaddr, unsigned long baddr,
 	for(; index < end ; index++) {
 //		if(dvma_entry_use(index))
 //			BUG();
-//		printk("mapping pa %lx to ba %lx\n", __pa(kaddr), index << DVMA_PAGE_SHIFT);
+//		pr_info("mapping pa %lx to ba %lx\n", __pa(kaddr),
+//			index << DVMA_PAGE_SHIFT);
 
 		dvma_entry_set(index, __pa(kaddr));
 
@@ -190,13 +182,12 @@ void dvma_unmap_iommu(unsigned long baddr, int len)
 	end = (DVMA_PAGE_ALIGN(baddr+len) >> DVMA_PAGE_SHIFT);
 
 	for(; index < end ; index++) {
-#ifdef DEBUG
-		printk("freeing bus mapping %08x\n", index << DVMA_PAGE_SHIFT);
-#endif
+		pr_debug("freeing bus mapping %08x\n",
+			 index << DVMA_PAGE_SHIFT);
 #if 0
 		if(!dvma_entry_use(index))
-			printk("dvma_unmap freeing unused entry %04x\n",
-			       index);
+			pr_info("dvma_unmap freeing unused entry %04x\n",
+				index);
 		else
 			dvma_entry_dec(index);
 #endif
diff --git a/arch/m68k/sun3x/prom.c b/arch/m68k/sun3x/prom.c
index 0898c3f8150851a3..5d60e65c1ee5274e 100644
--- a/arch/m68k/sun3x/prom.c
+++ b/arch/m68k/sun3x/prom.c
@@ -106,9 +106,9 @@ void __init sun3x_prom_init(void)
 	idprom_init();
 
 	if (!((idprom->id_machtype & SM_ARCH_MASK) == SM_SUN3X)) {
-		printk("Warning: machine reports strange type %02x\n",
+		pr_warn("Machine reports strange type %02x\n",
 			idprom->id_machtype);
-		printk("Pretending it's a 3/80, but very afraid...\n");
+		pr_warn("Pretending it's a 3/80, but very afraid...\n");
 		idprom->id_machtype = SM_SUN3X | SM_3_80;
 	}
 
-- 
1.9.1
