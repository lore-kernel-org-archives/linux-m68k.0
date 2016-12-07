From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 21/22] m68k/mm: Modernize printing of kernel messages
Date: Wed,  7 Dec 2016 16:09:19 +0100
Message-ID: <1481123360-10978-22-git-send-email-geert__531.48331721804$1481123934$gmane$org@linux-m68k.org>
References: <1481123360-10978-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1481123360-10978-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@linux-m68k.org>, Sam Creasey <sammy@sammy.net>, Joshua Thompson <funaho@jurai.org>, Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Convert from printk() to pr_*().

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/mm/init.c   | 2 +-
 arch/m68k/mm/memory.c | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/mm/init.c b/arch/m68k/mm/init.c
index b09a3cb29b68fda4..7f5dd339a311800e 100644
--- a/arch/m68k/mm/init.c
+++ b/arch/m68k/mm/init.c
@@ -66,7 +66,7 @@ void __init m68k_setup_node(int node)
 	end = (unsigned long)phys_to_virt(info->addr + info->size - 1) >> __virt_to_node_shift();
 	for (; i <= end; i++) {
 		if (pg_data_table[i])
-			printk("overlap at %u for chunk %u\n", i, node);
+			pr_warn("overlap at %u for chunk %u\n", i, node);
 		pg_data_table[i] = pg_data_map + node;
 	}
 #endif
diff --git a/arch/m68k/mm/memory.c b/arch/m68k/mm/memory.c
index 51bc9d258ede39b8..4902b681a9fccf3f 100644
--- a/arch/m68k/mm/memory.c
+++ b/arch/m68k/mm/memory.c
@@ -47,9 +47,7 @@ void __init init_pointer_table(unsigned long ptable)
 	}
 
 	PD_MARKBITS(dp) &= ~mask;
-#ifdef DEBUG
-	printk("init_pointer_table: %lx, %x\n", ptable, PD_MARKBITS(dp));
-#endif
+	pr_debug("init_pointer_table: %lx, %x\n", ptable, PD_MARKBITS(dp));
 
 	/* unreserve the page so it's possible to free that page */
 	PD_PAGE(dp)->flags &= ~(1 << PG_reserved);
-- 
1.9.1
