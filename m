From: Greg Ungerer <gerg@uclinux.org>
Subject: [PATCH 1/6] m68k: merge mmu and non-mmu versions of muldi3
Date: Wed, 30 Mar 2011 17:58:22 +1000
Message-ID: <de032cfd09b94c8803091bf143890ce48e61304a.1301471809.git.gerg@uclinux.org>
References: <1301471907-10204-1-git-send-email-gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:57650 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754175Ab1C3IA6 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 30 Mar 2011 04:00:58 -0400
In-Reply-To: <1301471907-10204-1-git-send-email-gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@uclinux.org>

The implementation of gcc's muldi3 support function differs only in
the use of the machine's 64 bit sized mul or not. (It isn't based
on using an MMU or not). Merge the current mmu and non-mmu versions
of arc/m68k/lib/muldi3 and use the appropriate pre-processor
conditionals to get the right version for all m68k processor types.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/lib/{muldi3_no.c => muldi3.c} |   14 +++++++
 arch/m68k/lib/muldi3_mm.c               |   63 -------------------------------
 2 files changed, 14 insertions(+), 63 deletions(-)
 rename arch/m68k/lib/{muldi3_no.c => muldi3.c} (88%)
 delete mode 100644 arch/m68k/lib/muldi3_mm.c

diff --git a/arch/m68k/lib/muldi3_no.c b/arch/m68k/lib/muldi3.c
similarity index 88%
rename from arch/m68k/lib/muldi3_no.c
rename to arch/m68k/lib/muldi3.c
index 34af72c..6bc1c16 100644
--- a/arch/m68k/lib/muldi3_no.c
+++ b/arch/m68k/lib/muldi3.c
@@ -22,6 +22,18 @@ Boston, MA 02111-1307, USA.  */
 #define BITS_PER_UNIT 8
 #define SI_TYPE_SIZE 32
 
+#if defined(__mc68020__) || defined(__mc68030__) || \
+    defined(__mc68040__) || defined(__mc68060__)
+
+#define umul_ppmm(w1, w0, u, v) \
+  __asm__ ("mulu%.l %3,%1:%0"						\
+           : "=d" ((USItype)(w0)),					\
+             "=d" ((USItype)(w1))					\
+           : "%0" ((USItype)(u)),					\
+             "dmi" ((USItype)(v)))
+
+#else
+
 #define __BITS4 (SI_TYPE_SIZE / 4)
 #define __ll_B (1L << (SI_TYPE_SIZE / 2))
 #define __ll_lowpart(t) ((USItype) (t) % __ll_B)
@@ -51,6 +63,8 @@ Boston, MA 02111-1307, USA.  */
     (w0) = __ll_lowpart (__x1) * __ll_B + __ll_lowpart (__x0);		\
   } while (0)
 
+#endif
+
 #define __umulsidi3(u, v) \
   ({DIunion __w;							\
     umul_ppmm (__w.s.high, __w.s.low, u, v);				\
diff --git a/arch/m68k/lib/muldi3_mm.c b/arch/m68k/lib/muldi3_mm.c
deleted file mode 100644
index be4f275..0000000
--- a/arch/m68k/lib/muldi3_mm.c
+++ /dev/null
@@ -1,63 +0,0 @@
-/* muldi3.c extracted from gcc-2.7.2.3/libgcc2.c and
-			   gcc-2.7.2.3/longlong.h which is: */
-/* Copyright (C) 1989, 1992, 1993, 1994, 1995 Free Software Foundation, Inc.
-
-This file is part of GNU CC.
-
-GNU CC is free software; you can redistribute it and/or modify
-it under the terms of the GNU General Public License as published by
-the Free Software Foundation; either version 2, or (at your option)
-any later version.
-
-GNU CC is distributed in the hope that it will be useful,
-but WITHOUT ANY WARRANTY; without even the implied warranty of
-MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-GNU General Public License for more details.
-
-You should have received a copy of the GNU General Public License
-along with GNU CC; see the file COPYING.  If not, write to
-the Free Software Foundation, 59 Temple Place - Suite 330,
-Boston, MA 02111-1307, USA.  */
-
-#define BITS_PER_UNIT 8
-
-#define umul_ppmm(w1, w0, u, v) \
-  __asm__ ("mulu%.l %3,%1:%0"						\
-           : "=d" ((USItype)(w0)),					\
-             "=d" ((USItype)(w1))					\
-           : "%0" ((USItype)(u)),					\
-             "dmi" ((USItype)(v)))
-
-#define __umulsidi3(u, v) \
-  ({DIunion __w;							\
-    umul_ppmm (__w.s.high, __w.s.low, u, v);				\
-    __w.ll; })
-
-typedef		 int SItype	__attribute__ ((mode (SI)));
-typedef unsigned int USItype	__attribute__ ((mode (SI)));
-typedef		 int DItype	__attribute__ ((mode (DI)));
-typedef int word_type __attribute__ ((mode (__word__)));
-
-struct DIstruct {SItype high, low;};
-
-typedef union
-{
-  struct DIstruct s;
-  DItype ll;
-} DIunion;
-
-DItype
-__muldi3 (DItype u, DItype v)
-{
-  DIunion w;
-  DIunion uu, vv;
-
-  uu.ll = u,
-  vv.ll = v;
-
-  w.ll = __umulsidi3 (uu.s.low, vv.s.low);
-  w.s.high += ((USItype) uu.s.low * (USItype) vv.s.high
-	       + (USItype) uu.s.high * (USItype) vv.s.low);
-
-  return w.ll;
-}
-- 
1.7.0.4
