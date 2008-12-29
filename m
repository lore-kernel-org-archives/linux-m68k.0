From: Andreas Schwab <schwab@suse.de>
Subject: [PATCH] m68k: wire up sys_restart_syscall
Date: Mon, 29 Dec 2008 19:34:57 +0100
Message-ID: <jezliekey6.fsf@sykes.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx1.suse.de ([195.135.220.2]:47773 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751846AbYL2Se7 (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Mon, 29 Dec 2008 13:34:59 -0500
Received: from Relay1.suse.de (relay-ext.suse.de [195.135.221.8])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.suse.de (Postfix) with ESMTP id 45495457F0
	for <linux-m68k@vger.kernel.org>; Mon, 29 Dec 2008 19:34:58 +0100 (CET)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Make restart blocks working, required for proper syscall restarting.

Signed-off-by: Andreas Schwab <schwab@suse.de>
---
 arch/m68k/kernel/entry.S  |    2 +-
 arch/m68k/kernel/signal.c |   15 +++++++++++++++
 include/asm-m68k/unistd.h |    4 +---
 3 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/kernel/entry.S b/arch/m68k/kernel/entry.S
index f28404d..5b78082 100644
--- a/arch/m68k/kernel/entry.S
+++ b/arch/m68k/kernel/entry.S
@@ -424,7 +424,7 @@ resume:
 .data
 ALIGN
 sys_call_table:
-	.long sys_ni_syscall	/* 0  -  old "setup()" system call*/
+	.long sys_restart_syscall	/* 0 - old "setup()" system call, used for =
restarting */
 	.long sys_exit
 	.long sys_fork
 	.long sys_read
diff --git a/arch/m68k/kernel/signal.c b/arch/m68k/kernel/signal.c
index d1e9220..842bfd9 100644
--- a/arch/m68k/kernel/signal.c
+++ b/arch/m68k/kernel/signal.c
@@ -348,6 +348,9 @@ restore_sigcontext(struct pt_regs *regs, struct sig=
context __user *usc, void __u
 	struct sigcontext context;
 	int err;
=20
+	/* Always make any pending restarted system calls return -EINTR */
+	current_thread_info()->restart_block.fn =3D do_no_restart_syscall;
+
 	/* get previous context */
 	if (copy_from_user(&context, usc, sizeof(context)))
 		goto badframe;
@@ -433,6 +436,9 @@ rt_restore_ucontext(struct pt_regs *regs, struct sw=
itch_stack *sw,
 	unsigned long usp;
 	int err;
=20
+	/* Always make any pending restarted system calls return -EINTR */
+	current_thread_info()->restart_block.fn =3D do_no_restart_syscall;
+
 	err =3D __get_user(temp, &uc->uc_mcontext.version);
 	if (temp !=3D MCONTEXT_VERSION)
 		goto badframe;
@@ -959,6 +965,15 @@ handle_restart(struct pt_regs *regs, struct k_siga=
ction *ka, int has_handler)
 		regs->d0 =3D -EINTR;
 		break;
=20
+	case -ERESTART_RESTARTBLOCK:
+		if (!has_handler) {
+			regs->d0 =3D __NR_restart_syscall;
+			regs->pc -=3D 2;
+			break;
+		}
+		regs->d0 =3D -EINTR;
+		break;
+
 	case -ERESTARTSYS:
 		if (has_handler && !(ka->sa.sa_flags & SA_RESTART)) {
 			regs->d0 =3D -EINTR;
diff --git a/include/asm-m68k/unistd.h b/include/asm-m68k/unistd.h
index 965abb8..3c19027 100644
--- a/include/asm-m68k/unistd.h
+++ b/include/asm-m68k/unistd.h
@@ -5,6 +5,7 @@
  * This file contains the system call numbers.
  */
=20
+#define __NR_restart_syscall	  0
 #define __NR_exit		  1
 #define __NR_fork		  2
 #define __NR_read		  3
@@ -359,9 +360,6 @@
 #define __ARCH_WANT_SYS_SIGPROCMASK
 #define __ARCH_WANT_SYS_RT_SIGACTION
=20
-/* whitelist for checksyscalls */
-#define __IGNORE_restart_syscall
-
 /*
  * "Conditional" syscalls
  *
--=20
1.6.1


Andreas.

--=20
Andreas Schwab, SuSE Labs, schwab@suse.de
SuSE Linux Products GmbH, Maxfeldstra=DFe 5, 90409 N=FCrnberg, Germany
PGP key fingerprint =3D 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4=
ED5
"And now for something completely different."
--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
