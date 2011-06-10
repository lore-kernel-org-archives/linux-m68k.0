From: Mathias Krause <minipli@googlemail.com>
Subject: [PATCH] m68k, exec: remove redundant set_fs(USER_DS)
Date: Fri, 10 Jun 2011 15:09:54 +0200
Message-ID: <1307711394-7827-1-git-send-email-minipli__3108.07348364524$1307711717$gmane$org@googlemail.com>
References: <BANLkTinv1teZEHMK0qymaVdcxPOErpqSyg@mail.gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <BANLkTinv1teZEHMK0qymaVdcxPOErpqSyg@mail.gmail.com>
References: <BANLkTiknCeAxe30MJdVTxDom+ko8+EDQ4A@mail.gmail.com> <1307642718-22257-1-git-send-email-minipli@googlemail.com> <20110609155630.0f734351.akpm@linux-foundation.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Mathias Krause <minipli@googlemail.com>, Greg Ungerer <gerg@uclinux.org>

The address limit is already set in flush_old_exec() so those calls to
set_fs(USER_DS) are redundant.

Signed-off-by: Mathias Krause <minipli@googlemail.com>
Cc: Greg Ungerer <gerg@uclinux.org>
---

Note: I'm not sure about the assignment to current->thread.fs in
flush_thread() -- shouldn't this be done in set_fs() itself?

 arch/m68k/include/asm/processor.h |    4 ----
 arch/m68k/kernel/process_mm.c     |    2 +-
 arch/m68k/kernel/process_no.c     |    2 +-
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/m68k/include/asm/processor.h b/arch/m68k/include/asm/processor.h
index f111b02..d8ef53a 100644
--- a/arch/m68k/include/asm/processor.h
+++ b/arch/m68k/include/asm/processor.h
@@ -105,9 +105,6 @@ struct thread_struct {
 static inline void start_thread(struct pt_regs * regs, unsigned long pc,
 				unsigned long usp)
 {
-	/* reads from user space */
-	set_fs(USER_DS);
-
 	regs->pc = pc;
 	regs->sr &= ~0x2000;
 	wrusp(usp);
@@ -129,7 +126,6 @@ extern int handle_kernel_fault(struct pt_regs *regs);
 
 #define start_thread(_regs, _pc, _usp)                  \
 do {                                                    \
-	set_fs(USER_DS); /* reads from user space */    \
 	(_regs)->pc = (_pc);                            \
 	((struct switch_stack *)(_regs))[-1].a6 = 0;    \
 	reformat(_regs);                                \
diff --git a/arch/m68k/kernel/process_mm.c b/arch/m68k/kernel/process_mm.c
index c2a1fc2..1bc223a 100644
--- a/arch/m68k/kernel/process_mm.c
+++ b/arch/m68k/kernel/process_mm.c
@@ -185,7 +185,7 @@ EXPORT_SYMBOL(kernel_thread);
 void flush_thread(void)
 {
 	unsigned long zero = 0;
-	set_fs(USER_DS);
+
 	current->thread.fs = __USER_DS;
 	if (!FPU_IS_EMU)
 		asm volatile (".chip 68k/68881\n\t"
diff --git a/arch/m68k/kernel/process_no.c b/arch/m68k/kernel/process_no.c
index 9b86ad1..69c1803 100644
--- a/arch/m68k/kernel/process_no.c
+++ b/arch/m68k/kernel/process_no.c
@@ -158,7 +158,7 @@ void flush_thread(void)
 #ifdef CONFIG_FPU
 	unsigned long zero = 0;
 #endif
-	set_fs(USER_DS);
+
 	current->thread.fs = __USER_DS;
 #ifdef CONFIG_FPU
 	if (!FPU_IS_EMU)
-- 
1.5.6.5
