From: <gerg@snapgear.com>
Subject: [PATCH] m68k: remove duplicate asm offset for task thread.info
Date: Fri, 2 Sep 2011 15:21:46 +1000
Message-ID: <1314940906-31969-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:41555 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750904Ab1IBFVJ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 2 Sep 2011 01:21:09 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

We have a duplicate name and definition for the offset of the thread.info
struct within the task struct in our asm-offsets.c code. Remove one of them,
and consolidate to use a single define, TASK_INFO.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/thread_info.h |    2 +-
 arch/m68k/kernel/asm-offsets.c      |    1 -
 2 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/include/asm/thread_info.h b/arch/m68k/include/asm/thread_info.h
index 7909889..e4e2159 100644
--- a/arch/m68k/include/asm/thread_info.h
+++ b/arch/m68k/include/asm/thread_info.h
@@ -57,7 +57,7 @@ struct thread_info {
 #define task_thread_info(tsk)	((struct thread_info *) NULL)
 #else
 #include <asm/asm-offsets.h>
-#define task_thread_info(tsk)	((struct thread_info *)((char *)tsk+TASK_TINFO))
+#define task_thread_info(tsk)	((struct thread_info *)((char *)tsk+TASK_INFO))
 #endif
 
 #define init_thread_info	(init_task.thread.info)
diff --git a/arch/m68k/kernel/asm-offsets.c b/arch/m68k/kernel/asm-offsets.c
index 983fed9..f6a54e2 100644
--- a/arch/m68k/kernel/asm-offsets.c
+++ b/arch/m68k/kernel/asm-offsets.c
@@ -25,7 +25,6 @@ int main(void)
 	DEFINE(TASK_THREAD, offsetof(struct task_struct, thread));
 	DEFINE(TASK_MM, offsetof(struct task_struct, mm));
 	DEFINE(TASK_INFO, offsetof(struct task_struct, thread.info));
-	DEFINE(TASK_TINFO, offsetof(struct task_struct, thread.info));
 
 	/* offsets into the thread struct */
 	DEFINE(THREAD_KSP, offsetof(struct thread_struct, ksp));
-- 
1.7.0.4
