From: Greg Ungerer <gerg@uclinux.org>
Subject: [PATCH] m68k: use conventional function parameters for do_sigreturn
Date: Tue, 19 Jan 2016 15:56:58 +1000
Message-ID: <1453183018-11722-1-git-send-email-gerg@uclinux.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out8.external.iinet.net.au ([203.59.1.225]:11334
	"EHLO icp-osb-irony-out8.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750930AbcASF5O (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Tue, 19 Jan 2016 00:57:14 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@uclinux.org>

Create conventional stack parameters for the calls to do_sigreturn and
do_rt_sigreturn. The current C code for do_sigreturn and do_rt_sigreturn
dig into the stack to create local pointers to the saved switch stack
and the pt_regs structs.

Using conventional stack parameters passed to these functions means the
code here does not need to know the exact details of how the underlying
entry handler layed these structs out on the stack.

The motivation for this change is a problem with non-MMU targets that
have broken signal return paths on newer versions of gcc. It appears as
though aliasing of the regs and switch stack pointers, caused by their
construction from pointers derived from the dummy long function parameter,
is resulting in the gcc optimizer removing what it thinks is useless
updates to the regs fields. Large parts of restore_sigcontext() and
mangle_kernel_stack() functions get optimized out. Of course this results
in non-functional code causing kernel oops. This problem has been observed
with gcc version 5.2 and 5.3, and probably exists in earlier versions as
well.

The resulting code after this change is a few bytes larger (due to the
overhead of creating the stack args and their tear down). Not being hot
paths I don't think this is too much of a problem here.

This change has been compile tested on all defconfigs, and run tested on
Atari (through aranym), ColdFire with MMU (M5407EVB) and ColdFire with
no-MMU (QEMU and M5208EVB).

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/kernel/entry.S  | 6 ++++++
 arch/m68k/kernel/signal.c | 8 ++------
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/m68k/kernel/entry.S b/arch/m68k/kernel/entry.S
index b54ac7a..97cd3ea 100644
--- a/arch/m68k/kernel/entry.S
+++ b/arch/m68k/kernel/entry.S
@@ -71,13 +71,19 @@ ENTRY(__sys_vfork)
 
 ENTRY(sys_sigreturn)
 	SAVE_SWITCH_STACK
+	movel	%sp,%sp@-		  | switch_stack pointer
+	pea	%sp@(SWITCH_STACK_SIZE+4) | pt_regs pointer
 	jbsr	do_sigreturn
+	addql	#8,%sp
 	RESTORE_SWITCH_STACK
 	rts
 
 ENTRY(sys_rt_sigreturn)
 	SAVE_SWITCH_STACK
+	movel	%sp,%sp@-		  | switch_stack pointer
+	pea	%sp@(SWITCH_STACK_SIZE+4) | pt_regs pointer
 	jbsr	do_rt_sigreturn
+	addql	#8,%sp
 	RESTORE_SWITCH_STACK
 	rts
 
diff --git a/arch/m68k/kernel/signal.c b/arch/m68k/kernel/signal.c
index af1c4f3..2dcee3a 100644
--- a/arch/m68k/kernel/signal.c
+++ b/arch/m68k/kernel/signal.c
@@ -737,10 +737,8 @@ badframe:
 	return 1;
 }
 
-asmlinkage int do_sigreturn(unsigned long __unused)
+asmlinkage int do_sigreturn(struct pt_regs *regs, struct switch_stack *sw)
 {
-	struct switch_stack *sw = (struct switch_stack *) &__unused;
-	struct pt_regs *regs = (struct pt_regs *) (sw + 1);
 	unsigned long usp = rdusp();
 	struct sigframe __user *frame = (struct sigframe __user *)(usp - 4);
 	sigset_t set;
@@ -764,10 +762,8 @@ badframe:
 	return 0;
 }
 
-asmlinkage int do_rt_sigreturn(unsigned long __unused)
+asmlinkage int do_rt_sigreturn(struct pt_regs *regs, struct switch_stack *sw)
 {
-	struct switch_stack *sw = (struct switch_stack *) &__unused;
-	struct pt_regs *regs = (struct pt_regs *) (sw + 1);
 	unsigned long usp = rdusp();
 	struct rt_sigframe __user *frame = (struct rt_sigframe __user *)(usp - 4);
 	sigset_t set;
-- 
1.9.1
