From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 2/5] m68k/amiga: Chip RAM - Convert from printk() to pr_*()
Date: Sat, 21 May 2011 21:18:17 +0200
Message-ID: <1306005500-29259-2-git-send-email-geert@linux-m68k.org>
References: <1306005500-29259-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1306005500-29259-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

and fix a few formattings:
  - resource sizes are now resource_size_t, use %pR to make it future proof,
  - use %lu for unsigned long.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/amiga/chipram.c |   28 ++++++++--------------------
 1 files changed, 8 insertions(+), 20 deletions(-)

diff --git a/arch/m68k/amiga/chipram.c b/arch/m68k/amiga/chipram.c
index e757fff..9005fa0 100644
--- a/arch/m68k/amiga/chipram.c
+++ b/arch/m68k/amiga/chipram.c
@@ -47,9 +47,7 @@ void *amiga_chip_alloc(unsigned long size, const char *name)
 	/* round up */
 	size = PAGE_ALIGN(size);
 
-#ifdef DEBUG
-	printk("amiga_chip_alloc: allocate %ld bytes\n", size);
-#endif
+	pr_debug("amiga_chip_alloc: allocate %lu bytes\n", size);
 	res = kzalloc(sizeof(struct resource), GFP_KERNEL);
 	if (!res)
 		return NULL;
@@ -61,9 +59,7 @@ void *amiga_chip_alloc(unsigned long size, const char *name)
 		return NULL;
 	}
 	chipavail -= size;
-#ifdef DEBUG
-	printk("amiga_chip_alloc: returning %lx\n", res->start);
-#endif
+	pr_debug("amiga_chip_alloc: returning %pR\n", res);
 	return (void *)ZTWO_VADDR(res->start);
 }
 EXPORT_SYMBOL(amiga_chip_alloc);
@@ -85,20 +81,16 @@ void * __init amiga_chip_alloc_res(unsigned long size, struct resource *res)
 	/* dmesg into chipmem prefers memory at the safe end */
 	start = CHIP_PHYSADDR + chipavail - size;
 
-#ifdef DEBUG
-	printk("amiga_chip_alloc_res: allocate %ld bytes\n", size);
-#endif
+	pr_debug("amiga_chip_alloc_res: allocate %lu bytes\n", size);
 	if (allocate_resource(&chipram_res, res, size, start, UINT_MAX,
 			      PAGE_SIZE, NULL, NULL) < 0) {
-		printk("amiga_chip_alloc_res: first alloc failed!\n");
+		pr_err("amiga_chip_alloc_res: first alloc failed!\n");
 		if (allocate_resource(&chipram_res, res, size, 0, UINT_MAX,
 				      PAGE_SIZE, NULL, NULL) < 0)
 			return NULL;
 	}
 	chipavail -= size;
-#ifdef DEBUG
-	printk("amiga_chip_alloc_res: returning %lx\n", res->start);
-#endif
+	pr_debug("amiga_chip_alloc_res: returning %pR\n", res);
 	return (void *)ZTWO_VADDR(res->start);
 }
 
@@ -113,14 +105,12 @@ void amiga_chip_free(void *ptr)
 			continue;
 		*p = res->sibling;
 		size = res->end-start;
-#ifdef DEBUG
-		printk("amiga_chip_free: free %ld bytes at %p\n", size, ptr);
-#endif
+		pr_debug("amiga_chip_free: free %lu bytes at %p\n", size, ptr);
 		chipavail += size;
 		kfree(res);
 		return;
 	}
-	printk("amiga_chip_free: trying to free nonexistent region at %p\n",
+	pr_err("amiga_chip_free: trying to free nonexistent region at %p\n",
 	       ptr);
 }
 EXPORT_SYMBOL(amiga_chip_free);
@@ -128,9 +118,7 @@ EXPORT_SYMBOL(amiga_chip_free);
 
 unsigned long amiga_chip_avail(void)
 {
-#ifdef DEBUG
-	printk("amiga_chip_avail : %ld bytes\n", chipavail);
-#endif
+	pr_debug("amiga_chip_avail : %lu bytes\n", chipavail);
 	return chipavail;
 }
 EXPORT_SYMBOL(amiga_chip_avail);
-- 
1.7.0.4
