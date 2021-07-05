Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CDAAC07E98
	for <linux-m68k@archiver.kernel.org>; Mon,  5 Jul 2021 05:58:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 13DE461396
	for <linux-m68k@archiver.kernel.org>; Mon,  5 Jul 2021 05:58:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbhGEGAt (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 5 Jul 2021 02:00:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbhGEGAt (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 5 Jul 2021 02:00:49 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5261BC061574
        for <linux-m68k@lists.linux-m68k.org>; Sun,  4 Jul 2021 22:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=sInBLtt0HDEfEeVJ/5xdaxmNKvuJOq+tWldkfFHv7qs=; b=nrdBzhn65Vus33KF6T6ZHupOYr
        efj8pGg48MadGI1ZXSgyv0fFOrGNeJZABhynUthkqnLiT/0TcsjBnoV+nuyypPckdP5gCm2ondlIA
        GsTf8HoKnQa2VwjJ55kauhr4/mmFKlqOdNDDXcpcZdXFzeBV2VWVuUb2C2DF2QeBxGFvE8PlZ3U82
        53ADWs61fh8miKQQNmbenb6cUWH3ZFu+rGYVDsiZrmrj0PDXGyd+WgRvHaBhpaL92Sp27mlb14RYj
        xoOsZrMAMPWPQTZLMXY3uscmPOUkJ5NlEFQRiqpMnx9Jp/o0h6q8RKmyGynTlYRlQ1UEE9A7q4Krk
        KfzO6URw==;
Received: from 213-225-15-202.nat.highway.a1.net ([213.225.15.202] helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m0Hc0-009vki-AE; Mon, 05 Jul 2021 05:57:55 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     geert@linux-m68k.org, gerg@linux-m68k.org
Cc:     linux-m68k@lists.linux-m68k.org, uclinux-dev@uclinux.org,
        torvalds@linux-foundation.org
Subject: [PATCH] m68knommu: remove set_fs()
Date:   Mon,  5 Jul 2021 07:57:19 +0200
Message-Id: <20210705055719.949875-2-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210705055719.949875-1-hch@lst.de>
References: <20210705055719.949875-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

m68knommu already does not distinguish between kernel and user address
spaces.  Stop defining set_fs() and thus uaccess_kernel() to avoid
confusion.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/m68k/Kconfig                   |  2 +-
 arch/m68k/include/asm/processor.h   |  9 +++++++++
 arch/m68k/include/asm/segment.h     | 13 +++++++------
 arch/m68k/include/asm/thread_info.h | 10 ++++++++++
 arch/m68k/kernel/asm-offsets.c      |  2 ++
 arch/m68k/kernel/entry.S            |  8 ++++----
 arch/m68k/kernel/process.c          |  6 ++++--
 arch/m68k/mm/init.c                 |  3 ++-
 8 files changed, 39 insertions(+), 14 deletions(-)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 96989ad46f66..1c60037e352a 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -32,7 +32,7 @@ config M68K
 	select NO_DMA if !MMU && !COLDFIRE
 	select OLD_SIGACTION
 	select OLD_SIGSUSPEND3
-	select SET_FS
+	select SET_FS if MMU
 	select UACCESS_MEMCPY if !MMU
 	select VIRT_TO_BUS
 	select ZONE_DMA
diff --git a/arch/m68k/include/asm/processor.h b/arch/m68k/include/asm/processor.h
index 3750819ac5a1..ac04b5c8fe8d 100644
--- a/arch/m68k/include/asm/processor.h
+++ b/arch/m68k/include/asm/processor.h
@@ -79,7 +79,9 @@ struct thread_struct {
 	unsigned long  ksp;		/* kernel stack pointer */
 	unsigned long  usp;		/* user stack pointer */
 	unsigned short sr;		/* saved status register */
+#ifdef CONFIG_MMU
 	unsigned short fs;		/* saved fs (sfc, dfc) */
+#endif
 	unsigned long  crp[2];		/* cpu root pointer */
 	unsigned long  esp0;		/* points to SR of stack frame */
 	unsigned long  faddr;		/* info about last fault */
@@ -89,11 +91,18 @@ struct thread_struct {
 	unsigned char  fpstate[FPSTATESIZE];  /* floating point state */
 };
 
+#ifdef CONFIG_MMU
 #define INIT_THREAD  {							\
 	.ksp	= sizeof(init_stack) + (unsigned long) init_stack,	\
 	.sr	= PS_S,							\
 	.fs	= __KERNEL_DS,						\
 }
+#else
+#define INIT_THREAD  {							\
+	.ksp	= sizeof(init_stack) + (unsigned long) init_stack,	\
+	.sr	= PS_S,							\
+}
+#endif /* CONFIG_MMU */
 
 /*
  * ColdFire stack format sbould be 0x4 for an aligned usp (will always be
diff --git a/arch/m68k/include/asm/segment.h b/arch/m68k/include/asm/segment.h
index 2b5e68a71ef7..b134820425a5 100644
--- a/arch/m68k/include/asm/segment.h
+++ b/arch/m68k/include/asm/segment.h
@@ -2,19 +2,20 @@
 #ifndef _M68K_SEGMENT_H
 #define _M68K_SEGMENT_H
 
-/* define constants */
 /* Address spaces (FC0-FC2) */
 #define USER_DATA     (1)
+#define USER_PROGRAM  (2)
+#define SUPER_DATA    (5)
+#define SUPER_PROGRAM (6)
+#define CPU_SPACE     (7)
+
+#ifdef CONFIG_MMU
 #ifndef __USER_DS
 #define __USER_DS     (USER_DATA)
 #endif
-#define USER_PROGRAM  (2)
-#define SUPER_DATA    (5)
 #ifndef __KERNEL_DS
 #define __KERNEL_DS   (SUPER_DATA)
 #endif
-#define SUPER_PROGRAM (6)
-#define CPU_SPACE     (7)
 
 #ifndef __ASSEMBLY__
 
@@ -55,5 +56,5 @@ static inline void set_fs(mm_segment_t val)
 #define uaccess_kernel()	(get_fs().seg == KERNEL_DS.seg)
 
 #endif /* __ASSEMBLY__ */
-
+#endif /* CONFIG_MMU */
 #endif /* _M68K_SEGMENT_H */
diff --git a/arch/m68k/include/asm/thread_info.h b/arch/m68k/include/asm/thread_info.h
index 15a757073fa5..8741388d11af 100644
--- a/arch/m68k/include/asm/thread_info.h
+++ b/arch/m68k/include/asm/thread_info.h
@@ -27,19 +27,29 @@
 struct thread_info {
 	struct task_struct	*task;		/* main task structure */
 	unsigned long		flags;
+#ifdef CONFIG_MMU
 	mm_segment_t		addr_limit;	/* thread address space */
+#endif
 	int			preempt_count;	/* 0 => preemptable, <0 => BUG */
 	__u32			cpu;		/* should always be 0 on m68k */
 	unsigned long		tp_value;	/* thread pointer */
 };
 #endif /* __ASSEMBLY__ */
 
+#ifdef CONFIG_MMU
 #define INIT_THREAD_INFO(tsk)			\
 {						\
 	.task		= &tsk,			\
 	.addr_limit	= KERNEL_DS,		\
 	.preempt_count	= INIT_PREEMPT_COUNT,	\
 }
+#else
+#define INIT_THREAD_INFO(tsk)			\
+{						\
+	.task		= &tsk,			\
+	.preempt_count	= INIT_PREEMPT_COUNT,	\
+}
+#endif /* CONFIG_MMU */
 
 #ifndef __ASSEMBLY__
 /* how to get the thread information struct from C */
diff --git a/arch/m68k/kernel/asm-offsets.c b/arch/m68k/kernel/asm-offsets.c
index ccea355052ef..ff9dc90aca93 100644
--- a/arch/m68k/kernel/asm-offsets.c
+++ b/arch/m68k/kernel/asm-offsets.c
@@ -31,7 +31,9 @@ int main(void)
 	DEFINE(THREAD_KSP, offsetof(struct thread_struct, ksp));
 	DEFINE(THREAD_USP, offsetof(struct thread_struct, usp));
 	DEFINE(THREAD_SR, offsetof(struct thread_struct, sr));
+#ifdef CONFIG_MMU
 	DEFINE(THREAD_FS, offsetof(struct thread_struct, fs));
+#endif
 	DEFINE(THREAD_CRP, offsetof(struct thread_struct, crp));
 	DEFINE(THREAD_ESP0, offsetof(struct thread_struct, esp0));
 	DEFINE(THREAD_FPREG, offsetof(struct thread_struct, fp));
diff --git a/arch/m68k/kernel/entry.S b/arch/m68k/kernel/entry.S
index 9dd76fbb7c6b..2e4054e26be6 100644
--- a/arch/m68k/kernel/entry.S
+++ b/arch/m68k/kernel/entry.S
@@ -335,11 +335,11 @@ resume:
 
 	/* save sr */
 	movew	%sr,%a0@(TASK_THREAD+THREAD_SR)
-
+#ifdef CONFIG_MMU
 	/* save fs (sfc,%dfc) (may be pointing to kernel memory) */
 	movec	%sfc,%d0
 	movew	%d0,%a0@(TASK_THREAD+THREAD_FS)
-
+#endif
 	/* save usp */
 	/* it is better to use a movel here instead of a movew 8*) */
 	movec	%usp,%d0
@@ -422,12 +422,12 @@ resume:
 	/* restore user stack pointer */
 	movel	%a1@(TASK_THREAD+THREAD_USP),%a0
 	movel	%a0,%usp
-
+#ifdef CONFIG_MMU
 	/* restore fs (sfc,%dfc) */
 	movew	%a1@(TASK_THREAD+THREAD_FS),%a0
 	movec	%a0,%sfc
 	movec	%a0,%dfc
-
+#endif
 	/* restore status register */
 	movew	%a1@(TASK_THREAD+THREAD_SR),%sr
 
diff --git a/arch/m68k/kernel/process.c b/arch/m68k/kernel/process.c
index db49f9091711..7b725f327658 100644
--- a/arch/m68k/kernel/process.c
+++ b/arch/m68k/kernel/process.c
@@ -92,7 +92,9 @@ void show_regs(struct pt_regs * regs)
 
 void flush_thread(void)
 {
+#ifdef CONFIG_MMU
 	current->thread.fs = __USER_DS;
+#endif
 #ifdef CONFIG_FPU
 	if (!FPU_IS_EMU) {
 		unsigned long zero = 0;
@@ -150,13 +152,13 @@ int copy_thread(unsigned long clone_flags, unsigned long usp, unsigned long arg,
 
 	p->thread.ksp = (unsigned long)frame;
 	p->thread.esp0 = (unsigned long)&frame->regs;
-
+#ifdef CONFIG_MMU
 	/*
 	 * Must save the current SFC/DFC value, NOT the value when
 	 * the parent was last descheduled - RGH  10-08-96
 	 */
 	p->thread.fs = get_fs().seg;
-
+#endif
 	if (unlikely(p->flags & (PF_KTHREAD | PF_IO_WORKER))) {
 		/* kernel thread */
 		memset(frame, 0, sizeof(struct fork_frame));
diff --git a/arch/m68k/mm/init.c b/arch/m68k/mm/init.c
index 5d749e188246..3beec9644ae9 100644
--- a/arch/m68k/mm/init.c
+++ b/arch/m68k/mm/init.c
@@ -72,11 +72,12 @@ void __init paging_init(void)
 	if (!empty_zero_page)
 		panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
 		      __func__, PAGE_SIZE, PAGE_SIZE);
-
+#ifdef CONFIG_MMU
 	/*
 	 * Set up SFC/DFC registers (user data space).
 	 */
 	set_fs (USER_DS);
+#endif
 
 	max_zone_pfn[ZONE_DMA] = end_mem >> PAGE_SHIFT;
 	free_area_init(max_zone_pfn);
-- 
2.30.2

