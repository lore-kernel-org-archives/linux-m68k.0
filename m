From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 20/22] m68k/mm: sun3 - Modernize printing of kernel messages
Date: Wed,  7 Dec 2016 16:09:18 +0100
Message-ID: <1481123360-10978-21-git-send-email-geert@linux-m68k.org>
References: <1481123360-10978-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1481123360-10978-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@linux-m68k.org>, Sam Creasey <sammy@sammy.net>, Joshua Thompson <funaho@jurai.org>, Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

  - Convert from printk() to pr_*(),
  - Add missing print to do_page_mapin(), as print_pte_vaddr() calls
    pr_cont().

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/include/asm/sun3_pgtable.h | 6 +++---
 arch/m68k/mm/sun3kmap.c              | 5 +++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/m68k/include/asm/sun3_pgtable.h b/arch/m68k/include/asm/sun3_pgtable.h
index 48657f9fdeceac19..d5104a7b5388535f 100644
--- a/arch/m68k/include/asm/sun3_pgtable.h
+++ b/arch/m68k/include/asm/sun3_pgtable.h
@@ -151,11 +151,11 @@ static inline void pgd_clear (pgd_t *pgdp) {}
 
 
 #define pte_ERROR(e) \
-	printk("%s:%d: bad pte %08lx.\n", __FILE__, __LINE__, pte_val(e))
+	pr_err("%s:%d: bad pte %08lx.\n", __FILE__, __LINE__, pte_val(e))
 #define pmd_ERROR(e) \
-	printk("%s:%d: bad pmd %08lx.\n", __FILE__, __LINE__, pmd_val(e))
+	pr_err("%s:%d: bad pmd %08lx.\n", __FILE__, __LINE__, pmd_val(e))
 #define pgd_ERROR(e) \
-	printk("%s:%d: bad pgd %08lx.\n", __FILE__, __LINE__, pgd_val(e))
+	pr_err("%s:%d: bad pgd %08lx.\n", __FILE__, __LINE__, pgd_val(e))
 
 
 /*
diff --git a/arch/m68k/mm/sun3kmap.c b/arch/m68k/mm/sun3kmap.c
index 3dc41158c05e973a..ae03555449b85d0e 100644
--- a/arch/m68k/mm/sun3kmap.c
+++ b/arch/m68k/mm/sun3kmap.c
@@ -40,6 +40,7 @@ static inline void do_page_mapin(unsigned long phys, unsigned long virt,
 	sun3_put_pte(virt, pte);
 
 #ifdef SUN3_KMAP_DEBUG
+	pr_info("mapin:");
 	print_pte_vaddr(virt);
 #endif
 
@@ -80,8 +81,8 @@ void __iomem *sun3_ioremap(unsigned long phys, unsigned long size,
 		return NULL;
 
 #ifdef SUN3_KMAP_DEBUG
-	printk("ioremap: got virt %p size %lx(%lx)\n",
-	       area->addr, size, area->size);
+	pr_info("ioremap: got virt %p size %lx(%lx)\n", area->addr, size,
+		area->size);
 #endif
 
 	pages = size / PAGE_SIZE;
-- 
1.9.1
