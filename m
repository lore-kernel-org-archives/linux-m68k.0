From: <gerg@snapgear.com>
Subject: [PATCH 21/35] m68k: use tracehook_report_syscall_entry/exit for ColdFire MMU ptrace path
Date: Fri, 16 Dec 2011 22:36:18 +1000
Message-ID: <1324038992-31222-22-git-send-email-gerg@snapgear.com>
References: <1324038992-31222-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:49404 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756946Ab1LPMg7 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 16 Dec 2011 07:36:59 -0500
In-Reply-To: <1324038992-31222-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The existing ColdFire code (which is all non-mmu) for system call entry
and exit uses the more modern tracehook_report_syscall_entry()/exit()
into the ptrace code. Now that we are supporting ColdFire with MMU we
need the same hooks for these.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Matt Waddel <mwaddel@yahoo.com>
Acked-by: Kurt Mahan <kmahan@xmission.com>
---
 arch/m68k/kernel/ptrace_mm.c |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/kernel/ptrace_mm.c b/arch/m68k/kernel/ptrace_mm.c
index 0b25268..7bc999b 100644
--- a/arch/m68k/kernel/ptrace_mm.c
+++ b/arch/m68k/kernel/ptrace_mm.c
@@ -18,6 +18,7 @@
 #include <linux/ptrace.h>
 #include <linux/user.h>
 #include <linux/signal.h>
+#include <linux/tracehook.h>
 
 #include <asm/uaccess.h>
 #include <asm/page.h>
@@ -275,3 +276,20 @@ asmlinkage void syscall_trace(void)
 		current->exit_code = 0;
 	}
 }
+
+#ifdef CONFIG_COLDFIRE
+asmlinkage int syscall_trace_enter(void)
+{
+	int ret = 0;
+
+	if (test_thread_flag(TIF_SYSCALL_TRACE))
+		ret = tracehook_report_syscall_entry(task_pt_regs(current));
+	return ret;
+}
+
+asmlinkage void syscall_trace_leave(void)
+{
+	if (test_thread_flag(TIF_SYSCALL_TRACE))
+		tracehook_report_syscall_exit(task_pt_regs(current), 0);
+}
+#endif /* CONFIG_COLDFIRE */
-- 
1.7.0.4
