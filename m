From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68knommu: Clean up printing of sections
Date: Thu, 31 May 2012 22:23:54 +0200
Message-ID: <1338495834-2468-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@uclinux.org>
Cc: linux-m68k@lists.linux-m68k.org, uclinux-dev@uclinux.org, Geert Uytterhoeven <geert@linux-m68k.org>

  - Remove casts and unneeded address-of ('&') operators,
  - Use %p to format pointers, %lx to format unsigned longs.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Not even compile tested

 arch/m68k/kernel/setup_no.c |   11 ++++-------
 1 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/m68k/kernel/setup_no.c b/arch/m68k/kernel/setup_no.c
index 7dc186b..8a624ec 100644
--- a/arch/m68k/kernel/setup_no.c
+++ b/arch/m68k/kernel/setup_no.c
@@ -218,13 +218,10 @@ void __init setup_arch(char **cmdline_p)
 	printk(KERN_INFO "Motorola M5235EVB support (C)2005 Syn-tech Systems, Inc. (Jate Sujjavanich)\n");
 #endif
 
-	pr_debug("KERNEL -> TEXT=0x%06x-0x%06x DATA=0x%06x-0x%06x "
-		 "BSS=0x%06x-0x%06x\n", (int) &_stext, (int) &_etext,
-		 (int) &_sdata, (int) &_edata,
-		 (int) &_sbss, (int) &_ebss);
-	pr_debug("MEMORY -> ROMFS=0x%06x-0x%06x MEM=0x%06x-0x%06x\n ",
-		 (int) &_ebss, (int) memory_start,
-		 (int) memory_start, (int) memory_end);
+	pr_debug("KERNEL -> TEXT=0x%p-0x%p DATA=0x%p-0x%p BSS=0x%p-0x%p\n",
+		 _stext, _etext, _sdata, _edata, _sbss, _ebss);
+	pr_debug("MEMORY -> ROMFS=0x%p-0x%06lx MEM=0x%06lx-0x%06lx\n ",
+		 _ebss, memory_start, memory_start, memory_end);
 
 	/* Keep a copy of command line */
 	*cmdline_p = &command_line[0];
-- 
1.7.0.4
