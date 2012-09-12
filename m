From: <gerg@snapgear.com>
Subject: [PATCH] m68k: always set stack frame format for
	ColdFire on thread start
Date: Wed, 12 Sep 2012 15:13:19 +1000
Message-ID: <1347426799-24854-1-git-send-email-gerg@snapgear.com>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <uclinux-dev-bounces@uclinux.org>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/options/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Errors-To: uclinux-dev-bounces@uclinux.org
Sender: uclinux-dev-bounces@uclinux.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>
List-Id: linux-m68k@vger.kernel.org

From: Greg Ungerer <gerg@uclinux.org>

The stack frame "format" field needs to be explicitly set on thread creation
on ColdFire. For a normal long word aligned user stack pointer the frame
format is 0x4.

We were doing this for non-MMU ColdFire, but not for the case with MMU enabled.
So fix it so we always do it if targeting ColdFire.

The old code happend to rely on the stack frame format being inhereted from
the process calling exec. Furture changes means that may not always work,
so we really do want to set it explicitly.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/processor.h |   23 ++++++++++++-----------
 1 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/m68k/include/asm/processor.h b/arch/m68k/include/asm/processor.h
index f17c42a..9b4c82c 100644
--- a/arch/m68k/include/asm/processor.h
+++ b/arch/m68k/include/asm/processor.h
@@ -100,6 +100,16 @@ struct thread_struct {
 	.fs	= __KERNEL_DS,						\
 }
 
+/*
+ * ColdFire stack format sbould be 0x4 for an aligned usp (will always be
+ * true on thread creation). We need to set this explicitly.
+ */
+#ifdef CONFIG_COLDFIRE
+#define setframeformat(_regs)	do { (_regs)->format = 0x4; } while(0)
+#else
+#define setframeformat(_regs)	do { } while (0)
+#endif
+
 #ifdef CONFIG_MMU
 /*
  * Do necessary setup to start up a newly executed thread.
@@ -109,6 +119,7 @@ static inline void start_thread(struct pt_regs * regs, unsigned long pc,
 {
 	regs->pc = pc;
 	regs->sr &= ~0x2000;
+	setframeformat(regs);
 	wrusp(usp);
 }
 
@@ -116,21 +127,11 @@ extern int handle_kernel_fault(struct pt_regs *regs);
 
 #else
 
-/*
- * Coldfire stacks need to be re-aligned on trap exit, conventional
- * 68k can handle this case cleanly.
- */
-#ifdef CONFIG_COLDFIRE
-#define reformat(_regs)		do { (_regs)->format = 0x4; } while(0)
-#else
-#define reformat(_regs)		do { } while (0)
-#endif
-
 #define start_thread(_regs, _pc, _usp)                  \
 do {                                                    \
 	(_regs)->pc = (_pc);                            \
 	((struct switch_stack *)(_regs))[-1].a6 = 0;    \
-	reformat(_regs);                                \
+	setframeformat(_regs);                          \
 	if (current->mm)                                \
 		(_regs)->d5 = current->mm->start_data;  \
 	(_regs)->sr &= ~0x2000;                         \
-- 
1.7.0.4

_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
