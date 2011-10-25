From: <gerg@snapgear.com>
Subject: [PATCH 31/36] m68k: completely disable FPU support for ColdFire
Date: Tue, 25 Oct 2011 17:19:23 +1000
Message-ID: <1319527168-11166-32-git-send-email-gerg@snapgear.com>
References: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:25226 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754723Ab1JYHVQ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 25 Oct 2011 03:21:16 -0400
In-Reply-To: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Disable all FPU support for the ColdFire CPU's running wirh MMU enabled.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/kernel/process_mm.c |   15 ++++++++++++---
 arch/m68k/kernel/signal_mm.c  |   16 ++++++++++++++++
 2 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/kernel/process_mm.c b/arch/m68k/kernel/process_mm.c
index 58a3253..f0155b1 100644
--- a/arch/m68k/kernel/process_mm.c
+++ b/arch/m68k/kernel/process_mm.c
@@ -168,13 +168,16 @@ EXPORT_SYMBOL(kernel_thread);
 
 void flush_thread(void)
 {
-	unsigned long zero = 0;
-
+	set_fs(USER_DS);
 	current->thread.fs = __USER_DS;
-	if (!FPU_IS_EMU)
+#ifndef CONFIG_COLDFIRE
+	if (!FPU_IS_EMU) {
+		unsigned long zero = 0;
 		asm volatile (".chip 68k/68881\n\t"
 			      "frestore %0@\n\t"
 			      ".chip 68k" : : "a" (&zero));
+	}
+#endif
 }
 
 /*
@@ -244,6 +247,7 @@ int copy_thread(unsigned long clone_flags, unsigned long usp,
 	 */
 	p->thread.fs = get_fs().seg;
 
+#ifndef CONFIG_COLDFIRE
 	if (!FPU_IS_EMU) {
 		/* Copy the current fpu state */
 		asm volatile ("fsave %0" : : "m" (p->thread.fpstate[0]) : "memory");
@@ -256,6 +260,7 @@ int copy_thread(unsigned long clone_flags, unsigned long usp,
 		/* Restore the state in case the fpu was busy */
 		asm volatile ("frestore %0" : : "m" (p->thread.fpstate[0]));
 	}
+#endif
 
 	return 0;
 }
@@ -264,7 +269,9 @@ int copy_thread(unsigned long clone_flags, unsigned long usp,
 
 int dump_fpu (struct pt_regs *regs, struct user_m68kfp_struct *fpu)
 {
+#ifndef CONFIG_COLDFIRE
 	char fpustate[216];
+#endif
 
 	if (FPU_IS_EMU) {
 		int i;
@@ -280,6 +287,7 @@ int dump_fpu (struct pt_regs *regs, struct user_m68kfp_struct *fpu)
 		return 1;
 	}
 
+#ifndef CONFIG_COLDFIRE
 	/* First dump the fpu context to avoid protocol violation.  */
 	asm volatile ("fsave %0" :: "m" (fpustate[0]) : "memory");
 	if (!CPU_IS_060 ? !fpustate[0] : !fpustate[2])
@@ -291,6 +299,7 @@ int dump_fpu (struct pt_regs *regs, struct user_m68kfp_struct *fpu)
 	asm volatile ("fmovemx %/fp0-%/fp7,%0"
 		:: "m" (fpu->fpregs[0])
 		: "memory");
+#endif
 	return 1;
 }
 EXPORT_SYMBOL(dump_fpu);
diff --git a/arch/m68k/kernel/signal_mm.c b/arch/m68k/kernel/signal_mm.c
index 5f6b3d0..f23f29f 100644
--- a/arch/m68k/kernel/signal_mm.c
+++ b/arch/m68k/kernel/signal_mm.c
@@ -225,16 +225,20 @@ static inline int restore_fpu_state(struct sigcontext *sc)
 	    } else
 		goto out;
 
+#ifndef CONFIG_COLDFIRE
 	    __asm__ volatile (".chip 68k/68881\n\t"
 			      "fmovemx %0,%%fp0-%%fp1\n\t"
 			      "fmoveml %1,%%fpcr/%%fpsr/%%fpiar\n\t"
 			      ".chip 68k"
 			      : /* no outputs */
 			      : "m" (*sc->sc_fpregs), "m" (*sc->sc_fpcntl));
+#endif
 	}
+#ifndef CONFIG_COLDFIRE
 	__asm__ volatile (".chip 68k/68881\n\t"
 			  "frestore %0\n\t"
 			  ".chip 68k" : : "m" (*sc->sc_fpstate));
+#endif
 	err = 0;
 
 out:
@@ -295,6 +299,7 @@ static inline int rt_restore_fpu_state(struct ucontext __user *uc)
 		if (__copy_from_user(&fpregs, &uc->uc_mcontext.fpregs,
 				     sizeof(fpregs)))
 			goto out;
+#ifndef CONFIG_COLDFIRE
 		__asm__ volatile (".chip 68k/68881\n\t"
 				  "fmovemx %0,%%fp0-%%fp7\n\t"
 				  "fmoveml %1,%%fpcr/%%fpsr/%%fpiar\n\t"
@@ -302,14 +307,17 @@ static inline int rt_restore_fpu_state(struct ucontext __user *uc)
 				  : /* no outputs */
 				  : "m" (*fpregs.f_fpregs),
 				    "m" (*fpregs.f_fpcntl));
+#endif
 	}
 	if (context_size &&
 	    __copy_from_user(fpstate + 4, (long __user *)&uc->uc_fpstate + 1,
 			     context_size))
 		goto out;
+#ifndef CONFIG_COLDFIRE
 	__asm__ volatile (".chip 68k/68881\n\t"
 			  "frestore %0\n\t"
 			  ".chip 68k" : : "m" (*fpstate));
+#endif
 	err = 0;
 
 out:
@@ -529,6 +537,7 @@ static inline void save_fpu_state(struct sigcontext *sc, struct pt_regs *regs)
 		return;
 	}
 
+#ifndef CONFIG_COLDFIRE
 	__asm__ volatile (".chip 68k/68881\n\t"
 			  "fsave %0\n\t"
 			  ".chip 68k"
@@ -552,12 +561,15 @@ static inline void save_fpu_state(struct sigcontext *sc, struct pt_regs *regs)
 				  : /* no inputs */
 				  : "memory");
 	}
+#endif
 }
 
 static inline int rt_save_fpu_state(struct ucontext __user *uc, struct pt_regs *regs)
 {
+#ifndef CONFIG_COLDFIRE
 	unsigned char fpstate[FPCONTEXT_SIZE];
 	int context_size = CPU_IS_060 ? 8 : 0;
+#endif
 	int err = 0;
 
 	if (FPU_IS_EMU) {
@@ -570,6 +582,7 @@ static inline int rt_save_fpu_state(struct ucontext __user *uc, struct pt_regs *
 		return err;
 	}
 
+#ifndef CONFIG_COLDFIRE
 	__asm__ volatile (".chip 68k/68881\n\t"
 			  "fsave %0\n\t"
 			  ".chip 68k"
@@ -602,6 +615,7 @@ static inline int rt_save_fpu_state(struct ucontext __user *uc, struct pt_regs *
 	if (context_size)
 		err |= copy_to_user((long __user *)&uc->uc_fpstate + 1, fpstate + 4,
 				    context_size);
+#endif
 	return err;
 }
 
@@ -661,6 +675,7 @@ static inline void push_cache (unsigned long vaddr)
 	 * cache_push_v().
 	 *                                                     Jes
 	 */
+#ifndef CONFIG_COLDFIRE
 	if (CPU_IS_040) {
 		unsigned long temp;
 
@@ -709,6 +724,7 @@ static inline void push_cache (unsigned long vaddr)
 			      "movec %1,%%cacr"
 			      : : "r" (vaddr + 4), "r" (temp));
 	}
+#endif
 }
 
 static inline void __user *
-- 
1.7.0.4
