From: <gerg@snapgear.com>
Subject: [PATCH 13/36] m68k: add cache support for V4e ColdFire cores running with MMU enabled
Date: Tue, 25 Oct 2011 17:19:05 +1000
Message-ID: <1319527168-11166-14-git-send-email-gerg@snapgear.com>
References: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:25209 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754762Ab1JYHVH (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 25 Oct 2011 03:21:07 -0400
In-Reply-To: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Add code to deal with instruction, data and branch caches of the V4e
ColdFire cores when they are running with the MMU enabled.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/cacheflush_mm.h |   88 +++++++++++++++++++++++++++++++--
 arch/m68k/mm/cache.c                  |   57 +++++++++++++---------
 2 files changed, 117 insertions(+), 28 deletions(-)

diff --git a/arch/m68k/include/asm/cacheflush_mm.h b/arch/m68k/include/asm/cacheflush_mm.h
index 73de7c8..8104bd8 100644
--- a/arch/m68k/include/asm/cacheflush_mm.h
+++ b/arch/m68k/include/asm/cacheflush_mm.h
@@ -2,23 +2,89 @@
 #define _M68K_CACHEFLUSH_H
 
 #include <linux/mm.h>
+#ifdef CONFIG_COLDFIRE
+#include <asm/mcfsim.h>
+#endif
 
 /* cache code */
 #define FLUSH_I_AND_D	(0x00000808)
 #define FLUSH_I		(0x00000008)
 
+#ifndef ICACHE_MAX_ADDR
+#define ICACHE_MAX_ADDR	0
+#define ICACHE_SET_MASK	0
+#define DCACHE_MAX_ADDR	0
+#define DCACHE_SETMASK	0
+#endif
+
+static inline void flush_cf_icache(unsigned long start, unsigned long end)
+{
+	unsigned long set;
+
+	for (set = start; set <= end; set += (0x10 - 3)) {
+		__asm__ __volatile__ (
+			"cpushl %%ic,(%0)\n\t"
+			"addq%.l #1,%0\n\t"
+			"cpushl %%ic,(%0)\n\t"
+			"addq%.l #1,%0\n\t"
+			"cpushl %%ic,(%0)\n\t"
+			"addq%.l #1,%0\n\t"
+			"cpushl %%ic,(%0)"
+			: "=a" (set)
+			: "a" (set));
+	}
+}
+
+static inline void flush_cf_dcache(unsigned long start, unsigned long end)
+{
+	unsigned long set;
+
+	for (set = start; set <= end; set += (0x10 - 3)) {
+		__asm__ __volatile__ (
+			"cpushl %%dc,(%0)\n\t"
+			"addq%.l #1,%0\n\t"
+			"cpushl %%dc,(%0)\n\t"
+			"addq%.l #1,%0\n\t"
+			"cpushl %%dc,(%0)\n\t"
+			"addq%.l #1,%0\n\t"
+			"cpushl %%dc,(%0)"
+			: "=a" (set)
+			: "a" (set));
+	}
+}
+
+static inline void flush_cf_bcache(unsigned long start, unsigned long end)
+{
+	unsigned long set;
+
+	for (set = start; set <= end; set += (0x10 - 3)) {
+		__asm__ __volatile__ (
+			"cpushl %%bc,(%0)\n\t"
+			"addq%.l #1,%0\n\t"
+			"cpushl %%bc,(%0)\n\t"
+			"addq%.l #1,%0\n\t"
+			"cpushl %%bc,(%0)\n\t"
+			"addq%.l #1,%0\n\t"
+			"cpushl %%bc,(%0)"
+			: "=a" (set)
+			: "a" (set));
+	}
+}
+
 /*
  * Cache handling functions
  */
 
 static inline void flush_icache(void)
 {
-	if (CPU_IS_040_OR_060)
+	if (CPU_IS_COLDFIRE) {
+		flush_cf_icache(0, ICACHE_MAX_ADDR);
+	} else if (CPU_IS_040_OR_060) {
 		asm volatile (	"nop\n"
 			"	.chip	68040\n"
 			"	cpusha	%bc\n"
 			"	.chip	68k");
-	else {
+	} else {
 		unsigned long tmp;
 		asm volatile (	"movec	%%cacr,%0\n"
 			"	or.w	%1,%0\n"
@@ -51,12 +117,14 @@ extern void cache_push_v(unsigned long vaddr, int len);
    process changes.  */
 #define __flush_cache_all()					\
 ({								\
-	if (CPU_IS_040_OR_060)					\
+	if (CPU_IS_COLDFIRE) {					\
+		flush_cf_dcache(0, DCACHE_MAX_ADDR);		\
+	} else if (CPU_IS_040_OR_060) {				\
 		__asm__ __volatile__("nop\n\t"			\
 				     ".chip 68040\n\t"		\
 				     "cpusha %dc\n\t"		\
 				     ".chip 68k");		\
-	else {							\
+	} else {						\
 		unsigned long _tmp;				\
 		__asm__ __volatile__("movec %%cacr,%0\n\t"	\
 				     "orw %1,%0\n\t"		\
@@ -112,7 +180,17 @@ static inline void flush_cache_page(struct vm_area_struct *vma, unsigned long vm
 /* RZ: use cpush %bc instead of cpush %dc, cinv %ic */
 static inline void __flush_page_to_ram(void *vaddr)
 {
-	if (CPU_IS_040_OR_060) {
+	if (CPU_IS_COLDFIRE) {
+		unsigned long addr, start, end;
+		addr = ((unsigned long) vaddr) & ~(PAGE_SIZE - 1);
+		start = addr & ICACHE_SET_MASK;
+		end = (addr + PAGE_SIZE - 1) & ICACHE_SET_MASK;
+		if (start > end) {
+			flush_cf_bcache(0, end);
+			end = ICACHE_MAX_ADDR;
+		}
+		flush_cf_bcache(start, end);
+	} else if (CPU_IS_040_OR_060) {
 		__asm__ __volatile__("nop\n\t"
 				     ".chip 68040\n\t"
 				     "cpushp %%bc,(%0)\n\t"
diff --git a/arch/m68k/mm/cache.c b/arch/m68k/mm/cache.c
index 5437fff..a34e5bb 100644
--- a/arch/m68k/mm/cache.c
+++ b/arch/m68k/mm/cache.c
@@ -10,10 +10,11 @@
 #include <asm/pgalloc.h>
 #include <asm/traps.h>
 
-
 static unsigned long virt_to_phys_slow(unsigned long vaddr)
 {
-	if (CPU_IS_060) {
+	if (CPU_IS_COLDFIRE) {
+		/* FIXME */
+	} else if (CPU_IS_060) {
 		unsigned long paddr;
 
 		/* The PLPAR instruction causes an access error if the translation
@@ -70,12 +71,41 @@ static unsigned long virt_to_phys_slow(unsigned long vaddr)
 	return 0;
 }
 
+void flush_icache_user_range(struct vm_area_struct *vma, struct page *page,
+			     unsigned long addr, int len)
+{
+	if (CPU_IS_COLDFIRE) {
+		/* FIXME */
+	} else if (CPU_IS_040_OR_060) {
+		asm volatile ("nop\n\t"
+			      ".chip 68040\n\t"
+			      "cpushp %%bc,(%0)\n\t"
+			      ".chip 68k"
+			      : : "a" (page_to_phys(page)));
+	} else {
+		unsigned long tmp;
+		asm volatile ("movec %%cacr,%0\n\t"
+			      "orw %1,%0\n\t"
+			      "movec %0,%%cacr"
+			      : "=&d" (tmp)
+			      : "di" (FLUSH_I));
+	}
+}
+
 /* Push n pages at kernel virtual address and clear the icache */
 /* RZ: use cpush %bc instead of cpush %dc, cinv %ic */
 void flush_icache_range(unsigned long address, unsigned long endaddr)
 {
-
-	if (CPU_IS_040_OR_060) {
+	if (CPU_IS_COLDFIRE) {
+		unsigned long start, end;
+		start = address & ICACHE_SET_MASK;
+		end = endaddr & ICACHE_SET_MASK;
+		if (start > end) {
+			flush_cf_icache(0, end);
+			end = ICACHE_MAX_ADDR;
+		}
+		flush_cf_icache(start, end);
+	} else if (CPU_IS_040_OR_060) {
 		address &= PAGE_MASK;
 
 		do {
@@ -97,22 +127,3 @@ void flush_icache_range(unsigned long address, unsigned long endaddr)
 }
 EXPORT_SYMBOL(flush_icache_range);
 
-void flush_icache_user_range(struct vm_area_struct *vma, struct page *page,
-			     unsigned long addr, int len)
-{
-	if (CPU_IS_040_OR_060) {
-		asm volatile ("nop\n\t"
-			      ".chip 68040\n\t"
-			      "cpushp %%bc,(%0)\n\t"
-			      ".chip 68k"
-			      : : "a" (page_to_phys(page)));
-	} else {
-		unsigned long tmp;
-		asm volatile ("movec %%cacr,%0\n\t"
-			      "orw %1,%0\n\t"
-			      "movec %0,%%cacr"
-			      : "=&d" (tmp)
-			      : "di" (FLUSH_I));
-	}
-}
-
-- 
1.7.0.4
