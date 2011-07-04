From: <gerg@snapgear.com>
Subject: [PATCH] m68k: merge and clean up delay.h files
Date: Mon, 4 Jul 2011 11:57:48 +1000
Message-ID: <1309744668-30960-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:30481 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751168Ab1GDB5p (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 3 Jul 2011 21:57:45 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The real difference between the mmu and non-mmu varients of the delay.h
files has nothing to do with having an mmu or not. It is processor family
differences that means slightly different code. Merge the delay_mm.h and
delay_no.h files back into a single file.

The primarly difference we need to deal with is whether the processor
supports a 32bit * 32bit -> 64bit multiply. Without it we need to do some
shift scaling as well as use a 32bit * 32bit -> 32bit multiply. If building
for a multi-CPU type kernel then we must use the simpler mult/shift scaling.

This version of delay code allows the CPU32 family to use a 64bit mul,
since it supports this instruction, the old code did not.

The changes use macros where appropriate to try and optimize constant sized
udelay times. And it removes the use of a fixed lib function for the non-mmu
case. Code size on typical kernel configurations is similar, or only larger
by a few tens of bytes.

Also removed the unused muldiv() code from delay_mm.h.

Build and run tested on ColdFire and ARAnyM. Build tested only on 68328
and 68360 (CPU32).

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/delay.h    |   97 ++++++++++++++++++++++++++++++++++++-
 arch/m68k/include/asm/delay_mm.h |   57 ----------------------
 arch/m68k/include/asm/delay_no.h |   76 -----------------------------
 arch/m68k/lib/Makefile           |    2 +-
 arch/m68k/lib/delay.c            |   21 --------
 5 files changed, 95 insertions(+), 158 deletions(-)
 delete mode 100644 arch/m68k/include/asm/delay_mm.h
 delete mode 100644 arch/m68k/include/asm/delay_no.h
 delete mode 100644 arch/m68k/lib/delay.c

diff --git a/arch/m68k/include/asm/delay.h b/arch/m68k/include/asm/delay.h
index d2598e3..9c09bec 100644
--- a/arch/m68k/include/asm/delay.h
+++ b/arch/m68k/include/asm/delay.h
@@ -1,5 +1,96 @@
-#ifdef __uClinux__
-#include "delay_no.h"
+#ifndef _M68K_DELAY_H
+#define _M68K_DELAY_H
+
+#include <asm/param.h>
+
+/*
+ * Copyright (C) 1994 Hamish Macdonald
+ * Copyright (C) 2004 Greg Ungerer <gerg@uclinux.com>
+ *
+ * Delay routines, using a pre-computed "loops_per_jiffy" value.
+ */
+
+#if defined(CONFIG_COLDFIRE)
+/*
+ * The ColdFire runs the delay loop at significantly different speeds
+ * depending upon long word alignment or not.  We'll pad it to
+ * long word alignment which is the faster version.
+ * The 0x4a8e is of course a 'tstl %fp' instruction.  This is better
+ * than using a NOP (0x4e71) instruction because it executes in one
+ * cycle not three and doesn't allow for an arbitrary delay waiting
+ * for bus cycles to finish.  Also fp/a6 isn't likely to cause a
+ * stall waiting for the register to become valid if such is added
+ * to the coldfire at some stage.
+ */
+#define	DELAY_ALIGN	".balignw 4, 0x4a8e\n\t"
 #else
-#include "delay_mm.h"
+/*
+ * No instruction alignment required for other m68k types.
+ */
+#define	DELAY_ALIGN
 #endif
+
+static inline void __delay(unsigned long loops)
+{
+	__asm__ __volatile__ (
+		DELAY_ALIGN
+		"1: subql #1,%0\n\t"
+		"jcc 1b"
+		: "=d" (loops)
+		: "0" (loops));
+}
+
+extern void __bad_udelay(void);
+
+
+#if defined(CONFIG_M68000) || defined(CONFIG_COLDFIRE)
+/*
+ * The simpler m68k and ColdFire processors do not have a 32*32->64
+ * multiply instruction. So we need to handle them a little differently.
+ * We use a bit of shifting and a single 32*32->32 multiply to get close.
+ * This is a macro so that the const version can factor out the first
+ * multiply and shift.
+ */
+#define	HZSCALE		(268435456 / (1000000 / HZ))
+
+#define	__const_udelay(u) \
+	__delay(((((u) * HZSCALE) >> 11) * (loops_per_jiffy >> 11)) >> 6)
+
+#else
+
+static inline void __xdelay(unsigned long xloops)
+{
+	unsigned long tmp;
+
+	__asm__ ("mulul %2,%0:%1"
+		: "=d" (xloops), "=d" (tmp)
+		: "d" (xloops), "1" (loops_per_jiffy));
+	__delay(xloops * HZ);
+}
+
+/*
+ * The definition of __const_udelay is specifically made a macro so that
+ * the const factor (4295 = 2**32 / 1000000) can be optimized out when
+ * the delay is a const.
+ */
+#define	__const_udelay(n)	(__xdelay((n) * 4295))
+
+#endif
+
+static inline void __udelay(unsigned long usecs)
+{
+	__const_udelay(usecs);
+}
+
+/*
+ * Use only for very small delays ( < 1 msec).  Should probably use a
+ * lookup table, really, as the multiplications take much too long with
+ * short delays.  This is a "reasonable" implementation, though (and the
+ * first constant multiplications gets optimized away if the delay is
+ * a constant)
+ */
+#define udelay(n) (__builtin_constant_p(n) ? \
+	((n) > 20000 ? __bad_udelay() : __const_udelay(n)) : __udelay(n))
+
+
+#endif /* defined(_M68K_DELAY_H) */
diff --git a/arch/m68k/include/asm/delay_mm.h b/arch/m68k/include/asm/delay_mm.h
deleted file mode 100644
index 5ed9285..0000000
--- a/arch/m68k/include/asm/delay_mm.h
+++ /dev/null
@@ -1,57 +0,0 @@
-#ifndef _M68K_DELAY_H
-#define _M68K_DELAY_H
-
-#include <asm/param.h>
-
-/*
- * Copyright (C) 1994 Hamish Macdonald
- *
- * Delay routines, using a pre-computed "loops_per_jiffy" value.
- */
-
-static inline void __delay(unsigned long loops)
-{
-	__asm__ __volatile__ ("1: subql #1,%0; jcc 1b"
-		: "=d" (loops) : "0" (loops));
-}
-
-extern void __bad_udelay(void);
-
-/*
- * Use only for very small delays ( < 1 msec).  Should probably use a
- * lookup table, really, as the multiplications take much too long with
- * short delays.  This is a "reasonable" implementation, though (and the
- * first constant multiplications gets optimized away if the delay is
- * a constant)
- */
-static inline void __const_udelay(unsigned long xloops)
-{
-	unsigned long tmp;
-
-	__asm__ ("mulul %2,%0:%1"
-		: "=d" (xloops), "=d" (tmp)
-		: "d" (xloops), "1" (loops_per_jiffy));
-	__delay(xloops * HZ);
-}
-
-static inline void __udelay(unsigned long usecs)
-{
-	__const_udelay(usecs * 4295);	/* 2**32 / 1000000 */
-}
-
-#define udelay(n) (__builtin_constant_p(n) ? \
-	((n) > 20000 ? __bad_udelay() : __const_udelay((n) * 4295)) : \
-	__udelay(n))
-
-static inline unsigned long muldiv(unsigned long a, unsigned long b,
-				   unsigned long c)
-{
-	unsigned long tmp;
-
-	__asm__ ("mulul %2,%0:%1; divul %3,%0:%1"
-		: "=d" (tmp), "=d" (a)
-		: "d" (b), "d" (c), "1" (a));
-	return a;
-}
-
-#endif /* defined(_M68K_DELAY_H) */
diff --git a/arch/m68k/include/asm/delay_no.h b/arch/m68k/include/asm/delay_no.h
deleted file mode 100644
index c3a0edc..0000000
--- a/arch/m68k/include/asm/delay_no.h
+++ /dev/null
@@ -1,76 +0,0 @@
-#ifndef _M68KNOMMU_DELAY_H
-#define _M68KNOMMU_DELAY_H
-
-/*
- * Copyright (C) 1994 Hamish Macdonald
- * Copyright (C) 2004 Greg Ungerer <gerg@snapgear.com>
- */
-
-#include <asm/param.h>
-
-static inline void __delay(unsigned long loops)
-{
-#if defined(CONFIG_COLDFIRE)
-	/* The coldfire runs this loop at significantly different speeds
-	 * depending upon long word alignment or not.  We'll pad it to
-	 * long word alignment which is the faster version.
-	 * The 0x4a8e is of course a 'tstl %fp' instruction.  This is better
-	 * than using a NOP (0x4e71) instruction because it executes in one
-	 * cycle not three and doesn't allow for an arbitrary delay waiting
-	 * for bus cycles to finish.  Also fp/a6 isn't likely to cause a
-	 * stall waiting for the register to become valid if such is added
-	 * to the coldfire at some stage.
-	 */
-	__asm__ __volatile__ (	".balignw 4, 0x4a8e\n\t"
-				"1: subql #1, %0\n\t"
-				"jcc 1b"
-		: "=d" (loops) : "0" (loops));
-#else
-	__asm__ __volatile__ (	"1: subql #1, %0\n\t"
-				"jcc 1b"
-		: "=d" (loops) : "0" (loops));
-#endif
-}
-
-/*
- *	Ideally we use a 32*32->64 multiply to calculate the number of
- *	loop iterations, but the older standard 68k and ColdFire do not
- *	have this instruction. So for them we have a clsoe approximation
- *	loop using 32*32->32 multiplies only. This calculation based on
- *	the ARM version of delay.
- *
- *	We want to implement:
- *
- *	loops = (usecs * 0x10c6 * HZ * loops_per_jiffy) / 2^32
- */
-
-#define	HZSCALE		(268435456 / (1000000/HZ))
-
-extern unsigned long loops_per_jiffy;
-
-static inline void _udelay(unsigned long usecs)
-{
-#if defined(CONFIG_M68328) || defined(CONFIG_M68EZ328) || \
-    defined(CONFIG_M68VZ328) || defined(CONFIG_M68360) || \
-    defined(CONFIG_COLDFIRE)
-	__delay((((usecs * HZSCALE) >> 11) * (loops_per_jiffy >> 11)) >> 6);
-#else
-	unsigned long tmp;
-
-	usecs *= 4295;		/* 2**32 / 1000000 */
-	__asm__ ("mulul %2,%0:%1"
-		: "=d" (usecs), "=d" (tmp)
-		: "d" (usecs), "1" (loops_per_jiffy*HZ));
-	__delay(usecs);
-#endif
-}
-
-/*
- *	Moved the udelay() function into library code, no longer inlined.
- *	I had to change the algorithm because we are overflowing now on
- *	the faster ColdFire parts. The code is a little bigger, so it makes
- *	sense to library it.
- */
-extern void udelay(unsigned long usecs);
-
-#endif /* defined(_M68KNOMMU_DELAY_H) */
diff --git a/arch/m68k/lib/Makefile b/arch/m68k/lib/Makefile
index df421e5..1a1bd90 100644
--- a/arch/m68k/lib/Makefile
+++ b/arch/m68k/lib/Makefile
@@ -9,6 +9,6 @@ lib-y	:= ashldi3.o ashrdi3.o lshrdi3.o muldi3.o \
 ifdef CONFIG_MMU
 lib-y	+= string.o uaccess.o checksum_mm.o
 else
-lib-y	+= mulsi3.o divsi3.o udivsi3.o modsi3.o umodsi3.o delay.o checksum_no.o
+lib-y	+= mulsi3.o divsi3.o udivsi3.o modsi3.o umodsi3.o checksum_no.o
 endif
 
diff --git a/arch/m68k/lib/delay.c b/arch/m68k/lib/delay.c
deleted file mode 100644
index 5bd5472..0000000
--- a/arch/m68k/lib/delay.c
+++ /dev/null
@@ -1,21 +0,0 @@
-/*
- *	arch/m68knommu/lib/delay.c
- *
- *	(C) Copyright 2004, Greg Ungerer <gerg@snapgear.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- */
-
-#include <linux/module.h>
-#include <asm/param.h>
-#include <asm/delay.h>
-
-EXPORT_SYMBOL(udelay);
-
-void udelay(unsigned long usecs)
-{
-	_udelay(usecs);
-}
-
-- 
1.7.0.4
