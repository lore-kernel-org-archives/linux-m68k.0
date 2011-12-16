From: <gerg@snapgear.com>
Subject: [PATCH 32/35] m68k: add ColdFire FPU support for the V4e ColdFire CPU's
Date: Fri, 16 Dec 2011 22:36:29 +1000
Message-ID: <1324038992-31222-33-git-send-email-gerg@snapgear.com>
References: <1324038992-31222-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:49435 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759098Ab1LPMhO (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 16 Dec 2011 07:37:14 -0500
In-Reply-To: <1324038992-31222-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The V4e ColdFire CPU family also has an integrated FPU (as well as the MMU).
So add code to support this hardware along side the existing m68k FPU code.

The ColdFire FPU is of course different to all previous 68k FP units. It is
close in operation to the 68060, but not completely compatible. The biggest
issue to deal with is that the ColdFire FPU multi-move instructions are
different. It does not support multi-moving the FP control registers, and
the multi-move of the FP data registers uses a different instruction
mnemonic.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
Acked-by: Matt Waddel <mwaddel@yahoo.com>
Acked-by: Kurt Mahan <kmahan@xmission.com>
---
 arch/m68k/include/asm/fpu.h   |    2 +
 arch/m68k/kernel/process_mm.c |   59 ++++++++++++----
 arch/m68k/kernel/setup_mm.c   |    2 +-
 arch/m68k/kernel/signal_mm.c  |  156 ++++++++++++++++++++++++++++-------------
 4 files changed, 154 insertions(+), 65 deletions(-)

diff --git a/arch/m68k/include/asm/fpu.h b/arch/m68k/include/asm/fpu.h
index ffb6b8c..526db9d 100644
--- a/arch/m68k/include/asm/fpu.h
+++ b/arch/m68k/include/asm/fpu.h
@@ -12,6 +12,8 @@
 #define FPSTATESIZE (96)
 #elif defined(CONFIG_M68KFPU_EMU)
 #define FPSTATESIZE (28)
+#elif defined(CONFIG_COLDFIRE) && defined(CONFIG_MMU)
+#define FPSTATESIZE (16)
 #elif defined(CONFIG_M68060)
 #define FPSTATESIZE (12)
 #else
diff --git a/arch/m68k/kernel/process_mm.c b/arch/m68k/kernel/process_mm.c
index 58a3253..125f34e 100644
--- a/arch/m68k/kernel/process_mm.c
+++ b/arch/m68k/kernel/process_mm.c
@@ -172,9 +172,7 @@ void flush_thread(void)
 
 	current->thread.fs = __USER_DS;
 	if (!FPU_IS_EMU)
-		asm volatile (".chip 68k/68881\n\t"
-			      "frestore %0@\n\t"
-			      ".chip 68k" : : "a" (&zero));
+		asm volatile ("frestore %0@" : : "a" (&zero) : "memory");
 }
 
 /*
@@ -248,11 +246,28 @@ int copy_thread(unsigned long clone_flags, unsigned long usp,
 		/* Copy the current fpu state */
 		asm volatile ("fsave %0" : : "m" (p->thread.fpstate[0]) : "memory");
 
-		if (!CPU_IS_060 ? p->thread.fpstate[0] : p->thread.fpstate[2])
-		  asm volatile ("fmovemx %/fp0-%/fp7,%0\n\t"
-				"fmoveml %/fpiar/%/fpcr/%/fpsr,%1"
-				: : "m" (p->thread.fp[0]), "m" (p->thread.fpcntl[0])
-				: "memory");
+		if (!CPU_IS_060 ? p->thread.fpstate[0] : p->thread.fpstate[2]) {
+			if (CPU_IS_COLDFIRE) {
+				asm volatile ("fmovemd %/fp0-%/fp7,%0\n\t"
+					      "fmovel %/fpiar,%1\n\t"
+					      "fmovel %/fpcr,%2\n\t"
+					      "fmovel %/fpsr,%3"
+					      :
+					      : "m" (p->thread.fp[0]),
+						"m" (p->thread.fpcntl[0]),
+						"m" (p->thread.fpcntl[1]),
+						"m" (p->thread.fpcntl[2])
+					      : "memory");
+			} else {
+				asm volatile ("fmovemx %/fp0-%/fp7,%0\n\t"
+					      "fmoveml %/fpiar/%/fpcr/%/fpsr,%1"
+					      :
+					      : "m" (p->thread.fp[0]),
+						"m" (p->thread.fpcntl[0])
+					      : "memory");
+			}
+		}
+
 		/* Restore the state in case the fpu was busy */
 		asm volatile ("frestore %0" : : "m" (p->thread.fpstate[0]));
 	}
@@ -285,12 +300,28 @@ int dump_fpu (struct pt_regs *regs, struct user_m68kfp_struct *fpu)
 	if (!CPU_IS_060 ? !fpustate[0] : !fpustate[2])
 		return 0;
 
-	asm volatile ("fmovem %/fpiar/%/fpcr/%/fpsr,%0"
-		:: "m" (fpu->fpcntl[0])
-		: "memory");
-	asm volatile ("fmovemx %/fp0-%/fp7,%0"
-		:: "m" (fpu->fpregs[0])
-		: "memory");
+	if (CPU_IS_COLDFIRE) {
+		asm volatile ("fmovel %/fpiar,%0\n\t"
+			      "fmovel %/fpcr,%1\n\t"
+			      "fmovel %/fpsr,%2\n\t"
+			      "fmovemd %/fp0-%/fp7,%3"
+			      :
+			      : "m" (fpu->fpcntl[0]),
+				"m" (fpu->fpcntl[1]),
+				"m" (fpu->fpcntl[2]),
+				"m" (fpu->fpregs[0])
+			      : "memory");
+	} else {
+		asm volatile ("fmovem %/fpiar/%/fpcr/%/fpsr,%0"
+			      :
+			      : "m" (fpu->fpcntl[0])
+			      : "memory");
+		asm volatile ("fmovemx %/fp0-%/fp7,%0"
+			      :
+			      : "m" (fpu->fpregs[0])
+			      : "memory");
+	}
+
 	return 1;
 }
 EXPORT_SYMBOL(dump_fpu);
diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
index b3938ad..d872ce4 100644
--- a/arch/m68k/kernel/setup_mm.c
+++ b/arch/m68k/kernel/setup_mm.c
@@ -236,7 +236,7 @@ void __init setup_arch(char **cmdline_p)
 	 *  with them, we should add a test to check_bugs() below] */
 #ifndef CONFIG_M68KFPU_EMU_ONLY
 	/* clear the fpu if we have one */
-	if (m68k_fputype & (FPU_68881|FPU_68882|FPU_68040|FPU_68060)) {
+	if (m68k_fputype & (FPU_68881|FPU_68882|FPU_68040|FPU_68060|FPU_COLDFIRE)) {
 		volatile int zero = 0;
 		asm volatile ("frestore %0" : : "m" (zero));
 	}
diff --git a/arch/m68k/kernel/signal_mm.c b/arch/m68k/kernel/signal_mm.c
index 5f6b3d0..9a827a5 100644
--- a/arch/m68k/kernel/signal_mm.c
+++ b/arch/m68k/kernel/signal_mm.c
@@ -203,7 +203,8 @@ static inline int restore_fpu_state(struct sigcontext *sc)
 
 	if (CPU_IS_060 ? sc->sc_fpstate[2] : sc->sc_fpstate[0]) {
 	    /* Verify the frame format.  */
-	    if (!CPU_IS_060 && (sc->sc_fpstate[0] != fpu_version))
+	    if (!(CPU_IS_060 || CPU_IS_COLDFIRE) &&
+		 (sc->sc_fpstate[0] != fpu_version))
 		goto out;
 	    if (CPU_IS_020_OR_030) {
 		if (m68k_fputype & FPU_68881 &&
@@ -222,19 +223,36 @@ static inline int restore_fpu_state(struct sigcontext *sc)
                       sc->sc_fpstate[3] == 0x60 ||
 		      sc->sc_fpstate[3] == 0xe0))
 		    goto out;
+	    } else if (CPU_IS_COLDFIRE) {
+		if (!(sc->sc_fpstate[0] == 0x00 ||
+                      sc->sc_fpstate[0] == 0x05 ||
+		      sc->sc_fpstate[0] == 0xe5))
+		    goto out;
 	    } else
 		goto out;
 
-	    __asm__ volatile (".chip 68k/68881\n\t"
-			      "fmovemx %0,%%fp0-%%fp1\n\t"
-			      "fmoveml %1,%%fpcr/%%fpsr/%%fpiar\n\t"
-			      ".chip 68k"
-			      : /* no outputs */
-			      : "m" (*sc->sc_fpregs), "m" (*sc->sc_fpcntl));
+	    if (CPU_IS_COLDFIRE) {
+		__asm__ volatile ("fmovemd %0,%%fp0-%%fp1\n\t"
+				  "fmovel %1,%%fpcr\n\t"
+				  "fmovel %2,%%fpsr\n\t"
+				  "fmovel %3,%%fpiar"
+				  : /* no outputs */
+				  : "m" (sc->sc_fpregs[0]),
+				    "m" (sc->sc_fpcntl[0]),
+				    "m" (sc->sc_fpcntl[1]),
+				    "m" (sc->sc_fpcntl[2]));
+	    } else {
+		__asm__ volatile (".chip 68k/68881\n\t"
+				  "fmovemx %0,%%fp0-%%fp1\n\t"
+				  "fmoveml %1,%%fpcr/%%fpsr/%%fpiar\n\t"
+				  ".chip 68k"
+				  : /* no outputs */
+				  : "m" (*sc->sc_fpregs),
+				    "m" (*sc->sc_fpcntl));
+	    }
 	}
-	__asm__ volatile (".chip 68k/68881\n\t"
-			  "frestore %0\n\t"
-			  ".chip 68k" : : "m" (*sc->sc_fpstate));
+
+	__asm__ volatile ("frestore %0" : : "m" (*sc->sc_fpstate));
 	err = 0;
 
 out:
@@ -249,7 +267,7 @@ out:
 static inline int rt_restore_fpu_state(struct ucontext __user *uc)
 {
 	unsigned char fpstate[FPCONTEXT_SIZE];
-	int context_size = CPU_IS_060 ? 8 : 0;
+	int context_size = CPU_IS_060 ? 8 : (CPU_IS_COLDFIRE ? 12 : 0);
 	fpregset_t fpregs;
 	int err = 1;
 
@@ -268,10 +286,11 @@ static inline int rt_restore_fpu_state(struct ucontext __user *uc)
 	if (__get_user(*(long *)fpstate, (long __user *)&uc->uc_fpstate))
 		goto out;
 	if (CPU_IS_060 ? fpstate[2] : fpstate[0]) {
-		if (!CPU_IS_060)
+		if (!(CPU_IS_060 || CPU_IS_COLDFIRE))
 			context_size = fpstate[1];
 		/* Verify the frame format.  */
-		if (!CPU_IS_060 && (fpstate[0] != fpu_version))
+		if (!(CPU_IS_060 || CPU_IS_COLDFIRE) &&
+		     (fpstate[0] != fpu_version))
 			goto out;
 		if (CPU_IS_020_OR_030) {
 			if (m68k_fputype & FPU_68881 &&
@@ -290,26 +309,42 @@ static inline int rt_restore_fpu_state(struct ucontext __user *uc)
 			      fpstate[3] == 0x60 ||
 			      fpstate[3] == 0xe0))
 				goto out;
+		} else if (CPU_IS_COLDFIRE) {
+			if (!(fpstate[3] == 0x00 ||
+			      fpstate[3] == 0x05 ||
+			      fpstate[3] == 0xe5))
+				goto out;
 		} else
 			goto out;
 		if (__copy_from_user(&fpregs, &uc->uc_mcontext.fpregs,
 				     sizeof(fpregs)))
 			goto out;
-		__asm__ volatile (".chip 68k/68881\n\t"
-				  "fmovemx %0,%%fp0-%%fp7\n\t"
-				  "fmoveml %1,%%fpcr/%%fpsr/%%fpiar\n\t"
-				  ".chip 68k"
-				  : /* no outputs */
-				  : "m" (*fpregs.f_fpregs),
-				    "m" (*fpregs.f_fpcntl));
+
+		if (CPU_IS_COLDFIRE) {
+			__asm__ volatile ("fmovemd %0,%%fp0-%%fp7\n\t"
+					  "fmovel %1,%%fpcr\n\t"
+					  "fmovel %2,%%fpsr\n\t"
+					  "fmovel %3,%%fpiar"
+					  : /* no outputs */
+					  : "m" (fpregs.f_fpregs[0]),
+					    "m" (fpregs.f_fpcntl[0]),
+					    "m" (fpregs.f_fpcntl[1]),
+					    "m" (fpregs.f_fpcntl[2]));
+		} else {
+			__asm__ volatile (".chip 68k/68881\n\t"
+					  "fmovemx %0,%%fp0-%%fp7\n\t"
+					  "fmoveml %1,%%fpcr/%%fpsr/%%fpiar\n\t"
+					  ".chip 68k"
+					  : /* no outputs */
+					  : "m" (*fpregs.f_fpregs),
+					    "m" (*fpregs.f_fpcntl));
+		}
 	}
 	if (context_size &&
 	    __copy_from_user(fpstate + 4, (long __user *)&uc->uc_fpstate + 1,
 			     context_size))
 		goto out;
-	__asm__ volatile (".chip 68k/68881\n\t"
-			  "frestore %0\n\t"
-			  ".chip 68k" : : "m" (*fpstate));
+	__asm__ volatile ("frestore %0" : : "m" (*fpstate));
 	err = 0;
 
 out:
@@ -529,10 +564,7 @@ static inline void save_fpu_state(struct sigcontext *sc, struct pt_regs *regs)
 		return;
 	}
 
-	__asm__ volatile (".chip 68k/68881\n\t"
-			  "fsave %0\n\t"
-			  ".chip 68k"
-			  : : "m" (*sc->sc_fpstate) : "memory");
+	__asm__ volatile ("fsave %0" : : "m" (*sc->sc_fpstate) : "memory");
 
 	if (CPU_IS_060 ? sc->sc_fpstate[2] : sc->sc_fpstate[0]) {
 		fpu_version = sc->sc_fpstate[0];
@@ -543,21 +575,35 @@ static inline void save_fpu_state(struct sigcontext *sc, struct pt_regs *regs)
 			if (*(unsigned short *) sc->sc_fpstate == 0x1f38)
 				sc->sc_fpstate[0x38] |= 1 << 3;
 		}
-		__asm__ volatile (".chip 68k/68881\n\t"
-				  "fmovemx %%fp0-%%fp1,%0\n\t"
-				  "fmoveml %%fpcr/%%fpsr/%%fpiar,%1\n\t"
-				  ".chip 68k"
-				  : "=m" (*sc->sc_fpregs),
-				    "=m" (*sc->sc_fpcntl)
-				  : /* no inputs */
-				  : "memory");
+
+		if (CPU_IS_COLDFIRE) {
+			__asm__ volatile ("fmovemd %%fp0-%%fp1,%0\n\t"
+					  "fmovel %%fpcr,%1\n\t"
+					  "fmovel %%fpsr,%2\n\t"
+					  "fmovel %%fpiar,%3"
+					  : "=m" (sc->sc_fpregs[0]),
+					    "=m" (sc->sc_fpcntl[0]),
+					    "=m" (sc->sc_fpcntl[1]),
+					    "=m" (sc->sc_fpcntl[2])
+					  : /* no inputs */
+					  : "memory");
+		} else {
+			__asm__ volatile (".chip 68k/68881\n\t"
+					  "fmovemx %%fp0-%%fp1,%0\n\t"
+					  "fmoveml %%fpcr/%%fpsr/%%fpiar,%1\n\t"
+					  ".chip 68k"
+					  : "=m" (*sc->sc_fpregs),
+					    "=m" (*sc->sc_fpcntl)
+					  : /* no inputs */
+					  : "memory");
+		}
 	}
 }
 
 static inline int rt_save_fpu_state(struct ucontext __user *uc, struct pt_regs *regs)
 {
 	unsigned char fpstate[FPCONTEXT_SIZE];
-	int context_size = CPU_IS_060 ? 8 : 0;
+	int context_size = CPU_IS_060 ? 8 : (CPU_IS_COLDFIRE ? 12 : 0);
 	int err = 0;
 
 	if (FPU_IS_EMU) {
@@ -570,15 +616,12 @@ static inline int rt_save_fpu_state(struct ucontext __user *uc, struct pt_regs *
 		return err;
 	}
 
-	__asm__ volatile (".chip 68k/68881\n\t"
-			  "fsave %0\n\t"
-			  ".chip 68k"
-			  : : "m" (*fpstate) : "memory");
+	__asm__ volatile ("fsave %0" : : "m" (*fpstate) : "memory");
 
 	err |= __put_user(*(long *)fpstate, (long __user *)&uc->uc_fpstate);
 	if (CPU_IS_060 ? fpstate[2] : fpstate[0]) {
 		fpregset_t fpregs;
-		if (!CPU_IS_060)
+		if (!(CPU_IS_060 || CPU_IS_COLDFIRE))
 			context_size = fpstate[1];
 		fpu_version = fpstate[0];
 		if (CPU_IS_020_OR_030 &&
@@ -588,14 +631,27 @@ static inline int rt_save_fpu_state(struct ucontext __user *uc, struct pt_regs *
 			if (*(unsigned short *) fpstate == 0x1f38)
 				fpstate[0x38] |= 1 << 3;
 		}
-		__asm__ volatile (".chip 68k/68881\n\t"
-				  "fmovemx %%fp0-%%fp7,%0\n\t"
-				  "fmoveml %%fpcr/%%fpsr/%%fpiar,%1\n\t"
-				  ".chip 68k"
-				  : "=m" (*fpregs.f_fpregs),
-				    "=m" (*fpregs.f_fpcntl)
-				  : /* no inputs */
-				  : "memory");
+		if (CPU_IS_COLDFIRE) {
+			__asm__ volatile ("fmovemd %%fp0-%%fp7,%0\n\t"
+					  "fmovel %%fpcr,%1\n\t"
+					  "fmovel %%fpsr,%2\n\t"
+					  "fmovel %%fpiar,%3"
+					  : "=m" (fpregs.f_fpregs[0]),
+					    "=m" (fpregs.f_fpcntl[0]),
+					    "=m" (fpregs.f_fpcntl[1]),
+					    "=m" (fpregs.f_fpcntl[2])
+					  : /* no inputs */
+					  : "memory");
+		} else {
+			__asm__ volatile (".chip 68k/68881\n\t"
+					  "fmovemx %%fp0-%%fp7,%0\n\t"
+					  "fmoveml %%fpcr/%%fpsr/%%fpiar,%1\n\t"
+					  ".chip 68k"
+					  : "=m" (*fpregs.f_fpregs),
+					    "=m" (*fpregs.f_fpcntl)
+					  : /* no inputs */
+					  : "memory");
+		}
 		err |= copy_to_user(&uc->uc_mcontext.fpregs, &fpregs,
 				    sizeof(fpregs));
 	}
@@ -693,7 +749,7 @@ static inline void push_cache (unsigned long vaddr)
 				      ".chip 68k"
 				      : : "a" (temp));
 	}
-	else {
+	else if (!CPU_IS_COLDFIRE) {
 		/*
 		 * 68030/68020 have no writeback cache;
 		 * still need to clear icache.
-- 
1.7.0.4
