From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: Eliminate unused variable in page_to_phys()
Date: Thu, 14 Jan 2010 14:39:31 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1001141439060.3063@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@lists.linux-m68k.org>

"pgdat" is unused, so we can eliminate it and turn page_to_phys()
into a single-line macro.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/include/asm/virtconvert.h |    7 +------
 1 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/arch/m68k/include/asm/virtconvert.h b/arch/m68k/include/asm/virtconvert.h
index 3f834b3..f35229b 100644
--- a/arch/m68k/include/asm/virtconvert.h
+++ b/arch/m68k/include/asm/virtconvert.h
@@ -31,12 +31,7 @@ static inline void *phys_to_virt(unsigned long address)
 #define page_to_phys(page) \
 	__pa(PAGE_OFFSET + (((page) - pg_data_map[0].node_mem_map) << PAGE_SHIFT))
 #else
-#define page_to_phys(_page) ({						\
-	struct page *__page = _page;					\
-	struct pglist_data *pgdat;					\
-	pgdat = pg_data_table[page_to_nid(__page)];			\
-	page_to_pfn(__page) << PAGE_SHIFT;				\
-})
+#define page_to_phys(page)	(page_to_pfn(page) << PAGE_SHIFT)
 #endif
 #else
 #define page_to_phys(page)	(((page) - mem_map) << PAGE_SHIFT)
-- 
1.6.0.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
