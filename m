From: <gerg@snapgear.com>
Subject: [PATCH 5/5] m68k: merge non-mmu and mmu versions of m68k_ksyms.c
Date: Thu, 21 Apr 2011 10:48:10 +1000
Message-ID: <1303346890-28249-6-git-send-email-gerg@snapgear.com>
References: <1303346890-28249-1-git-send-email-gerg@snapgear.com>
 <1303346890-28249-2-git-send-email-gerg@snapgear.com>
 <1303346890-28249-3-git-send-email-gerg@snapgear.com>
 <1303346890-28249-4-git-send-email-gerg@snapgear.com>
 <1303346890-28249-5-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:19401 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752811Ab1DUAty (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 20 Apr 2011 20:49:54 -0400
In-Reply-To: <1303346890-28249-5-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

After cleaning up m68k_ksyms_no.c it is now strait forward to merge
the non-mmu and mmu versions of m68k_ksyms.c. So do it.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/kernel/m68k_ksyms.c    |   35 ++++++++++++++++++++++++++---
 arch/m68k/kernel/m68k_ksyms_mm.c |   16 -------------
 arch/m68k/kernel/m68k_ksyms_no.c |   44 --------------------------------------
 3 files changed, 31 insertions(+), 64 deletions(-)
 delete mode 100644 arch/m68k/kernel/m68k_ksyms_mm.c
 delete mode 100644 arch/m68k/kernel/m68k_ksyms_no.c

diff --git a/arch/m68k/kernel/m68k_ksyms.c b/arch/m68k/kernel/m68k_ksyms.c
index 4752c28..3e23913 100644
--- a/arch/m68k/kernel/m68k_ksyms.c
+++ b/arch/m68k/kernel/m68k_ksyms.c
@@ -1,5 +1,32 @@
-#ifdef CONFIG_MMU
-#include "m68k_ksyms_mm.c"
-#else
-#include "m68k_ksyms_no.c"
+#include <linux/module.h>
+
+asmlinkage long long __ashldi3 (long long, int);
+asmlinkage long long __ashrdi3 (long long, int);
+asmlinkage long long __lshrdi3 (long long, int);
+asmlinkage long long __muldi3 (long long, long long);
+
+/* The following are special because they're not called
+   explicitly (the C compiler generates them).  Fortunately,
+   their interface isn't gonna change any time soon now, so
+   it's OK to leave it out of version control.  */
+EXPORT_SYMBOL(__ashldi3);
+EXPORT_SYMBOL(__ashrdi3);
+EXPORT_SYMBOL(__lshrdi3);
+EXPORT_SYMBOL(__muldi3);
+
+#ifndef CONFIG_MMU
+/*
+ * Simpler 68k and ColdFire parts also need a few other gcc functions.
+ */
+extern long long __divsi3(long long, long long);
+extern long long __modsi3(long long, long long);
+extern long long __mulsi3(long long, long long);
+extern long long __udivsi3(long long, long long);
+extern long long __umodsi3(long long, long long);
+
+EXPORT_SYMBOL(__divsi3);
+EXPORT_SYMBOL(__modsi3);
+EXPORT_SYMBOL(__mulsi3);
+EXPORT_SYMBOL(__udivsi3);
+EXPORT_SYMBOL(__umodsi3);
 #endif
diff --git a/arch/m68k/kernel/m68k_ksyms_mm.c b/arch/m68k/kernel/m68k_ksyms_mm.c
deleted file mode 100644
index d900e77..0000000
--- a/arch/m68k/kernel/m68k_ksyms_mm.c
+++ /dev/null
@@ -1,16 +0,0 @@
-#include <linux/module.h>
-
-asmlinkage long long __ashldi3 (long long, int);
-asmlinkage long long __ashrdi3 (long long, int);
-asmlinkage long long __lshrdi3 (long long, int);
-asmlinkage long long __muldi3 (long long, long long);
-
-/* The following are special because they're not called
-   explicitly (the C compiler generates them).  Fortunately,
-   their interface isn't gonna change any time soon now, so
-   it's OK to leave it out of version control.  */
-EXPORT_SYMBOL(__ashldi3);
-EXPORT_SYMBOL(__ashrdi3);
-EXPORT_SYMBOL(__lshrdi3);
-EXPORT_SYMBOL(__muldi3);
-
diff --git a/arch/m68k/kernel/m68k_ksyms_no.c b/arch/m68k/kernel/m68k_ksyms_no.c
deleted file mode 100644
index db6f87a..0000000
--- a/arch/m68k/kernel/m68k_ksyms_no.c
+++ /dev/null
@@ -1,44 +0,0 @@
-#include <linux/module.h>
-#include <linux/linkage.h>
-#include <linux/sched.h>
-#include <linux/string.h>
-#include <linux/mm.h>
-#include <linux/user.h>
-#include <linux/elfcore.h>
-#include <linux/in6.h>
-#include <linux/interrupt.h>
-
-#include <asm/setup.h>
-#include <asm/machdep.h>
-#include <asm/pgalloc.h>
-#include <asm/irq.h>
-#include <asm/io.h>
-#include <asm/checksum.h>
-#include <asm/current.h>
-
-/*
- * libgcc functions - functions that are used internally by the
- * compiler...  (prototypes are not correct though, but that
- * doesn't really matter since they're not versioned).
- */
-extern void __ashldi3(void);
-extern void __ashrdi3(void);
-extern void __divsi3(void);
-extern void __lshrdi3(void);
-extern void __modsi3(void);
-extern void __muldi3(void);
-extern void __mulsi3(void);
-extern void __udivsi3(void);
-extern void __umodsi3(void);
-
-        /* gcc lib functions */
-EXPORT_SYMBOL(__ashldi3);
-EXPORT_SYMBOL(__ashrdi3);
-EXPORT_SYMBOL(__divsi3);
-EXPORT_SYMBOL(__lshrdi3);
-EXPORT_SYMBOL(__modsi3);
-EXPORT_SYMBOL(__muldi3);
-EXPORT_SYMBOL(__mulsi3);
-EXPORT_SYMBOL(__udivsi3);
-EXPORT_SYMBOL(__umodsi3);
-
-- 
1.7.0.4
