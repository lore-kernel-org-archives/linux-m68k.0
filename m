Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A9ABC4332F
	for <linux-m68k@archiver.kernel.org>; Mon, 30 Oct 2023 04:01:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbjJ3EBA (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 30 Oct 2023 00:01:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbjJ3EA7 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 30 Oct 2023 00:00:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CEB697
        for <linux-m68k@lists.linux-m68k.org>; Sun, 29 Oct 2023 21:00:56 -0700 (PDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
        by dfw.source.kernel.org (Postfix) with ESMTP id 7F3EB60BB9;
        Mon, 30 Oct 2023 04:00:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFD3AC433C8;
        Mon, 30 Oct 2023 04:00:53 +0000 (UTC)
From:   Greg Ungerer <gerg@linux-m68k.org>
To:     linux-m68k@lists.linux-m68k.org
Cc:     geert@linux-m68k.org, Greg Ungerer <gerg@kernel.org>,
        Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH] m68k: use kernel's generic muldi3 libgcc function
Date:   Mon, 30 Oct 2023 14:00:40 +1000
Message-Id: <20231030040040.3087779-1-gerg@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

From: Greg Ungerer <gerg@kernel.org>

Use the kernels own generic lib/muldi3.c implementation of muldi3 for
68K machines. Some 68K CPUs support 64bit multiplies so move the arch
specific umul_ppmm() macro into a header file that is included by
lib/muldi3.c. That way it can take advantage of the single instruction
when available.

There is currently no arch specific compiler.h header for m68k, so create
one for the umul_ppmm() macro. Then remove the old arch/m68k/lib/muldi3.c
file that is no longer required.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/Kconfig                |  2 +
 arch/m68k/include/asm/compiler.h | 22 ++++++++
 arch/m68k/lib/Makefile           |  2 +-
 arch/m68k/lib/muldi3.c           | 96 --------------------------------
 4 files changed, 25 insertions(+), 97 deletions(-)
 create mode 100644 arch/m68k/include/asm/compiler.h
 delete mode 100644 arch/m68k/lib/muldi3.c

Geert: this is a follow up to our discussion at
       https://lore.kernel.org/all/f9dc98e1-83b0-4345-b4e8-f833f0e73e58@linux-m68k.org/T/

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 3e96486d9528..6aa85096e1ee 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -22,7 +22,9 @@ config M68K
 	select GENERIC_LIB_ASHLDI3
 	select GENERIC_LIB_ASHRDI3
 	select GENERIC_LIB_LSHRDI3
+	select GENERIC_LIB_MULDI3
 	select HAS_IOPORT if PCI || ISA || ATARI_ROM_ISA
+	select HAVE_ARCH_COMPILER_H
 	select HAVE_ARCH_SECCOMP
 	select HAVE_ARCH_SECCOMP_FILTER
 	select HAVE_ASM_MODVERSIONS
diff --git a/arch/m68k/include/asm/compiler.h b/arch/m68k/include/asm/compiler.h
new file mode 100644
index 000000000000..4abd3c6fc0e2
--- /dev/null
+++ b/arch/m68k/include/asm/compiler.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_M68K_COMPILER_H
+#define __ASM_M68K_COMPILER_H
+
+#ifndef CONFIG_CPU_HAS_NO_MULDIV64
+
+/*
+ * For those 68K CPUs that support 64bit multiply define umul_ppm()
+ * for the common muldi3 libgcc helper function (in lib/muldi3.c).
+ * CPUs that don't have it (like the original 68000 and ColdFire)
+ * will fallback to using the C-coded version of umul_ppmm().
+ */
+#define umul_ppmm(w1, w0, u, v)				\
+	__asm__ ("mulu%.l %3,%1:%0"			\
+		 : "=d" ((unsigned long)(w0)),		\
+		   "=d" ((unsigned long)(w1))		\
+		 : "%0" ((unsigned long)(u)),		\
+		   "dmi" ((unsigned long)(v)))
+
+#endif /* !CONFIG_CPU_HAS_NO_MULDIV64 */
+
+#endif /* __ASM_M68K_COMPILER_H */
diff --git a/arch/m68k/lib/Makefile b/arch/m68k/lib/Makefile
index 9158688e6cc6..15278a95259e 100644
--- a/arch/m68k/lib/Makefile
+++ b/arch/m68k/lib/Makefile
@@ -4,7 +4,7 @@
 # Makefile for m68k-specific library files..
 #
 
-lib-y	:= muldi3.o memcpy.o memset.o memmove.o
+lib-y	:= memcpy.o memset.o memmove.o
 
 lib-$(CONFIG_MMU) += uaccess.o
 lib-$(CONFIG_CPU_HAS_NO_MULDIV64) += mulsi3.o divsi3.o udivsi3.o
diff --git a/arch/m68k/lib/muldi3.c b/arch/m68k/lib/muldi3.c
deleted file mode 100644
index eb7d9d86ff66..000000000000
--- a/arch/m68k/lib/muldi3.c
+++ /dev/null
@@ -1,96 +0,0 @@
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
-GNU General Public License for more details. */
-
-#include <linux/compiler.h>
-#include <linux/export.h>
-
-#ifdef CONFIG_CPU_HAS_NO_MULDIV64
-
-#define SI_TYPE_SIZE 32
-#define __BITS4 (SI_TYPE_SIZE / 4)
-#define __ll_B (1L << (SI_TYPE_SIZE / 2))
-#define __ll_lowpart(t) ((USItype) (t) % __ll_B)
-#define __ll_highpart(t) ((USItype) (t) / __ll_B)
-
-#define umul_ppmm(w1, w0, u, v)						\
-  do {									\
-    USItype __x0, __x1, __x2, __x3;					\
-    USItype __ul, __vl, __uh, __vh;					\
-									\
-    __ul = __ll_lowpart (u);						\
-    __uh = __ll_highpart (u);						\
-    __vl = __ll_lowpart (v);						\
-    __vh = __ll_highpart (v);						\
-									\
-    __x0 = (USItype) __ul * __vl;					\
-    __x1 = (USItype) __ul * __vh;					\
-    __x2 = (USItype) __uh * __vl;					\
-    __x3 = (USItype) __uh * __vh;					\
-									\
-    __x1 += __ll_highpart (__x0);/* this can't give carry */		\
-    __x1 += __x2;		/* but this indeed can */		\
-    if (__x1 < __x2)		/* did we get it? */			\
-      __x3 += __ll_B;		/* yes, add it in the proper pos. */	\
-									\
-    (w1) = __x3 + __ll_highpart (__x1);					\
-    (w0) = __ll_lowpart (__x1) * __ll_B + __ll_lowpart (__x0);		\
-  } while (0)
-
-#else
-
-#define umul_ppmm(w1, w0, u, v) \
-  __asm__ ("mulu%.l %3,%1:%0"						\
-           : "=d" ((USItype)(w0)),					\
-             "=d" ((USItype)(w1))					\
-           : "%0" ((USItype)(u)),					\
-             "dmi" ((USItype)(v)))
-
-#endif
-
-#define __umulsidi3(u, v) \
-  ({DIunion __w;							\
-    umul_ppmm (__w.s.high, __w.s.low, u, v);				\
-    __w.ll; })
-
-typedef 	 int SItype	__mode(SI);
-typedef unsigned int USItype	__mode(SI);
-typedef		 int DItype	__mode(DI);
-typedef int word_type           __mode(__word__);
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
-  uu.ll = u;
-  vv.ll = v;
-
-  w.ll = __umulsidi3 (uu.s.low, vv.s.low);
-  w.s.high += ((USItype) uu.s.low * (USItype) vv.s.high
-	       + (USItype) uu.s.high * (USItype) vv.s.low);
-
-  return w.ll;
-}
-EXPORT_SYMBOL(__muldi3);
-- 
2.25.1

