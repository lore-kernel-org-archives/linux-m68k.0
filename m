From: <gerg@snapgear.com>
Subject: [PATCH] m68k: merge MMU and non MMU versions of system.h
Date: Fri, 6 May 2011 10:18:15 +1000
Message-ID: <1304641095-27872-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:54631 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753097Ab1EFASX (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 5 May 2011 20:18:23 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The non-MMU m68k targets can use the same asm/system.h as the MMU
targets. So switch the current system_mm.h to be system.h and remove
system_no.h.

The assembly support code for the non-MMU resume functions needs to
be modified to match the now common switch_to() macro. Specifically
this means correctly saving and restoring the status flags in the case
of the ColdFire resume, and some reordering of the code to not use
registers before they are saved or after they are restored.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/entry_no.h    |   12 +-
 arch/m68k/include/asm/system.h      |  194 ++++++++++++++++++++++++++++++++++-
 arch/m68k/include/asm/system_mm.h   |  193 ----------------------------------
 arch/m68k/include/asm/system_no.h   |  153 ---------------------------
 arch/m68k/platform/68328/entry.S    |   13 +--
 arch/m68k/platform/68360/entry.S    |   13 +--
 arch/m68k/platform/coldfire/entry.S |   24 +++--
 7 files changed, 222 insertions(+), 380 deletions(-)
 delete mode 100644 arch/m68k/include/asm/system_mm.h
 delete mode 100644 arch/m68k/include/asm/system_no.h

diff --git a/arch/m68k/include/asm/entry_no.h b/arch/m68k/include/asm/entry_no.h
index 627d69b..68611e3 100644
--- a/arch/m68k/include/asm/entry_no.h
+++ b/arch/m68k/include/asm/entry_no.h
@@ -96,11 +96,11 @@
 .endm
 
 .macro RDUSP
-	movel	sw_usp,%a2
+	movel	sw_usp,%a3
 .endm
 
 .macro WRUSP
-	movel	%a0,sw_usp
+	movel	%a3,sw_usp
 .endm
 
 #else /* !CONFIG_COLDFIRE_SW_A7 */
@@ -127,13 +127,13 @@
 .endm
 
 .macro RDUSP
-	/*move	%usp,%a2*/
-	.word	0x4e6a
+	/*move	%usp,%a3*/
+	.word	0x4e6b
 .endm
 
 .macro WRUSP
-	/*move	%a0,%usp*/
-	.word	0x4e60
+	/*move	%a3,%usp*/
+	.word	0x4e63
 .endm
 
 #endif /* !CONFIG_COLDFIRE_SW_A7 */
diff --git a/arch/m68k/include/asm/system.h b/arch/m68k/include/asm/system.h
index ccea925..47b01f4 100644
--- a/arch/m68k/include/asm/system.h
+++ b/arch/m68k/include/asm/system.h
@@ -1,5 +1,193 @@
-#ifdef __uClinux__
-#include "system_no.h"
+#ifndef _M68K_SYSTEM_H
+#define _M68K_SYSTEM_H
+
+#include <linux/linkage.h>
+#include <linux/kernel.h>
+#include <linux/irqflags.h>
+#include <asm/segment.h>
+#include <asm/entry.h>
+
+#ifdef __KERNEL__
+
+/*
+ * switch_to(n) should switch tasks to task ptr, first checking that
+ * ptr isn't the current task, in which case it does nothing.  This
+ * also clears the TS-flag if the task we switched to has used the
+ * math co-processor latest.
+ */
+/*
+ * switch_to() saves the extra registers, that are not saved
+ * automatically by SAVE_SWITCH_STACK in resume(), ie. d0-d5 and
+ * a0-a1. Some of these are used by schedule() and its predecessors
+ * and so we might get see unexpected behaviors when a task returns
+ * with unexpected register values.
+ *
+ * syscall stores these registers itself and none of them are used
+ * by syscall after the function in the syscall has been called.
+ *
+ * Beware that resume now expects *next to be in d1 and the offset of
+ * tss to be in a1. This saves a few instructions as we no longer have
+ * to push them onto the stack and read them back right after.
+ *
+ * 02/17/96 - Jes Sorensen (jds@kom.auc.dk)
+ *
+ * Changed 96/09/19 by Andreas Schwab
+ * pass prev in a0, next in a1
+ */
+asmlinkage void resume(void);
+#define switch_to(prev,next,last) do { \
+  register void *_prev __asm__ ("a0") = (prev); \
+  register void *_next __asm__ ("a1") = (next); \
+  register void *_last __asm__ ("d1"); \
+  __asm__ __volatile__("jbsr resume" \
+		       : "=a" (_prev), "=a" (_next), "=d" (_last) \
+		       : "0" (_prev), "1" (_next) \
+		       : "d0", "d2", "d3", "d4", "d5"); \
+  (last) = _last; \
+} while (0)
+
+
+/*
+ * Force strict CPU ordering.
+ * Not really required on m68k...
+ */
+#define nop()		do { asm volatile ("nop"); barrier(); } while (0)
+#define mb()		barrier()
+#define rmb()		barrier()
+#define wmb()		barrier()
+#define read_barrier_depends()	((void)0)
+#define set_mb(var, value)	({ (var) = (value); wmb(); })
+
+#define smp_mb()	barrier()
+#define smp_rmb()	barrier()
+#define smp_wmb()	barrier()
+#define smp_read_barrier_depends()	((void)0)
+
+#define xchg(ptr,x) ((__typeof__(*(ptr)))__xchg((unsigned long)(x),(ptr),sizeof(*(ptr))))
+
+struct __xchg_dummy { unsigned long a[100]; };
+#define __xg(x) ((volatile struct __xchg_dummy *)(x))
+
+#ifndef CONFIG_RMW_INSNS
+static inline unsigned long __xchg(unsigned long x, volatile void * ptr, int size)
+{
+	unsigned long flags, tmp;
+
+	local_irq_save(flags);
+
+	switch (size) {
+	case 1:
+		tmp = *(u8 *)ptr;
+		*(u8 *)ptr = x;
+		x = tmp;
+		break;
+	case 2:
+		tmp = *(u16 *)ptr;
+		*(u16 *)ptr = x;
+		x = tmp;
+		break;
+	case 4:
+		tmp = *(u32 *)ptr;
+		*(u32 *)ptr = x;
+		x = tmp;
+		break;
+	default:
+		BUG();
+	}
+
+	local_irq_restore(flags);
+	return x;
+}
 #else
-#include "system_mm.h"
+static inline unsigned long __xchg(unsigned long x, volatile void * ptr, int size)
+{
+	switch (size) {
+	    case 1:
+		__asm__ __volatile__
+			("moveb %2,%0\n\t"
+			 "1:\n\t"
+			 "casb %0,%1,%2\n\t"
+			 "jne 1b"
+			 : "=&d" (x) : "d" (x), "m" (*__xg(ptr)) : "memory");
+		break;
+	    case 2:
+		__asm__ __volatile__
+			("movew %2,%0\n\t"
+			 "1:\n\t"
+			 "casw %0,%1,%2\n\t"
+			 "jne 1b"
+			 : "=&d" (x) : "d" (x), "m" (*__xg(ptr)) : "memory");
+		break;
+	    case 4:
+		__asm__ __volatile__
+			("movel %2,%0\n\t"
+			 "1:\n\t"
+			 "casl %0,%1,%2\n\t"
+			 "jne 1b"
+			 : "=&d" (x) : "d" (x), "m" (*__xg(ptr)) : "memory");
+		break;
+	}
+	return x;
+}
 #endif
+
+#include <asm-generic/cmpxchg-local.h>
+
+#define cmpxchg64_local(ptr, o, n) __cmpxchg64_local_generic((ptr), (o), (n))
+
+/*
+ * Atomic compare and exchange.  Compare OLD with MEM, if identical,
+ * store NEW in MEM.  Return the initial value in MEM.  Success is
+ * indicated by comparing RETURN with OLD.
+ */
+#ifdef CONFIG_RMW_INSNS
+#define __HAVE_ARCH_CMPXCHG	1
+
+static inline unsigned long __cmpxchg(volatile void *p, unsigned long old,
+				      unsigned long new, int size)
+{
+	switch (size) {
+	case 1:
+		__asm__ __volatile__ ("casb %0,%2,%1"
+				      : "=d" (old), "=m" (*(char *)p)
+				      : "d" (new), "0" (old), "m" (*(char *)p));
+		break;
+	case 2:
+		__asm__ __volatile__ ("casw %0,%2,%1"
+				      : "=d" (old), "=m" (*(short *)p)
+				      : "d" (new), "0" (old), "m" (*(short *)p));
+		break;
+	case 4:
+		__asm__ __volatile__ ("casl %0,%2,%1"
+				      : "=d" (old), "=m" (*(int *)p)
+				      : "d" (new), "0" (old), "m" (*(int *)p));
+		break;
+	}
+	return old;
+}
+
+#define cmpxchg(ptr, o, n)						    \
+	((__typeof__(*(ptr)))__cmpxchg((ptr), (unsigned long)(o),	    \
+			(unsigned long)(n), sizeof(*(ptr))))
+#define cmpxchg_local(ptr, o, n)					    \
+	((__typeof__(*(ptr)))__cmpxchg((ptr), (unsigned long)(o),	    \
+			(unsigned long)(n), sizeof(*(ptr))))
+#else
+
+/*
+ * cmpxchg_local and cmpxchg64_local are atomic wrt current CPU. Always make
+ * them available.
+ */
+#define cmpxchg_local(ptr, o, n)				  	       \
+	((__typeof__(*(ptr)))__cmpxchg_local_generic((ptr), (unsigned long)(o),\
+			(unsigned long)(n), sizeof(*(ptr))))
+
+#include <asm-generic/cmpxchg.h>
+
+#endif
+
+#define arch_align_stack(x) (x)
+
+#endif /* __KERNEL__ */
+
+#endif /* _M68K_SYSTEM_H */
diff --git a/arch/m68k/include/asm/system_mm.h b/arch/m68k/include/asm/system_mm.h
deleted file mode 100644
index 47b01f4..0000000
--- a/arch/m68k/include/asm/system_mm.h
+++ /dev/null
@@ -1,193 +0,0 @@
-#ifndef _M68K_SYSTEM_H
-#define _M68K_SYSTEM_H
-
-#include <linux/linkage.h>
-#include <linux/kernel.h>
-#include <linux/irqflags.h>
-#include <asm/segment.h>
-#include <asm/entry.h>
-
-#ifdef __KERNEL__
-
-/*
- * switch_to(n) should switch tasks to task ptr, first checking that
- * ptr isn't the current task, in which case it does nothing.  This
- * also clears the TS-flag if the task we switched to has used the
- * math co-processor latest.
- */
-/*
- * switch_to() saves the extra registers, that are not saved
- * automatically by SAVE_SWITCH_STACK in resume(), ie. d0-d5 and
- * a0-a1. Some of these are used by schedule() and its predecessors
- * and so we might get see unexpected behaviors when a task returns
- * with unexpected register values.
- *
- * syscall stores these registers itself and none of them are used
- * by syscall after the function in the syscall has been called.
- *
- * Beware that resume now expects *next to be in d1 and the offset of
- * tss to be in a1. This saves a few instructions as we no longer have
- * to push them onto the stack and read them back right after.
- *
- * 02/17/96 - Jes Sorensen (jds@kom.auc.dk)
- *
- * Changed 96/09/19 by Andreas Schwab
- * pass prev in a0, next in a1
- */
-asmlinkage void resume(void);
-#define switch_to(prev,next,last) do { \
-  register void *_prev __asm__ ("a0") = (prev); \
-  register void *_next __asm__ ("a1") = (next); \
-  register void *_last __asm__ ("d1"); \
-  __asm__ __volatile__("jbsr resume" \
-		       : "=a" (_prev), "=a" (_next), "=d" (_last) \
-		       : "0" (_prev), "1" (_next) \
-		       : "d0", "d2", "d3", "d4", "d5"); \
-  (last) = _last; \
-} while (0)
-
-
-/*
- * Force strict CPU ordering.
- * Not really required on m68k...
- */
-#define nop()		do { asm volatile ("nop"); barrier(); } while (0)
-#define mb()		barrier()
-#define rmb()		barrier()
-#define wmb()		barrier()
-#define read_barrier_depends()	((void)0)
-#define set_mb(var, value)	({ (var) = (value); wmb(); })
-
-#define smp_mb()	barrier()
-#define smp_rmb()	barrier()
-#define smp_wmb()	barrier()
-#define smp_read_barrier_depends()	((void)0)
-
-#define xchg(ptr,x) ((__typeof__(*(ptr)))__xchg((unsigned long)(x),(ptr),sizeof(*(ptr))))
-
-struct __xchg_dummy { unsigned long a[100]; };
-#define __xg(x) ((volatile struct __xchg_dummy *)(x))
-
-#ifndef CONFIG_RMW_INSNS
-static inline unsigned long __xchg(unsigned long x, volatile void * ptr, int size)
-{
-	unsigned long flags, tmp;
-
-	local_irq_save(flags);
-
-	switch (size) {
-	case 1:
-		tmp = *(u8 *)ptr;
-		*(u8 *)ptr = x;
-		x = tmp;
-		break;
-	case 2:
-		tmp = *(u16 *)ptr;
-		*(u16 *)ptr = x;
-		x = tmp;
-		break;
-	case 4:
-		tmp = *(u32 *)ptr;
-		*(u32 *)ptr = x;
-		x = tmp;
-		break;
-	default:
-		BUG();
-	}
-
-	local_irq_restore(flags);
-	return x;
-}
-#else
-static inline unsigned long __xchg(unsigned long x, volatile void * ptr, int size)
-{
-	switch (size) {
-	    case 1:
-		__asm__ __volatile__
-			("moveb %2,%0\n\t"
-			 "1:\n\t"
-			 "casb %0,%1,%2\n\t"
-			 "jne 1b"
-			 : "=&d" (x) : "d" (x), "m" (*__xg(ptr)) : "memory");
-		break;
-	    case 2:
-		__asm__ __volatile__
-			("movew %2,%0\n\t"
-			 "1:\n\t"
-			 "casw %0,%1,%2\n\t"
-			 "jne 1b"
-			 : "=&d" (x) : "d" (x), "m" (*__xg(ptr)) : "memory");
-		break;
-	    case 4:
-		__asm__ __volatile__
-			("movel %2,%0\n\t"
-			 "1:\n\t"
-			 "casl %0,%1,%2\n\t"
-			 "jne 1b"
-			 : "=&d" (x) : "d" (x), "m" (*__xg(ptr)) : "memory");
-		break;
-	}
-	return x;
-}
-#endif
-
-#include <asm-generic/cmpxchg-local.h>
-
-#define cmpxchg64_local(ptr, o, n) __cmpxchg64_local_generic((ptr), (o), (n))
-
-/*
- * Atomic compare and exchange.  Compare OLD with MEM, if identical,
- * store NEW in MEM.  Return the initial value in MEM.  Success is
- * indicated by comparing RETURN with OLD.
- */
-#ifdef CONFIG_RMW_INSNS
-#define __HAVE_ARCH_CMPXCHG	1
-
-static inline unsigned long __cmpxchg(volatile void *p, unsigned long old,
-				      unsigned long new, int size)
-{
-	switch (size) {
-	case 1:
-		__asm__ __volatile__ ("casb %0,%2,%1"
-				      : "=d" (old), "=m" (*(char *)p)
-				      : "d" (new), "0" (old), "m" (*(char *)p));
-		break;
-	case 2:
-		__asm__ __volatile__ ("casw %0,%2,%1"
-				      : "=d" (old), "=m" (*(short *)p)
-				      : "d" (new), "0" (old), "m" (*(short *)p));
-		break;
-	case 4:
-		__asm__ __volatile__ ("casl %0,%2,%1"
-				      : "=d" (old), "=m" (*(int *)p)
-				      : "d" (new), "0" (old), "m" (*(int *)p));
-		break;
-	}
-	return old;
-}
-
-#define cmpxchg(ptr, o, n)						    \
-	((__typeof__(*(ptr)))__cmpxchg((ptr), (unsigned long)(o),	    \
-			(unsigned long)(n), sizeof(*(ptr))))
-#define cmpxchg_local(ptr, o, n)					    \
-	((__typeof__(*(ptr)))__cmpxchg((ptr), (unsigned long)(o),	    \
-			(unsigned long)(n), sizeof(*(ptr))))
-#else
-
-/*
- * cmpxchg_local and cmpxchg64_local are atomic wrt current CPU. Always make
- * them available.
- */
-#define cmpxchg_local(ptr, o, n)				  	       \
-	((__typeof__(*(ptr)))__cmpxchg_local_generic((ptr), (unsigned long)(o),\
-			(unsigned long)(n), sizeof(*(ptr))))
-
-#include <asm-generic/cmpxchg.h>
-
-#endif
-
-#define arch_align_stack(x) (x)
-
-#endif /* __KERNEL__ */
-
-#endif /* _M68K_SYSTEM_H */
diff --git a/arch/m68k/include/asm/system_no.h b/arch/m68k/include/asm/system_no.h
deleted file mode 100644
index 6fe9f93..0000000
--- a/arch/m68k/include/asm/system_no.h
+++ /dev/null
@@ -1,153 +0,0 @@
-#ifndef _M68KNOMMU_SYSTEM_H
-#define _M68KNOMMU_SYSTEM_H
-
-#include <linux/linkage.h>
-#include <linux/irqflags.h>
-#include <asm/segment.h>
-#include <asm/entry.h>
-
-/*
- * switch_to(n) should switch tasks to task ptr, first checking that
- * ptr isn't the current task, in which case it does nothing.  This
- * also clears the TS-flag if the task we switched to has used the
- * math co-processor latest.
- */
-/*
- * switch_to() saves the extra registers, that are not saved
- * automatically by SAVE_SWITCH_STACK in resume(), ie. d0-d5 and
- * a0-a1. Some of these are used by schedule() and its predecessors
- * and so we might get see unexpected behaviors when a task returns
- * with unexpected register values.
- *
- * syscall stores these registers itself and none of them are used
- * by syscall after the function in the syscall has been called.
- *
- * Beware that resume now expects *next to be in d1 and the offset of
- * tss to be in a1. This saves a few instructions as we no longer have
- * to push them onto the stack and read them back right after.
- *
- * 02/17/96 - Jes Sorensen (jds@kom.auc.dk)
- *
- * Changed 96/09/19 by Andreas Schwab
- * pass prev in a0, next in a1, offset of tss in d1, and whether
- * the mm structures are shared in d2 (to avoid atc flushing).
- */
-asmlinkage void resume(void);
-#define switch_to(prev,next,last)				\
-{								\
-  void *_last;							\
-  __asm__ __volatile__(						\
-  	"movel	%1, %%a0\n\t"					\
-	"movel	%2, %%a1\n\t"					\
-	"jbsr resume\n\t"					\
-	"movel	%%d1, %0\n\t"					\
-       : "=d" (_last)						\
-       : "d" (prev), "d" (next)					\
-       : "cc", "d0", "d1", "d2", "d3", "d4", "d5", "a0", "a1");	\
-  (last) = _last;						\
-}
-
-#define iret() __asm__ __volatile__ ("rte": : :"memory", "sp", "cc")
-
-/*
- * Force strict CPU ordering.
- * Not really required on m68k...
- */
-#define nop()  asm volatile ("nop"::)
-#define mb()   asm volatile (""   : : :"memory")
-#define rmb()  asm volatile (""   : : :"memory")
-#define wmb()  asm volatile (""   : : :"memory")
-#define set_mb(var, value)	({ (var) = (value); wmb(); })
-
-#define smp_mb()	barrier()
-#define smp_rmb()	barrier()
-#define smp_wmb()	barrier()
-#define smp_read_barrier_depends()	do { } while(0)
-
-#define read_barrier_depends()  ((void)0)
-
-#define xchg(ptr,x) ((__typeof__(*(ptr)))__xchg((unsigned long)(x),(ptr),sizeof(*(ptr))))
-
-struct __xchg_dummy { unsigned long a[100]; };
-#define __xg(x) ((volatile struct __xchg_dummy *)(x))
-
-#ifndef CONFIG_RMW_INSNS
-static inline unsigned long __xchg(unsigned long x, volatile void * ptr, int size)
-{
-  unsigned long tmp, flags;
-
-  local_irq_save(flags);
-
-  switch (size) {
-  case 1:
-    __asm__ __volatile__
-    ("moveb %2,%0\n\t"
-     "moveb %1,%2"
-    : "=&d" (tmp) : "d" (x), "m" (*__xg(ptr)) : "memory");
-    break;
-  case 2:
-    __asm__ __volatile__
-    ("movew %2,%0\n\t"
-     "movew %1,%2"
-    : "=&d" (tmp) : "d" (x), "m" (*__xg(ptr)) : "memory");
-    break;
-  case 4:
-    __asm__ __volatile__
-    ("movel %2,%0\n\t"
-     "movel %1,%2"
-    : "=&d" (tmp) : "d" (x), "m" (*__xg(ptr)) : "memory");
-    break;
-  }
-  local_irq_restore(flags);
-  return tmp;
-}
-#else
-static inline unsigned long __xchg(unsigned long x, volatile void * ptr, int size)
-{
-	switch (size) {
-	    case 1:
-		__asm__ __volatile__
-			("moveb %2,%0\n\t"
-			 "1:\n\t"
-			 "casb %0,%1,%2\n\t"
-			 "jne 1b"
-			 : "=&d" (x) : "d" (x), "m" (*__xg(ptr)) : "memory");
-		break;
-	    case 2:
-		__asm__ __volatile__
-			("movew %2,%0\n\t"
-			 "1:\n\t"
-			 "casw %0,%1,%2\n\t"
-			 "jne 1b"
-			 : "=&d" (x) : "d" (x), "m" (*__xg(ptr)) : "memory");
-		break;
-	    case 4:
-		__asm__ __volatile__
-			("movel %2,%0\n\t"
-			 "1:\n\t"
-			 "casl %0,%1,%2\n\t"
-			 "jne 1b"
-			 : "=&d" (x) : "d" (x), "m" (*__xg(ptr)) : "memory");
-		break;
-	}
-	return x;
-}
-#endif
-
-#include <asm-generic/cmpxchg-local.h>
-
-/*
- * cmpxchg_local and cmpxchg64_local are atomic wrt current CPU. Always make
- * them available.
- */
-#define cmpxchg_local(ptr, o, n)				  	       \
-	((__typeof__(*(ptr)))__cmpxchg_local_generic((ptr), (unsigned long)(o),\
-			(unsigned long)(n), sizeof(*(ptr))))
-#define cmpxchg64_local(ptr, o, n) __cmpxchg64_local_generic((ptr), (o), (n))
-
-#include <asm-generic/cmpxchg.h>
-
-#define arch_align_stack(x) (x)
-
-
-#endif /* _M68KNOMMU_SYSTEM_H */
diff --git a/arch/m68k/platform/68328/entry.S b/arch/m68k/platform/68328/entry.S
index f68dce7..4ed7a65 100644
--- a/arch/m68k/platform/68328/entry.S
+++ b/arch/m68k/platform/68328/entry.S
@@ -241,22 +241,21 @@ ENTRY(bad_interrupt)
 
 /*
  * Beware - when entering resume, prev (the current task) is
- * in a0, next (the new task) is in a1,so don't change these
+ * in a0, next (the new task) is in a1, so don't change these
  * registers until their contents are no longer needed.
  */
 ENTRY(resume)
 	movel	%a0,%d1				/* save prev thread in d1 */
 	movew	%sr,%a0@(TASK_THREAD+THREAD_SR)	/* save sr */
-	movel	%usp,%a2			/* save usp */
-	movel	%a2,%a0@(TASK_THREAD+THREAD_USP)
-
 	SAVE_SWITCH_STACK
 	movel	%sp,%a0@(TASK_THREAD+THREAD_KSP) /* save kernel stack */
+	movel	%usp,%a3			/* save usp */
+	movel	%a3,%a0@(TASK_THREAD+THREAD_USP)
+
+	movel	%a1@(TASK_THREAD+THREAD_USP),%a3 /* restore user stack */
+	movel	%a3,%usp
 	movel	%a1@(TASK_THREAD+THREAD_KSP),%sp /* restore new thread stack */
 	RESTORE_SWITCH_STACK
-
-	movel	%a1@(TASK_THREAD+THREAD_USP),%a0 /* restore user stack */
-	movel	%a0,%usp
 	movew	%a1@(TASK_THREAD+THREAD_SR),%sr	/* restore thread status reg */
 	rts
 
diff --git a/arch/m68k/platform/68360/entry.S b/arch/m68k/platform/68360/entry.S
index a07b14f..0ede670 100644
--- a/arch/m68k/platform/68360/entry.S
+++ b/arch/m68k/platform/68360/entry.S
@@ -162,22 +162,21 @@ bad_interrupt:
 
 /*
  * Beware - when entering resume, prev (the current task) is
- * in a0, next (the new task) is in a1,so don't change these
+ * in a0, next (the new task) is in a1, so don't change these
  * registers until their contents are no longer needed.
  */
 ENTRY(resume)
 	movel	%a0,%d1				/* save prev thread in d1 */
 	movew	%sr,%a0@(TASK_THREAD+THREAD_SR)	/* save sr */
-	movel	%usp,%a2			/* save usp */
-	movel	%a2,%a0@(TASK_THREAD+THREAD_USP)
-
 	SAVE_SWITCH_STACK
 	movel	%sp,%a0@(TASK_THREAD+THREAD_KSP) /* save kernel stack */
+	movel	%usp,%a3			/* save usp */
+	movel	%a3,%a0@(TASK_THREAD+THREAD_USP)
+
+	movel	%a1@(TASK_THREAD+THREAD_USP),%a3 /* restore user stack */
+	movel	%a3,%usp
 	movel	%a1@(TASK_THREAD+THREAD_KSP),%sp /* restore new thread stack */
 	RESTORE_SWITCH_STACK
-
-	movel	%a1@(TASK_THREAD+THREAD_USP),%a0 /* restore user stack */
-	movel	%a0,%usp
 	movew	%a1@(TASK_THREAD+THREAD_SR),%sr	/* restore thread status reg */
 	rts
 
diff --git a/arch/m68k/platform/coldfire/entry.S b/arch/m68k/platform/coldfire/entry.S
index 27c2b00..bd27242 100644
--- a/arch/m68k/platform/coldfire/entry.S
+++ b/arch/m68k/platform/coldfire/entry.S
@@ -182,21 +182,23 @@ ENTRY(inthandler)
 
 /*
  * Beware - when entering resume, prev (the current task) is
- * in a0, next (the new task) is in a1,so don't change these
+ * in a0, next (the new task) is in a1, so don't change these
  * registers until their contents are no longer needed.
- * This is always called in supervisor mode, so don't bother to save
- * and restore sr; user's process sr is actually in the stack.
  */
 ENTRY(resume)
-	movel	%a0, %d1			/* get prev thread in d1 */
-	RDUSP
-	movel	%a2,%a0@(TASK_THREAD+THREAD_USP)
-
+	movew	%sr,%d1				 /* save current status */
+	movew	%d1,%a0@(TASK_THREAD+THREAD_SR)
+	movel	%a0,%d1				 /* get prev thread in d1 */
 	SAVE_SWITCH_STACK
 	movel	%sp,%a0@(TASK_THREAD+THREAD_KSP) /* save kernel stack pointer */
-	movel	%a1@(TASK_THREAD+THREAD_KSP),%sp /* restore new thread stack */
+	RDUSP					 /* movel %usp,%a3 */
+	movel	%a3,%a0@(TASK_THREAD+THREAD_USP) /* save thread user stack */
+
+	movel	%a1@(TASK_THREAD+THREAD_USP),%a3 /* restore thread user stack */
+	WRUSP					 /* movel %a3,%usp */
+	movel	%a1@(TASK_THREAD+THREAD_KSP),%sp /* restore new kernel stack */
+	movew	%a1@(TASK_THREAD+THREAD_SR),%d7	 /* restore new status */
+	movew	%d7,%sr
 	RESTORE_SWITCH_STACK
-
-	movel	%a1@(TASK_THREAD+THREAD_USP),%a0 /* restore thread user stack */
-	WRUSP
 	rts
+
-- 
1.7.0.4
