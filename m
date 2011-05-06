From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: Really wire up sys_pselect6 and sys_ppoll
Date: Fri, 6 May 2011 21:08:42 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1105062107290.23969__40445.9595949904$1304708960$gmane$org@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@lists.linux-m68k.org>, uClinux list <uclinux-dev@uclinux.org>
Cc: Greg Ungerer <gerg@uclinux.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>

We reserved the numbers a long time ago, but never wired them up in the
syscall table as they need TIF_RESTORE_SIGMASK, which we only got last year
in commit cb6831d5d3099e772a510eb3e1ed0760ccffb45e ("m68k: Switch to saner
sigsuspend()")

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
I'll move this before "m68k: unistd - Comment out definitions for unimplemented
syscalls", and will update the latter.

 arch/m68k/kernel/syscalltable.S |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/kernel/syscalltable.S b/arch/m68k/kernel/syscalltable.S
index cb3bc1b..6f7b091 100644
--- a/arch/m68k/kernel/syscalltable.S
+++ b/arch/m68k/kernel/syscalltable.S
@@ -321,8 +321,8 @@ ENTRY(sys_call_table)
 	.long sys_readlinkat
 	.long sys_fchmodat
 	.long sys_faccessat		/* 300 */
-	.long sys_ni_syscall		/* Reserved for pselect6 */
-	.long sys_ni_syscall		/* Reserved for ppoll */
+	.long sys_pselect6
+	.long sys_ppoll
 	.long sys_unshare
 	.long sys_set_robust_list
 	.long sys_get_robust_list	/* 305 */
-- 
1.7.0.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
