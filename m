From: Greg Ungerer <gerg@snapgear.com>
Subject: [PATCH] m68k: switch to using asm-generic/hardirq.h
Date: Tue, 7 Sep 2010 15:00:47 +1000
Message-ID: <201009070500.o8750l71006902@goober.internal.moreton.com.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:43303 "HELO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751580Ab0IGFBZ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 7 Sep 2010 01:01:25 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: gerg@uclinux.org


Hi All,

Is there any reason that the m68k arch cannot use the generic
hardirq.h support?

It looks to be the same, unless I am missing something.
If it can then it is simple to merge the non-mmu and mmu
versions of hardirq.h.

Regards
Greg




m68k: switch to using asm-generic/hardirq.h

M68k arch can use generic hardirq.h. This also means that we can
simply switch to a single hardirq.h for both m68k and m68knommu.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/hardirq.h    |   11 +++++++----
 arch/m68k/include/asm/hardirq_mm.h |   16 ----------------
 arch/m68k/include/asm/hardirq_no.h |   19 -------------------
 arch/m68k/include/asm/irq.h        |   10 +++++-----
 4 files changed, 12 insertions(+), 44 deletions(-)
 delete mode 100644 arch/m68k/include/asm/hardirq_mm.h
 delete mode 100644 arch/m68k/include/asm/hardirq_no.h

diff --git a/arch/m68k/include/asm/hardirq.h b/arch/m68k/include/asm/hardirq.h
index 56d0d5d..d0e9d06 100644
--- a/arch/m68k/include/asm/hardirq.h
+++ b/arch/m68k/include/asm/hardirq.h
@@ -1,5 +1,8 @@
-#ifdef __uClinux__
-#include "hardirq_no.h"
-#else
-#include "hardirq_mm.h"
+#ifndef __M68K_HARDIRQ_H
+#define __M68K_HARDIRQ_H
+
+#include <asm-generic/hardirq.h>
+
+#define HARDIRQ_BITS	8
+
 #endif
diff --git a/arch/m68k/include/asm/hardirq_mm.h b/arch/m68k/include/asm/hardirq_mm.h
deleted file mode 100644
index 394ee94..0000000
--- a/arch/m68k/include/asm/hardirq_mm.h
+++ /dev/null
@@ -1,16 +0,0 @@
-#ifndef __M68K_HARDIRQ_H
-#define __M68K_HARDIRQ_H
-
-#include <linux/threads.h>
-#include <linux/cache.h>
-
-/* entry.S is sensitive to the offsets of these fields */
-typedef struct {
-	unsigned int __softirq_pending;
-} ____cacheline_aligned irq_cpustat_t;
-
-#include <linux/irq_cpustat.h>	/* Standard mappings for irq_cpustat_t above */
-
-#define HARDIRQ_BITS	8
-
-#endif
diff --git a/arch/m68k/include/asm/hardirq_no.h b/arch/m68k/include/asm/hardirq_no.h
deleted file mode 100644
index b44b14b..0000000
--- a/arch/m68k/include/asm/hardirq_no.h
+++ /dev/null
@@ -1,19 +0,0 @@
-#ifndef __M68K_HARDIRQ_H
-#define __M68K_HARDIRQ_H
-
-#include <asm/irq.h>
-
-#define HARDIRQ_BITS	8
-
-/*
- * The hardirq mask has to be large enough to have
- * space for potentially all IRQ sources in the system
- * nesting on a single CPU:
- */
-#if (1 << HARDIRQ_BITS) < NR_IRQS
-# error HARDIRQ_BITS is too low!
-#endif
-
-#include <asm-generic/hardirq.h>
-
-#endif /* __M68K_HARDIRQ_H */
diff --git a/arch/m68k/include/asm/irq.h b/arch/m68k/include/asm/irq.h
index 907eff1..d2b04f1 100644
--- a/arch/m68k/include/asm/irq.h
+++ b/arch/m68k/include/asm/irq.h
@@ -25,12 +25,7 @@
 #define NR_IRQS	0
 #endif
 
-#ifdef CONFIG_MMU
-
-#include <linux/linkage.h>
 #include <linux/hardirq.h>
-#include <linux/irqreturn.h>
-#include <linux/spinlock_types.h>
 
 /*
  * The hardirq mask has to be large enough to have
@@ -41,6 +36,11 @@
 # error HARDIRQ_BITS is too low!
 #endif
 
+#ifdef CONFIG_MMU
+#include <linux/linkage.h>
+#include <linux/irqreturn.h>
+#include <linux/spinlock_types.h>
+
 /*
  * Interrupt source definitions
  * General interrupt sources are the level 1-7.
-- 
1.6.3.3
