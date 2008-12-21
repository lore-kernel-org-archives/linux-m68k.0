From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH] m68k: Kill several external declarations in source files (was: Re: linux-next: boot-params tree build failure)
Date: Mon, 22 Dec 2008 08:51:44 +1030
Message-ID: <200812220851.44880.rusty@rustcorp.com.au>
References: <20081217165557.b4898a4b.sfr@canb.auug.org.au> <Pine.LNX.4.64.0812170915400.29433@anakin> <Pine.LNX.4.64.0812211205270.3499@anakin>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0812211205270.3499@anakin>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Linux/m68k <linux-m68k@vger.kernel.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

On Sunday 21 December 2008 21:42:44 Geert Uytterhoeven wrote:
> Shall I cherry pick this into my for-next branch (breaking Rusty's changes),
> or wait until the current linux-next has been merged by Linus (and maybe
> postpone to .30)?

Good q.  I can take the just setup.c changes and roll them into the
boot-params tree if you want?

ie. something like:

Subject: m68k: Use asm/sections.h in kernel/setup.c

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
arch/m68k/kernel/setup.c    |   11 +++++------

diff --git a/arch/m68k/kernel/setup.c b/arch/m68k/kernel/setup.c
index 066faec..594cbd1 100644
--- a/arch/m68k/kernel/setup.c
+++ b/arch/m68k/kernel/setup.c
@@ -26,6 +26,7 @@
 #include <linux/initrd.h>
 
 #include <asm/bootinfo.h>
+#include <asm/sections.h>
 #include <asm/setup.h>
 #include <asm/fpu.h>
 #include <asm/irq.h>
@@ -63,7 +64,6 @@ EXPORT_SYMBOL(vme_brdtype);
 int m68k_is040or060;
 EXPORT_SYMBOL(m68k_is040or060);
 
-extern int end;
 extern unsigned long availmem;
 
 int m68k_num_memory;
@@ -216,11 +216,10 @@ static void __init m68k_parse_bootinfo(const struct bi_record *record)
 
 void __init setup_arch(char **cmdline_p)
 {
-       extern int _etext, _edata, _end;
        int i;
 
        /* The bootinfo is located right after the kernel bss */
-       m68k_parse_bootinfo((const struct bi_record *)&_end);
+       m68k_parse_bootinfo((const struct bi_record *)_end);
 
        if (CPU_IS_040)
                m68k_is040or060 = 4;
@@ -253,9 +252,9 @@ void __init setup_arch(char **cmdline_p)
        }
 
        init_mm.start_code = PAGE_OFFSET;
-       init_mm.end_code = (unsigned long) &_etext;
-       init_mm.end_data = (unsigned long) &_edata;
-       init_mm.brk = (unsigned long) &_end;
+       init_mm.end_code = (unsigned long)_etext;
+       init_mm.end_data = (unsigned long)_edata;
+       init_mm.brk = (unsigned long)_end;
