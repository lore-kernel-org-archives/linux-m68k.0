From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 6/8] m68k: always make available dump_fpu()
Date: Mon, 29 Aug 2016 21:43:22 +1000
Message-ID: <1472471004-4580-7-git-send-email-gerg@linux-m68k.org>
References: <1472471004-4580-1-git-send-email-gerg@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out9.external.iinet.net.au ([203.59.1.226]:49458
        "EHLO icp-osb-irony-out9.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S932817AbcH2LmT (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Mon, 29 Aug 2016 07:42:19 -0400
In-Reply-To: <1472471004-4580-1-git-send-email-gerg@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@linux-m68k.org>

Our local m68k architecture dump_fpu() is conditionally compiled in on
CONFIG_FPU. That is OK for all existing MMU enabled CPU types, but won't
handle the case for some ColdFire SoC CPU parts that we want to support
that have no FPU hardware.

dump_fpu() is expected to be present by the ELF loader, so we must always
have it available and exported.

Modify the position of the conditional to allow supporting the case where
CONFIG_FPU is not defined.

This change based on changes and discussion from Yannick Gicquel
<yannick.gicquel@open.eurogiciel.org>.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/kernel/process.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/kernel/process.c b/arch/m68k/kernel/process.c
index c55ff71..44ec789 100644
--- a/arch/m68k/kernel/process.c
+++ b/arch/m68k/kernel/process.c
@@ -203,7 +203,6 @@ int copy_thread(unsigned long clone_flags, unsigned long usp,
 }
 
 /* Fill in the fpu structure for a core dump.  */
-#ifdef CONFIG_FPU
 int dump_fpu (struct pt_regs *regs, struct user_m68kfp_struct *fpu)
 {
 	char fpustate[216];
@@ -222,6 +221,7 @@ int dump_fpu (struct pt_regs *regs, struct user_m68kfp_struct *fpu)
 		return 1;
 	}
 
+#ifdef CONFIG_FPU
 	/* First dump the fpu context to avoid protocol violation.  */
 	asm volatile ("fsave %0" :: "m" (fpustate[0]) : "memory");
 	if (!CPU_IS_060 ? !fpustate[0] : !fpustate[2])
@@ -248,11 +248,11 @@ int dump_fpu (struct pt_regs *regs, struct user_m68kfp_struct *fpu)
 			      : "m" (fpu->fpregs[0])
 			      : "memory");
 	}
+#endif /* CONFIG_FPU */
 
 	return 1;
 }
 EXPORT_SYMBOL(dump_fpu);
-#endif /* CONFIG_FPU */
 
 unsigned long get_wchan(struct task_struct *p)
 {
-- 
1.9.1
