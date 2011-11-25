From: <gerg@snapgear.com>
Subject: [PATCH 21/35] m68k: use tracehook_report_syscall_entry/exit for ColdFire MMU ptrace path
Date: Fri, 25 Nov 2011 13:41:06 +1000
Message-ID: <1322192480-22822-22-git-send-email-gerg@snapgear.com>
References: <1322192480-22822-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:53466 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752705Ab1KYDjh (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 24 Nov 2011 22:39:37 -0500
In-Reply-To: <1322192480-22822-1-git-send-email-gerg@snapgear.com>
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
