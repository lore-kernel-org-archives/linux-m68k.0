From: <gerg@snapgear.com>
Subject: [PATCH 1/2] m68k: move hardware vector setting from traps.c to its own file
Date: Thu, 11 Aug 2011 15:49:50 +1000
Message-ID: <1313041791-26628-2-git-send-email-gerg@snapgear.com>
References: <1313041791-26628-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:44187 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751036Ab1HKFq2 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 11 Aug 2011 01:46:28 -0400
In-Reply-To: <1313041791-26628-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Most of the trap.c code is general to all m68k arch members. But the code
it currently contains to set the hardware vector table is quite specific to
the 680x0 family. They can have the vector table at any address unlike
other family members (which either support only a single fixed address,
or a limited range of addresses). So lets move that code out to a new file,
vectors.c. This will make sharing the rest of the trap.c code easier and
cleaner.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/kernel/Makefile   |    2 +-
 arch/m68k/kernel/traps_mm.c |  115 ----------------------------------
 arch/m68k/kernel/vectors.c  |  145 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 146 insertions(+), 116 deletions(-)
 create mode 100644 arch/m68k/kernel/vectors.c

diff --git a/arch/m68k/kernel/Makefile b/arch/m68k/kernel/Makefile
index 5e1bf94..2f14e19 100644
--- a/arch/m68k/kernel/Makefile
+++ b/arch/m68k/kernel/Makefile
@@ -10,7 +10,7 @@ obj-y	:= entry.o m68k_ksyms.o process.o ptrace.o setup.o signal.o \
 	   sys_m68k.o syscalltable.o time.o traps.o
 
 obj-y$(CONFIG_MMU_SUN3) += dma.o	# no, it's not a typo
-obj-$(CONFIG_MMU)	+= ints.o module.o devres.o
+obj-$(CONFIG_MMU)	+= ints.o module.o devres.o vectors.c
 devres-$(CONFIG_MMU)	= ../../../kernel/irq/devres.o
 
 ifndef CONFIG_MMU
diff --git a/arch/m68k/kernel/traps_mm.c b/arch/m68k/kernel/traps_mm.c
index 4022bbc..227d484 100644
--- a/arch/m68k/kernel/traps_mm.c
+++ b/arch/m68k/kernel/traps_mm.c
@@ -39,121 +39,6 @@
 #include <asm/machdep.h>
 #include <asm/siginfo.h>
 
-/* assembler routines */
-asmlinkage void system_call(void);
-asmlinkage void buserr(void);
-asmlinkage void trap(void);
-asmlinkage void nmihandler(void);
-#ifdef CONFIG_M68KFPU_EMU
-asmlinkage void fpu_emu(void);
-#endif
-
-e_vector vectors[256];
-
-/* nmi handler for the Amiga */
-asm(".text\n"
-    __ALIGN_STR "\n"
-    "nmihandler: rte");
-
-/*
- * this must be called very early as the kernel might
- * use some instruction that are emulated on the 060
- * and so we're prepared for early probe attempts (e.g. nf_init).
- */
-void __init base_trap_init(void)
-{
-	if (MACH_IS_SUN3X) {
-		extern e_vector *sun3x_prom_vbr;
-
-		__asm__ volatile ("movec %%vbr, %0" : "=r" (sun3x_prom_vbr));
-	}
-
-	/* setup the exception vector table */
-	__asm__ volatile ("movec %0,%%vbr" : : "r" ((void*)vectors));
-
-	if (CPU_IS_060) {
-		/* set up ISP entry points */
-		asmlinkage void unimp_vec(void) asm ("_060_isp_unimp");
-
-		vectors[VEC_UNIMPII] = unimp_vec;
-	}
-
-	vectors[VEC_BUSERR] = buserr;
-	vectors[VEC_ILLEGAL] = trap;
-	vectors[VEC_SYS] = system_call;
-}
-
-void __init trap_init (void)
-{
-	int i;
-
-	for (i = VEC_SPUR; i <= VEC_INT7; i++)
-		vectors[i] = bad_inthandler;
-
-	for (i = 0; i < VEC_USER; i++)
-		if (!vectors[i])
-			vectors[i] = trap;
-
-	for (i = VEC_USER; i < 256; i++)
-		vectors[i] = bad_inthandler;
-
-#ifdef CONFIG_M68KFPU_EMU
-	if (FPU_IS_EMU)
-		vectors[VEC_LINE11] = fpu_emu;
-#endif
-
-	if (CPU_IS_040 && !FPU_IS_EMU) {
-		/* set up FPSP entry points */
-		asmlinkage void dz_vec(void) asm ("dz");
-		asmlinkage void inex_vec(void) asm ("inex");
-		asmlinkage void ovfl_vec(void) asm ("ovfl");
-		asmlinkage void unfl_vec(void) asm ("unfl");
-		asmlinkage void snan_vec(void) asm ("snan");
-		asmlinkage void operr_vec(void) asm ("operr");
-		asmlinkage void bsun_vec(void) asm ("bsun");
-		asmlinkage void fline_vec(void) asm ("fline");
-		asmlinkage void unsupp_vec(void) asm ("unsupp");
-
-		vectors[VEC_FPDIVZ] = dz_vec;
-		vectors[VEC_FPIR] = inex_vec;
-		vectors[VEC_FPOVER] = ovfl_vec;
-		vectors[VEC_FPUNDER] = unfl_vec;
-		vectors[VEC_FPNAN] = snan_vec;
-		vectors[VEC_FPOE] = operr_vec;
-		vectors[VEC_FPBRUC] = bsun_vec;
-		vectors[VEC_LINE11] = fline_vec;
-		vectors[VEC_FPUNSUP] = unsupp_vec;
-	}
-
-	if (CPU_IS_060 && !FPU_IS_EMU) {
-		/* set up IFPSP entry points */
-		asmlinkage void snan_vec6(void) asm ("_060_fpsp_snan");
-		asmlinkage void operr_vec6(void) asm ("_060_fpsp_operr");
-		asmlinkage void ovfl_vec6(void) asm ("_060_fpsp_ovfl");
-		asmlinkage void unfl_vec6(void) asm ("_060_fpsp_unfl");
-		asmlinkage void dz_vec6(void) asm ("_060_fpsp_dz");
-		asmlinkage void inex_vec6(void) asm ("_060_fpsp_inex");
-		asmlinkage void fline_vec6(void) asm ("_060_fpsp_fline");
-		asmlinkage void unsupp_vec6(void) asm ("_060_fpsp_unsupp");
-		asmlinkage void effadd_vec6(void) asm ("_060_fpsp_effadd");
-
-		vectors[VEC_FPNAN] = snan_vec6;
-		vectors[VEC_FPOE] = operr_vec6;
-		vectors[VEC_FPOVER] = ovfl_vec6;
-		vectors[VEC_FPUNDER] = unfl_vec6;
-		vectors[VEC_FPDIVZ] = dz_vec6;
-		vectors[VEC_FPIR] = inex_vec6;
-		vectors[VEC_LINE11] = fline_vec6;
-		vectors[VEC_FPUNSUP] = unsupp_vec6;
-		vectors[VEC_UNIMPEA] = effadd_vec6;
-	}
-
-        /* if running on an amiga, make the NMI interrupt do nothing */
-	if (MACH_IS_AMIGA) {
-		vectors[VEC_INT7] = nmihandler;
-	}
-}
-
 
 static const char *vec_names[] = {
 	[VEC_RESETSP]	= "RESET SP",
diff --git a/arch/m68k/kernel/vectors.c b/arch/m68k/kernel/vectors.c
new file mode 100644
index 0000000..147b03f
--- /dev/null
+++ b/arch/m68k/kernel/vectors.c
@@ -0,0 +1,145 @@
+/*
+ *  vectors.c
+ *
+ *  Copyright (C) 1993, 1994 by Hamish Macdonald
+ *
+ *  68040 fixes by Michael Rausch
+ *  68040 fixes by Martin Apel
+ *  68040 fixes and writeback by Richard Zidlicky
+ *  68060 fixes by Roman Hodek
+ *  68060 fixes by Jesper Skov
+ *
+ * This file is subject to the terms and conditions of the GNU General Public
+ * License.  See the file COPYING in the main directory of this archive
+ * for more details.
+ */
+
+/*
+ * Sets up all exception vectors
+ */
+#include <linux/sched.h>
+#include <linux/kernel.h>
+#include <linux/linkage.h>
+#include <linux/init.h>
+#include <linux/kallsyms.h>
+
+#include <asm/setup.h>
+#include <asm/fpu.h>
+#include <asm/system.h>
+#include <asm/traps.h>
+
+/* assembler routines */
+asmlinkage void system_call(void);
+asmlinkage void buserr(void);
+asmlinkage void trap(void);
+asmlinkage void nmihandler(void);
+#ifdef CONFIG_M68KFPU_EMU
+asmlinkage void fpu_emu(void);
+#endif
+
+e_vector vectors[256];
+
+/* nmi handler for the Amiga */
+asm(".text\n"
+    __ALIGN_STR "\n"
+    "nmihandler: rte");
+
+/*
+ * this must be called very early as the kernel might
+ * use some instruction that are emulated on the 060
+ * and so we're prepared for early probe attempts (e.g. nf_init).
+ */
+void __init base_trap_init(void)
+{
+	if (MACH_IS_SUN3X) {
+		extern e_vector *sun3x_prom_vbr;
+
+		__asm__ volatile ("movec %%vbr, %0" : "=r" (sun3x_prom_vbr));
+	}
+
+	/* setup the exception vector table */
+	__asm__ volatile ("movec %0,%%vbr" : : "r" ((void*)vectors));
+
+	if (CPU_IS_060) {
+		/* set up ISP entry points */
+		asmlinkage void unimp_vec(void) asm ("_060_isp_unimp");
+
+		vectors[VEC_UNIMPII] = unimp_vec;
+	}
+
+	vectors[VEC_BUSERR] = buserr;
+	vectors[VEC_ILLEGAL] = trap;
+	vectors[VEC_SYS] = system_call;
+}
+
+void __init trap_init (void)
+{
+	int i;
+
+	for (i = VEC_SPUR; i <= VEC_INT7; i++)
+		vectors[i] = bad_inthandler;
+
+	for (i = 0; i < VEC_USER; i++)
+		if (!vectors[i])
+			vectors[i] = trap;
+
+	for (i = VEC_USER; i < 256; i++)
+		vectors[i] = bad_inthandler;
+
+#ifdef CONFIG_M68KFPU_EMU
+	if (FPU_IS_EMU)
+		vectors[VEC_LINE11] = fpu_emu;
+#endif
+
+	if (CPU_IS_040 && !FPU_IS_EMU) {
+		/* set up FPSP entry points */
+		asmlinkage void dz_vec(void) asm ("dz");
+		asmlinkage void inex_vec(void) asm ("inex");
+		asmlinkage void ovfl_vec(void) asm ("ovfl");
+		asmlinkage void unfl_vec(void) asm ("unfl");
+		asmlinkage void snan_vec(void) asm ("snan");
+		asmlinkage void operr_vec(void) asm ("operr");
+		asmlinkage void bsun_vec(void) asm ("bsun");
+		asmlinkage void fline_vec(void) asm ("fline");
+		asmlinkage void unsupp_vec(void) asm ("unsupp");
+
+		vectors[VEC_FPDIVZ] = dz_vec;
+		vectors[VEC_FPIR] = inex_vec;
+		vectors[VEC_FPOVER] = ovfl_vec;
+		vectors[VEC_FPUNDER] = unfl_vec;
+		vectors[VEC_FPNAN] = snan_vec;
+		vectors[VEC_FPOE] = operr_vec;
+		vectors[VEC_FPBRUC] = bsun_vec;
+		vectors[VEC_LINE11] = fline_vec;
+		vectors[VEC_FPUNSUP] = unsupp_vec;
+	}
+
+	if (CPU_IS_060 && !FPU_IS_EMU) {
+		/* set up IFPSP entry points */
+		asmlinkage void snan_vec6(void) asm ("_060_fpsp_snan");
+		asmlinkage void operr_vec6(void) asm ("_060_fpsp_operr");
+		asmlinkage void ovfl_vec6(void) asm ("_060_fpsp_ovfl");
+		asmlinkage void unfl_vec6(void) asm ("_060_fpsp_unfl");
+		asmlinkage void dz_vec6(void) asm ("_060_fpsp_dz");
+		asmlinkage void inex_vec6(void) asm ("_060_fpsp_inex");
+		asmlinkage void fline_vec6(void) asm ("_060_fpsp_fline");
+		asmlinkage void unsupp_vec6(void) asm ("_060_fpsp_unsupp");
+		asmlinkage void effadd_vec6(void) asm ("_060_fpsp_effadd");
+
+		vectors[VEC_FPNAN] = snan_vec6;
+		vectors[VEC_FPOE] = operr_vec6;
+		vectors[VEC_FPOVER] = ovfl_vec6;
+		vectors[VEC_FPUNDER] = unfl_vec6;
+		vectors[VEC_FPDIVZ] = dz_vec6;
+		vectors[VEC_FPIR] = inex_vec6;
+		vectors[VEC_LINE11] = fline_vec6;
+		vectors[VEC_FPUNSUP] = unsupp_vec6;
+		vectors[VEC_UNIMPEA] = effadd_vec6;
+	}
+
+        /* if running on an amiga, make the NMI interrupt do nothing */
+	if (MACH_IS_AMIGA) {
+		vectors[VEC_INT7] = nmihandler;
+	}
+}
+
-- 
1.7.0.4
