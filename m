From: <gerg@snapgear.com>
Subject: [PATCH] m68k: remove dead definition from thread-info.h
Date: Fri, 2 Sep 2011 15:31:37 +1000
Message-ID: <1314941497-32136-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:48463 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750904Ab1IBFbB (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 2 Sep 2011 01:31:01 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The conditional definition of the task_thread_info() macro based on
ASM_OFFSETS_C being defined is not used. Remove it.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/thread_info.h |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/arch/m68k/include/asm/thread_info.h b/arch/m68k/include/asm/thread_info.h
index e4e2159..6140b48 100644
--- a/arch/m68k/include/asm/thread_info.h
+++ b/arch/m68k/include/asm/thread_info.h
@@ -53,13 +53,9 @@ struct thread_info {
 #include <asm/current.h>
 #endif
 
-#ifdef ASM_OFFSETS_C
-#define task_thread_info(tsk)	((struct thread_info *) NULL)
-#else
 #include <asm/asm-offsets.h>
-#define task_thread_info(tsk)	((struct thread_info *)((char *)tsk+TASK_INFO))
-#endif
 
+#define task_thread_info(tsk)	((struct thread_info *)((char *)tsk+TASK_INFO))
 #define init_thread_info	(init_task.thread.info)
 #define task_stack_page(tsk)	((tsk)->stack)
 #define current_thread_info()	task_thread_info(current)
-- 
1.7.0.4
