From: <gerg@snapgear.com>
Subject: [PATCH] m68k: merge mmu and non-mmu include/asm/entry.h files
Date: Thu, 23 Jun 2011 12:10:23 +1000
Message-ID: <1308795023-23722-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:22460 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758245Ab1FWCKY (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 22 Jun 2011 22:10:24 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The changes in the mmu version of entry.h (entry_mm.h) and the non-mmu
version (entry_no.h) are not about the presence or use of an MMU at all.
The main changes are to support the ColdFire processors. The code for
trap entry and exit for all types of 68k processor outside coldfire is
the same.

So merge the files back to a single entry.h and share the common 68k
entry/exit code. Some changes are required for the non-mmu entry
handlers to adopt the differing macros for system call and interrupt
entry, but this is quite strait forward. The changes for the ColdFire
remove a couple of instructions for the separate a7 register case, and
are no worse for the older single a7 register case.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/entry.h       |  255 ++++++++++++++++++++++++++++++++++-
 arch/m68k/include/asm/entry_mm.h    |  128 ------------------
 arch/m68k/include/asm/entry_no.h    |  181 -------------------------
 arch/m68k/kernel/entry_no.S         |    6 +-
 arch/m68k/platform/68328/entry.S    |   18 ++--
 arch/m68k/platform/68360/entry.S    |    4 +-
 arch/m68k/platform/coldfire/entry.S |    6 +-
 7 files changed, 268 insertions(+), 330 deletions(-)
 delete mode 100644 arch/m68k/include/asm/entry_mm.h
 delete mode 100644 arch/m68k/include/asm/entry_no.h

diff --git a/arch/m68k/include/asm/entry.h b/arch/m68k/include/asm/entry.h
index 876eec6..c3c5a86 100644
--- a/arch/m68k/include/asm/entry.h
+++ b/arch/m68k/include/asm/entry.h
@@ -1,5 +1,254 @@
-#ifdef __uClinux__
-#include "entry_no.h"
+#ifndef __M68K_ENTRY_H
+#define __M68K_ENTRY_H
+
+#include <asm/setup.h>
+#include <asm/page.h>
+#ifdef __ASSEMBLY__
+#include <asm/thread_info.h>
+#endif
+
+/*
+ * Stack layout in 'ret_from_exception':
+ *
+ *	This allows access to the syscall arguments in registers d1-d5
+ *
+ *	 0(sp) - d1
+ *	 4(sp) - d2
+ *	 8(sp) - d3
+ *	 C(sp) - d4
+ *	10(sp) - d5
+ *	14(sp) - a0
+ *	18(sp) - a1
+ *	1C(sp) - a2
+ *	20(sp) - d0
+ *	24(sp) - orig_d0
+ *	28(sp) - stack adjustment
+ *	2C(sp) - [ sr              ] [ format & vector ]
+ *	2E(sp) - [ pc-hiword       ] [ sr              ]
+ *	30(sp) - [ pc-loword       ] [ pc-hiword       ]
+ *	32(sp) - [ format & vector ] [ pc-loword       ]
+ *		  ^^^^^^^^^^^^^^^^^   ^^^^^^^^^^^^^^^^^
+ *			M68K		  COLDFIRE
+ */
+
+/* the following macro is used when enabling interrupts */
+#if defined(MACH_ATARI_ONLY)
+	/* block out HSYNC on the atari */
+#define ALLOWINT	(~0x400)
+#define	MAX_NOINT_IPL	3
 #else
-#include "entry_mm.h"
+	/* portable version */
+#define ALLOWINT	(~0x700)
+#define	MAX_NOINT_IPL	0
+#endif /* machine compilation types */
+
+#ifdef __ASSEMBLY__
+/*
+ * This defines the normal kernel pt-regs layout.
+ *
+ * regs a3-a6 and d6-d7 are preserved by C code
+ * the kernel doesn't mess with usp unless it needs to
+ */
+#define SWITCH_STACK_SIZE	(6*4+4)	/* includes return address */
+
+#ifdef CONFIG_COLDFIRE
+#ifdef CONFIG_COLDFIRE_SW_A7
+/*
+ * This is made a little more tricky on older ColdFires. There is no
+ * separate supervisor and user stack pointers. Need to artificially
+ * construct a usp in software... When doing this we need to disable
+ * interrupts, otherwise bad things will happen.
+ */
+.globl sw_usp
+.globl sw_ksp
+
+.macro SAVE_ALL_SYS
+	move	#0x2700,%sr		/* disable intrs */
+	btst	#5,%sp@(2)		/* from user? */
+	bnes	6f			/* no, skip */
+	movel	%sp,sw_usp		/* save user sp */
+	addql	#8,sw_usp		/* remove exception */
+	movel	sw_ksp,%sp		/* kernel sp */
+	subql	#8,%sp			/* room for exception */
+	clrl	%sp@-			/* stkadj */
+	movel	%d0,%sp@-		/* orig d0 */
+	movel	%d0,%sp@-		/* d0 */
+	lea	%sp@(-32),%sp		/* space for 8 regs */
+	moveml	%d1-%d5/%a0-%a2,%sp@
+	movel	sw_usp,%a0		/* get usp */
+	movel	%a0@-,%sp@(PT_OFF_PC)	/* copy exception program counter */
+	movel	%a0@-,%sp@(PT_OFF_FORMATVEC)/*copy exception format/vector/sr */
+	bra	7f
+	6:
+	clrl	%sp@-			/* stkadj */
+	movel	%d0,%sp@-		/* orig d0 */
+	movel	%d0,%sp@-		/* d0 */
+	lea	%sp@(-32),%sp		/* space for 8 regs */
+	moveml	%d1-%d5/%a0-%a2,%sp@
+	7:
+.endm
+
+.macro SAVE_ALL_INT
+	SAVE_ALL_SYS
+	moveq	#-1,%d0			/* not system call entry */
+	movel	%d0,%sp@(PT_OFF_ORIG_D0)
+.endm
+
+.macro RESTORE_USER
+	move	#0x2700,%sr		/* disable intrs */
+	movel	sw_usp,%a0		/* get usp */
+	movel	%sp@(PT_OFF_PC),%a0@-	/* copy exception program counter */
+	movel	%sp@(PT_OFF_FORMATVEC),%a0@-/*copy exception format/vector/sr */
+	moveml	%sp@,%d1-%d5/%a0-%a2
+	lea	%sp@(32),%sp		/* space for 8 regs */
+	movel	%sp@+,%d0
+	addql	#4,%sp			/* orig d0 */
+	addl	%sp@+,%sp		/* stkadj */
+	addql	#8,%sp			/* remove exception */
+	movel	%sp,sw_ksp		/* save ksp */
+	subql	#8,sw_usp		/* set exception */
+	movel	sw_usp,%sp		/* restore usp */
+	rte
+.endm
+
+.macro RDUSP
+	movel	sw_usp,%a3
+.endm
+
+.macro WRUSP
+	movel	%a3,sw_usp
+.endm
+
+#else /* !CONFIG_COLDFIRE_SW_A7 */
+/*
+ * Modern ColdFire parts have separate supervisor and user stack
+ * pointers. Simple load and restore macros for this case.
+ */
+.macro SAVE_ALL_SYS
+	move	#0x2700,%sr		/* disable intrs */
+	clrl	%sp@-			/* stkadj */
+	movel	%d0,%sp@-		/* orig d0 */
+	movel	%d0,%sp@-		/* d0 */
+	lea	%sp@(-32),%sp		/* space for 8 regs */
+	moveml	%d1-%d5/%a0-%a2,%sp@
+.endm
+
+.macro SAVE_ALL_INT
+	move	#0x2700,%sr		/* disable intrs */
+	clrl	%sp@-			/* stkadj */
+	pea	-1:w			/* orig d0 */
+	movel	%d0,%sp@-		/* d0 */
+	lea	%sp@(-32),%sp		/* space for 8 regs */
+	moveml	%d1-%d5/%a0-%a2,%sp@
+.endm
+
+.macro RESTORE_USER
+	moveml	%sp@,%d1-%d5/%a0-%a2
+	lea	%sp@(32),%sp		/* space for 8 regs */
+	movel	%sp@+,%d0
+	addql	#4,%sp			/* orig d0 */
+	addl	%sp@+,%sp		/* stkadj */
+	rte
+.endm
+
+.macro RDUSP
+	/*move	%usp,%a3*/
+	.word	0x4e6b
+.endm
+
+.macro WRUSP
+	/*move	%a3,%usp*/
+	.word	0x4e63
+.endm
+
+#endif /* !CONFIG_COLDFIRE_SW_A7 */
+
+.macro SAVE_SWITCH_STACK
+	lea	%sp@(-24),%sp		/* 6 regs */
+	moveml	%a3-%a6/%d6-%d7,%sp@
+.endm
+
+.macro RESTORE_SWITCH_STACK
+	moveml	%sp@,%a3-%a6/%d6-%d7
+	lea	%sp@(24),%sp		/* 6 regs */
+.endm
+
+#else /* !CONFIG_COLDFIRE */
+
+/*
+ * All other types of m68k parts (68000, 680x0, CPU32) have the same
+ * entry and exit code.
+ */
+
+/*
+ * a -1 in the orig_d0 field signifies
+ * that the stack frame is NOT for syscall
+ */
+.macro SAVE_ALL_INT
+	clrl	%sp@-			/* stk_adj */
+	pea	-1:w			/* orig d0 */
+	movel	%d0,%sp@-		/* d0 */
+	moveml	%d1-%d5/%a0-%a2,%sp@-
+.endm
+
+.macro SAVE_ALL_SYS
+	clrl	%sp@-			/* stk_adj */
+	movel	%d0,%sp@-		/* orig d0 */
+	movel	%d0,%sp@-		/* d0 */
+	moveml	%d1-%d5/%a0-%a2,%sp@-
+.endm
+
+.macro RESTORE_ALL
+	moveml	%sp@+,%a0-%a2/%d1-%d5
+	movel	%sp@+,%d0
+	addql	#4,%sp			/* orig d0 */
+	addl	%sp@+,%sp		/* stk adj */
+	rte
+.endm
+
+
+.macro SAVE_SWITCH_STACK
+	moveml	%a3-%a6/%d6-%d7,%sp@-
+.endm
+
+.macro RESTORE_SWITCH_STACK
+	moveml	%sp@+,%a3-%a6/%d6-%d7
+.endm
+
+#endif /* !CONFIG_COLDFIRE */
+
+/*
+ * Register %a2 is reserved and set to current task on MMU enabled systems.
+ * Non-MMU systems do not reserve %a2 in this way, and this definition is
+ * not used for them.
+ */
+#define curptr a2
+
+#define GET_CURRENT(tmp) get_current tmp
+.macro get_current reg=%d0
+	movel	%sp,\reg
+	andw	#-THREAD_SIZE,\reg
+	movel	\reg,%curptr
+	movel	%curptr@,%curptr
+.endm
+
+#else /* C source */
+
+#define STR(X) STR1(X)
+#define STR1(X) #X
+
+#define SAVE_ALL_INT				\
+	"clrl	%%sp@-;"    /* stk_adj */	\
+	"pea	-1:w;"	    /* orig d0 = -1 */	\
+	"movel	%%d0,%%sp@-;" /* d0 */		\
+	"moveml	%%d1-%%d5/%%a0-%%a2,%%sp@-"
+
+#define GET_CURRENT(tmp) \
+	"movel	%%sp,"#tmp"\n\t" \
+	"andw	#-"STR(THREAD_SIZE)","#tmp"\n\t" \
+	"movel	"#tmp",%%a2\n\t" \
+	"movel	%%a2@,%%a2"
+
 #endif
+
+#endif /* __M68K_ENTRY_H */
diff --git a/arch/m68k/include/asm/entry_mm.h b/arch/m68k/include/asm/entry_mm.h
deleted file mode 100644
index 73b8c8f..0000000
--- a/arch/m68k/include/asm/entry_mm.h
+++ /dev/null
@@ -1,128 +0,0 @@
-#ifndef __M68K_ENTRY_H
-#define __M68K_ENTRY_H
-
-#include <asm/setup.h>
-#include <asm/page.h>
-#ifdef __ASSEMBLY__
-#include <asm/thread_info.h>
-#endif
-
-/*
- * Stack layout in 'ret_from_exception':
- *
- *	This allows access to the syscall arguments in registers d1-d5
- *
- *	 0(sp) - d1
- *	 4(sp) - d2
- *	 8(sp) - d3
- *	 C(sp) - d4
- *	10(sp) - d5
- *	14(sp) - a0
- *	18(sp) - a1
- *	1C(sp) - a2
- *	20(sp) - d0
- *	24(sp) - orig_d0
- *	28(sp) - stack adjustment
- *	2C(sp) - sr
- *	2E(sp) - pc
- *	32(sp) - format & vector
- */
-
-/*
- * 97/05/14 Andreas: Register %a2 is now set to the current task throughout
- *		     the whole kernel.
- */
-
-/* the following macro is used when enabling interrupts */
-#if defined(MACH_ATARI_ONLY)
-	/* block out HSYNC on the atari */
-#define ALLOWINT	(~0x400)
-#define	MAX_NOINT_IPL	3
-#else
-	/* portable version */
-#define ALLOWINT	(~0x700)
-#define	MAX_NOINT_IPL	0
-#endif /* machine compilation types */
-
-#ifdef __ASSEMBLY__
-
-#define curptr a2
-
-LFLUSH_I_AND_D = 0x00000808
-
-#define SAVE_ALL_INT save_all_int
-#define SAVE_ALL_SYS save_all_sys
-#define RESTORE_ALL restore_all
-/*
- * This defines the normal kernel pt-regs layout.
- *
- * regs a3-a6 and d6-d7 are preserved by C code
- * the kernel doesn't mess with usp unless it needs to
- */
-
-/*
- * a -1 in the orig_d0 field signifies
- * that the stack frame is NOT for syscall
- */
-.macro	save_all_int
-	clrl	%sp@-		| stk_adj
-	pea	-1:w		| orig d0
-	movel	%d0,%sp@-	| d0
-	moveml	%d1-%d5/%a0-%a1/%curptr,%sp@-
-.endm
-
-.macro	save_all_sys
-	clrl	%sp@-		| stk_adj
-	movel	%d0,%sp@-	| orig d0
-	movel	%d0,%sp@-	| d0
-	moveml	%d1-%d5/%a0-%a1/%curptr,%sp@-
-.endm
-
-.macro	restore_all
-	moveml	%sp@+,%a0-%a1/%curptr/%d1-%d5
-	movel	%sp@+,%d0
-	addql	#4,%sp		| orig d0
-	addl	%sp@+,%sp	| stk adj
-	rte
-.endm
-
-#define SWITCH_STACK_SIZE (6*4+4)	/* includes return address */
-
-#define SAVE_SWITCH_STACK save_switch_stack
-#define RESTORE_SWITCH_STACK restore_switch_stack
-#define GET_CURRENT(tmp) get_current tmp
-
-.macro	save_switch_stack
-	moveml	%a3-%a6/%d6-%d7,%sp@-
-.endm
-
-.macro	restore_switch_stack
-	moveml	%sp@+,%a3-%a6/%d6-%d7
-.endm
-
-.macro	get_current reg=%d0
-	movel	%sp,\reg
-	andw	#-THREAD_SIZE,\reg
-	movel	\reg,%curptr
-	movel	%curptr@,%curptr
-.endm
-
-#else /* C source */
-
-#define STR(X) STR1(X)
-#define STR1(X) #X
-
-#define SAVE_ALL_INT				\
-	"clrl	%%sp@-;"    /* stk_adj */	\
-	"pea	-1:w;"	    /* orig d0 = -1 */	\
-	"movel	%%d0,%%sp@-;" /* d0 */		\
-	"moveml	%%d1-%%d5/%%a0-%%a2,%%sp@-"
-#define GET_CURRENT(tmp) \
-	"movel	%%sp,"#tmp"\n\t" \
-	"andw	#-"STR(THREAD_SIZE)","#tmp"\n\t" \
-	"movel	"#tmp",%%a2\n\t" \
-	"movel	%%a2@,%%a2"
-
-#endif
-
-#endif /* __M68K_ENTRY_H */
diff --git a/arch/m68k/include/asm/entry_no.h b/arch/m68k/include/asm/entry_no.h
deleted file mode 100644
index 627d69b..0000000
--- a/arch/m68k/include/asm/entry_no.h
+++ /dev/null
@@ -1,181 +0,0 @@
-#ifndef __M68KNOMMU_ENTRY_H
-#define __M68KNOMMU_ENTRY_H
-
-#include <asm/setup.h>
-#include <asm/page.h>
-
-/*
- * Stack layout in 'ret_from_exception':
- *
- * This allows access to the syscall arguments in registers d1-d5
- *
- *	 0(sp) - d1
- *	 4(sp) - d2
- *	 8(sp) - d3
- *	 C(sp) - d4
- *	10(sp) - d5
- *	14(sp) - a0
- *	18(sp) - a1
- *	1C(sp) - a2
- *	20(sp) - d0
- *	24(sp) - orig_d0
- *	28(sp) - stack adjustment
- *	2C(sp) - [ sr              ] [ format & vector ]
- *	2E(sp) - [ pc-hiword       ] [ sr              ]
- *	30(sp) - [ pc-loword       ] [ pc-hiword       ]
- *	32(sp) - [ format & vector ] [ pc-loword       ]
- *		  ^^^^^^^^^^^^^^^^^   ^^^^^^^^^^^^^^^^^
- *			M68K		  COLDFIRE
- */
-
-#define ALLOWINT (~0x700)
-
-#ifdef __ASSEMBLY__
-
-#define SWITCH_STACK_SIZE (6*4+4)	/* Includes return address */
-
-/*
- * This defines the normal kernel pt-regs layout.
- *
- * regs are a2-a6 and d6-d7 preserved by C code
- * the kernel doesn't mess with usp unless it needs to
- */
-
-#ifdef CONFIG_COLDFIRE
-#ifdef CONFIG_COLDFIRE_SW_A7
-/*
- * This is made a little more tricky on older ColdFires. There is no
- * separate supervisor and user stack pointers. Need to artificially
- * construct a usp in software... When doing this we need to disable
- * interrupts, otherwise bad things will happen.
- */
-.globl sw_usp
-.globl sw_ksp
-
-.macro SAVE_ALL
-	move	#0x2700,%sr		/* disable intrs */
-	btst	#5,%sp@(2)		/* from user? */
-	bnes	6f			/* no, skip */
-	movel	%sp,sw_usp		/* save user sp */
-	addql	#8,sw_usp		/* remove exception */
-	movel	sw_ksp,%sp		/* kernel sp */
-	subql	#8,%sp			/* room for exception */
-	clrl	%sp@-			/* stkadj */
-	movel	%d0,%sp@-		/* orig d0 */
-	movel	%d0,%sp@-		/* d0 */
-	lea	%sp@(-32),%sp		/* space for 8 regs */
-	moveml	%d1-%d5/%a0-%a2,%sp@
-	movel	sw_usp,%a0		/* get usp */
-	movel	%a0@-,%sp@(PT_OFF_PC)	/* copy exception program counter */
-	movel	%a0@-,%sp@(PT_OFF_FORMATVEC)/*copy exception format/vector/sr */
-	bra	7f
-	6:
-	clrl	%sp@-			/* stkadj */
-	movel	%d0,%sp@-		/* orig d0 */
-	movel	%d0,%sp@-		/* d0 */
-	lea	%sp@(-32),%sp		/* space for 8 regs */
-	moveml	%d1-%d5/%a0-%a2,%sp@
-	7:
-.endm
-
-.macro RESTORE_USER
-	move	#0x2700,%sr		/* disable intrs */
-	movel	sw_usp,%a0		/* get usp */
-	movel	%sp@(PT_OFF_PC),%a0@-	/* copy exception program counter */
-	movel	%sp@(PT_OFF_FORMATVEC),%a0@-/*copy exception format/vector/sr */
-	moveml	%sp@,%d1-%d5/%a0-%a2
-	lea	%sp@(32),%sp		/* space for 8 regs */
-	movel	%sp@+,%d0
-	addql	#4,%sp			/* orig d0 */
-	addl	%sp@+,%sp		/* stkadj */
-	addql	#8,%sp			/* remove exception */
-	movel	%sp,sw_ksp		/* save ksp */
-	subql	#8,sw_usp		/* set exception */
-	movel	sw_usp,%sp		/* restore usp */
-	rte
-.endm
-
-.macro RDUSP
-	movel	sw_usp,%a2
-.endm
-
-.macro WRUSP
-	movel	%a0,sw_usp
-.endm
-
-#else /* !CONFIG_COLDFIRE_SW_A7 */
-/*
- * Modern ColdFire parts have separate supervisor and user stack
- * pointers. Simple load and restore macros for this case.
- */
-.macro SAVE_ALL
-	move	#0x2700,%sr		/* disable intrs */
-	clrl	%sp@-			/* stkadj */
-	movel	%d0,%sp@-		/* orig d0 */
-	movel	%d0,%sp@-		/* d0 */
-	lea	%sp@(-32),%sp		/* space for 8 regs */
-	moveml	%d1-%d5/%a0-%a2,%sp@
-.endm
-
-.macro RESTORE_USER
-	moveml	%sp@,%d1-%d5/%a0-%a2
-	lea	%sp@(32),%sp		/* space for 8 regs */
-	movel	%sp@+,%d0
-	addql	#4,%sp			/* orig d0 */
-	addl	%sp@+,%sp		/* stkadj */
-	rte
-.endm
-
-.macro RDUSP
-	/*move	%usp,%a2*/
-	.word	0x4e6a
-.endm
-
-.macro WRUSP
-	/*move	%a0,%usp*/
-	.word	0x4e60
-.endm
-
-#endif /* !CONFIG_COLDFIRE_SW_A7 */
-
-.macro SAVE_SWITCH_STACK
-	lea	%sp@(-24),%sp		/* 6 regs */
-	moveml	%a3-%a6/%d6-%d7,%sp@
-.endm
-
-.macro RESTORE_SWITCH_STACK
-	moveml	%sp@,%a3-%a6/%d6-%d7
-	lea	%sp@(24),%sp		/* 6 regs */
-.endm
-
-#else /* !CONFIG_COLDFIRE */
-
-/*
- * Standard 68k interrupt entry and exit macros.
- */
-.macro SAVE_ALL
-	clrl	%sp@-			/* stkadj */
-	movel	%d0,%sp@-		/* orig d0 */
-	movel	%d0,%sp@-		/* d0 */
-	moveml	%d1-%d5/%a0-%a2,%sp@-
-.endm
-
-.macro RESTORE_ALL
-	moveml	%sp@+,%a0-%a2/%d1-%d5
-	movel	%sp@+,%d0
-	addql	#4,%sp			/* orig d0 */
-	addl	%sp@+,%sp		/* stkadj */
-	rte
-.endm
-
-.macro SAVE_SWITCH_STACK
-	moveml	%a3-%a6/%d6-%d7,%sp@-
-.endm
-
-.macro RESTORE_SWITCH_STACK
-	moveml	%sp@+,%a3-%a6/%d6-%d7
-.endm
-
-#endif /* !COLDFIRE_SW_A7 */
-#endif /* __ASSEMBLY__ */
-#endif /* __M68KNOMMU_ENTRY_H */
diff --git a/arch/m68k/kernel/entry_no.S b/arch/m68k/kernel/entry_no.S
index 5f0f6b5..1b42890 100644
--- a/arch/m68k/kernel/entry_no.S
+++ b/arch/m68k/kernel/entry_no.S
@@ -43,7 +43,7 @@
 .globl sys_vfork
 
 ENTRY(buserr)
-	SAVE_ALL
+	SAVE_ALL_INT
 	moveq	#-1,%d0
 	movel	%d0,%sp@(PT_OFF_ORIG_D0)
 	movel	%sp,%sp@- 		/* stack frame pointer argument */
@@ -52,7 +52,7 @@ ENTRY(buserr)
 	jra	ret_from_exception
 
 ENTRY(trap)
-	SAVE_ALL
+	SAVE_ALL_INT
 	moveq	#-1,%d0
 	movel	%d0,%sp@(PT_OFF_ORIG_D0)
 	movel	%sp,%sp@- 		/* stack frame pointer argument */
@@ -64,7 +64,7 @@ ENTRY(trap)
 
 .globl dbginterrupt
 ENTRY(dbginterrupt)
-	SAVE_ALL
+	SAVE_ALL_INT
 	moveq	#-1,%d0
 	movel	%d0,%sp@(PT_OFF_ORIG_D0)
 	movel	%sp,%sp@- 		/* stack frame pointer argument */
diff --git a/arch/m68k/platform/68328/entry.S b/arch/m68k/platform/68328/entry.S
index f68dce7..4f3e612 100644
--- a/arch/m68k/platform/68328/entry.S
+++ b/arch/m68k/platform/68328/entry.S
@@ -67,7 +67,7 @@ ret_from_signal:
 	jra	ret_from_exception
 
 ENTRY(system_call)
-	SAVE_ALL
+	SAVE_ALL_SYS
 
 	/* save top of frame*/
 	pea	%sp@
@@ -129,7 +129,7 @@ Lsignal_return:
  * This is the main interrupt handler, responsible for calling process_int()
  */
 inthandler1:
-	SAVE_ALL
+	SAVE_ALL_INT
 	movew	%sp@(PT_OFF_FORMATVEC), %d0
 	and	#0x3ff, %d0
 
@@ -140,7 +140,7 @@ inthandler1:
 	bra	ret_from_interrupt
 
 inthandler2:
-	SAVE_ALL
+	SAVE_ALL_INT
 	movew	%sp@(PT_OFF_FORMATVEC), %d0
 	and	#0x3ff, %d0
 
@@ -151,7 +151,7 @@ inthandler2:
 	bra	ret_from_interrupt
 
 inthandler3:
-	SAVE_ALL
+	SAVE_ALL_INT
 	movew	%sp@(PT_OFF_FORMATVEC), %d0
 	and	#0x3ff, %d0
 
@@ -162,7 +162,7 @@ inthandler3:
 	bra	ret_from_interrupt
 
 inthandler4:
-	SAVE_ALL
+	SAVE_ALL_INT
 	movew	%sp@(PT_OFF_FORMATVEC), %d0
 	and	#0x3ff, %d0
 
@@ -173,7 +173,7 @@ inthandler4:
 	bra	ret_from_interrupt
 
 inthandler5:
-	SAVE_ALL
+	SAVE_ALL_INT
 	movew	%sp@(PT_OFF_FORMATVEC), %d0
 	and	#0x3ff, %d0
 
@@ -184,7 +184,7 @@ inthandler5:
 	bra	ret_from_interrupt
 
 inthandler6:
-	SAVE_ALL
+	SAVE_ALL_INT
 	movew	%sp@(PT_OFF_FORMATVEC), %d0
 	and	#0x3ff, %d0
 
@@ -195,7 +195,7 @@ inthandler6:
 	bra	ret_from_interrupt
 
 inthandler7:
-	SAVE_ALL
+	SAVE_ALL_INT
 	movew	%sp@(PT_OFF_FORMATVEC), %d0
 	and	#0x3ff, %d0
 
@@ -206,7 +206,7 @@ inthandler7:
 	bra	ret_from_interrupt
 
 inthandler:
-	SAVE_ALL
+	SAVE_ALL_INT
 	movew	%sp@(PT_OFF_FORMATVEC), %d0
 	and	#0x3ff, %d0
 
diff --git a/arch/m68k/platform/68360/entry.S b/arch/m68k/platform/68360/entry.S
index a07b14f..b0d7fba 100644
--- a/arch/m68k/platform/68360/entry.S
+++ b/arch/m68k/platform/68360/entry.S
@@ -63,7 +63,7 @@ ret_from_signal:
 	jra	ret_from_exception
 
 ENTRY(system_call)
-	SAVE_ALL
+	SAVE_ALL_SYS
 
 	/* save top of frame*/
 	pea	%sp@
@@ -125,7 +125,7 @@ Lsignal_return:
  * This is the main interrupt handler, responsible for calling do_IRQ()
  */
 inthandler:
-	SAVE_ALL
+	SAVE_ALL_INT
 	movew	%sp@(PT_OFF_FORMATVEC), %d0
 	and.l	#0x3ff, %d0
 	lsr.l   #0x02,  %d0
diff --git a/arch/m68k/platform/coldfire/entry.S b/arch/m68k/platform/coldfire/entry.S
index 27c2b00..a3fbf34 100644
--- a/arch/m68k/platform/coldfire/entry.S
+++ b/arch/m68k/platform/coldfire/entry.S
@@ -61,7 +61,7 @@ enosys:
 	bra	1f
 
 ENTRY(system_call)
-	SAVE_ALL
+	SAVE_ALL_SYS
 	move	#0x2000,%sr		/* enable intrs again */
 
 	cmpl	#NR_syscalls,%d0
@@ -165,9 +165,7 @@ Lsignal_return:
  * sources). Calls up to high level code to do all the work.
  */
 ENTRY(inthandler)
-	SAVE_ALL
-	moveq	#-1,%d0
-	movel	%d0,%sp@(PT_OFF_ORIG_D0)
+	SAVE_ALL_INT
 
 	movew	%sp@(PT_OFF_FORMATVEC),%d0 /* put exception # in d0 */
 	andl	#0x03fc,%d0		/* mask out vector only */
-- 
1.7.0.4
