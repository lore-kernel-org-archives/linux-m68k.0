From: <gerg@snapgear.com>
Subject: [PATCH 31/35] m68k: adjustments to stack frame for ColdFire with MMU enabled
Date: Fri, 16 Dec 2011 22:36:28 +1000
Message-ID: <1324038992-31222-32-git-send-email-gerg@snapgear.com>
References: <1324038992-31222-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:49434 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759098Ab1LPMhM (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 16 Dec 2011 07:37:12 -0500
In-Reply-To: <1324038992-31222-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The exception return stack adjustment required by ColdFire when running
with the MMU enabled is not completely identical to 680x0 processors.
Specifically the format type 4 stack frame doesn't need any stack
adjustment on exception return. And the ColdFire always must return with
a frame type of 4, not 0.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Matt Waddel <mwaddel@yahoo.com>
Acked-by: Kurt Mahan <kmahan@xmission.com>
---
 arch/m68k/kernel/signal_mm.c |   17 +++++++++++++++--
 1 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/kernel/signal_mm.c b/arch/m68k/kernel/signal_mm.c
index a0afc23..5f6b3d0 100644
--- a/arch/m68k/kernel/signal_mm.c
+++ b/arch/m68k/kernel/signal_mm.c
@@ -56,7 +56,11 @@ static const int frame_extra_sizes[16] = {
   [1]	= -1, /* sizeof(((struct frame *)0)->un.fmt1), */
   [2]	= sizeof(((struct frame *)0)->un.fmt2),
   [3]	= sizeof(((struct frame *)0)->un.fmt3),
+#ifdef CONFIG_COLDFIRE
+  [4]	= 0,
+#else
   [4]	= sizeof(((struct frame *)0)->un.fmt4),
+#endif
   [5]	= -1, /* sizeof(((struct frame *)0)->un.fmt5), */
   [6]	= -1, /* sizeof(((struct frame *)0)->un.fmt6), */
   [7]	= sizeof(((struct frame *)0)->un.fmt7),
@@ -84,7 +88,11 @@ int handle_kernel_fault(struct pt_regs *regs)
 	regs->stkadj = frame_extra_sizes[regs->format];
 	tregs =	(struct pt_regs *)((long)regs + regs->stkadj);
 	tregs->vector = regs->vector;
+#ifdef CONFIG_COLDFIRE
+	tregs->format = 4;
+#else
 	tregs->format = 0;
+#endif
 	tregs->pc = fixup->fixup;
 	tregs->sr = regs->sr;
 
@@ -336,8 +344,12 @@ static int mangle_kernel_stack(struct pt_regs *regs, int formatvec,
 		regs->format = formatvec >> 12;
 		regs->vector = formatvec & 0xfff;
 #define frame_offset (sizeof(struct pt_regs)+sizeof(struct switch_stack))
-		__asm__ __volatile__
-			("   movel %0,%/a0\n\t"
+		__asm__ __volatile__ (
+#ifdef CONFIG_COLDFIRE
+			 "   movel %0,%/sp\n\t"
+			 "   bra ret_from_signal\n"
+#else
+			 "   movel %0,%/a0\n\t"
 			 "   subl %1,%/a0\n\t"     /* make room on stack */
 			 "   movel %/a0,%/sp\n\t"  /* set stack pointer */
 			 /* move switch_stack and pt_regs */
@@ -350,6 +362,7 @@ static int mangle_kernel_stack(struct pt_regs *regs, int formatvec,
 			 "2: movel %4@+,%/a0@+\n\t"
 			 "   dbra %1,2b\n\t"
 			 "   bral ret_from_signal\n"
+#endif
 			 : /* no outputs, it doesn't ever return */
 			 : "a" (sw), "d" (fsize), "d" (frame_offset/4-1),
 			   "n" (frame_offset), "a" (buf + fsize/4)
-- 
1.7.0.4
