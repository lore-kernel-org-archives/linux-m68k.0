From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 3/3] m68k: Allow all kernel traps to be handled via exception fixups
Date: Fri,  7 Jan 2011 17:22:05 +0100
Message-ID: <1294417325-6109-4-git-send-email-geert@linux-m68k.org>
References: <1294417325-6109-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1294417325-6109-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: Andreas Schwab <schwab@suse.de>, Geert Uytterhoeven <geert@linux-m68k.org>

From: Andreas Schwab <schwab@suse.de>

This will be needed by the ARAnyM Native Feature initialization code.
Also document that the VEC_TRACE check is needed for 68020/30.

Signed-off-by: Andreas Schwab <schwab@suse.de>
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/kernel/traps.c |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/kernel/traps.c b/arch/m68k/kernel/traps.c
index cd802d4..4022bbc 100644
--- a/arch/m68k/kernel/traps.c
+++ b/arch/m68k/kernel/traps.c
@@ -58,6 +58,7 @@ asm(".text\n"
 /*
  * this must be called very early as the kernel might
  * use some instruction that are emulated on the 060
+ * and so we're prepared for early probe attempts (e.g. nf_init).
  */
 void __init base_trap_init(void)
 {
@@ -78,6 +79,7 @@ void __init base_trap_init(void)
 	}
 
 	vectors[VEC_BUSERR] = buserr;
+	vectors[VEC_ILLEGAL] = trap;
 	vectors[VEC_SYS] = system_call;
 }
 
@@ -1055,9 +1057,11 @@ asmlinkage void trap_c(struct frame *fp)
 	siginfo_t info;
 
 	if (fp->ptregs.sr & PS_S) {
-		if ((fp->ptregs.vector >> 2) == VEC_TRACE) {
-			/* traced a trapping instruction */
-		} else
+		if (fp->ptregs.vector == VEC_TRACE << 2) {
+			/* traced a trapping instruction on a 68020/30,
+			 * real exception will be executed afterwards.
+			 */
+		} else if (!handle_kernel_fault(&fp->ptregs))
 			bad_super_trap(fp);
 		return;
 	}
-- 
1.7.0.4
