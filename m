From: Alex Dowad <alexinbeijing@gmail.com>
Subject: [PATCH 15/32] m68k: copy_thread(): rename 'arg' argument to 'kthread_arg'
Date: Fri, 13 Mar 2015 20:14:38 +0200
Message-ID: <1426270496-26362-5-git-send-email-alexinbeijing__48499.8647276827$1426270865$gmane$org@gmail.com>
References: <1426270496-26362-1-git-send-email-alexinbeijing@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1426270496-26362-1-git-send-email-alexinbeijing@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>

The 'arg' argument to copy_thread() is only ever used when forking a new
kernel thread. Hence, rename it to 'kthread_arg' for clarity (and consistency
with do_fork() and other arch-specific implementations of copy_thread()).

Signed-off-by: Alex Dowad <alexinbeijing@gmail.com>
---
 arch/m68k/kernel/process.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/kernel/process.c b/arch/m68k/kernel/process.c
index c55ff71..92bf7b4 100644
--- a/arch/m68k/kernel/process.c
+++ b/arch/m68k/kernel/process.c
@@ -129,8 +129,11 @@ asmlinkage int m68k_clone(struct pt_regs *regs)
 		       (int __user *)regs->d3, (int __user *)regs->d4);
 }
 
+/*
+ * Copy architecture-specific thread state
+ */
 int copy_thread(unsigned long clone_flags, unsigned long usp,
-		 unsigned long arg, struct task_struct *p)
+		 unsigned long kthread_arg, struct task_struct *p)
 {
 	struct fork_frame {
 		struct switch_stack sw;
@@ -153,11 +156,13 @@ int copy_thread(unsigned long clone_flags, unsigned long usp,
 		memset(frame, 0, sizeof(struct fork_frame));
 		frame->regs.sr = PS_S;
 		frame->sw.a3 = usp; /* function */
-		frame->sw.d7 = arg;
+		frame->sw.d7 = kthread_arg;
 		frame->sw.retpc = (unsigned long)ret_from_kernel_thread;
 		p->thread.usp = 0;
 		return 0;
 	}
+
+	/* user thread */
 	memcpy(frame, container_of(current_pt_regs(), struct fork_frame, regs),
 		sizeof(struct fork_frame));
 	frame->regs.d0 = 0;
-- 
2.0.0.GIT
