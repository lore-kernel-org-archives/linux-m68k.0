From: <gerg@snapgear.com>
Subject: [PATCH v2 4/6] m68k: remove duplicate memset() implementation
Date: Wed, 20 Apr 2011 15:54:38 +1000
Message-ID: <1303278880-16153-6-git-send-email-gerg@snapgear.com>
References: <1303278880-16153-1-git-send-email-gerg@snapgear.com>
 <1303278880-16153-2-git-send-email-gerg@snapgear.com>
 <1303278880-16153-3-git-send-email-gerg@snapgear.com>
 <1303278880-16153-4-git-send-email-gerg@snapgear.com>
 <1303278880-16153-5-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:45041 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752148Ab1DTF5j (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 20 Apr 2011 01:57:39 -0400
In-Reply-To: <1303278880-16153-5-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Merging the mmu and non-mmu directories we ended up with duplicate
implementations of memset(). One is a little more optimized for the
>68020 case, but that can easily be inserted into a single
implementation of memset(). Clean up the exporting of this symbol
too, otherwise we end up exporting it twice on a no-mmu build.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/kernel/m68k_ksyms_no.c |    1 -
 arch/m68k/lib/Makefile           |    5 +-
 arch/m68k/lib/memset.c           |  114 +++++++++++++++++++++++--------------
 arch/m68k/lib/string.c           |   61 --------------------
 4 files changed, 74 insertions(+), 107 deletions(-)

diff --git a/arch/m68k/kernel/m68k_ksyms_no.c b/arch/m68k/kernel/m68k_ksyms_no.c
index 39fe0a7..346bce6 100644
--- a/arch/m68k/kernel/m68k_ksyms_no.c
+++ b/arch/m68k/kernel/m68k_ksyms_no.c
@@ -36,7 +36,6 @@ EXPORT_SYMBOL(csum_partial_copy_nocheck);
    their interface isn't gonna change any time soon now, so
    it's OK to leave it out of version control.  */
 EXPORT_SYMBOL(memcpy);
-EXPORT_SYMBOL(memset);
 
 /*
  * libgcc functions - functions that are used internally by the
diff --git a/arch/m68k/lib/Makefile b/arch/m68k/lib/Makefile
index ec479a9..ac275d5 100644
--- a/arch/m68k/lib/Makefile
+++ b/arch/m68k/lib/Makefile
@@ -3,12 +3,13 @@
 # Makefile for m68k-specific library files..
 #
 
-lib-y	:= ashldi3.o ashrdi3.o lshrdi3.o muldi3.o memmove.o checksum.o
+lib-y	:= ashldi3.o ashrdi3.o lshrdi3.o muldi3.o \
+	   memset.o memmove.o checksum.o
 
 ifdef CONFIG_MMU
 lib-y	+= string.o uaccess.o
 else
 lib-y	+= mulsi3.o divsi3.o udivsi3.o modsi3.o umodsi3.o \
-	   memcpy.o memset.o delay.o
+	   memcpy.o delay.o
 endif
 
diff --git a/arch/m68k/lib/memset.c b/arch/m68k/lib/memset.c
index 1389bf4..eea2834 100644
--- a/arch/m68k/lib/memset.c
+++ b/arch/m68k/lib/memset.c
@@ -1,47 +1,75 @@
-#include <linux/types.h>
+/*
+ * This file is subject to the terms and conditions of the GNU General Public
+ * License.  See the file COPYING in the main directory of this archive
+ * for more details.
+ */
 
-void * memset(void * s, int c, size_t count)
+#include <linux/module.h>
+#include <linux/string.h>
+
+void *memset(void *s, int c, size_t count)
 {
-  void *xs = s;
-  size_t temp;
+	void *xs = s;
+	size_t temp;
 
-  if (!count)
-    return xs;
-  c &= 0xff;
-  c |= c << 8;
-  c |= c << 16;
-  if ((long) s & 1)
-    {
-      char *cs = s;
-      *cs++ = c;
-      s = cs;
-      count--;
-    }
-  if (count > 2 && (long) s & 2)
-    {
-      short *ss = s;
-      *ss++ = c;
-      s = ss;
-      count -= 2;
-    }
-  temp = count >> 2;
-  if (temp)
-    {
-      long *ls = s;
-      for (; temp; temp--)
-	*ls++ = c;
-      s = ls;
-    }
-  if (count & 2)
-    {
-      short *ss = s;
-      *ss++ = c;
-      s = ss;
-    }
-  if (count & 1)
-    {
-      char *cs = s;
-      *cs = c;
-    }
-  return xs;
+	if (!count)
+		return xs;
+	c &= 0xff;
+	c |= c << 8;
+	c |= c << 16;
+	if ((long)s & 1) {
+		char *cs = s;
+		*cs++ = c;
+		s = cs;
+		count--;
+	}
+	if (count > 2 && (long)s & 2) {
+		short *ss = s;
+		*ss++ = c;
+		s = ss;
+		count -= 2;
+	}
+	temp = count >> 2;
+	if (temp) {
+		long *ls = s;
+#if defined(__mc68020__) || defined(__mc68030__) || \
+    defined(__mc68040__) || defined(__mc68060__)
+		size_t temp1;
+		asm volatile (
+			"	movel %1,%2\n"
+			"	andw  #7,%2\n"
+			"	lsrl  #3,%1\n"
+			"	negw  %2\n"
+			"	jmp   %%pc@(2f,%2:w:2)\n"
+			"1:	movel %3,%0@+\n"
+			"	movel %3,%0@+\n"
+			"	movel %3,%0@+\n"
+			"	movel %3,%0@+\n"
+			"	movel %3,%0@+\n"
+			"	movel %3,%0@+\n"
+			"	movel %3,%0@+\n"
+			"	movel %3,%0@+\n"
+			"2:	dbra  %1,1b\n"
+			"	clrw  %1\n"
+			"	subql #1,%1\n"
+			"	jpl   1b"
+			: "=a" (ls), "=d" (temp), "=&d" (temp1)
+			: "d" (c), "0" (ls), "1" (temp));
+#else
+		for (; temp; temp--)
+			*ls++ = c;
+#endif
+		s = ls;
+	}
+	if (count & 2) {
+		short *ss = s;
+		*ss++ = c;
+		s = ss;
+	}
+	if (count & 1) {
+		char *cs = s;
+		*cs = c;
+	}
+	return xs;
 }
+EXPORT_SYMBOL(memset);
diff --git a/arch/m68k/lib/string.c b/arch/m68k/lib/string.c
index 711fa74..6d24612 100644
--- a/arch/m68k/lib/string.c
+++ b/arch/m68k/lib/string.c
@@ -21,67 +21,6 @@ char *strcat(char *dest, const char *src)
 }
 EXPORT_SYMBOL(strcat);
 
-void *memset(void *s, int c, size_t count)
-{
-	void *xs = s;
-	size_t temp, temp1;
-
-	if (!count)
-		return xs;
-	c &= 0xff;
-	c |= c << 8;
-	c |= c << 16;
-	if ((long)s & 1) {
-		char *cs = s;
-		*cs++ = c;
-		s = cs;
-		count--;
-	}
-	if (count > 2 && (long)s & 2) {
-		short *ss = s;
-		*ss++ = c;
-		s = ss;
-		count -= 2;
-	}
-	temp = count >> 2;
-	if (temp) {
-		long *ls = s;
-
-		asm volatile (
-			"	movel %1,%2\n"
-			"	andw  #7,%2\n"
-			"	lsrl  #3,%1\n"
-			"	negw  %2\n"
-			"	jmp   %%pc@(2f,%2:w:2)\n"
-			"1:	movel %3,%0@+\n"
-			"	movel %3,%0@+\n"
-			"	movel %3,%0@+\n"
-			"	movel %3,%0@+\n"
-			"	movel %3,%0@+\n"
-			"	movel %3,%0@+\n"
-			"	movel %3,%0@+\n"
-			"	movel %3,%0@+\n"
-			"2:	dbra  %1,1b\n"
-			"	clrw  %1\n"
-			"	subql #1,%1\n"
-			"	jpl   1b"
-			: "=a" (ls), "=d" (temp), "=&d" (temp1)
-			: "d" (c), "0" (ls), "1" (temp));
-		s = ls;
-	}
-	if (count & 2) {
-		short *ss = s;
-		*ss++ = c;
-		s = ss;
-	}
-	if (count & 1) {
-		char *cs = s;
-		*cs = c;
-	}
-	return xs;
-}
-EXPORT_SYMBOL(memset);
-
 void *memcpy(void *to, const void *from, size_t n)
 {
 	void *xto = to;
-- 
1.7.0.4
