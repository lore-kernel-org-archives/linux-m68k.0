From: <gerg@snapgear.com>
Subject: [PATCH] m68k: merge mmu and non-mmu bitops.h
Date: Fri, 3 Jun 2011 16:51:23 +1000
Message-ID: <1307083883-10786-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:47531 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751868Ab1FCGwC (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 3 Jun 2011 02:52:02 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The following patch merges the mmu and non-mmu versions of the m68k
bitops.h files. Now there is a good deal of difference between the two
files, but none of it is actually an mmu specific difference. It is
all about the specific m68k/coldfire varient we are targeting. So it
makes an awful lot of sense to merge these into a single bitops.h.

This is more an RFC than anything else. There is a number of ways I
can see to factor this code. The approach in this first attempt is to
keep the various versions of each macro/function type together. But
this means that there is some ifdefery with each to handle each CPU
type. The ifdefs could be grouped - but this will move the macro
definitions away from the inline functions they reference.

I have added some comments in a couple of appropriate places to try
and make it clear what the differences we are dealing with are.
Specifically the instruction and addressing mode differences we have
to deal with.

The merged form keeps the same underlying optimizations for each CPU
type for all the general bit clear/set/change and find bit operations.
It does switch to using the generic le operations though, instead of
any local varients.

Build tested on ColdFire, 68328, 68360 (which is cpu32) and 68020+.
Run tested on ColdFire and ARAnyM.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/bitops.h    |  522 ++++++++++++++++++++++++++++++++++++-
 arch/m68k/include/asm/bitops_mm.h |  501 -----------------------------------
 arch/m68k/include/asm/bitops_no.h |  333 -----------------------
 3 files changed, 519 insertions(+), 837 deletions(-)
 delete mode 100644 arch/m68k/include/asm/bitops_mm.h
 delete mode 100644 arch/m68k/include/asm/bitops_no.h

diff --git a/arch/m68k/include/asm/bitops.h b/arch/m68k/include/asm/bitops.h
index ce163ab..3596e56 100644
--- a/arch/m68k/include/asm/bitops.h
+++ b/arch/m68k/include/asm/bitops.h
@@ -1,5 +1,521 @@
-#ifdef __uClinux__
-#include "bitops_no.h"
+#ifndef _M68K_BITOPS_H
+#define _M68K_BITOPS_H
+/*
+ * Copyright 1992, Linus Torvalds.
+ *
+ * This file is subject to the terms and conditions of the GNU General Public
+ * License.  See the file COPYING in the main directory of this archive
+ * for more details.
+ */
+
+#ifndef _LINUX_BITOPS_H
+#error only <linux/bitops.h> can be included directly
+#endif
+
+#include <linux/compiler.h>
+
+/*
+ *	Bit access functions vary a across the ColdFire and 68k families.
+ *	So we will break them out here, and then macro in the ones we want.
+ *
+ *	ColdFire - supports standard bset/bclr/bchg with register operand only
+ *	68000    - supports standard bset/bclr/bchg with memory operand
+ *      >= 68020 - also supports the bfset/bfclr/bfchg instructions 
+ *
+ *	Although it is possible to use only the bset/bclr/bchg with register
+ *	operands on all platforms you end up with larger generated code.
+ *	So we use the best form possible on a given platform.
+ */
+
+static inline void bset_reg_set_bit(int nr, volatile unsigned long *vaddr)
+{
+        char *p = (char *)vaddr + (nr ^ 31) / 8;
+
+        __asm__ __volatile__ ("bset %1,(%0)"
+		:
+		: "a" (p), "di" (nr & 7)
+		: "memory");
+}
+
+static inline void bset_mem_set_bit(int nr, volatile unsigned long *vaddr)
+{
+	char *p = (char *)vaddr + (nr ^ 31) / 8;
+
+	__asm__ __volatile__ ("bset %1,%0"
+		: "+m" (*p)
+		: "di" (nr & 7));
+}
+
+static inline void bfset_mem_set_bit(int nr, volatile unsigned long *vaddr)
+{
+	__asm__ __volatile__ ("bfset %1{%0:#1}"
+		:
+		: "d" (nr ^ 31), "o" (*vaddr)
+		: "memory");
+}
+
+#if defined(CONFIG_COLDFIRE)
+#define	set_bit(nr,vaddr)	bset_reg_set_bit(nr,vaddr)
+#elif defined(CONFIG_M68000) || defined(CONFIG_MCPU32)
+#define	set_bit(nr,vaddr)	bset_mem_set_bit(nr,vaddr)
+#else
+#define set_bit(nr,vaddr)	(__builtin_constant_p(nr) ? \
+				bset_mem_set_bit(nr,vaddr) : \
+				bfset_mem_set_bit(nr,vaddr))
+#endif
+
+#define __set_bit(nr,vaddr)	set_bit(nr,vaddr)
+
+
+/*
+ * clear_bit() doesn't provide any barrier for the compiler.
+ */
+#define smp_mb__before_clear_bit()	barrier()
+#define smp_mb__after_clear_bit()	barrier()
+
+static inline void bclr_reg_clear_bit(int nr, volatile unsigned long *vaddr)
+{
+        char *p = (char *)vaddr + (nr ^ 31) / 8;
+
+        __asm__ __volatile__ ("bclr %1,(%0)"
+		:
+		: "a" (p), "di" (nr & 7)
+		: "memory");
+}
+
+static inline void bclr_mem_clear_bit(int nr, volatile unsigned long *vaddr)
+{
+	char *p = (char *)vaddr + (nr ^ 31) / 8;
+
+	__asm__ __volatile__ ("bclr %1,%0"
+		: "+m" (*p)
+		: "di" (nr & 7));
+}
+
+static inline void bfclr_mem_clear_bit(int nr, volatile unsigned long *vaddr)
+{
+	__asm__ __volatile__ ("bfclr %1{%0:#1}"
+		:
+		: "d" (nr ^ 31), "o" (*vaddr)
+		: "memory");
+}
+
+#if defined(CONFIG_COLDFIRE)
+#define	clear_bit(nr,vaddr)	bclr_reg_clear_bit(nr,vaddr)
+#elif defined(CONFIG_M68000) || defined(CONFIG_MCPU32)
+#define	clear_bit(nr,vaddr)	bclr_mem_clear_bit(nr,vaddr)
+#else
+#define clear_bit(nr,vaddr)	(__builtin_constant_p(nr) ? \
+				bclr_mem_clear_bit(nr, vaddr) : \
+				bfclr_mem_clear_bit(nr, vaddr))
+#endif
+
+#define __clear_bit(nr,vaddr)	clear_bit(nr,vaddr)
+
+
+static inline void bchg_reg_change_bit(int nr, volatile unsigned long *vaddr)
+{
+        char *p = (char *)vaddr + (nr ^ 31) / 8;
+
+        __asm__ __volatile__ ("bchg %1,(%0)"
+		:
+		: "a" (p), "di" (nr & 7)
+		: "memory");
+}
+
+static inline void bchg_mem_change_bit(int nr, volatile unsigned long *vaddr)
+{
+	char *p = (char *)vaddr + (nr ^ 31) / 8;
+
+	__asm__ __volatile__ ("bchg %1,%0"
+		: "+m" (*p)
+		: "di" (nr & 7));
+}
+
+static inline void bfchg_mem_change_bit(int nr, volatile unsigned long *vaddr)
+{
+	__asm__ __volatile__ ("bfchg %1{%0:#1}"
+		:
+		: "d" (nr ^ 31), "o" (*vaddr)
+		: "memory");
+}
+
+#if defined(CONFIG_COLDFIRE)
+#define	change_bit(nr,vaddr)	bchg_reg_change_bit(nr,vaddr)
+#elif defined(CONFIG_M68000) || defined(CONFIG_MCPU32)
+#define	change_bit(nr,vaddr)	bchg_mem_change_bit(nr,vaddr)
+#else
+#define change_bit(nr,vaddr)	(__builtin_constant_p(nr) ? \
+				bchg_mem_change_bit(nr,vaddr) : \
+				bfchg_mem_change_bit(nr,vaddr))
+#endif
+
+#define __change_bit(nr,vaddr)	change_bit(nr,vaddr)
+
+
+static inline int test_bit(int nr, const unsigned long *vaddr)
+{
+	return (vaddr[nr >> 5] & (1UL << (nr & 31))) != 0;
+}
+
+
+static inline int bset_reg_test_and_set_bit(int nr, volatile unsigned long *vaddr)
+{
+        char *p = (char *)vaddr + (nr ^ 31) / 8;
+        char retval;
+
+        __asm__ __volatile__ ("bset %2,(%1); sne %0"
+		: "=d" (retval)
+		: "a" (p), "di" (nr & 7)
+		: "memory");
+        return retval;
+}
+
+static inline int bset_mem_test_and_set_bit(int nr, volatile unsigned long *vaddr)
+{
+	char *p = (char *)vaddr + (nr ^ 31) / 8;
+	char retval;
+
+	__asm__ __volatile__ ("bset %2,%1; sne %0"
+		: "=d" (retval), "+m" (*p)
+		: "di" (nr & 7));
+	return retval;
+}
+
+static inline int bfset_mem_test_and_set_bit(int nr, volatile unsigned long *vaddr)
+{
+	char retval;
+
+	__asm__ __volatile__ ("bfset %2{%1:#1}; sne %0"
+		: "=d" (retval)
+		: "d" (nr ^ 31), "o" (*vaddr)
+		: "memory");
+	return retval;
+}
+
+#if defined(CONFIG_COLDFIRE)
+#define	test_and_set_bit(nr,vaddr)	bset_reg_test_and_set_bit(nr,vaddr)
+#elif defined(CONFIG_M68000) || defined(CONFIG_MCPU32)
+#define	test_and_set_bit(nr,vaddr)	bset_mem_test_and_set_bit(nr,vaddr)
+#else
+#define test_and_set_bit(nr,vaddr)	(__builtin_constant_p(nr) ? \
+					bset_mem_test_and_set_bit(nr,vaddr) : \
+					bfset_mem_test_and_set_bit(nr,vaddr))
+#endif
+
+#define __test_and_set_bit(nr,vaddr)	test_and_set_bit(nr,vaddr)
+
+
+static inline int bclr_reg_test_and_clear_bit(int nr, volatile unsigned long *vaddr)
+{
+        char *p = (char *)vaddr + (nr ^ 31) / 8;
+        char retval;
+
+        __asm__ __volatile__ ("bclr %2,(%1); sne %0"
+		: "=d" (retval)
+		: "a" (p), "di" (nr & 7)
+		: "memory");
+        return retval;
+}
+
+static inline int bclr_mem_test_and_clear_bit(int nr, volatile unsigned long *vaddr)
+{
+	char *p = (char *)vaddr + (nr ^ 31) / 8;
+	char retval;
+
+	__asm__ __volatile__ ("bclr %2,%1; sne %0"
+		: "=d" (retval), "+m" (*p)
+		: "di" (nr & 7));
+	return retval;
+}
+
+static inline int bfclr_mem_test_and_clear_bit(int nr, volatile unsigned long *vaddr)
+{
+	char retval;
+
+	__asm__ __volatile__ ("bfclr %2{%1:#1}; sne %0"
+		: "=d" (retval)
+		: "d" (nr ^ 31), "o" (*vaddr)
+		: "memory");
+	return retval;
+}
+
+#if defined(CONFIG_COLDFIRE)
+#define	test_and_clear_bit(nr,vaddr)	bclr_reg_test_and_clear_bit(nr,vaddr)
+#elif defined(CONFIG_M68000) || defined(CONFIG_MCPU32)
+#define	test_and_clear_bit(nr,vaddr)	bclr_mem_test_and_clear_bit(nr,vaddr)
+#else
+#define test_and_clear_bit(nr,vaddr)	(__builtin_constant_p(nr) ? \
+					bclr_mem_test_and_clear_bit(nr,vaddr) : \
+					bfclr_mem_test_and_clear_bit(nr,vaddr))
+#endif
+
+#define __test_and_clear_bit(nr,vaddr)	test_and_clear_bit(nr,vaddr)
+
+
+static inline int bchg_reg_test_and_change_bit(int nr, volatile unsigned long *vaddr)
+{
+        char *p = (char *)vaddr + (nr ^ 31) / 8;
+        char retval;
+
+        __asm__ __volatile__ ("bchg %2,(%1); sne %0"
+		: "=d" (retval)
+		: "a" (p), "di" (nr & 7)
+		: "memory");
+        return retval;
+}
+
+static inline int bchg_mem_test_and_change_bit(int nr, volatile unsigned long *vaddr)
+{
+	char *p = (char *)vaddr + (nr ^ 31) / 8;
+	char retval;
+
+	__asm__ __volatile__ ("bchg %2,%1; sne %0"
+		: "=d" (retval), "+m" (*p)
+		: "di" (nr & 7));
+	return retval;
+}
+
+static inline int bfchg_mem_test_and_change_bit(int nr, volatile unsigned long *vaddr)
+{
+	char retval;
+
+	__asm__ __volatile__ ("bfchg %2{%1:#1}; sne %0"
+		: "=d" (retval)
+		: "d" (nr ^ 31), "o" (*vaddr)
+		: "memory");
+	return retval;
+}
+
+#if defined(CONFIG_COLDFIRE)
+#define	test_and_change_bit(nr,vaddr)	bchg_reg_test_and_change_bit(nr,vaddr)
+#elif defined(CONFIG_M68000) || defined(CONFIG_MCPU32)
+#define	test_and_change_bit(nr,vaddr)	bchg_mem_test_and_change_bit(nr,vaddr)
+#else
+#define test_and_change_bit(nr,vaddr)	(__builtin_constant_p(nr) ? \
+					bchg_mem_test_and_change_bit(nr,vaddr) : \
+					bfchg_mem_test_and_change_bit(nr,vaddr))
+#endif
+
+#define __test_and_change_bit(nr,vaddr)	test_and_change_bit(nr,vaddr)
+
+
+/*
+ *	The true 68020 and more advanced processors support the "bfffo"
+ *	instruction for finding bits. ColdFire and simple 68000 parts
+ *	(including CPU32) do not support this. They simply use the generic
+ *	functions.
+ */
+#if defined(CONFIG_M68000) || defined(CONFIG_MCPU32) || defined(CONFIG_COLDFIRE)
+#include <asm-generic/bitops/find.h>
+#include <asm-generic/bitops/ffz.h>
+#else
+
+static inline int find_first_zero_bit(const unsigned long *vaddr,
+				      unsigned size)
+{
+	const unsigned long *p = vaddr;
+	int res = 32;
+	unsigned int words;
+	unsigned long num;
+
+	if (!size)
+		return 0;
+
+	words = (size + 31) >> 5;
+	while (!(num = ~*p++)) {
+		if (!--words)
+			goto out;
+	}
+
+	__asm__ __volatile__ ("bfffo %1{#0,#0},%0"
+			      : "=d" (res) : "d" (num & -num));
+	res ^= 31;
+out:
+	res += ((long)p - (long)vaddr - 4) * 8;
+	return res < size ? res : size;
+}
+#define find_first_zero_bit find_first_zero_bit
+
+static inline int find_next_zero_bit(const unsigned long *vaddr, int size,
+				     int offset)
+{
+	const unsigned long *p = vaddr + (offset >> 5);
+	int bit = offset & 31UL, res;
+
+	if (offset >= size)
+		return size;
+
+	if (bit) {
+		unsigned long num = ~*p++ & (~0UL << bit);
+		offset -= bit;
+
+		/* Look for zero in first longword */
+		__asm__ __volatile__ ("bfffo %1{#0,#0},%0"
+				      : "=d" (res) : "d" (num & -num));
+		if (res < 32) {
+			offset += res ^ 31;
+			return offset < size ? offset : size;
+		}
+		offset += 32;
+
+		if (offset >= size)
+			return size;
+	}
+	/* No zero yet, search remaining full bytes for a zero */
+	return offset + find_first_zero_bit(p, size - offset);
+}
+#define find_next_zero_bit find_next_zero_bit
+
+static inline int find_first_bit(const unsigned long *vaddr, unsigned size)
+{
+	const unsigned long *p = vaddr;
+	int res = 32;
+	unsigned int words;
+	unsigned long num;
+
+	if (!size)
+		return 0;
+
+	words = (size + 31) >> 5;
+	while (!(num = *p++)) {
+		if (!--words)
+			goto out;
+	}
+
+	__asm__ __volatile__ ("bfffo %1{#0,#0},%0"
+			      : "=d" (res) : "d" (num & -num));
+	res ^= 31;
+out:
+	res += ((long)p - (long)vaddr - 4) * 8;
+	return res < size ? res : size;
+}
+#define find_first_bit find_first_bit
+
+static inline int find_next_bit(const unsigned long *vaddr, int size,
+				int offset)
+{
+	const unsigned long *p = vaddr + (offset >> 5);
+	int bit = offset & 31UL, res;
+
+	if (offset >= size)
+		return size;
+
+	if (bit) {
+		unsigned long num = *p++ & (~0UL << bit);
+		offset -= bit;
+
+		/* Look for one in first longword */
+		__asm__ __volatile__ ("bfffo %1{#0,#0},%0"
+				      : "=d" (res) : "d" (num & -num));
+		if (res < 32) {
+			offset += res ^ 31;
+			return offset < size ? offset : size;
+		}
+		offset += 32;
+
+		if (offset >= size)
+			return size;
+	}
+	/* No one yet, search remaining full bytes for a one */
+	return offset + find_first_bit(p, size - offset);
+}
+#define find_next_bit find_next_bit
+
+/*
+ * ffz = Find First Zero in word. Undefined if no zero exists,
+ * so code should check against ~0UL first..
+ */
+static inline unsigned long ffz(unsigned long word)
+{
+	int res;
+
+	__asm__ __volatile__ ("bfffo %1{#0,#0},%0"
+			      : "=d" (res) : "d" (~word & -~word));
+	return res ^ 31;
+}
+
+#endif
+
+#ifdef __KERNEL__
+
+#if defined(CONFIG_M68000) || defined(CONFIG_MCPU32) || defined(CONFIG_COLDFIRE)
+
+/*
+ *	The newer ColdFire family members support a "bitrev" instruction
+ *	and we can use that to implement a fast ffs. Older Coldfire parts,
+ *	and normal 68000 parts don't have anything special, so we use the
+ *	generic functions for those.
+ */
+#if (defined(__mcfisaaplus__) || defined(__mcfisac__)) && \
+    !defined(CONFIG_M68000) && !defined(CONFIG_MCPU32)
+static inline int __ffs(int x)
+{
+        __asm__ __volatile__ ("bitrev %0; ff1 %0"
+		: "=d" (x)
+		: "0" (x));
+        return x;
+}
+
+static inline int ffs(int x)
+{
+        if (!x)
+                return 0;
+	return __ffs(x) + 1;
+}
+
+#else
+#include <asm-generic/bitops/ffs.h>
+#include <asm-generic/bitops/__ffs.h>
+#endif
+
+#include <asm-generic/bitops/fls.h>
+#include <asm-generic/bitops/__fls.h>
+
 #else
-#include "bitops_mm.h"
+
+/*
+ *	ffs: find first bit set. This is defined the same way as
+ *	the libc and compiler builtin ffs routines, therefore
+ *	differs in spirit from the above ffz (man ffs).
+ */
+static inline int ffs(int x)
+{
+	int cnt;
+
+	__asm__ ("bfffo %1{#0:#0},%0"
+		: "=d" (cnt)
+		: "dm" (x & -x));
+	return 32 - cnt;
+}
+#define __ffs(x) (ffs(x) - 1)
+
+/*
+ *	fls: find last bit set.
+ */
+static inline int fls(int x)
+{
+	int cnt;
+
+	__asm__ ("bfffo %1{#0,#0},%0"
+		: "=d" (cnt)
+		: "dm" (x));
+	return 32 - cnt;
+}
+
+static inline int __fls(int x)
+{
+	return fls(x) - 1;
+}
+
 #endif
+
+#include <asm-generic/bitops/ext2-atomic.h>
+#include <asm-generic/bitops/le.h>
+#include <asm-generic/bitops/fls64.h>
+#include <asm-generic/bitops/sched.h>
+#include <asm-generic/bitops/hweight.h>
+#include <asm-generic/bitops/lock.h>
+#endif /* __KERNEL__ */
+
+#endif /* _M68K_BITOPS_H */
diff --git a/arch/m68k/include/asm/bitops_mm.h b/arch/m68k/include/asm/bitops_mm.h
deleted file mode 100644
index 89cf5b8..0000000
--- a/arch/m68k/include/asm/bitops_mm.h
+++ /dev/null
@@ -1,501 +0,0 @@
-#ifndef _M68K_BITOPS_H
-#define _M68K_BITOPS_H
-/*
- * Copyright 1992, Linus Torvalds.
- *
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file COPYING in the main directory of this archive
- * for more details.
- */
-
-#ifndef _LINUX_BITOPS_H
-#error only <linux/bitops.h> can be included directly
-#endif
-
-#include <linux/compiler.h>
-
-/*
- * Require 68020 or better.
- *
- * They use the standard big-endian m680x0 bit ordering.
- */
-
-#define test_and_set_bit(nr,vaddr) \
-  (__builtin_constant_p(nr) ? \
-   __constant_test_and_set_bit(nr, vaddr) : \
-   __generic_test_and_set_bit(nr, vaddr))
-
-#define __test_and_set_bit(nr,vaddr) test_and_set_bit(nr,vaddr)
-
-static inline int __constant_test_and_set_bit(int nr, unsigned long *vaddr)
-{
-	char *p = (char *)vaddr + (nr ^ 31) / 8;
-	char retval;
-
-	__asm__ __volatile__ ("bset %2,%1; sne %0"
-			: "=d" (retval), "+m" (*p)
-			: "di" (nr & 7));
-
-	return retval;
-}
-
-static inline int __generic_test_and_set_bit(int nr, unsigned long *vaddr)
-{
-	char retval;
-
-	__asm__ __volatile__ ("bfset %2{%1:#1}; sne %0"
-			: "=d" (retval) : "d" (nr^31), "o" (*vaddr) : "memory");
-
-	return retval;
-}
-
-#define set_bit(nr,vaddr) \
-  (__builtin_constant_p(nr) ? \
-   __constant_set_bit(nr, vaddr) : \
-   __generic_set_bit(nr, vaddr))
-
-#define __set_bit(nr,vaddr) set_bit(nr,vaddr)
-
-static inline void __constant_set_bit(int nr, volatile unsigned long *vaddr)
-{
-	char *p = (char *)vaddr + (nr ^ 31) / 8;
-	__asm__ __volatile__ ("bset %1,%0"
-			: "+m" (*p) : "di" (nr & 7));
-}
-
-static inline void __generic_set_bit(int nr, volatile unsigned long *vaddr)
-{
-	__asm__ __volatile__ ("bfset %1{%0:#1}"
-			: : "d" (nr^31), "o" (*vaddr) : "memory");
-}
-
-#define test_and_clear_bit(nr,vaddr) \
-  (__builtin_constant_p(nr) ? \
-   __constant_test_and_clear_bit(nr, vaddr) : \
-   __generic_test_and_clear_bit(nr, vaddr))
-
-#define __test_and_clear_bit(nr,vaddr) test_and_clear_bit(nr,vaddr)
-
-static inline int __constant_test_and_clear_bit(int nr, unsigned long *vaddr)
-{
-	char *p = (char *)vaddr + (nr ^ 31) / 8;
-	char retval;
-
-	__asm__ __volatile__ ("bclr %2,%1; sne %0"
-			: "=d" (retval), "+m" (*p)
-			: "di" (nr & 7));
-
-	return retval;
-}
-
-static inline int __generic_test_and_clear_bit(int nr, unsigned long *vaddr)
-{
-	char retval;
-
-	__asm__ __volatile__ ("bfclr %2{%1:#1}; sne %0"
-			: "=d" (retval) : "d" (nr^31), "o" (*vaddr) : "memory");
-
-	return retval;
-}
-
-/*
- * clear_bit() doesn't provide any barrier for the compiler.
- */
-#define smp_mb__before_clear_bit()	barrier()
-#define smp_mb__after_clear_bit()	barrier()
-
-#define clear_bit(nr,vaddr) \
-  (__builtin_constant_p(nr) ? \
-   __constant_clear_bit(nr, vaddr) : \
-   __generic_clear_bit(nr, vaddr))
-#define __clear_bit(nr,vaddr) clear_bit(nr,vaddr)
-
-static inline void __constant_clear_bit(int nr, volatile unsigned long *vaddr)
-{
-	char *p = (char *)vaddr + (nr ^ 31) / 8;
-	__asm__ __volatile__ ("bclr %1,%0"
-			: "+m" (*p) : "di" (nr & 7));
-}
-
-static inline void __generic_clear_bit(int nr, volatile unsigned long *vaddr)
-{
-	__asm__ __volatile__ ("bfclr %1{%0:#1}"
-			: : "d" (nr^31), "o" (*vaddr) : "memory");
-}
-
-#define test_and_change_bit(nr,vaddr) \
-  (__builtin_constant_p(nr) ? \
-   __constant_test_and_change_bit(nr, vaddr) : \
-   __generic_test_and_change_bit(nr, vaddr))
-
-#define __test_and_change_bit(nr,vaddr) test_and_change_bit(nr,vaddr)
-#define __change_bit(nr,vaddr) change_bit(nr,vaddr)
-
-static inline int __constant_test_and_change_bit(int nr, unsigned long *vaddr)
-{
-	char *p = (char *)vaddr + (nr ^ 31) / 8;
-	char retval;
-
-	__asm__ __volatile__ ("bchg %2,%1; sne %0"
-			: "=d" (retval), "+m" (*p)
-			: "di" (nr & 7));
-
-	return retval;
-}
-
-static inline int __generic_test_and_change_bit(int nr, unsigned long *vaddr)
-{
-	char retval;
-
-	__asm__ __volatile__ ("bfchg %2{%1:#1}; sne %0"
-			: "=d" (retval) : "d" (nr^31), "o" (*vaddr) : "memory");
-
-	return retval;
-}
-
-#define change_bit(nr,vaddr) \
-  (__builtin_constant_p(nr) ? \
-   __constant_change_bit(nr, vaddr) : \
-   __generic_change_bit(nr, vaddr))
-
-static inline void __constant_change_bit(int nr, unsigned long *vaddr)
-{
-	char *p = (char *)vaddr + (nr ^ 31) / 8;
-	__asm__ __volatile__ ("bchg %1,%0"
-			: "+m" (*p) : "di" (nr & 7));
-}
-
-static inline void __generic_change_bit(int nr, unsigned long *vaddr)
-{
-	__asm__ __volatile__ ("bfchg %1{%0:#1}"
-			: : "d" (nr^31), "o" (*vaddr) : "memory");
-}
-
-static inline int test_bit(int nr, const unsigned long *vaddr)
-{
-	return (vaddr[nr >> 5] & (1UL << (nr & 31))) != 0;
-}
-
-static inline int find_first_zero_bit(const unsigned long *vaddr,
-				      unsigned size)
-{
-	const unsigned long *p = vaddr;
-	int res = 32;
-	unsigned int words;
-	unsigned long num;
-
-	if (!size)
-		return 0;
-
-	words = (size + 31) >> 5;
-	while (!(num = ~*p++)) {
-		if (!--words)
-			goto out;
-	}
-
-	__asm__ __volatile__ ("bfffo %1{#0,#0},%0"
-			      : "=d" (res) : "d" (num & -num));
-	res ^= 31;
-out:
-	res += ((long)p - (long)vaddr - 4) * 8;
-	return res < size ? res : size;
-}
-#define find_first_zero_bit find_first_zero_bit
-
-static inline int find_next_zero_bit(const unsigned long *vaddr, int size,
-				     int offset)
-{
-	const unsigned long *p = vaddr + (offset >> 5);
-	int bit = offset & 31UL, res;
-
-	if (offset >= size)
-		return size;
-
-	if (bit) {
-		unsigned long num = ~*p++ & (~0UL << bit);
-		offset -= bit;
-
-		/* Look for zero in first longword */
-		__asm__ __volatile__ ("bfffo %1{#0,#0},%0"
-				      : "=d" (res) : "d" (num & -num));
-		if (res < 32) {
-			offset += res ^ 31;
-			return offset < size ? offset : size;
-		}
-		offset += 32;
-
-		if (offset >= size)
-			return size;
-	}
-	/* No zero yet, search remaining full bytes for a zero */
-	return offset + find_first_zero_bit(p, size - offset);
-}
-#define find_next_zero_bit find_next_zero_bit
-
-static inline int find_first_bit(const unsigned long *vaddr, unsigned size)
-{
-	const unsigned long *p = vaddr;
-	int res = 32;
-	unsigned int words;
-	unsigned long num;
-
-	if (!size)
-		return 0;
-
-	words = (size + 31) >> 5;
-	while (!(num = *p++)) {
-		if (!--words)
-			goto out;
-	}
-
-	__asm__ __volatile__ ("bfffo %1{#0,#0},%0"
-			      : "=d" (res) : "d" (num & -num));
-	res ^= 31;
-out:
-	res += ((long)p - (long)vaddr - 4) * 8;
-	return res < size ? res : size;
-}
-#define find_first_bit find_first_bit
-
-static inline int find_next_bit(const unsigned long *vaddr, int size,
-				int offset)
-{
-	const unsigned long *p = vaddr + (offset >> 5);
-	int bit = offset & 31UL, res;
-
-	if (offset >= size)
-		return size;
-
-	if (bit) {
-		unsigned long num = *p++ & (~0UL << bit);
-		offset -= bit;
-
-		/* Look for one in first longword */
-		__asm__ __volatile__ ("bfffo %1{#0,#0},%0"
-				      : "=d" (res) : "d" (num & -num));
-		if (res < 32) {
-			offset += res ^ 31;
-			return offset < size ? offset : size;
-		}
-		offset += 32;
-
-		if (offset >= size)
-			return size;
-	}
-	/* No one yet, search remaining full bytes for a one */
-	return offset + find_first_bit(p, size - offset);
-}
-#define find_next_bit find_next_bit
-
-/*
- * ffz = Find First Zero in word. Undefined if no zero exists,
- * so code should check against ~0UL first..
- */
-static inline unsigned long ffz(unsigned long word)
-{
-	int res;
-
-	__asm__ __volatile__ ("bfffo %1{#0,#0},%0"
-			      : "=d" (res) : "d" (~word & -~word));
-	return res ^ 31;
-}
-
-#ifdef __KERNEL__
-
-/*
- * ffs: find first bit set. This is defined the same way as
- * the libc and compiler builtin ffs routines, therefore
- * differs in spirit from the above ffz (man ffs).
- */
-
-static inline int ffs(int x)
-{
-	int cnt;
-
-	asm ("bfffo %1{#0:#0},%0" : "=d" (cnt) : "dm" (x & -x));
-
-	return 32 - cnt;
-}
-#define __ffs(x) (ffs(x) - 1)
-
-/*
- * fls: find last bit set.
- */
-
-static inline int fls(int x)
-{
-	int cnt;
-
-	asm ("bfffo %1{#0,#0},%0" : "=d" (cnt) : "dm" (x));
-
-	return 32 - cnt;
-}
-
-static inline int __fls(int x)
-{
-	return fls(x) - 1;
-}
-
-#include <asm-generic/bitops/fls64.h>
-#include <asm-generic/bitops/sched.h>
-#include <asm-generic/bitops/hweight.h>
-#include <asm-generic/bitops/lock.h>
-
-/* Bitmap functions for the little endian bitmap. */
-
-static inline void __set_bit_le(int nr, void *addr)
-{
-	__set_bit(nr ^ 24, addr);
-}
-
-static inline void __clear_bit_le(int nr, void *addr)
-{
-	__clear_bit(nr ^ 24, addr);
-}
-
-static inline int __test_and_set_bit_le(int nr, void *addr)
-{
-	return __test_and_set_bit(nr ^ 24, addr);
-}
-
-static inline int test_and_set_bit_le(int nr, void *addr)
-{
-	return test_and_set_bit(nr ^ 24, addr);
-}
-
-static inline int __test_and_clear_bit_le(int nr, void *addr)
-{
-	return __test_and_clear_bit(nr ^ 24, addr);
-}
-
-static inline int test_and_clear_bit_le(int nr, void *addr)
-{
-	return test_and_clear_bit(nr ^ 24, addr);
-}
-
-static inline int test_bit_le(int nr, const void *vaddr)
-{
-	const unsigned char *p = vaddr;
-	return (p[nr >> 3] & (1U << (nr & 7))) != 0;
-}
-
-static inline int find_first_zero_bit_le(const void *vaddr, unsigned size)
-{
-	const unsigned long *p = vaddr, *addr = vaddr;
-	int res = 0;
-	unsigned int words;
-
-	if (!size)
-		return 0;
-
-	words = (size >> 5) + ((size & 31) > 0);
-	while (*p++ == ~0UL) {
-		if (--words == 0)
-			goto out;
-	}
-
-	--p;
-	for (res = 0; res < 32; res++)
-		if (!test_bit_le(res, p))
-			break;
-out:
-	res += (p - addr) * 32;
-	return res < size ? res : size;
-}
-#define find_first_zero_bit_le find_first_zero_bit_le
-
-static inline unsigned long find_next_zero_bit_le(const void *addr,
-		unsigned long size, unsigned long offset)
-{
-	const unsigned long *p = addr;
-	int bit = offset & 31UL, res;
-
-	if (offset >= size)
-		return size;
-
-	p += offset >> 5;
-
-	if (bit) {
-		offset -= bit;
-		/* Look for zero in first longword */
-		for (res = bit; res < 32; res++)
-			if (!test_bit_le(res, p)) {
-				offset += res;
-				return offset < size ? offset : size;
-			}
-		p++;
-		offset += 32;
-
-		if (offset >= size)
-			return size;
-	}
-	/* No zero yet, search remaining full bytes for a zero */
-	return offset + find_first_zero_bit_le(p, size - offset);
-}
-#define find_next_zero_bit_le find_next_zero_bit_le
-
-static inline int find_first_bit_le(const void *vaddr, unsigned size)
-{
-	const unsigned long *p = vaddr, *addr = vaddr;
-	int res = 0;
-	unsigned int words;
-
-	if (!size)
-		return 0;
-
-	words = (size >> 5) + ((size & 31) > 0);
-	while (*p++ == 0UL) {
-		if (--words == 0)
-			goto out;
-	}
-
-	--p;
-	for (res = 0; res < 32; res++)
-		if (test_bit_le(res, p))
-			break;
-out:
-	res += (p - addr) * 32;
-	return res < size ? res : size;
-}
-#define find_first_bit_le find_first_bit_le
-
-static inline unsigned long find_next_bit_le(const void *addr,
-		unsigned long size, unsigned long offset)
-{
-	const unsigned long *p = addr;
-	int bit = offset & 31UL, res;
-
-	if (offset >= size)
-		return size;
-
-	p += offset >> 5;
-
-	if (bit) {
-		offset -= bit;
-		/* Look for one in first longword */
-		for (res = bit; res < 32; res++)
-			if (test_bit_le(res, p)) {
-				offset += res;
-				return offset < size ? offset : size;
-			}
-		p++;
-		offset += 32;
-
-		if (offset >= size)
-			return size;
-	}
-	/* No set bit yet, search remaining full bytes for a set bit */
-	return offset + find_first_bit_le(p, size - offset);
-}
-#define find_next_bit_le find_next_bit_le
-
-/* Bitmap functions for the ext2 filesystem. */
-
-#define ext2_set_bit_atomic(lock, nr, addr)	\
-	test_and_set_bit_le(nr, addr)
-#define ext2_clear_bit_atomic(lock, nr, addr)	\
-	test_and_clear_bit_le(nr, addr)
-
-#endif /* __KERNEL__ */
-
-#endif /* _M68K_BITOPS_H */
diff --git a/arch/m68k/include/asm/bitops_no.h b/arch/m68k/include/asm/bitops_no.h
deleted file mode 100644
index 72e85ac..0000000
--- a/arch/m68k/include/asm/bitops_no.h
+++ /dev/null
@@ -1,333 +0,0 @@
-#ifndef _M68KNOMMU_BITOPS_H
-#define _M68KNOMMU_BITOPS_H
-
-/*
- * Copyright 1992, Linus Torvalds.
- */
-
-#include <linux/compiler.h>
-#include <asm/byteorder.h>	/* swab32 */
-
-#ifdef __KERNEL__
-
-#ifndef _LINUX_BITOPS_H
-#error only <linux/bitops.h> can be included directly
-#endif
-
-#if defined (__mcfisaaplus__) || defined (__mcfisac__)
-static inline int ffs(unsigned int val)
-{
-        if (!val)
-                return 0;
-
-        asm volatile(
-                        "bitrev %0\n\t"
-                        "ff1 %0\n\t"
-                        : "=d" (val)
-                        : "0" (val)
-		    );
-        val++;
-        return val;
-}
-
-static inline int __ffs(unsigned int val)
-{
-        asm volatile(
-                        "bitrev %0\n\t"
-                        "ff1 %0\n\t"
-                        : "=d" (val)
-                        : "0" (val)
-		    );
-        return val;
-}
-
-#else
-#include <asm-generic/bitops/ffs.h>
-#include <asm-generic/bitops/__ffs.h>
-#endif
-
-#include <asm-generic/bitops/sched.h>
-#include <asm-generic/bitops/ffz.h>
-
-static __inline__ void set_bit(int nr, volatile unsigned long * addr)
-{
-#ifdef CONFIG_COLDFIRE
-	__asm__ __volatile__ ("lea %0,%%a0; bset %1,(%%a0)"
-	     : "+m" (((volatile char *)addr)[(nr^31) >> 3])
-	     : "d" (nr)
-	     : "%a0", "cc");
-#else
-	__asm__ __volatile__ ("bset %1,%0"
-	     : "+m" (((volatile char *)addr)[(nr^31) >> 3])
-	     : "di" (nr)
-	     : "cc");
-#endif
-}
-
-#define __set_bit(nr, addr) set_bit(nr, addr)
-
-/*
- * clear_bit() doesn't provide any barrier for the compiler.
- */
-#define smp_mb__before_clear_bit()	barrier()
-#define smp_mb__after_clear_bit()	barrier()
-
-static __inline__ void clear_bit(int nr, volatile unsigned long * addr)
-{
-#ifdef CONFIG_COLDFIRE
-	__asm__ __volatile__ ("lea %0,%%a0; bclr %1,(%%a0)"
-	     : "+m" (((volatile char *)addr)[(nr^31) >> 3])
-	     : "d" (nr)
-	     : "%a0", "cc");
-#else
-	__asm__ __volatile__ ("bclr %1,%0"
-	     : "+m" (((volatile char *)addr)[(nr^31) >> 3])
-	     : "di" (nr)
-	     : "cc");
-#endif
-}
-
-#define __clear_bit(nr, addr) clear_bit(nr, addr)
-
-static __inline__ void change_bit(int nr, volatile unsigned long * addr)
-{
-#ifdef CONFIG_COLDFIRE
-	__asm__ __volatile__ ("lea %0,%%a0; bchg %1,(%%a0)"
-	     : "+m" (((volatile char *)addr)[(nr^31) >> 3])
-	     : "d" (nr)
-	     : "%a0", "cc");
-#else
-	__asm__ __volatile__ ("bchg %1,%0"
-	     : "+m" (((volatile char *)addr)[(nr^31) >> 3])
-	     : "di" (nr)
-	     : "cc");
-#endif
-}
-
-#define __change_bit(nr, addr) change_bit(nr, addr)
-
-static __inline__ int test_and_set_bit(int nr, volatile unsigned long * addr)
-{
-	char retval;
-
-#ifdef CONFIG_COLDFIRE
-	__asm__ __volatile__ ("lea %1,%%a0; bset %2,(%%a0); sne %0"
-	     : "=d" (retval), "+m" (((volatile char *)addr)[(nr^31) >> 3])
-	     : "d" (nr)
-	     : "%a0");
-#else
-	__asm__ __volatile__ ("bset %2,%1; sne %0"
-	     : "=d" (retval), "+m" (((volatile char *)addr)[(nr^31) >> 3])
-	     : "di" (nr)
-	     /* No clobber */);
-#endif
-
-	return retval;
-}
-
-#define __test_and_set_bit(nr, addr) test_and_set_bit(nr, addr)
-
-static __inline__ int test_and_clear_bit(int nr, volatile unsigned long * addr)
-{
-	char retval;
-
-#ifdef CONFIG_COLDFIRE
-	__asm__ __volatile__ ("lea %1,%%a0; bclr %2,(%%a0); sne %0"
-	     : "=d" (retval), "+m" (((volatile char *)addr)[(nr^31) >> 3])
-	     : "d" (nr)
-	     : "%a0");
-#else
-	__asm__ __volatile__ ("bclr %2,%1; sne %0"
-	     : "=d" (retval), "+m" (((volatile char *)addr)[(nr^31) >> 3])
-	     : "di" (nr)
-	     /* No clobber */);
-#endif
-
-	return retval;
-}
-
-#define __test_and_clear_bit(nr, addr) test_and_clear_bit(nr, addr)
-
-static __inline__ int test_and_change_bit(int nr, volatile unsigned long * addr)
-{
-	char retval;
-
-#ifdef CONFIG_COLDFIRE
-	__asm__ __volatile__ ("lea %1,%%a0\n\tbchg %2,(%%a0)\n\tsne %0"
-	     : "=d" (retval), "+m" (((volatile char *)addr)[(nr^31) >> 3])
-	     : "d" (nr)
-	     : "%a0");
-#else
-	__asm__ __volatile__ ("bchg %2,%1; sne %0"
-	     : "=d" (retval), "+m" (((volatile char *)addr)[(nr^31) >> 3])
-	     : "di" (nr)
-	     /* No clobber */);
-#endif
-
-	return retval;
-}
-
-#define __test_and_change_bit(nr, addr) test_and_change_bit(nr, addr)
-
-/*
- * This routine doesn't need to be atomic.
- */
-static __inline__ int __constant_test_bit(int nr, const volatile unsigned long * addr)
-{
-	return ((1UL << (nr & 31)) & (((const volatile unsigned int *) addr)[nr >> 5])) != 0;
-}
-
-static __inline__ int __test_bit(int nr, const volatile unsigned long * addr)
-{
-	int 	* a = (int *) addr;
-	int	mask;
-
-	a += nr >> 5;
-	mask = 1 << (nr & 0x1f);
-	return ((mask & *a) != 0);
-}
-
-#define test_bit(nr,addr) \
-(__builtin_constant_p(nr) ? \
- __constant_test_bit((nr),(addr)) : \
- __test_bit((nr),(addr)))
-
-#include <asm-generic/bitops/find.h>
-#include <asm-generic/bitops/hweight.h>
-#include <asm-generic/bitops/lock.h>
-
-#define BITOP_LE_SWIZZLE	((BITS_PER_LONG-1) & ~0x7)
-
-static inline void __set_bit_le(int nr, void *addr)
-{
-	__set_bit(nr ^ BITOP_LE_SWIZZLE, addr);
-}
-
-static inline void __clear_bit_le(int nr, void *addr)
-{
-	__clear_bit(nr ^ BITOP_LE_SWIZZLE, addr);
-}
-
-static inline int __test_and_set_bit_le(int nr, volatile void *addr)
-{
-	char retval;
-
-#ifdef CONFIG_COLDFIRE
-	__asm__ __volatile__ ("lea %1,%%a0; bset %2,(%%a0); sne %0"
-	     : "=d" (retval), "+m" (((volatile char *)addr)[nr >> 3])
-	     : "d" (nr)
-	     : "%a0");
-#else
-	__asm__ __volatile__ ("bset %2,%1; sne %0"
-	     : "=d" (retval), "+m" (((volatile char *)addr)[nr >> 3])
-	     : "di" (nr)
-	     /* No clobber */);
-#endif
-
-	return retval;
-}
-
-static inline int __test_and_clear_bit_le(int nr, volatile void *addr)
-{
-	char retval;
-
-#ifdef CONFIG_COLDFIRE
-	__asm__ __volatile__ ("lea %1,%%a0; bclr %2,(%%a0); sne %0"
-	     : "=d" (retval), "+m" (((volatile char *)addr)[nr >> 3])
-	     : "d" (nr)
-	     : "%a0");
-#else
-	__asm__ __volatile__ ("bclr %2,%1; sne %0"
-	     : "=d" (retval), "+m" (((volatile char *)addr)[nr >> 3])
-	     : "di" (nr)
-	     /* No clobber */);
-#endif
-
-	return retval;
-}
-
-#include <asm-generic/bitops/ext2-atomic.h>
-
-static inline int test_bit_le(int nr, const volatile void *addr)
-{
-	char retval;
-
-#ifdef CONFIG_COLDFIRE
-	__asm__ __volatile__ ("lea %1,%%a0; btst %2,(%%a0); sne %0"
-	     : "=d" (retval)
-	     : "m" (((const volatile char *)addr)[nr >> 3]), "d" (nr)
-	     : "%a0");
-#else
-	__asm__ __volatile__ ("btst %2,%1; sne %0"
-	     : "=d" (retval)
-	     : "m" (((const volatile char *)addr)[nr >> 3]), "di" (nr)
-	     /* No clobber */);
-#endif
-
-	return retval;
-}
-
-#define find_first_zero_bit_le(addr, size)	\
-	find_next_zero_bit_le((addr), (size), 0)
-
-static inline unsigned long find_next_zero_bit_le(void *addr, unsigned long size, unsigned long offset)
-{
-	unsigned long *p = ((unsigned long *) addr) + (offset >> 5);
-	unsigned long result = offset & ~31UL;
-	unsigned long tmp;
-
-	if (offset >= size)
-		return size;
-	size -= result;
-	offset &= 31UL;
-	if(offset) {
-		/* We hold the little endian value in tmp, but then the
-		 * shift is illegal. So we could keep a big endian value
-		 * in tmp, like this:
-		 *
-		 * tmp = __swab32(*(p++));
-		 * tmp |= ~0UL >> (32-offset);
-		 *
-		 * but this would decrease performance, so we change the
-		 * shift:
-		 */
-		tmp = *(p++);
-		tmp |= __swab32(~0UL >> (32-offset));
-		if(size < 32)
-			goto found_first;
-		if(~tmp)
-			goto found_middle;
-		size -= 32;
-		result += 32;
-	}
-	while(size & ~31UL) {
-		if(~(tmp = *(p++)))
-			goto found_middle;
-		result += 32;
-		size -= 32;
-	}
-	if(!size)
-		return result;
-	tmp = *p;
-
-found_first:
-	/* tmp is little endian, so we would have to swab the shift,
-	 * see above. But then we have to swab tmp below for ffz, so
-	 * we might as well do this here.
-	 */
-	return result + ffz(__swab32(tmp) | (~0UL << size));
-found_middle:
-	return result + ffz(__swab32(tmp));
-}
-#define find_next_zero_bit_le find_next_zero_bit_le
-
-extern unsigned long find_next_bit_le(const void *addr,
-		unsigned long size, unsigned long offset);
-
-#endif /* __KERNEL__ */
-
-#include <asm-generic/bitops/fls.h>
-#include <asm-generic/bitops/__fls.h>
-#include <asm-generic/bitops/fls64.h>
-
-#endif /* _M68KNOMMU_BITOPS_H */
-- 
1.7.0.4
