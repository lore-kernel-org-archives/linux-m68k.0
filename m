From: Himangi Saraogi <himangi774@gmail.com>
Subject: [PATCH] mm/m68k: Eliminate memset after alloc_bootmem_pages
Date: Sat, 19 Jul 2014 17:05:13 +0530
Message-ID: <20140719113513.GA23586__21225.7141167813$1405769752$gmane$org@himangi-Dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Cc: Julia Lawall <julia.lawall@lip6.fr>

alloc_bootmem and related functions always return a zeroed region of memory.
Thus a memset after calls to these functions is unnecessary.

The following Coccinelle semantic patch was used for making the change:

@@
expression E,E1;
@@

E = \(alloc_bootmem\|alloc_bootmem_low\|alloc_bootmem_pages\|alloc_bootmem_low_pages\)(...)
... when != E
- memset(E,0,E1);

Signed-off-by: Himangi Saraogi <himangi774@gmail.com>
Acked-by: Julia Lawall <julia.lawall@lip6.fr>
---
To send to: Geert Uytterhoeven <geert@linux-m68k.org>,linux-m68k@lists.linux-m68k.org,linux-kernel@vger.kernel.org
 arch/m68k/mm/init.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/m68k/mm/init.c b/arch/m68k/mm/init.c
index acaff6a..b09a3cb 100644
--- a/arch/m68k/mm/init.c
+++ b/arch/m68k/mm/init.c
@@ -94,7 +94,6 @@ void __init paging_init(void)
 	high_memory = (void *) end_mem;
 
 	empty_zero_page = alloc_bootmem_pages(PAGE_SIZE);
-	memset(empty_zero_page, 0, PAGE_SIZE);
 
 	/*
 	 * Set up SFC/DFC registers (user data space).
-- 
1.9.1
