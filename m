From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: Remove big kernel lock in cache flush code
Date: Sat, 16 Oct 2010 19:36:54 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1010161936010.5904@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@lists.linux-m68k.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Andreas Schwab <schwab@linux-m68k.org>

The cache flush code doesn't need a lock, so we can remove the use of the BKL.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reported-by: Arnd Bergmann <arnd@arndb.de>
Suggested-by: Andreas Schwab <schwab@linux-m68k.org>
---
 arch/m68k/kernel/sys_m68k.c |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/kernel/sys_m68k.c b/arch/m68k/kernel/sys_m68k.c
index 2f431ec..3db2e7f 100644
--- a/arch/m68k/kernel/sys_m68k.c
+++ b/arch/m68k/kernel/sys_m68k.c
@@ -12,7 +12,6 @@
 #include <linux/mm.h>
 #include <linux/fs.h>
 #include <linux/smp.h>
-#include <linux/smp_lock.h>
 #include <linux/sem.h>
 #include <linux/msg.h>
 #include <linux/shm.h>
@@ -377,7 +376,6 @@ sys_cacheflush (unsigned long addr, int scope, int cache, unsigned long len)
 	struct vm_area_struct *vma;
 	int ret = -EINVAL;
 
-	lock_kernel();
 	if (scope < FLUSH_SCOPE_LINE || scope > FLUSH_SCOPE_ALL ||
 	    cache & ~FLUSH_CACHE_BOTH)
 		goto out;
@@ -446,7 +444,6 @@ sys_cacheflush (unsigned long addr, int scope, int cache, unsigned long len)
 	    }
 	}
 out:
-	unlock_kernel();
 	return ret;
 }
 
-- 
1.7.0.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
