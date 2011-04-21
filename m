From: <gerg@snapgear.com>
Subject: [PATCH v3 5/6] m68k: remove duplicate memcpy() implementation
Date: Thu, 21 Apr 2011 10:24:50 +1000
Message-ID: <1303345491-27888-6-git-send-email-gerg@snapgear.com>
References: <1303345491-27888-1-git-send-email-gerg@snapgear.com>
 <1303345491-27888-2-git-send-email-gerg@snapgear.com>
 <1303345491-27888-3-git-send-email-gerg@snapgear.com>
 <1303345491-27888-4-git-send-email-gerg@snapgear.com>
 <1303345491-27888-5-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:58611 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752687Ab1DUAZV (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 20 Apr 2011 20:25:21 -0400
In-Reply-To: <1303345491-27888-5-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Merging the mmu and non-mmu directories we ended up with duplicate
implementations of memcpy(). One is a little more optimized for the
>= 68020 case, but that can easily be inserted into a single
implementation of memcpy(). Clean up the exporting of this symbol
too, otherwise we end up exporting it twice on a no-mmu build.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/kernel/m68k_ksyms_no.c |    6 --
 arch/m68k/lib/Makefile           |    5 +-
 arch/m68k/lib/memcpy.c           |  128 +++++++++++++++++++++----------------
 arch/m68k/lib/string.c           |   67 --------------------
 4 files changed, 75 insertions(+), 131 deletions(-)

diff --git a/arch/m68k/kernel/m68k_ksyms_no.c b/arch/m68k/kernel/m68k_ksyms_no.c
index 346bce6..10af0af 100644
--- a/arch/m68k/kernel/m68k_ksyms_no.c
+++ b/arch/m68k/kernel/m68k_ksyms_no.c
@@ -31,12 +31,6 @@ EXPORT_SYMBOL(kernel_thread);
 /* Networking helper routines. */
 EXPORT_SYMBOL(csum_partial_copy_nocheck);
 
-/* The following are special because they're not called
-   explicitly (the C compiler generates them).  Fortunately,
-   their interface isn't gonna change any time soon now, so
-   it's OK to leave it out of version control.  */
-EXPORT_SYMBOL(memcpy);
-
 /*
  * libgcc functions - functions that are used internally by the
  * compiler...  (prototypes are not correct though, but that
diff --git a/arch/m68k/lib/Makefile b/arch/m68k/lib/Makefile
index ac275d5..2438d02 100644
--- a/arch/m68k/lib/Makefile
+++ b/arch/m68k/lib/Makefile
@@ -4,12 +4,11 @@
 #
 
 lib-y	:= ashldi3.o ashrdi3.o lshrdi3.o muldi3.o \
-	   memset.o memmove.o checksum.o
+	   memcpy.o memset.o memmove.o checksum.o
 
 ifdef CONFIG_MMU
 lib-y	+= string.o uaccess.o
 else
-lib-y	+= mulsi3.o divsi3.o udivsi3.o modsi3.o umodsi3.o \
-	   memcpy.o delay.o
+lib-y	+= mulsi3.o divsi3.o udivsi3.o modsi3.o umodsi3.o delay.o
 endif
 
diff --git a/arch/m68k/lib/memcpy.c b/arch/m68k/lib/memcpy.c
index b50dbca..62182c8 100644
--- a/arch/m68k/lib/memcpy.c
+++ b/arch/m68k/lib/memcpy.c
@@ -1,62 +1,80 @@
+/*
+ * This file is subject to the terms and conditions of the GNU General Public
+ * License.  See the file COPYING in the main directory of this archive
+ * for more details.
+ */
 
-#include <linux/types.h>
+#include <linux/module.h>
+#include <linux/string.h>
 
-void * memcpy(void * to, const void * from, size_t n)
+void *memcpy(void *to, const void *from, size_t n)
 {
-#ifdef CONFIG_COLDFIRE
-  void *xto = to;
-  size_t temp;
+	void *xto = to;
+	size_t temp, temp1;
 
-  if (!n)
-    return xto;
-  if ((long) to & 1)
-    {
-      char *cto = to;
-      const char *cfrom = from;
-      *cto++ = *cfrom++;
-      to = cto;
-      from = cfrom;
-      n--;
-    }
-  if (n > 2 && (long) to & 2)
-    {
-      short *sto = to;
-      const short *sfrom = from;
-      *sto++ = *sfrom++;
-      to = sto;
-      from = sfrom;
-      n -= 2;
-    }
-  temp = n >> 2;
-  if (temp)
-    {
-      long *lto = to;
-      const long *lfrom = from;
-      for (; temp; temp--)
-	*lto++ = *lfrom++;
-      to = lto;
-      from = lfrom;
-    }
-  if (n & 2)
-    {
-      short *sto = to;
-      const short *sfrom = from;
-      *sto++ = *sfrom++;
-      to = sto;
-      from = sfrom;
-    }
-  if (n & 1)
-    {
-      char *cto = to;
-      const char *cfrom = from;
-      *cto = *cfrom;
-    }
-  return xto;
+	if (!n)
+		return xto;
+	if ((long)to & 1) {
+		char *cto = to;
+		const char *cfrom = from;
+		*cto++ = *cfrom++;
+		to = cto;
+		from = cfrom;
+		n--;
+	}
+	if (n > 2 && (long)to & 2) {
+		short *sto = to;
+		const short *sfrom = from;
+		*sto++ = *sfrom++;
+		to = sto;
+		from = sfrom;
+		n -= 2;
+	}
+	temp = n >> 2;
+	if (temp) {
+		long *lto = to;
+		const long *lfrom = from;
+#if defined(__mc68020__) || defined(__mc68030__) || \
+    defined(__mc68040__) || defined(__mc68060__) || defined(__mcpu32__)
+		asm volatile (
+			"	movel %2,%3\n"
+			"	andw  #7,%3\n"
+			"	lsrl  #3,%2\n"
+			"	negw  %3\n"
+			"	jmp   %%pc@(1f,%3:w:2)\n"
+			"4:	movel %0@+,%1@+\n"
+			"	movel %0@+,%1@+\n"
+			"	movel %0@+,%1@+\n"
+			"	movel %0@+,%1@+\n"
+			"	movel %0@+,%1@+\n"
+			"	movel %0@+,%1@+\n"
+			"	movel %0@+,%1@+\n"
+			"	movel %0@+,%1@+\n"
+			"1:	dbra  %2,4b\n"
+			"	clrw  %2\n"
+			"	subql #1,%2\n"
+			"	jpl   4b"
+			: "=a" (lfrom), "=a" (lto), "=d" (temp), "=&d" (temp1)
+			: "0" (lfrom), "1" (lto), "2" (temp));
 #else
-  const char *c_from = from;
-  char *c_to = to;
-  while (n-- > 0)
-    *c_to++ = *c_from++;
-  return((void *) to);
+		for (; temp; temp--)
+			*lto++ = *lfrom++;
 #endif
+		to = lto;
+		from = lfrom;
+	}
+	if (n & 2) {
+		short *sto = to;
+		const short *sfrom = from;
+		*sto++ = *sfrom++;
+		to = sto;
+		from = sfrom;
+	}
+	if (n & 1) {
+		char *cto = to;
+		const char *cfrom = from;
+		*cto = *cfrom;
+	}
+	return xto;
 }
+EXPORT_SYMBOL(memcpy);
diff --git a/arch/m68k/lib/string.c b/arch/m68k/lib/string.c
index 6d24612..b9a57ab 100644
--- a/arch/m68k/lib/string.c
+++ b/arch/m68k/lib/string.c
@@ -20,70 +20,3 @@ char *strcat(char *dest, const char *src)
 	return __kernel_strcpy(dest + __kernel_strlen(dest), src);
 }
 EXPORT_SYMBOL(strcat);
-
-void *memcpy(void *to, const void *from, size_t n)
-{
-	void *xto = to;
-	size_t temp, temp1;
-
-	if (!n)
-		return xto;
-	if ((long)to & 1) {
-		char *cto = to;
-		const char *cfrom = from;
-		*cto++ = *cfrom++;
-		to = cto;
-		from = cfrom;
-		n--;
-	}
-	if (n > 2 && (long)to & 2) {
-		short *sto = to;
-		const short *sfrom = from;
-		*sto++ = *sfrom++;
-		to = sto;
-		from = sfrom;
-		n -= 2;
-	}
-	temp = n >> 2;
-	if (temp) {
-		long *lto = to;
-		const long *lfrom = from;
-
-		asm volatile (
-			"	movel %2,%3\n"
-			"	andw  #7,%3\n"
-			"	lsrl  #3,%2\n"
-			"	negw  %3\n"
-			"	jmp   %%pc@(1f,%3:w:2)\n"
-			"4:	movel %0@+,%1@+\n"
-			"	movel %0@+,%1@+\n"
-			"	movel %0@+,%1@+\n"
-			"	movel %0@+,%1@+\n"
-			"	movel %0@+,%1@+\n"
-			"	movel %0@+,%1@+\n"
-			"	movel %0@+,%1@+\n"
-			"	movel %0@+,%1@+\n"
-			"1:	dbra  %2,4b\n"
-			"	clrw  %2\n"
-			"	subql #1,%2\n"
-			"	jpl   4b"
-			: "=a" (lfrom), "=a" (lto), "=d" (temp), "=&d" (temp1)
-			: "0" (lfrom), "1" (lto), "2" (temp));
-		to = lto;
-		from = lfrom;
-	}
-	if (n & 2) {
-		short *sto = to;
-		const short *sfrom = from;
-		*sto++ = *sfrom++;
-		to = sto;
-		from = sfrom;
-	}
-	if (n & 1) {
-		char *cto = to;
-		const char *cfrom = from;
-		*cto = *cfrom;
-	}
-	return xto;
-}
-EXPORT_SYMBOL(memcpy);
-- 
1.7.0.4
