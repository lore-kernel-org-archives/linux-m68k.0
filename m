From: <gerg@snapgear.com>
Subject: [PATCH 07/35] m68k: use addr_limit checking for m68k CPUs that do no support address spaces
Date: Fri, 16 Dec 2011 22:36:04 +1000
Message-ID: <1324038992-31222-8-git-send-email-gerg@snapgear.com>
References: <1324038992-31222-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:49361 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759110Ab1LPMgl (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 16 Dec 2011 07:36:41 -0500
In-Reply-To: <1324038992-31222-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>, Alexander Stein <alexander.stein@systec-electronic.com>

From: Greg Ungerer <gerg@uclinux.org>

The ColdFire CPU family, and the original 68000, do not support separate
address spaces like the other 680x0 CPU types. Modify the set_fs()/get_fs()
functions and macros to use a thread_info addr_limit for address space
checking. This is pretty much what all other architectures that do not
support separate setable address spaces do.

Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
Signed-off-by: Greg Ungerer <gerg@uclinux.org>
Acked-by: Matt Waddel <mwaddel@yahoo.com>
Acked-by: Kurt Mahan <kmahan@xmission.com>
---
 arch/m68k/include/asm/segment.h     |   30 ++++++++++++++++--------------
 arch/m68k/include/asm/thread_info.h |    3 +++
 2 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/arch/m68k/include/asm/segment.h b/arch/m68k/include/asm/segment.h
index 1a142e9..0fa80e9 100644
--- a/arch/m68k/include/asm/segment.h
+++ b/arch/m68k/include/asm/segment.h
@@ -22,23 +22,26 @@ typedef struct {
 } mm_segment_t;
 
 #define MAKE_MM_SEG(s)	((mm_segment_t) { (s) })
-#define USER_DS		MAKE_MM_SEG(__USER_DS)
-#define KERNEL_DS	MAKE_MM_SEG(__KERNEL_DS)
 
+#ifdef CONFIG_CPU_HAS_ADDRESS_SPACES
 /*
  * Get/set the SFC/DFC registers for MOVES instructions
  */
+#define USER_DS		MAKE_MM_SEG(__USER_DS)
+#define KERNEL_DS	MAKE_MM_SEG(__KERNEL_DS)
 
 static inline mm_segment_t get_fs(void)
 {
-#ifdef CONFIG_CPU_HAS_ADDRESS_SPACES
 	mm_segment_t _v;
 	__asm__ ("movec %/dfc,%0":"=r" (_v.seg):);
-
 	return _v;
-#else
-	return USER_DS;
-#endif
+}
+
+static inline void set_fs(mm_segment_t val)
+{
+	__asm__ __volatile__ ("movec %0,%/sfc\n\t"
+			      "movec %0,%/dfc\n\t"
+			      : /* no outputs */ : "r" (val.seg) : "memory");
 }
 
 static inline mm_segment_t get_ds(void)
@@ -47,14 +50,13 @@ static inline mm_segment_t get_ds(void)
     return KERNEL_DS;
 }
 
-static inline void set_fs(mm_segment_t val)
-{
-#ifdef CONFIG_CPU_HAS_ADDRESS_SPACES
-	__asm__ __volatile__ ("movec %0,%/sfc\n\t"
-			      "movec %0,%/dfc\n\t"
-			      : /* no outputs */ : "r" (val.seg) : "memory");
+#else
+#define USER_DS		MAKE_MM_SEG(TASK_SIZE)
+#define KERNEL_DS	MAKE_MM_SEG(0xFFFFFFFF)
+#define get_ds()	(KERNEL_DS)
+#define get_fs()	(current_thread_info()->addr_limit)
+#define set_fs(x)	(current_thread_info()->addr_limit = (x))
 #endif
-}
 
 #define segment_eq(a,b)	((a).seg == (b).seg)
 
diff --git a/arch/m68k/include/asm/thread_info.h b/arch/m68k/include/asm/thread_info.h
index 01cef3c..29fa6da 100644
--- a/arch/m68k/include/asm/thread_info.h
+++ b/arch/m68k/include/asm/thread_info.h
@@ -3,6 +3,7 @@
 
 #include <asm/types.h>
 #include <asm/page.h>
+#include <asm/segment.h>
 
 /*
  * On machines with 4k pages we default to an 8k thread size, though we
@@ -26,6 +27,7 @@ struct thread_info {
 	struct task_struct	*task;		/* main task structure */
 	unsigned long		flags;
 	struct exec_domain	*exec_domain;	/* execution domain */
+	mm_segment_t		addr_limit;	/* thread address space */
 	int			preempt_count;	/* 0 => preemptable, <0 => BUG */
 	__u32			cpu;		/* should always be 0 on m68k */
 	unsigned long		tp_value;	/* thread pointer */
@@ -39,6 +41,7 @@ struct thread_info {
 {						\
 	.task		= &tsk,			\
 	.exec_domain	= &default_exec_domain,	\
+	.addr_limit	= KERNEL_DS,		\
 	.preempt_count	= INIT_PREEMPT_COUNT,	\
 	.restart_block = {			\
 		.fn = do_no_restart_syscall,	\
-- 
1.7.0.4
