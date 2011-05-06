From: <gerg@snapgear.com>
Subject: [PATCH] m68k: merge MMU and non-MMU versions of asm/hardirq.h
Date: Fri, 6 May 2011 10:20:03 +1000
Message-ID: <1304641203-27994-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:54688 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754456Ab1EFAUJ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 5 May 2011 20:20:09 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The contents of asm/hardirq.h are pretty strait forward for both the
MMU (hardirq_mm.h) and non-MMU (hardirq_no.h) include files. Merge the
two back into a single file.

Build and run tested on m68knommu targets, and ARAnyM Atari emulator.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/hardirq.h    |   35 ++++++++++++++++++++++++++++++++---
 arch/m68k/include/asm/hardirq_mm.h |   16 ----------------
 arch/m68k/include/asm/hardirq_no.h |   19 -------------------
 arch/m68k/include/asm/irq.h        |    9 ---------
 4 files changed, 32 insertions(+), 47 deletions(-)
 delete mode 100644 arch/m68k/include/asm/hardirq_mm.h
 delete mode 100644 arch/m68k/include/asm/hardirq_no.h

diff --git a/arch/m68k/include/asm/hardirq.h b/arch/m68k/include/asm/hardirq.h
index 56d0d5d..870e534 100644
--- a/arch/m68k/include/asm/hardirq.h
+++ b/arch/m68k/include/asm/hardirq.h
@@ -1,5 +1,34 @@
-#ifdef __uClinux__
-#include "hardirq_no.h"
+#ifndef __M68K_HARDIRQ_H
+#define __M68K_HARDIRQ_H
+
+#include <linux/threads.h>
+#include <linux/cache.h>
+#include <asm/irq.h>
+
+#define HARDIRQ_BITS	8
+
+/*
+ * The hardirq mask has to be large enough to have
+ * space for potentially all IRQ sources in the system
+ * nesting on a single CPU:
+ */
+#if (1 << HARDIRQ_BITS) < NR_IRQS
+# error HARDIRQ_BITS is too low!
+#endif
+
+#ifdef CONFIG_MMU
+
+/* entry.S is sensitive to the offsets of these fields */
+typedef struct {
+	unsigned int __softirq_pending;
+} ____cacheline_aligned irq_cpustat_t;
+
+#include <linux/irq_cpustat.h>	/* Standard mappings for irq_cpustat_t above */
+
 #else
-#include "hardirq_mm.h"
+
+#include <asm-generic/hardirq.h>
+
+#endif /* !CONFIG_MMU */
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
index 907eff1..67c9738 100644
--- a/arch/m68k/include/asm/irq.h
+++ b/arch/m68k/include/asm/irq.h
@@ -33,15 +33,6 @@
 #include <linux/spinlock_types.h>
 
 /*
- * The hardirq mask has to be large enough to have
- * space for potentially all IRQ sources in the system
- * nesting on a single CPU:
- */
-#if (1 << HARDIRQ_BITS) < NR_IRQS
-# error HARDIRQ_BITS is too low!
-#endif
-
-/*
  * Interrupt source definitions
  * General interrupt sources are the level 1-7.
  * Adding an interrupt service routine for one of these sources
-- 
1.7.0.4
