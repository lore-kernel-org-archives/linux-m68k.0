From: <gerg@snapgear.com>
Subject: [PATCH 2/2] m68k: use kernel processor defines for conditional optimizations
Date: Fri, 3 Jun 2011 16:43:17 +1000
Message-ID: <1307083397-9994-4-git-send-email-gerg@snapgear.com>
References: <1307083397-9994-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:11032 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751862Ab1FCGoN (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 3 Jun 2011 02:44:13 -0400
In-Reply-To: <1307083397-9994-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Older m68k-linux compilers will include pre-defined symbols that
confuse what processor it is being targeted for. For example gcc-4.1.2
will pre-define __mc68020__ even if you specify the target processor
as -m68000 on the gcc command line. Newer versions of gcc have this
corrected.

In a few places the m68k code uses defined(__mc68020__) for optimizations
that include instructions that are specific to the CPU 68020 and above.
When compiling with older compilers this will be true even when we have
selected to compile for the older 68000 processors.

Switch to using the kernel processor defines, CONFIG_M68020 and friends.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/kernel/m68k_ksyms.c |    3 +--
 arch/m68k/lib/memcpy.c        |    9 ++++-----
 arch/m68k/lib/memset.c        |    9 ++++-----
 arch/m68k/lib/muldi3.c        |   21 ++++++++++-----------
 4 files changed, 19 insertions(+), 23 deletions(-)

diff --git a/arch/m68k/kernel/m68k_ksyms.c b/arch/m68k/kernel/m68k_ksyms.c
index 33f8276..1b7a14d 100644
--- a/arch/m68k/kernel/m68k_ksyms.c
+++ b/arch/m68k/kernel/m68k_ksyms.c
@@ -14,8 +14,7 @@ EXPORT_SYMBOL(__ashrdi3);
 EXPORT_SYMBOL(__lshrdi3);
 EXPORT_SYMBOL(__muldi3);
 
-#if !defined(__mc68020__) && !defined(__mc68030__) && \
-    !defined(__mc68040__) && !defined(__mc68060__) && !defined(__mcpu32__)
+#if defined(CONFIG_M68000) || defined(CONFIG_COLDFIRE)
 /*
  * Simpler 68k and ColdFire parts also need a few other gcc functions.
  */
diff --git a/arch/m68k/lib/memcpy.c b/arch/m68k/lib/memcpy.c
index 62182c8..0648893 100644
--- a/arch/m68k/lib/memcpy.c
+++ b/arch/m68k/lib/memcpy.c
@@ -34,8 +34,10 @@ void *memcpy(void *to, const void *from, size_t n)
 	if (temp) {
 		long *lto = to;
 		const long *lfrom = from;
-#if defined(__mc68020__) || defined(__mc68030__) || \
-    defined(__mc68040__) || defined(__mc68060__) || defined(__mcpu32__)
+#if defined(CONFIG_M68000) || defined(CONFIG_COLDFIRE)
+		for (; temp; temp--)
+			*lto++ = *lfrom++;
+#else
 		asm volatile (
 			"	movel %2,%3\n"
 			"	andw  #7,%3\n"
@@ -56,9 +58,6 @@ void *memcpy(void *to, const void *from, size_t n)
 			"	jpl   4b"
 			: "=a" (lfrom), "=a" (lto), "=d" (temp), "=&d" (temp1)
 			: "0" (lfrom), "1" (lto), "2" (temp));
-#else
-		for (; temp; temp--)
-			*lto++ = *lfrom++;
 #endif
 		to = lto;
 		from = lfrom;
diff --git a/arch/m68k/lib/memset.c b/arch/m68k/lib/memset.c
index f649e6a..8a7639f 100644
--- a/arch/m68k/lib/memset.c
+++ b/arch/m68k/lib/memset.c
@@ -32,8 +32,10 @@ void *memset(void *s, int c, size_t count)
 	temp = count >> 2;
 	if (temp) {
 		long *ls = s;
-#if defined(__mc68020__) || defined(__mc68030__) || \
-    defined(__mc68040__) || defined(__mc68060__) || defined(__mcpu32__)
+#if defined(CONFIG_M68000) || defined(CONFIG_COLDFIRE)
+		for (; temp; temp--)
+			*ls++ = c;
+#else
 		size_t temp1;
 		asm volatile (
 			"	movel %1,%2\n"
@@ -55,9 +57,6 @@ void *memset(void *s, int c, size_t count)
 			"	jpl   1b"
 			: "=a" (ls), "=d" (temp), "=&d" (temp1)
 			: "d" (c), "0" (ls), "1" (temp));
-#else
-		for (; temp; temp--)
-			*ls++ = c;
 #endif
 		s = ls;
 	}
diff --git a/arch/m68k/lib/muldi3.c b/arch/m68k/lib/muldi3.c
index 079bafc..79e928a 100644
--- a/arch/m68k/lib/muldi3.c
+++ b/arch/m68k/lib/muldi3.c
@@ -19,17 +19,7 @@ along with GNU CC; see the file COPYING.  If not, write to
 the Free Software Foundation, 59 Temple Place - Suite 330,
 Boston, MA 02111-1307, USA.  */
 
-#if defined(__mc68020__) || defined(__mc68030__) || \
-    defined(__mc68040__) || defined(__mc68060__) || defined(__mcpu32__)
-
-#define umul_ppmm(w1, w0, u, v) \
-  __asm__ ("mulu%.l %3,%1:%0"						\
-           : "=d" ((USItype)(w0)),					\
-             "=d" ((USItype)(w1))					\
-           : "%0" ((USItype)(u)),					\
-             "dmi" ((USItype)(v)))
-
-#else
+#if defined(CONFIG_M68000) || defined(CONFIG_COLDFIRE)
 
 #define SI_TYPE_SIZE 32
 #define __BITS4 (SI_TYPE_SIZE / 4)
@@ -61,6 +51,15 @@ Boston, MA 02111-1307, USA.  */
     (w0) = __ll_lowpart (__x1) * __ll_B + __ll_lowpart (__x0);		\
   } while (0)
 
+#else
+
+#define umul_ppmm(w1, w0, u, v) \
+  __asm__ ("mulu%.l %3,%1:%0"						\
+           : "=d" ((USItype)(w0)),					\
+             "=d" ((USItype)(w1))					\
+           : "%0" ((USItype)(u)),					\
+             "dmi" ((USItype)(v)))
+
 #endif
 
 #define __umulsidi3(u, v) \
-- 
1.7.0.4
