From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCHv2 6/8] m68k: always make available dump_fpu()
Date: Fri,  2 Sep 2016 17:11:07 +1000
Message-ID: <1472800267-30786-1-git-send-email-gerg@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out4.external.iinet.net.au ([203.59.1.220]:38234
        "EHLO icp-osb-irony-out4.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751494AbcIBHJS (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 2 Sep 2016 03:09:18 -0400
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

Remove the conditional and reorganize the dump_fpu hard FPU code path
to let the compiler remove code when not needed.

This change based on changes and discussion from Yannick Gicquel
<yannick.gicquel@open.eurogiciel.org>.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/kernel/process.c | 56 +++++++++++++++++++++++-----------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

v2: Modify to avoid warnings about unused fpustate in some configurations

diff --git a/arch/m68k/kernel/process.c b/arch/m68k/kernel/process.c
index c55ff71..4ba1ae7 100644
--- a/arch/m68k/kernel/process.c
+++ b/arch/m68k/kernel/process.c
@@ -203,11 +203,8 @@ int copy_thread(unsigned long clone_flags, unsigned long usp,
 }
 
 /* Fill in the fpu structure for a core dump.  */
-#ifdef CONFIG_FPU
 int dump_fpu (struct pt_regs *regs, struct user_m68kfp_struct *fpu)
 {
-	char fpustate[216];
-
 	if (FPU_IS_EMU) {
 		int i;
 
@@ -222,37 +219,40 @@ int dump_fpu (struct pt_regs *regs, struct user_m68kfp_struct *fpu)
 		return 1;
 	}
 
-	/* First dump the fpu context to avoid protocol violation.  */
-	asm volatile ("fsave %0" :: "m" (fpustate[0]) : "memory");
-	if (!CPU_IS_060 ? !fpustate[0] : !fpustate[2])
-		return 0;
+	if (IS_ENABLED(CONFIG_FPU)) {
+		char fpustate[216];
 
-	if (CPU_IS_COLDFIRE) {
-		asm volatile ("fmovel %/fpiar,%0\n\t"
-			      "fmovel %/fpcr,%1\n\t"
-			      "fmovel %/fpsr,%2\n\t"
-			      "fmovemd %/fp0-%/fp7,%3"
-			      :
-			      : "m" (fpu->fpcntl[0]),
-				"m" (fpu->fpcntl[1]),
-				"m" (fpu->fpcntl[2]),
-				"m" (fpu->fpregs[0])
-			      : "memory");
-	} else {
-		asm volatile ("fmovem %/fpiar/%/fpcr/%/fpsr,%0"
-			      :
-			      : "m" (fpu->fpcntl[0])
-			      : "memory");
-		asm volatile ("fmovemx %/fp0-%/fp7,%0"
-			      :
-			      : "m" (fpu->fpregs[0])
-			      : "memory");
+		/* First dump the fpu context to avoid protocol violation.  */
+		asm volatile ("fsave %0" :: "m" (fpustate[0]) : "memory");
+		if (!CPU_IS_060 ? !fpustate[0] : !fpustate[2])
+			return 0;
+
+		if (CPU_IS_COLDFIRE) {
+			asm volatile ("fmovel %/fpiar,%0\n\t"
+				      "fmovel %/fpcr,%1\n\t"
+				      "fmovel %/fpsr,%2\n\t"
+				      "fmovemd %/fp0-%/fp7,%3"
+				      :
+				      : "m" (fpu->fpcntl[0]),
+					"m" (fpu->fpcntl[1]),
+					"m" (fpu->fpcntl[2]),
+					"m" (fpu->fpregs[0])
+				      : "memory");
+		} else {
+			asm volatile ("fmovem %/fpiar/%/fpcr/%/fpsr,%0"
+				      :
+				      : "m" (fpu->fpcntl[0])
+				      : "memory");
+			asm volatile ("fmovemx %/fp0-%/fp7,%0"
+				      :
+				      : "m" (fpu->fpregs[0])
+				      : "memory");
+		}
 	}
 
 	return 1;
 }
 EXPORT_SYMBOL(dump_fpu);
-#endif /* CONFIG_FPU */
 
 unsigned long get_wchan(struct task_struct *p)
 {
-- 
1.9.1
