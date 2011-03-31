From: Greg Ungerer <gerg@uclinux.org>
Subject: [PATCH 2/5] m68knommu: remove stubs for __ioremap() and iounmap()
Date: Thu, 31 Mar 2011 14:19:28 +1000
Message-ID: <48c605a3077ab6fc07ba2e04b58455a22153ffb9.1301544679.git.gerg@uclinux.org>
References: <3401d75b43ad3a987a93456d978e53fea9dee11c.1301544679.git.gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:31837 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751996Ab1CaEVl (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 31 Mar 2011 00:21:41 -0400
In-Reply-To: <3401d75b43ad3a987a93456d978e53fea9dee11c.1301544679.git.gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@uclinux.org>

The implementation of iounmap() and __ioremap() for non-mmu m68k is
trivial. We can inline them in m68knommu headers and remove the trivial
implementations.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/io_no.h    |    8 +++++---
 arch/m68k/kernel/m68k_ksyms_no.c |    2 --
 arch/m68k/mm/Makefile_no         |    2 +-
 arch/m68k/mm/kmap_no.c           |   37 -------------------------------------
 4 files changed, 6 insertions(+), 43 deletions(-)
 delete mode 100644 arch/m68k/mm/kmap_no.c

diff --git a/arch/m68k/include/asm/io_no.h b/arch/m68k/include/asm/io_no.h
index cf20f30..353bf75 100644
--- a/arch/m68k/include/asm/io_no.h
+++ b/arch/m68k/include/asm/io_no.h
@@ -144,8 +144,10 @@ static inline void io_insl(unsigned int addr, void *buf, int len)
 #define IOMAP_NOCACHE_NONSER		2
 #define IOMAP_WRITETHROUGH		3
 
-extern void *__ioremap(unsigned long physaddr, unsigned long size, int cacheflag);
-
+static inline void *__ioremap(unsigned long physaddr, unsigned long size, int cacheflag)
+{
+	return (void *) physaddr;
+}
 static inline void *ioremap(unsigned long physaddr, unsigned long size)
 {
 	return __ioremap(physaddr, size, IOMAP_NOCACHE_SER);
@@ -163,7 +165,7 @@ static inline void *ioremap_fullcache(unsigned long physaddr, unsigned long size
 	return __ioremap(physaddr, size, IOMAP_FULL_CACHING);
 }
 
-extern void iounmap(void *addr);
+#define	iounmap(addr)	do { } while(0)
 
 /*
  * Convert a physical pointer to a virtual kernel pointer for /dev/mem
diff --git a/arch/m68k/kernel/m68k_ksyms_no.c b/arch/m68k/kernel/m68k_ksyms_no.c
index 10af0af..c26717b 100644
--- a/arch/m68k/kernel/m68k_ksyms_no.c
+++ b/arch/m68k/kernel/m68k_ksyms_no.c
@@ -20,8 +20,6 @@ extern int dump_fpu(struct pt_regs *, elf_fpregset_t *);
 
 /* platform dependent support */
 
-EXPORT_SYMBOL(__ioremap);
-EXPORT_SYMBOL(iounmap);
 EXPORT_SYMBOL(dump_fpu);
 
 EXPORT_SYMBOL(ip_fast_csum);
diff --git a/arch/m68k/mm/Makefile_no b/arch/m68k/mm/Makefile_no
index b54ab6b..80579c6 100644
--- a/arch/m68k/mm/Makefile_no
+++ b/arch/m68k/mm/Makefile_no
@@ -2,4 +2,4 @@
 # Makefile for the linux m68knommu specific parts of the memory manager.
 #
 
-obj-y += init.o kmap.o
+obj-y += init.o
diff --git a/arch/m68k/mm/kmap_no.c b/arch/m68k/mm/kmap_no.c
deleted file mode 100644
index 38b2abe..0000000
--- a/arch/m68k/mm/kmap_no.c
+++ /dev/null
@@ -1,37 +0,0 @@
-/*
- *  linux/arch/m68knommu/mm/kmap.c
- *
- *  Copyright (C) 2000 Lineo, <davidm@snapgear.com>
- *  Copyright (C) 2000-2002 David McCullough <davidm@snapgear.com>
- */
-
-#include <linux/mm.h>
-#include <linux/kernel.h>
-#include <linux/string.h>
-#include <linux/types.h>
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
-/*
- * Map some physical address range into the kernel address space.
- */
-void *__ioremap(unsigned long physaddr, unsigned long size, int cacheflag)
-{
-	return (void *)physaddr;
-}
-
-/*
- * Unmap a ioremap()ed region again.
- */
-void iounmap(void *addr)
-{
-}
-
-- 
1.7.0.4
