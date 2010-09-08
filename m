From: Greg Ungerer <gerg@snapgear.com>
Subject: [PATCH v2] m68k/m68knommu: merge MMU and non-MMU atomic.h
Date: Wed, 8 Sep 2010 10:31:11 +1000
Message-ID: <201009080031.o880VBpV031375@goober.internal.moreton.com.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:33372 "HELO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1753690Ab0IHAgD (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 7 Sep 2010 20:36:03 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: gerg@uclinux.org

>From 31b4a9fff37587b571f24b005cee47e3ac8485ac Mon Sep 17 00:00:00 2001
From: Greg Ungerer <gerg@uclinux.org>
Date: Mon, 6 Sep 2010 12:49:41 +1000
Subject: [PATCH 6/8] m68k/m68knommu: merge MMU and non-MMU atomic.h

The only difference between the MMU and non-MMU versions of atomic.h
is some extra support needed by ColdFire family processors. So merge
this into the MMU version of atomic.h.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/{atomic_mm.h => atomic.h} |   17 ++-
 arch/m68k/include/asm/atomic_no.h               |  155 -----------------------
 2 files changed, 14 insertions(+), 158 deletions(-)
 rename arch/m68k/include/asm/{atomic_mm.h => atomic.h} (91%)
 delete mode 100644 arch/m68k/include/asm/atomic_no.h

diff --git a/arch/m68k/include/asm/atomic_mm.h b/arch/m68k/include/asm/atomic.h
similarity index 91%
rename from arch/m68k/include/asm/atomic_mm.h
rename to arch/m68k/include/asm/atomic.h
index 6a223b3..03ae3d1 100644
--- a/arch/m68k/include/asm/atomic_mm.h
+++ b/arch/m68k/include/asm/atomic.h
@@ -18,14 +18,24 @@
 #define atomic_read(v)		(*(volatile int *)&(v)->counter)
 #define atomic_set(v, i)	(((v)->counter) = i)
 
+/*
+ * The ColdFire parts cannot do some immediate to memory operations,
+ * so for them we do not specify the "i" asm constraint.
+ */
+#ifdef CONFIG_COLDFIRE
+#define	ASM_DI	"d"
+#else
+#define	ASM_DI	"di"
+#endif
+
 static inline void atomic_add(int i, atomic_t *v)
 {
-	__asm__ __volatile__("addl %1,%0" : "+m" (*v) : "id" (i));
+	__asm__ __volatile__("addl %1,%0" : "+m" (*v) : ASM_DI (i));
 }
 
 static inline void atomic_sub(int i, atomic_t *v)
 {
-	__asm__ __volatile__("subl %1,%0" : "+m" (*v) : "id" (i));
+	__asm__ __volatile__("subl %1,%0" : "+m" (*v) : ASM_DI (i));
 }
 
 static inline void atomic_inc(atomic_t *v)
@@ -150,7 +160,7 @@ static inline int atomic_sub_and_test(int i, atomic_t *v)
 	char c;
 	__asm__ __volatile__("subl %2,%1; seq %0"
 			     : "=d" (c), "+m" (*v)
-			     : "id" (i));
+			     : ASM_DI (i));
 	return c != 0;
 }
 
@@ -197,4 +207,5 @@ static __inline__ int atomic_add_unless(atomic_t *v, int a, int u)
 #define smp_mb__after_atomic_inc()	barrier()
 
 #include <asm-generic/atomic-long.h>
+#include <asm-generic/atomic64.h>
 #endif /* __ARCH_M68K_ATOMIC __ */
diff --git a/arch/m68k/include/asm/atomic_no.h b/arch/m68k/include/asm/atomic_no.h
deleted file mode 100644
index 289310c..0000000
--- a/arch/m68k/include/asm/atomic_no.h
+++ /dev/null
@@ -1,155 +0,0 @@
-#ifndef __ARCH_M68KNOMMU_ATOMIC__
-#define __ARCH_M68KNOMMU_ATOMIC__
-
-#include <linux/types.h>
-#include <asm/system.h>
-
-/*
- * Atomic operations that C can't guarantee us.  Useful for
- * resource counting etc..
- */
-
-/*
- * We do not have SMP m68k systems, so we don't have to deal with that.
- */
-
-#define ATOMIC_INIT(i)	{ (i) }
-
-#define atomic_read(v)		(*(volatile int *)&(v)->counter)
-#define atomic_set(v, i)	(((v)->counter) = i)
-
-static __inline__ void atomic_add(int i, atomic_t *v)
-{
-#ifdef CONFIG_COLDFIRE
-	__asm__ __volatile__("addl %1,%0" : "+m" (*v) : "d" (i));
-#else
-	__asm__ __volatile__("addl %1,%0" : "+m" (*v) : "di" (i));
-#endif
-}
-
-static __inline__ void atomic_sub(int i, atomic_t *v)
-{
-#ifdef CONFIG_COLDFIRE
-	__asm__ __volatile__("subl %1,%0" : "+m" (*v) : "d" (i));
-#else
-	__asm__ __volatile__("subl %1,%0" : "+m" (*v) : "di" (i));
-#endif
-}
-
-static __inline__ int atomic_sub_and_test(int i, atomic_t * v)
-{
-	char c;
-#ifdef CONFIG_COLDFIRE
-	__asm__ __volatile__("subl %2,%1; seq %0"
-			     : "=d" (c), "+m" (*v)
-			     : "d" (i));
-#else
-	__asm__ __volatile__("subl %2,%1; seq %0"
-			     : "=d" (c), "+m" (*v)
-			     : "di" (i));
-#endif
-	return c != 0;
-}
-
-static __inline__ void atomic_inc(volatile atomic_t *v)
-{
-	__asm__ __volatile__("addql #1,%0" : "+m" (*v));
-}
-
-/*
- * atomic_inc_and_test - increment and test
- * @v: pointer of type atomic_t
- *
- * Atomically increments @v by 1
- * and returns true if the result is zero, or false for all
- * other cases.
- */
-
-static __inline__ int atomic_inc_and_test(volatile atomic_t *v)
-{
-	char c;
-	__asm__ __volatile__("addql #1,%1; seq %0" : "=d" (c), "+m" (*v));
-	return c != 0;
-}
-
-static __inline__ void atomic_dec(volatile atomic_t *v)
-{
-	__asm__ __volatile__("subql #1,%0" : "+m" (*v));
-}
-
-static __inline__ int atomic_dec_and_test(volatile atomic_t *v)
-{
-	char c;
-	__asm__ __volatile__("subql #1,%1; seq %0" : "=d" (c), "+m" (*v));
-	return c != 0;
-}
-
-static __inline__ void atomic_clear_mask(unsigned long mask, unsigned long *v)
-{
-	__asm__ __volatile__("andl %1,%0" : "+m" (*v) : "id" (~(mask)));
-}
-
-static __inline__ void atomic_set_mask(unsigned long mask, unsigned long *v)
-{
-	__asm__ __volatile__("orl %1,%0" : "+m" (*v) : "id" (mask));
-}
-
-/* Atomic operations are already serializing */
-#define smp_mb__before_atomic_dec()    barrier()
-#define smp_mb__after_atomic_dec() barrier()
-#define smp_mb__before_atomic_inc()    barrier()
-#define smp_mb__after_atomic_inc() barrier()
-
-static inline int atomic_add_return(int i, atomic_t * v)
-{
-	unsigned long temp, flags;
-
-	local_irq_save(flags);
-	temp = *(long *)v;
-	temp += i;
-	*(long *)v = temp;
-	local_irq_restore(flags);
-
-	return temp;
-}
-
-#define atomic_add_negative(a, v)	(atomic_add_return((a), (v)) < 0)
-
-static inline int atomic_sub_return(int i, atomic_t * v)
-{
-	unsigned long temp, flags;
-
-	local_irq_save(flags);
-	temp = *(long *)v;
-	temp -= i;
-	*(long *)v = temp;
-	local_irq_restore(flags);
-
-	return temp;
-}
-
-#define atomic_cmpxchg(v, o, n) ((int)cmpxchg(&((v)->counter), (o), (n)))
-#define atomic_xchg(v, new) (xchg(&((v)->counter), new))
-
-static __inline__ int atomic_add_unless(atomic_t *v, int a, int u)
-{
-	int c, old;
-	c = atomic_read(v);
-	for (;;) {
-		if (unlikely(c == (u)))
-			break;
-		old = atomic_cmpxchg((v), c, c + (a));
-		if (likely(old == c))
-			break;
-		c = old;
-	}
-	return c != (u);
-}
-
-#define atomic_inc_not_zero(v) atomic_add_unless((v), 1, 0)
-
-#define atomic_dec_return(v) atomic_sub_return(1,(v))
-#define atomic_inc_return(v) atomic_add_return(1,(v))
-
-#include <asm-generic/atomic-long.h>
-#endif /* __ARCH_M68KNOMMU_ATOMIC __ */
-- 
1.6.3.3
