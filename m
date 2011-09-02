From: <gerg@snapgear.com>
Subject: [PATCH] m68k: merge the init_task code for mmu and non-mmu targets
Date: Fri, 2 Sep 2011 15:20:09 +1000
Message-ID: <1314940809-31873-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:51087 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750904Ab1IBFTd (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 2 Sep 2011 01:19:33 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The init_task code can be the same for both mmu and non-mmu targets.
None of the alignment carried out in the the current init_task code
is necessary. The linker script takes care of aligning the init_thread
structure to a THREAD SIZE boundary, and that is all we need.

So use the init_task.c code for all target types, that makes m68k
code consistent with what most other architectures do.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/kernel/Makefile     |    6 +++---
 arch/m68k/kernel/init_task.c  |    3 +--
 arch/m68k/kernel/process_mm.c |   16 ----------------
 3 files changed, 4 insertions(+), 21 deletions(-)

diff --git a/arch/m68k/kernel/Makefile b/arch/m68k/kernel/Makefile
index e7f0f2e..01ae30e 100644
--- a/arch/m68k/kernel/Makefile
+++ b/arch/m68k/kernel/Makefile
@@ -6,8 +6,8 @@ extra-$(CONFIG_MMU)	:= head.o
 extra-$(CONFIG_SUN3)	:= sun3-head.o
 extra-y			+= vmlinux.lds
 
-obj-y	:= entry.o m68k_ksyms.o module.o process.o ptrace.o setup.o signal.o \
-	   sys_m68k.o syscalltable.o time.o traps.o
+obj-y	:= entry.o init_task.o m68k_ksyms.o module.o process.o ptrace.o
+obj-y	+= setup.o signal.o sys_m68k.o syscalltable.o time.o traps.o
 
 obj-$(CONFIG_MMU)	+= ints.o devres.o vectors.o
 devres-$(CONFIG_MMU)	= ../../../kernel/irq/devres.o
@@ -16,6 +16,6 @@ ifndef CONFIG_MMU_SUN3
 obj-y			+= dma.o
 endif
 ifndef CONFIG_MMU
-obj-y			+= init_task.o irq.o
+obj-y			+= irq.o
 endif
 
diff --git a/arch/m68k/kernel/init_task.c b/arch/m68k/kernel/init_task.c
index cbf9dc3..c744cfc 100644
--- a/arch/m68k/kernel/init_task.c
+++ b/arch/m68k/kernel/init_task.c
@@ -19,7 +19,6 @@ static struct sighand_struct init_sighand = INIT_SIGHAND(init_sighand);
  *
  * All other task structs will be allocated on slabs in fork.c
  */
-__asm__(".align 4");
 struct task_struct init_task = INIT_TASK(init_task);
 
 EXPORT_SYMBOL(init_task);
@@ -27,7 +26,7 @@ EXPORT_SYMBOL(init_task);
 /*
  * Initial thread structure.
  *
- * We need to make sure that this is 8192-byte aligned due to the
+ * We need to make sure that this is THREAD size aligned due to the
  * way process stacks are handled. This is done by having a special
  * "init_task" linker map entry..
  */
diff --git a/arch/m68k/kernel/process_mm.c b/arch/m68k/kernel/process_mm.c
index 1bc223a..58a3253 100644
--- a/arch/m68k/kernel/process_mm.c
+++ b/arch/m68k/kernel/process_mm.c
@@ -33,22 +33,6 @@
 #include <asm/setup.h>
 #include <asm/pgtable.h>
 
-/*
- * Initial task/thread structure. Make this a per-architecture thing,
- * because different architectures tend to have different
- * alignment requirements and potentially different initial
- * setup.
- */
-static struct signal_struct init_signals = INIT_SIGNALS(init_signals);
-static struct sighand_struct init_sighand = INIT_SIGHAND(init_sighand);
-union thread_union init_thread_union __init_task_data
-	__attribute__((aligned(THREAD_SIZE))) =
-		{ INIT_THREAD_INFO(init_task) };
-
-/* initial task structure */
-struct task_struct init_task = INIT_TASK(init_task);
-
-EXPORT_SYMBOL(init_task);
 
 asmlinkage void ret_from_fork(void);
 
-- 
1.7.0.4
