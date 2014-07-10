From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH -next] m68k: Export mach_random_get_entropy to modules
Date: Thu, 10 Jul 2014 18:05:53 +0200
Message-ID: <1405008353-10359-1-git-send-email-geert__3750.38317074559$1405008380$gmane$org@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

When a module calls random_get_entropy():

    ERROR: "mach_random_get_entropy" [crypto/drbg.ko] undefined!
    make[1]: *** [__modpost] Error 1

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
To be queued for 3.17

kisskb.ellerman.id.au/kisskb/buildresult/11449343/
---
 arch/m68k/kernel/time.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/m68k/kernel/time.c b/arch/m68k/kernel/time.c
index 958f1adb9d0c..3857737e3958 100644
--- a/arch/m68k/kernel/time.c
+++ b/arch/m68k/kernel/time.c
@@ -11,6 +11,7 @@
  */
 
 #include <linux/errno.h>
+#include <linux/export.h>
 #include <linux/module.h>
 #include <linux/sched.h>
 #include <linux/kernel.h>
@@ -30,6 +31,7 @@
 
 
 unsigned long (*mach_random_get_entropy)(void);
+EXPORT_SYMBOL_GPL(mach_random_get_entropy);
 
 
 /*
-- 
1.9.1
