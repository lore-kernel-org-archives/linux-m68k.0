From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 07/18] m68k: remove big kernel lock
Date: Tue, 14 Sep 2010 21:34:58 +0200
Message-ID: <1284492909-7147-8-git-send-email-arnd@arndb.de>
References: <1284492909-7147-1-git-send-email-arnd@arndb.de>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1284492909-7147-1-git-send-email-arnd@arndb.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: arnd@arndb.de
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Roman Zippel <zippel@linux-m68k.org>, linux-m68k@lists.linux-m68k.org

The cache flush code only locks against itself, so there
is no excuse to use the BKL here. This replaces it with
a local mutex in order to maintain serialization of flushes.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Roman Zippel <zippel@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
---
 arch/m68k/kernel/sys_m68k.c |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/kernel/sys_m68k.c b/arch/m68k/kernel/sys_m68k.c
index 2f431ec..f6aec52 100644
--- a/arch/m68k/kernel/sys_m68k.c
+++ b/arch/m68k/kernel/sys_m68k.c
@@ -12,7 +12,7 @@
 #include <linux/mm.h>
 #include <linux/fs.h>
 #include <linux/smp.h>
-#include <linux/smp_lock.h>
+#include <linux/mutex.h>
 #include <linux/sem.h>
 #include <linux/msg.h>
 #include <linux/shm.h>
@@ -374,10 +374,11 @@ cache_flush_060 (unsigned long addr, int scope, int cache, unsigned long len)
 asmlinkage int
 sys_cacheflush (unsigned long addr, int scope, int cache, unsigned long len)
 {
+	static DEFINE_MUTEX(cacheflush_mutex);
 	struct vm_area_struct *vma;
 	int ret = -EINVAL;
 
-	lock_kernel();
+	mutex_lock(&cacheflush_mutex);
 	if (scope < FLUSH_SCOPE_LINE || scope > FLUSH_SCOPE_ALL ||
 	    cache & ~FLUSH_CACHE_BOTH)
 		goto out;
@@ -446,7 +447,7 @@ sys_cacheflush (unsigned long addr, int scope, int cache, unsigned long len)
 	    }
 	}
 out:
-	unlock_kernel();
+	mutex_unlock(&cacheflush_mutex);
 	return ret;
 }
 
-- 
1.7.1
