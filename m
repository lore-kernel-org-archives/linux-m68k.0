From: <gerg@snapgear.com>
Subject: [PATCH] m68k: print memory layout info in boot log
Date: Fri, 21 Oct 2011 17:07:32 +1000
Message-ID: <1319180852-11105-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:37542 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752586Ab1JUHOa (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 21 Oct 2011 03:14:30 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Output a table of the kernel memory regions at boot time.
This is taken directly from the ARM architecture code that does this.
The table looks like this:

Virtual kernel memory layout:
    vector  : 0x00000000 - 0x00000400   (   0 kB)
    kmap    : 0xd0000000 - 0xe0000000   ( 256 MB)
    vmalloc : 0xc0000000 - 0xcfffffff   ( 255 MB)
    lowmem  : 0x00000000 - 0x02000000   (  32 MB)
      .init : 0x00128000 - 0x00134000   (  48 kB)
      .text : 0x00020000 - 0x00118d54   ( 996 kB)
      .data : 0x00118d60 - 0x00126000   (  53 kB)
      .bss  : 0x00134000 - 0x001413e0   (  53 kB)

This has been very useful while debugging the ColdFire virtual memory
support code. But in general I think it is nice to know extacly where
the kernel has layed everything out on boot.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/traps.h     |    1 +
 arch/m68k/kernel/vmlinux-std.lds  |    2 ++
 arch/m68k/kernel/vmlinux-sun3.lds |    2 ++
 arch/m68k/mm/init_mm.c            |   34 ++++++++++++++++++++++++++++++++++
 4 files changed, 39 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/include/asm/traps.h b/arch/m68k/include/asm/traps.h
index 151068f..4aff335 100644
--- a/arch/m68k/include/asm/traps.h
+++ b/arch/m68k/include/asm/traps.h
@@ -18,6 +18,7 @@
 
 typedef void (*e_vector)(void);
 extern e_vector vectors[];
+extern e_vector *_ramvec;
 
 asmlinkage void auto_inthandler(void);
 asmlinkage void user_inthandler(void);
diff --git a/arch/m68k/kernel/vmlinux-std.lds b/arch/m68k/kernel/vmlinux-std.lds
index d099359..63407c8 100644
--- a/arch/m68k/kernel/vmlinux-std.lds
+++ b/arch/m68k/kernel/vmlinux-std.lds
@@ -31,7 +31,9 @@ SECTIONS
 
   RW_DATA_SECTION(16, PAGE_SIZE, THREAD_SIZE)
 
+  _sbss = .;
   BSS_SECTION(0, 0, 0)
+  _ebss = .;
 
   _edata = .;			/* End of data section */
 
diff --git a/arch/m68k/kernel/vmlinux-sun3.lds b/arch/m68k/kernel/vmlinux-sun3.lds
index 8080469..ad0f46d 100644
--- a/arch/m68k/kernel/vmlinux-sun3.lds
+++ b/arch/m68k/kernel/vmlinux-sun3.lds
@@ -44,7 +44,9 @@ __init_begin = .;
 	. = ALIGN(PAGE_SIZE);
 	__init_end = .;
 
+  _sbss = .;
   BSS_SECTION(0, 0, 0)
+  _ebss = .;
 
   _end = . ;
 
diff --git a/arch/m68k/mm/init_mm.c b/arch/m68k/mm/init_mm.c
index bbe5254..beb383d 100644
--- a/arch/m68k/mm/init_mm.c
+++ b/arch/m68k/mm/init_mm.c
@@ -24,6 +24,7 @@
 #include <asm/page.h>
 #include <asm/pgalloc.h>
 #include <asm/system.h>
+#include <asm/traps.h>
 #include <asm/machdep.h>
 #include <asm/io.h>
 #ifdef CONFIG_ATARI
@@ -75,6 +76,38 @@ extern void init_pointer_table(unsigned long ptable);
 
 extern pmd_t *zero_pgtable;
 
+#if defined(CONFIG_MMU) && !defined(CONFIG_COLDFIRE)
+#define VECTORS	&vectors[0]
+#else
+#define VECTORS	_ramvec
+#endif
+
+void __init print_memmap(void)
+{
+#define UL(x) ((unsigned long) (x))
+#define MLK(b, t) UL(b), UL(t), (UL(t) - UL(b)) >> 10
+#define MLM(b, t) UL(b), UL(t), (UL(t) - UL(b)) >> 20
+#define MLK_ROUNDUP(b, t) b, t, DIV_ROUND_UP(((t) - (b)), 1024)
+
+	printk(KERN_NOTICE "Virtual kernel memory layout:\n"
+		"    vector  : 0x%08lx - 0x%08lx   (%4ld kB)\n"
+		"    kmap    : 0x%08lx - 0x%08lx   (%4ld MB)\n"
+		"    vmalloc : 0x%08lx - 0x%08lx   (%4ld MB)\n"
+		"    lowmem  : 0x%08lx - 0x%08lx   (%4ld MB)\n"
+		"      .init : 0x%p" " - 0x%p" "   (%4d kB)\n"
+		"      .text : 0x%p" " - 0x%p" "   (%4d kB)\n"
+		"      .data : 0x%p" " - 0x%p" "   (%4d kB)\n"
+		"      .bss  : 0x%p" " - 0x%p" "   (%4d kB)\n",
+		MLK(VECTORS, VECTORS + 256),
+		MLM(KMAP_START, KMAP_END),
+		MLM(VMALLOC_START, VMALLOC_END),
+		MLM(PAGE_OFFSET, (unsigned long)high_memory),
+		MLK_ROUNDUP(__init_begin, __init_end),
+		MLK_ROUNDUP(_stext, _etext),
+		MLK_ROUNDUP(_sdata, _edata),
+		MLK_ROUNDUP(_sbss, _ebss));
+}
+
 void __init mem_init(void)
 {
 	pg_data_t *pgdat;
@@ -125,6 +158,7 @@ void __init mem_init(void)
 	       codepages << (PAGE_SHIFT-10),
 	       datapages << (PAGE_SHIFT-10),
 	       initpages << (PAGE_SHIFT-10));
+	print_memmap();
 }
 
 #ifdef CONFIG_BLK_DEV_INITRD
-- 
1.7.0.4
