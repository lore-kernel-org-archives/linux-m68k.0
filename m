From: sfking@fdwdc.com
Subject: [RFC 24/31] proof of concept merge of m68k and m68knommu
Date: Sun,  6 Sep 2009 22:40:14 -0700
Message-ID: <fcd5e5bae9ee5983684b301ef7365b7e6a7942dc.1252222135.git.sfking@fdwdc.com>
References: <cover.1252222129.git.sfking@fdwdc.com>
 <cfdcab7374087d5279ec9a1269831e8159d98f2b.1252222133.git.sfking@fdwdc.com>
 <8cb57205150fb96915e9d12c936be301a5e1e1e1.1252222133.git.sfking@fdwdc.com>
 <44c52df23985288bc2f4a819b73b3cc6da0826b9.1252222133.git.sfking@fdwdc.com>
 <6db080fb352e20adab49ed7762d3200831160b0f.1252222133.git.sfking@fdwdc.com>
 <c2e845e94079ee2a24e19456666f571c687f93f7.1252222133.git.sfking@fdwdc.com>
 <afa7a198356e79718b7682ea33cdfeec1933ae3d.1252222133.git.sfking@fdwdc.com>
 <f6625c80e8b3246063209517cccc855c056b2b71.1252222133.git.sfking@fdwdc.com>
 <55335001e487bd208ef4801c9df7e2d38a842ad3.1252222134.git.sfking@fdwdc.com>
 <1960838f2a4476b115b27420dcec29f81f0a15c1.1252222134.git.sfking@fdwdc.com>
 <491494a31232c4ce3a7fb96c3ed9db228f0ec5b4.1252222134.git.sfking@fdwdc.com>
 <b5baa71b2c543432ce8561ef7c18ef73201d47a8.1252222134.git.sfking@fdwdc.com>
 <fa246e049b7bc779d1c85def3f733a540463c3e2.1252222134.git.sfking@fdwdc.com>
 <c90263ddd638105b7df953128fd150d7fafc56ee.1252222134.git.sfking@fdwdc.com>
 <732b3e401d3708f1abf810ff0028e48d63df7e4b.1252222134.git.sfking@fdwdc.com>
 <9132c5b379a84a9b9a8762fc557abcae6e6ca479.1252222134.git.sfking@fdwdc.com>
 <f9216a12af8475d50631ae2dfea94d807aae1c1f.1252222134.git.sfking@fdwdc.com>
 <58c8b539029e276a7fc7ddeca2f2909845959c25.1252222134.git.sfking@fdwdc.com>
 <7916cd27beda9a78f37dcd9bef81229fcf67e7c6.1252222134.git.sfking@fdwdc.com>
 <f3cef3055f176a78514b07c083d19b5aec5f821f.1252222134.git.sfking@fdwdc.com>
 <572b33baa354e24a1e4ddfbaaf4b9ad71f262f0c.1252222134.git.sfking@fdwdc.com>
 <2e03009ed21c515946779f20bfbd182d04fa45fe.1252222134.git.sfking@fdwdc.com>
 <8f43ed7055e315597a6f75d70cf391cca512204b.1252222134.git.sfking@fdwdc.com>
 <c4340c33259effcd3a821f48cbdd44e5ced25077.1252222134.git.sfking@fdwdc.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp109.biz.mail.mud.yahoo.com ([68.142.201.178]:34459 "HELO
	smtp109.biz.mail.mud.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1758995AbZIGFrW (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 7 Sep 2009 01:47:22 -0400
In-Reply-To: <c4340c33259effcd3a821f48cbdd44e5ced25077.1252222134.git.sfking@fdwdc.com>
In-Reply-To: <cover.1252222129.git.sfking@fdwdc.com>
References: <cover.1252222129.git.sfking@fdwdc.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: uclinux-dev@uclinux.org
Cc: gerg@snapgear.com, linux-m68k@lists.linux-m68k.org

---
 arch/m68k/mm/kmap.c                             |  369 +----------------------
 arch/m68k/mm/{kmap.c => kmap_mm.c}              |    0 
 arch/{m68knommu/mm/kmap.c => m68k/mm/kmap_no.c} |    0 
 3 files changed, 3 insertions(+), 366 deletions(-)
 copy arch/m68k/mm/{kmap.c => kmap_mm.c} (100%)
 copy arch/{m68knommu/mm/kmap.c => m68k/mm/kmap_no.c} (100%)

diff --git a/arch/m68k/mm/kmap.c b/arch/m68k/mm/kmap.c
index df620ac..a373d13 100644
--- a/arch/m68k/mm/kmap.c
+++ b/arch/m68k/mm/kmap.c
@@ -1,368 +1,5 @@
-/*
- *  linux/arch/m68k/mm/kmap.c
- *
- *  Copyright (C) 1997 Roman Hodek
- *
- *  10/01/99 cleaned up the code and changing to the same interface
- *	     used by other architectures		/Roman Zippel
- */
-
-#include <linux/module.h>
-#include <linux/mm.h>
-#include <linux/kernel.h>
-#include <linux/string.h>
-#include <linux/types.h>
-#include <linux/slab.h>
-#include <linux/vmalloc.h>
-
-#include <asm/setup.h>
-#include <asm/segment.h>
-#include <asm/page.h>
-#include <asm/pgalloc.h>
-#include <asm/io.h>
-#include <asm/system.h>
-
-#undef DEBUG
-
-#define PTRTREESIZE	(256*1024)
-
-/*
- * For 040/060 we can use the virtual memory area like other architectures,
- * but for 020/030 we want to use early termination page descriptor and we
- * can't mix this with normal page descriptors, so we have to copy that code
- * (mm/vmalloc.c) and return appriorate aligned addresses.
- */
-
-#ifdef CPU_M68040_OR_M68060_ONLY
-
-#define IO_SIZE		PAGE_SIZE
-
-static inline struct vm_struct *get_io_area(unsigned long size)
-{
-	return get_vm_area(size, VM_IOREMAP);
-}
-
-
-static inline void free_io_area(void *addr)
-{
-	vfree((void *)(PAGE_MASK & (unsigned long)addr));
-}
-
+#ifdef CONFIG_MMU
+#include "kmap_mm.c"
 #else
-
-#define IO_SIZE		(256*1024)
-
-static struct vm_struct *iolist;
-
-static struct vm_struct *get_io_area(unsigned long size)
-{
-	unsigned long addr;
-	struct vm_struct **p, *tmp, *area;
-
-	area = kmalloc(sizeof(*area), GFP_KERNEL);
-	if (!area)
-		return NULL;
-	addr = KMAP_START;
-	for (p = &iolist; (tmp = *p) ; p = &tmp->next) {
-		if (size + addr < (unsigned long)tmp->addr)
-			break;
-		if (addr > KMAP_END-size) {
-			kfree(area);
-			return NULL;
-		}
-		addr = tmp->size + (unsigned long)tmp->addr;
-	}
-	area->addr = (void *)addr;
-	area->size = size + IO_SIZE;
-	area->next = *p;
-	*p = area;
-	return area;
-}
-
-static inline void free_io_area(void *addr)
-{
-	struct vm_struct **p, *tmp;
-
-	if (!addr)
-		return;
-	addr = (void *)((unsigned long)addr & -IO_SIZE);
-	for (p = &iolist ; (tmp = *p) ; p = &tmp->next) {
-		if (tmp->addr == addr) {
-			*p = tmp->next;
-			__iounmap(tmp->addr, tmp->size);
-			kfree(tmp);
-			return;
-		}
-	}
-}
-
+#include "kmap_no.c"
 #endif
-
-/*
- * Map some physical address range into the kernel address space. The
- * code is copied and adapted from map_chunk().
- */
-/* Rewritten by Andreas Schwab to remove all races. */
-
-void __iomem *__ioremap(unsigned long physaddr, unsigned long size, int cacheflag)
-{
-	struct vm_struct *area;
-	unsigned long virtaddr, retaddr;
-	long offset;
-	pgd_t *pgd_dir;
-	pmd_t *pmd_dir;
-	pte_t *pte_dir;
-
-	/*
-	 * Don't allow mappings that wrap..
-	 */
-	if (!size || size > physaddr + size)
-		return NULL;
-
-#ifdef CONFIG_AMIGA
-	if (MACH_IS_AMIGA) {
-		if ((physaddr >= 0x40000000) && (physaddr + size < 0x60000000)
-		    && (cacheflag == IOMAP_NOCACHE_SER))
-			return (void __iomem *)physaddr;
-	}
-#endif
-
-#ifdef DEBUG
-	printk("ioremap: 0x%lx,0x%lx(%d) - ", physaddr, size, cacheflag);
-#endif
-	/*
-	 * Mappings have to be aligned
-	 */
-	offset = physaddr & (IO_SIZE - 1);
-	physaddr &= -IO_SIZE;
-	size = (size + offset + IO_SIZE - 1) & -IO_SIZE;
-
-	/*
-	 * Ok, go for it..
-	 */
-	area = get_io_area(size);
-	if (!area)
-		return NULL;
-
-	virtaddr = (unsigned long)area->addr;
-	retaddr = virtaddr + offset;
-#ifdef DEBUG
-	printk("0x%lx,0x%lx,0x%lx", physaddr, virtaddr, retaddr);
-#endif
-
-	/*
-	 * add cache and table flags to physical address
-	 */
-	if (CPU_IS_040_OR_060) {
-		physaddr |= (_PAGE_PRESENT | _PAGE_GLOBAL040 |
-			     _PAGE_ACCESSED | _PAGE_DIRTY);
-		switch (cacheflag) {
-		case IOMAP_FULL_CACHING:
-			physaddr |= _PAGE_CACHE040;
-			break;
-		case IOMAP_NOCACHE_SER:
-		default:
-			physaddr |= _PAGE_NOCACHE_S;
-			break;
-		case IOMAP_NOCACHE_NONSER:
-			physaddr |= _PAGE_NOCACHE;
-			break;
-		case IOMAP_WRITETHROUGH:
-			physaddr |= _PAGE_CACHE040W;
-			break;
-		}
-	} else {
-		physaddr |= (_PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_DIRTY);
-		switch (cacheflag) {
-		case IOMAP_NOCACHE_SER:
-		case IOMAP_NOCACHE_NONSER:
-		default:
-			physaddr |= _PAGE_NOCACHE030;
-			break;
-		case IOMAP_FULL_CACHING:
-		case IOMAP_WRITETHROUGH:
-			break;
-		}
-	}
-
-	while ((long)size > 0) {
-#ifdef DEBUG
-		if (!(virtaddr & (PTRTREESIZE-1)))
-			printk ("\npa=%#lx va=%#lx ", physaddr, virtaddr);
-#endif
-		pgd_dir = pgd_offset_k(virtaddr);
-		pmd_dir = pmd_alloc(&init_mm, pgd_dir, virtaddr);
-		if (!pmd_dir) {
-			printk("ioremap: no mem for pmd_dir\n");
-			return NULL;
-		}
-
-		if (CPU_IS_020_OR_030) {
-			pmd_dir->pmd[(virtaddr/PTRTREESIZE) & 15] = physaddr;
-			physaddr += PTRTREESIZE;
-			virtaddr += PTRTREESIZE;
-			size -= PTRTREESIZE;
-		} else {
-			pte_dir = pte_alloc_kernel(pmd_dir, virtaddr);
-			if (!pte_dir) {
-				printk("ioremap: no mem for pte_dir\n");
-				return NULL;
-			}
-
-			pte_val(*pte_dir) = physaddr;
-			virtaddr += PAGE_SIZE;
-			physaddr += PAGE_SIZE;
-			size -= PAGE_SIZE;
-		}
-	}
-#ifdef DEBUG
-	printk("\n");
-#endif
-	flush_tlb_all();
-
-	return (void __iomem *)retaddr;
-}
-EXPORT_SYMBOL(__ioremap);
-
-/*
- * Unmap a ioremap()ed region again
- */
-void iounmap(void __iomem *addr)
-{
-#ifdef CONFIG_AMIGA
-	if ((!MACH_IS_AMIGA) ||
-	    (((unsigned long)addr < 0x40000000) ||
-	     ((unsigned long)addr > 0x60000000)))
-			free_io_area((__force void *)addr);
-#else
-	free_io_area((__force void *)addr);
-#endif
-}
-EXPORT_SYMBOL(iounmap);
-
-/*
- * __iounmap unmaps nearly everything, so be careful
- * it doesn't free currently pointer/page tables anymore but it
- * wans't used anyway and might be added later.
- */
-void __iounmap(void *addr, unsigned long size)
-{
-	unsigned long virtaddr = (unsigned long)addr;
-	pgd_t *pgd_dir;
-	pmd_t *pmd_dir;
-	pte_t *pte_dir;
-
-	while ((long)size > 0) {
-		pgd_dir = pgd_offset_k(virtaddr);
-		if (pgd_bad(*pgd_dir)) {
-			printk("iounmap: bad pgd(%08lx)\n", pgd_val(*pgd_dir));
-			pgd_clear(pgd_dir);
-			return;
-		}
-		pmd_dir = pmd_offset(pgd_dir, virtaddr);
-
-		if (CPU_IS_020_OR_030) {
-			int pmd_off = (virtaddr/PTRTREESIZE) & 15;
-			int pmd_type = pmd_dir->pmd[pmd_off] & _DESCTYPE_MASK;
-
-			if (pmd_type == _PAGE_PRESENT) {
-				pmd_dir->pmd[pmd_off] = 0;
-				virtaddr += PTRTREESIZE;
-				size -= PTRTREESIZE;
-				continue;
-			} else if (pmd_type == 0)
-				continue;
-		}
-
-		if (pmd_bad(*pmd_dir)) {
-			printk("iounmap: bad pmd (%08lx)\n", pmd_val(*pmd_dir));
-			pmd_clear(pmd_dir);
-			return;
-		}
-		pte_dir = pte_offset_kernel(pmd_dir, virtaddr);
-
-		pte_val(*pte_dir) = 0;
-		virtaddr += PAGE_SIZE;
-		size -= PAGE_SIZE;
-	}
-
-	flush_tlb_all();
-}
-
-/*
- * Set new cache mode for some kernel address space.
- * The caller must push data for that range itself, if such data may already
- * be in the cache.
- */
-void kernel_set_cachemode(void *addr, unsigned long size, int cmode)
-{
-	unsigned long virtaddr = (unsigned long)addr;
-	pgd_t *pgd_dir;
-	pmd_t *pmd_dir;
-	pte_t *pte_dir;
-
-	if (CPU_IS_040_OR_060) {
-		switch (cmode) {
-		case IOMAP_FULL_CACHING:
-			cmode = _PAGE_CACHE040;
-			break;
-		case IOMAP_NOCACHE_SER:
-		default:
-			cmode = _PAGE_NOCACHE_S;
-			break;
-		case IOMAP_NOCACHE_NONSER:
-			cmode = _PAGE_NOCACHE;
-			break;
-		case IOMAP_WRITETHROUGH:
-			cmode = _PAGE_CACHE040W;
-			break;
-		}
-	} else {
-		switch (cmode) {
-		case IOMAP_NOCACHE_SER:
-		case IOMAP_NOCACHE_NONSER:
-		default:
-			cmode = _PAGE_NOCACHE030;
-			break;
-		case IOMAP_FULL_CACHING:
-		case IOMAP_WRITETHROUGH:
-			cmode = 0;
-		}
-	}
-
-	while ((long)size > 0) {
-		pgd_dir = pgd_offset_k(virtaddr);
-		if (pgd_bad(*pgd_dir)) {
-			printk("iocachemode: bad pgd(%08lx)\n", pgd_val(*pgd_dir));
-			pgd_clear(pgd_dir);
-			return;
-		}
-		pmd_dir = pmd_offset(pgd_dir, virtaddr);
-
-		if (CPU_IS_020_OR_030) {
-			int pmd_off = (virtaddr/PTRTREESIZE) & 15;
-
-			if ((pmd_dir->pmd[pmd_off] & _DESCTYPE_MASK) == _PAGE_PRESENT) {
-				pmd_dir->pmd[pmd_off] = (pmd_dir->pmd[pmd_off] &
-							 _CACHEMASK040) | cmode;
-				virtaddr += PTRTREESIZE;
-				size -= PTRTREESIZE;
-				continue;
-			}
-		}
-
-		if (pmd_bad(*pmd_dir)) {
-			printk("iocachemode: bad pmd (%08lx)\n", pmd_val(*pmd_dir));
-			pmd_clear(pmd_dir);
-			return;
-		}
-		pte_dir = pte_offset_kernel(pmd_dir, virtaddr);
-
-		pte_val(*pte_dir) = (pte_val(*pte_dir) & _CACHEMASK040) | cmode;
-		virtaddr += PAGE_SIZE;
-		size -= PAGE_SIZE;
-	}
-
-	flush_tlb_all();
-}
-EXPORT_SYMBOL(kernel_set_cachemode);
diff --git a/arch/m68k/mm/kmap.c b/arch/m68k/mm/kmap_mm.c
similarity index 100%
copy from arch/m68k/mm/kmap.c
copy to arch/m68k/mm/kmap_mm.c
diff --git a/arch/m68knommu/mm/kmap.c b/arch/m68k/mm/kmap_no.c
similarity index 100%
copy from arch/m68knommu/mm/kmap.c
copy to arch/m68k/mm/kmap_no.c
-- 
1.5.6.5

