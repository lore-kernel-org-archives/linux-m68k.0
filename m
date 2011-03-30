From: Greg Ungerer <gerg@uclinux.org>
Subject: [PATCH 5/6] m68k: remove duplicate memcpy() implementation
Date: Wed, 30 Mar 2011 17:58:26 +1000
Message-ID: <7267c04683dfc6703141afae23b905461d218e9b.1301471810.git.gerg@uclinux.org>
References: <de032cfd09b94c8803091bf143890ce48e61304a.1301471809.git.gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:57641 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754175Ab1C3IAy (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 30 Mar 2011 04:00:54 -0400
In-Reply-To: <de032cfd09b94c8803091bf143890ce48e61304a.1301471809.git.gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@uclinux.org>

Merging the mmu and non-mmu directories we ended up with duplicate
implementations of memcpy(). One is a little more optimized for the
>68020 case, but that can easily be inserted into a single
implementation of memcpy(). Clean up the exporting of this symbol
too, otherwise we end up exporting it twice on a no-mmu build.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/kernel/m68k_ksyms_no.c     |    6 --
 arch/m68k/lib/Makefile               |    5 +-
 arch/m68k/lib/{string.c => memcpy.c} |   21 ++-----
 arch/m68k/lib/string.c               |  111 +++++++---------------------------
 4 files changed, 30 insertions(+), 113 deletions(-)
 rename arch/m68k/lib/{string.c => memcpy.c} (84%)
 rewrite arch/m68k/lib/string.c (71%)

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
 
diff --git a/arch/m68k/lib/string.c b/arch/m68k/lib/memcpy.c
similarity index 84%
rename from arch/m68k/lib/string.c
rename to arch/m68k/lib/memcpy.c
index 6d24612..2592171 100644
--- a/arch/m68k/lib/string.c
+++ b/arch/m68k/lib/memcpy.c
@@ -4,23 +4,9 @@
  * for more details.
  */
 
-#define __IN_STRING_C
-
 #include <linux/module.h>
 #include <linux/string.h>
 
-char *strcpy(char *dest, const char *src)
-{
-	return __kernel_strcpy(dest, src);
-}
-EXPORT_SYMBOL(strcpy);
-
-char *strcat(char *dest, const char *src)
-{
-	return __kernel_strcpy(dest + __kernel_strlen(dest), src);
-}
-EXPORT_SYMBOL(strcat);
-
 void *memcpy(void *to, const void *from, size_t n)
 {
 	void *xto = to;
@@ -48,7 +34,8 @@ void *memcpy(void *to, const void *from, size_t n)
 	if (temp) {
 		long *lto = to;
 		const long *lfrom = from;
-
+#if defined(__mc68020__) || defined(__mc68030__) || \
+    defined(__mc68040__) || defined(__mc68060__)
 		asm volatile (
 			"	movel %2,%3\n"
 			"	andw  #7,%3\n"
@@ -69,6 +56,10 @@ void *memcpy(void *to, const void *from, size_t n)
 			"	jpl   4b"
 			: "=a" (lfrom), "=a" (lto), "=d" (temp), "=&d" (temp1)
 			: "0" (lfrom), "1" (lto), "2" (temp));
+#else
+		for (; temp; temp--)
+			*lto++ = *lfrom++;
+#endif
 		to = lto;
 		from = lfrom;
 	}
diff --git a/arch/m68k/lib/string.c b/arch/m68k/lib/string.c
dissimilarity index 71%
index 6d24612..b9a57ab 100644
--- a/arch/m68k/lib/string.c
+++ b/arch/m68k/lib/string.c
@@ -1,89 +1,22 @@
-/*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file COPYING in the main directory of this archive
- * for more details.
- */
-
-#define __IN_STRING_C
-
-#include <linux/module.h>
-#include <linux/string.h>
-
-char *strcpy(char *dest, const char *src)
-{
-	return __kernel_strcpy(dest, src);
-}
-EXPORT_SYMBOL(strcpy);
-
-char *strcat(char *dest, const char *src)
-{
-	return __kernel_strcpy(dest + __kernel_strlen(dest), src);
-}
-EXPORT_SYMBOL(strcat);
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
+/*
+ * This file is subject to the terms and conditions of the GNU General Public
+ * License.  See the file COPYING in the main directory of this archive
+ * for more details.
+ */
+
+#define __IN_STRING_C
+
+#include <linux/module.h>
+#include <linux/string.h>
+
+char *strcpy(char *dest, const char *src)
+{
+	return __kernel_strcpy(dest, src);
+}
+EXPORT_SYMBOL(strcpy);
+
+char *strcat(char *dest, const char *src)
+{
+	return __kernel_strcpy(dest + __kernel_strlen(dest), src);
+}
+EXPORT_SYMBOL(strcat);
-- 
1.7.0.4
