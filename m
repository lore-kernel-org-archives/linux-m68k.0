Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CC1CC07E99
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Jul 2021 07:02:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 63FFE613CA
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Jul 2021 07:02:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231136AbhGIHFQ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 9 Jul 2021 03:05:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230121AbhGIHFQ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 9 Jul 2021 03:05:16 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6887BC0613DD
        for <linux-m68k@lists.linux-m68k.org>; Fri,  9 Jul 2021 00:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=EjgynRwpqoPPhEiKT7CACEeNDgKLv2uOHD7xoGKVeqk=; b=vP9zgM9G8JE7+CThhLFXEycjOX
        dAZvmJVzEem6To4P/t3zf9GhVTs+6rSzR21eVCRKuLJjat5Y5iPlZn1Pwd3hAKpe9zrs58UFIXHgl
        wpEID744B3Uutle8U+5rczIqTRleN9vOYJyBxoxvnB+hQZIQ4xwQY66QRmALOytWIIYfqX/ZnjbuY
        wNfHRv8WxY4yoKQHRiAZ+bcVq7Ws5Po2whH1nApEc8q1iqN6f97rckih3yylBn62Lg3bpI750zv0h
        U0U4GcpGRPq0pZO6/HZ9MdoLljljPaW5RRdD/Wv6Oe+MAykGQdnp73wGgLNj9rT57wQtyWSaM3+Yw
        0b5wsuAA==;
Received: from p4fdb05cb.dip0.t-ipconnect.de ([79.219.5.203] helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m1kWf-00EFOU-P4; Fri, 09 Jul 2021 07:02:20 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        linux-m68k@lists.linux-m68k.org
Subject: [PATCH 7/7] m68k: remove set_fs()
Date:   Fri,  9 Jul 2021 09:01:32 +0200
Message-Id: <20210709070132.3387689-8-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709070132.3387689-1-hch@lst.de>
References: <20210709070132.3387689-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Add a m68k-only set_fc helper to set the SFC and DFC registers for the
few places that need to override it for special MM operations, but
disconnect that from the deprecated kernel-wide set_fs() API.

Note that the SFC/DFC registers are context switched, so there is no need
to disable preemption.

Partially based on an earlier patch from
Linus Torvalds <torvalds@linux-foundation.org>.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/m68k/68000/entry.S             |  1 -
 arch/m68k/Kconfig                   |  1 -
 arch/m68k/coldfire/entry.S          |  1 -
 arch/m68k/include/asm/processor.h   | 31 +++++++++++++--
 arch/m68k/include/asm/segment.h     | 59 -----------------------------
 arch/m68k/include/asm/thread_info.h |  3 --
 arch/m68k/include/asm/tlbflush.h    | 11 ++----
 arch/m68k/include/asm/uaccess.h     |  4 --
 arch/m68k/kernel/asm-offsets.c      |  2 +-
 arch/m68k/kernel/entry.S            |  5 +--
 arch/m68k/kernel/process.c          |  4 +-
 arch/m68k/kernel/traps.c            | 13 ++-----
 arch/m68k/mac/misc.c                |  1 -
 arch/m68k/mm/cache.c                | 23 ++++++-----
 arch/m68k/mm/init.c                 |  2 +-
 arch/m68k/mm/kmap.c                 |  1 -
 arch/m68k/mm/memory.c               |  1 -
 arch/m68k/mm/motorola.c             |  2 +-
 arch/m68k/sun3/config.c             |  3 +-
 arch/m68k/sun3/mmu_emu.c            |  6 +--
 arch/m68k/sun3/sun3ints.c           |  1 -
 arch/m68k/sun3x/prom.c              |  1 -
 22 files changed, 59 insertions(+), 117 deletions(-)
 delete mode 100644 arch/m68k/include/asm/segment.h

diff --git a/arch/m68k/68000/entry.S b/arch/m68k/68000/entry.S
index 259b3661b614..6aefcc20c28a 100644
--- a/arch/m68k/68000/entry.S
+++ b/arch/m68k/68000/entry.S
@@ -15,7 +15,6 @@
 #include <asm/unistd.h>
 #include <asm/errno.h>
 #include <asm/setup.h>
-#include <asm/segment.h>
 #include <asm/traps.h>
 #include <asm/asm-offsets.h>
 #include <asm/entry.h>
diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 96989ad46f66..3a83013f0a96 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -32,7 +32,6 @@ config M68K
 	select NO_DMA if !MMU && !COLDFIRE
 	select OLD_SIGACTION
 	select OLD_SIGSUSPEND3
-	select SET_FS
 	select UACCESS_MEMCPY if !MMU
 	select VIRT_TO_BUS
 	select ZONE_DMA
diff --git a/arch/m68k/coldfire/entry.S b/arch/m68k/coldfire/entry.S
index d43a02795a4a..412bb7326099 100644
--- a/arch/m68k/coldfire/entry.S
+++ b/arch/m68k/coldfire/entry.S
@@ -31,7 +31,6 @@
 #include <asm/thread_info.h>
 #include <asm/errno.h>
 #include <asm/setup.h>
-#include <asm/segment.h>
 #include <asm/asm-offsets.h>
 #include <asm/entry.h>
 
diff --git a/arch/m68k/include/asm/processor.h b/arch/m68k/include/asm/processor.h
index 3750819ac5a1..debb4537eab5 100644
--- a/arch/m68k/include/asm/processor.h
+++ b/arch/m68k/include/asm/processor.h
@@ -9,7 +9,6 @@
 #define __ASM_M68K_PROCESSOR_H
 
 #include <linux/thread_info.h>
-#include <asm/segment.h>
 #include <asm/fpu.h>
 #include <asm/ptrace.h>
 
@@ -75,11 +74,37 @@ static inline void wrusp(unsigned long usp)
 #define TASK_UNMAPPED_BASE	0
 #endif
 
+/* Address spaces (or Function Codes in Motorola lingo) */
+#define USER_DATA     (1)
+#define USER_PROGRAM  (2)
+#define SUPER_DATA    (5)
+#define SUPER_PROGRAM (6)
+#define CPU_SPACE     (7)
+
+#ifdef CONFIG_CPU_HAS_ADDRESS_SPACES
+/*
+ * Set the SFC/DFC registers for special MM operations.  For most normal
+ * operation these remain set to USER_DATA for the uaccess routines.
+ */
+static inline void set_fc(unsigned long val)
+{
+	WARN_ON_ONCE(in_interrupt());
+
+	__asm__ __volatile__ ("movec %0,%/sfc\n\t"
+			      "movec %0,%/dfc\n\t"
+			      : /* no outputs */ : "r" (val) : "memory");
+}
+#else
+static inline void set_fc(unsigned long val)
+{
+}
+#endif /* CONFIG_CPU_HAS_ADDRESS_SPACES */
+
 struct thread_struct {
 	unsigned long  ksp;		/* kernel stack pointer */
 	unsigned long  usp;		/* user stack pointer */
 	unsigned short sr;		/* saved status register */
-	unsigned short fs;		/* saved fs (sfc, dfc) */
+	unsigned short fc;		/* saved fc (sfc, dfc) */
 	unsigned long  crp[2];		/* cpu root pointer */
 	unsigned long  esp0;		/* points to SR of stack frame */
 	unsigned long  faddr;		/* info about last fault */
@@ -92,7 +117,7 @@ struct thread_struct {
 #define INIT_THREAD  {							\
 	.ksp	= sizeof(init_stack) + (unsigned long) init_stack,	\
 	.sr	= PS_S,							\
-	.fs	= __KERNEL_DS,						\
+	.fc	= USER_DATA,						\
 }
 
 /*
diff --git a/arch/m68k/include/asm/segment.h b/arch/m68k/include/asm/segment.h
deleted file mode 100644
index 2b5e68a71ef7..000000000000
--- a/arch/m68k/include/asm/segment.h
+++ /dev/null
@@ -1,59 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _M68K_SEGMENT_H
-#define _M68K_SEGMENT_H
-
-/* define constants */
-/* Address spaces (FC0-FC2) */
-#define USER_DATA     (1)
-#ifndef __USER_DS
-#define __USER_DS     (USER_DATA)
-#endif
-#define USER_PROGRAM  (2)
-#define SUPER_DATA    (5)
-#ifndef __KERNEL_DS
-#define __KERNEL_DS   (SUPER_DATA)
-#endif
-#define SUPER_PROGRAM (6)
-#define CPU_SPACE     (7)
-
-#ifndef __ASSEMBLY__
-
-typedef struct {
-	unsigned long seg;
-} mm_segment_t;
-
-#define MAKE_MM_SEG(s)	((mm_segment_t) { (s) })
-
-#ifdef CONFIG_CPU_HAS_ADDRESS_SPACES
-/*
- * Get/set the SFC/DFC registers for MOVES instructions
- */
-#define USER_DS		MAKE_MM_SEG(__USER_DS)
-#define KERNEL_DS	MAKE_MM_SEG(__KERNEL_DS)
-
-static inline mm_segment_t get_fs(void)
-{
-	mm_segment_t _v;
-	__asm__ ("movec %/dfc,%0":"=r" (_v.seg):);
-	return _v;
-}
-
-static inline void set_fs(mm_segment_t val)
-{
-	__asm__ __volatile__ ("movec %0,%/sfc\n\t"
-			      "movec %0,%/dfc\n\t"
-			      : /* no outputs */ : "r" (val.seg) : "memory");
-}
-
-#else
-#define USER_DS		MAKE_MM_SEG(TASK_SIZE)
-#define KERNEL_DS	MAKE_MM_SEG(0xFFFFFFFF)
-#define get_fs()	(current_thread_info()->addr_limit)
-#define set_fs(x)	(current_thread_info()->addr_limit = (x))
-#endif
-
-#define uaccess_kernel()	(get_fs().seg == KERNEL_DS.seg)
-
-#endif /* __ASSEMBLY__ */
-
-#endif /* _M68K_SEGMENT_H */
diff --git a/arch/m68k/include/asm/thread_info.h b/arch/m68k/include/asm/thread_info.h
index 15a757073fa5..c952658ba792 100644
--- a/arch/m68k/include/asm/thread_info.h
+++ b/arch/m68k/include/asm/thread_info.h
@@ -4,7 +4,6 @@
 
 #include <asm/types.h>
 #include <asm/page.h>
-#include <asm/segment.h>
 
 /*
  * On machines with 4k pages we default to an 8k thread size, though we
@@ -27,7 +26,6 @@
 struct thread_info {
 	struct task_struct	*task;		/* main task structure */
 	unsigned long		flags;
-	mm_segment_t		addr_limit;	/* thread address space */
 	int			preempt_count;	/* 0 => preemptable, <0 => BUG */
 	__u32			cpu;		/* should always be 0 on m68k */
 	unsigned long		tp_value;	/* thread pointer */
@@ -37,7 +35,6 @@ struct thread_info {
 #define INIT_THREAD_INFO(tsk)			\
 {						\
 	.task		= &tsk,			\
-	.addr_limit	= KERNEL_DS,		\
 	.preempt_count	= INIT_PREEMPT_COUNT,	\
 }
 
diff --git a/arch/m68k/include/asm/tlbflush.h b/arch/m68k/include/asm/tlbflush.h
index a6318ccd308f..b882e2f4f551 100644
--- a/arch/m68k/include/asm/tlbflush.h
+++ b/arch/m68k/include/asm/tlbflush.h
@@ -13,13 +13,12 @@ static inline void flush_tlb_kernel_page(void *addr)
 	if (CPU_IS_COLDFIRE) {
 		mmu_write(MMUOR, MMUOR_CNL);
 	} else if (CPU_IS_040_OR_060) {
-		mm_segment_t old_fs = get_fs();
-		set_fs(KERNEL_DS);
+		set_fc(SUPER_DATA);
 		__asm__ __volatile__(".chip 68040\n\t"
 				     "pflush (%0)\n\t"
 				     ".chip 68k"
 				     : : "a" (addr));
-		set_fs(old_fs);
+		set_fc(USER_DATA);
 	} else if (CPU_IS_020_OR_030)
 		__asm__ __volatile__("pflush #4,#4,(%0)" : : "a" (addr));
 }
@@ -84,12 +83,8 @@ static inline void flush_tlb_mm(struct mm_struct *mm)
 
 static inline void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
 {
-	if (vma->vm_mm == current->active_mm) {
-		mm_segment_t old_fs = force_uaccess_begin();
-
+	if (vma->vm_mm == current->active_mm)
 		__flush_tlb_one(addr);
-		force_uaccess_end(old_fs);
-	}
 }
 
 static inline void flush_tlb_range(struct vm_area_struct *vma,
diff --git a/arch/m68k/include/asm/uaccess.h b/arch/m68k/include/asm/uaccess.h
index 2bedb1b8c4bf..a308f0b41154 100644
--- a/arch/m68k/include/asm/uaccess.h
+++ b/arch/m68k/include/asm/uaccess.h
@@ -9,7 +9,6 @@
  */
 #include <linux/compiler.h>
 #include <linux/types.h>
-#include <asm/segment.h>
 #include <asm/extable.h>
 
 /* We let the MMU do all checking */
@@ -249,9 +248,6 @@ unsigned long raw_copy_from_user(void *to, const void __user *from,
 unsigned long raw_copy_to_user(void __user *to, const void *from,
 		unsigned long n);
 
-#define user_addr_max() \
-	(uaccess_kernel() ? ~0UL : TASK_SIZE)
-
 extern long strncpy_from_user(char *dst, const char __user *src, long count);
 extern __must_check long strnlen_user(const char __user *str, long n);
 
diff --git a/arch/m68k/kernel/asm-offsets.c b/arch/m68k/kernel/asm-offsets.c
index ccea355052ef..906d73230537 100644
--- a/arch/m68k/kernel/asm-offsets.c
+++ b/arch/m68k/kernel/asm-offsets.c
@@ -31,7 +31,7 @@ int main(void)
 	DEFINE(THREAD_KSP, offsetof(struct thread_struct, ksp));
 	DEFINE(THREAD_USP, offsetof(struct thread_struct, usp));
 	DEFINE(THREAD_SR, offsetof(struct thread_struct, sr));
-	DEFINE(THREAD_FS, offsetof(struct thread_struct, fs));
+	DEFINE(THREAD_FC, offsetof(struct thread_struct, fc));
 	DEFINE(THREAD_CRP, offsetof(struct thread_struct, crp));
 	DEFINE(THREAD_ESP0, offsetof(struct thread_struct, esp0));
 	DEFINE(THREAD_FPREG, offsetof(struct thread_struct, fp));
diff --git a/arch/m68k/kernel/entry.S b/arch/m68k/kernel/entry.S
index 9dd76fbb7c6b..63434f331561 100644
--- a/arch/m68k/kernel/entry.S
+++ b/arch/m68k/kernel/entry.S
@@ -36,7 +36,6 @@
 #include <linux/linkage.h>
 #include <asm/errno.h>
 #include <asm/setup.h>
-#include <asm/segment.h>
 #include <asm/traps.h>
 #include <asm/unistd.h>
 #include <asm/asm-offsets.h>
@@ -338,7 +337,7 @@ resume:
 
 	/* save fs (sfc,%dfc) (may be pointing to kernel memory) */
 	movec	%sfc,%d0
-	movew	%d0,%a0@(TASK_THREAD+THREAD_FS)
+	movew	%d0,%a0@(TASK_THREAD+THREAD_FC)
 
 	/* save usp */
 	/* it is better to use a movel here instead of a movew 8*) */
@@ -424,7 +423,7 @@ resume:
 	movel	%a0,%usp
 
 	/* restore fs (sfc,%dfc) */
-	movew	%a1@(TASK_THREAD+THREAD_FS),%a0
+	movew	%a1@(TASK_THREAD+THREAD_FC),%a0
 	movec	%a0,%sfc
 	movec	%a0,%dfc
 
diff --git a/arch/m68k/kernel/process.c b/arch/m68k/kernel/process.c
index db49f9091711..1ab692b952cd 100644
--- a/arch/m68k/kernel/process.c
+++ b/arch/m68k/kernel/process.c
@@ -92,7 +92,7 @@ void show_regs(struct pt_regs * regs)
 
 void flush_thread(void)
 {
-	current->thread.fs = __USER_DS;
+	current->thread.fc = USER_DATA;
 #ifdef CONFIG_FPU
 	if (!FPU_IS_EMU) {
 		unsigned long zero = 0;
@@ -155,7 +155,7 @@ int copy_thread(unsigned long clone_flags, unsigned long usp, unsigned long arg,
 	 * Must save the current SFC/DFC value, NOT the value when
 	 * the parent was last descheduled - RGH  10-08-96
 	 */
-	p->thread.fs = get_fs().seg;
+	p->thread.fc = USER_DATA;
 
 	if (unlikely(p->flags & (PF_KTHREAD | PF_IO_WORKER))) {
 		/* kernel thread */
diff --git a/arch/m68k/kernel/traps.c b/arch/m68k/kernel/traps.c
index 9e1261462bcc..c5e0a4f93bd5 100644
--- a/arch/m68k/kernel/traps.c
+++ b/arch/m68k/kernel/traps.c
@@ -181,9 +181,8 @@ static inline void access_error060 (struct frame *fp)
 static inline unsigned long probe040(int iswrite, unsigned long addr, int wbs)
 {
 	unsigned long mmusr;
-	mm_segment_t old_fs = get_fs();
 
-	set_fs(MAKE_MM_SEG(wbs));
+	set_fc(wbs);
 
 	if (iswrite)
 		asm volatile (".chip 68040; ptestw (%0); .chip 68k" : : "a" (addr));
@@ -192,7 +191,7 @@ static inline unsigned long probe040(int iswrite, unsigned long addr, int wbs)
 
 	asm volatile (".chip 68040; movec %%mmusr,%0; .chip 68k" : "=r" (mmusr));
 
-	set_fs(old_fs);
+	set_fc(USER_DATA);
 
 	return mmusr;
 }
@@ -201,10 +200,8 @@ static inline int do_040writeback1(unsigned short wbs, unsigned long wba,
 				   unsigned long wbd)
 {
 	int res = 0;
-	mm_segment_t old_fs = get_fs();
 
-	/* set_fs can not be moved, otherwise put_user() may oops */
-	set_fs(MAKE_MM_SEG(wbs));
+	set_fc(wbs);
 
 	switch (wbs & WBSIZ_040) {
 	case BA_SIZE_BYTE:
@@ -218,9 +215,7 @@ static inline int do_040writeback1(unsigned short wbs, unsigned long wba,
 		break;
 	}
 
-	/* set_fs can not be moved, otherwise put_user() may oops */
-	set_fs(old_fs);
-
+	set_fc(USER_DATA);
 
 	pr_debug("do_040writeback1, res=%d\n", res);
 
diff --git a/arch/m68k/mac/misc.c b/arch/m68k/mac/misc.c
index 90f4e9ca1276..4fab34791758 100644
--- a/arch/m68k/mac/misc.c
+++ b/arch/m68k/mac/misc.c
@@ -18,7 +18,6 @@
 
 #include <linux/uaccess.h>
 #include <asm/io.h>
-#include <asm/segment.h>
 #include <asm/setup.h>
 #include <asm/macintosh.h>
 #include <asm/mac_via.h>
diff --git a/arch/m68k/mm/cache.c b/arch/m68k/mm/cache.c
index b486c0889eec..d26eb1a591d3 100644
--- a/arch/m68k/mm/cache.c
+++ b/arch/m68k/mm/cache.c
@@ -12,7 +12,8 @@
 #include <asm/traps.h>
 
 
-static unsigned long virt_to_phys_slow(unsigned long vaddr)
+static unsigned long virt_to_phys_slow(unsigned long vaddr,
+		unsigned long seg)
 {
 	if (CPU_IS_060) {
 		unsigned long paddr;
@@ -55,7 +56,7 @@ static unsigned long virt_to_phys_slow(unsigned long vaddr)
 		asm volatile ("ptestr %3,%2@,#7,%0\n\t"
 			      "pmove %%psr,%1"
 			      : "=a&" (descaddr), "=m" (mmusr)
-			      : "a" (vaddr), "d" (get_fs().seg));
+			      : "a" (vaddr), "d" (seg));
 		if (mmusr & (MMU_I|MMU_B|MMU_L))
 			return 0;
 		descaddr = phys_to_virt((unsigned long)descaddr);
@@ -73,7 +74,8 @@ static unsigned long virt_to_phys_slow(unsigned long vaddr)
 
 /* Push n pages at kernel virtual address and clear the icache */
 /* RZ: use cpush %bc instead of cpush %dc, cinv %ic */
-void flush_icache_user_range(unsigned long address, unsigned long endaddr)
+static void __flush_icache_range(unsigned long address, unsigned long endaddr,
+		unsigned long seg)
 {
 	if (CPU_IS_COLDFIRE) {
 		unsigned long start, end;
@@ -92,7 +94,7 @@ void flush_icache_user_range(unsigned long address, unsigned long endaddr)
 				      ".chip 68040\n\t"
 				      "cpushp %%bc,(%0)\n\t"
 				      ".chip 68k"
-				      : : "a" (virt_to_phys_slow(address)));
+				      : : "a" (virt_to_phys_slow(address, seg)));
 			address += PAGE_SIZE;
 		} while (address < endaddr);
 	} else {
@@ -105,13 +107,16 @@ void flush_icache_user_range(unsigned long address, unsigned long endaddr)
 	}
 }
 
-void flush_icache_range(unsigned long address, unsigned long endaddr)
+void flush_icache_user_range(unsigned long address, unsigned long endaddr)
 {
-	mm_segment_t old_fs = get_fs();
+	__flush_icache_range(address, endaddr, USER_DATA);
+}
 
-	set_fs(KERNEL_DS);
-	flush_icache_user_range(address, endaddr);
-	set_fs(old_fs);
+void flush_icache_range(unsigned long address, unsigned long endaddr)
+{
+	set_fc(SUPER_DATA);
+	__flush_icache_range(address, endaddr, SUPER_DATA);
+	set_fc(USER_DATA);
 }
 EXPORT_SYMBOL(flush_icache_range);
 
diff --git a/arch/m68k/mm/init.c b/arch/m68k/mm/init.c
index 5d749e188246..133cd8802a78 100644
--- a/arch/m68k/mm/init.c
+++ b/arch/m68k/mm/init.c
@@ -76,7 +76,7 @@ void __init paging_init(void)
 	/*
 	 * Set up SFC/DFC registers (user data space).
 	 */
-	set_fs (USER_DS);
+	set_fc(USER_DATA);
 
 	max_zone_pfn[ZONE_DMA] = end_mem >> PAGE_SHIFT;
 	free_area_init(max_zone_pfn);
diff --git a/arch/m68k/mm/kmap.c b/arch/m68k/mm/kmap.c
index 1269d513b221..20ddf71b43d0 100644
--- a/arch/m68k/mm/kmap.c
+++ b/arch/m68k/mm/kmap.c
@@ -17,7 +17,6 @@
 #include <linux/vmalloc.h>
 
 #include <asm/setup.h>
-#include <asm/segment.h>
 #include <asm/page.h>
 #include <asm/io.h>
 #include <asm/tlbflush.h>
diff --git a/arch/m68k/mm/memory.c b/arch/m68k/mm/memory.c
index fe75aecfb238..c2c03b0a1567 100644
--- a/arch/m68k/mm/memory.c
+++ b/arch/m68k/mm/memory.c
@@ -15,7 +15,6 @@
 #include <linux/gfp.h>
 
 #include <asm/setup.h>
-#include <asm/segment.h>
 #include <asm/page.h>
 #include <asm/traps.h>
 #include <asm/machdep.h>
diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
index 3a653f0a4188..9f3f77785aa7 100644
--- a/arch/m68k/mm/motorola.c
+++ b/arch/m68k/mm/motorola.c
@@ -467,7 +467,7 @@ void __init paging_init(void)
 	/*
 	 * Set up SFC/DFC registers
 	 */
-	set_fs(KERNEL_DS);
+	set_fc(USER_DATA);
 
 #ifdef DEBUG
 	printk ("before free_area_init\n");
diff --git a/arch/m68k/sun3/config.c b/arch/m68k/sun3/config.c
index f7dd47232b6c..203f428a0344 100644
--- a/arch/m68k/sun3/config.c
+++ b/arch/m68k/sun3/config.c
@@ -31,7 +31,6 @@
 #include <asm/intersil.h>
 #include <asm/irq.h>
 #include <asm/sections.h>
-#include <asm/segment.h>
 #include <asm/sun3ints.h>
 
 char sun3_reserved_pmeg[SUN3_PMEGS_NUM];
@@ -89,7 +88,7 @@ void __init sun3_init(void)
 	sun3_reserved_pmeg[249] = 1;
 	sun3_reserved_pmeg[252] = 1;
 	sun3_reserved_pmeg[253] = 1;
-	set_fs(KERNEL_DS);
+	set_fc(USER_DATA);
 }
 
 /* Without this, Bad Things happen when something calls arch_reset. */
diff --git a/arch/m68k/sun3/mmu_emu.c b/arch/m68k/sun3/mmu_emu.c
index 7aa879b7c7ff..7ec20817c0c9 100644
--- a/arch/m68k/sun3/mmu_emu.c
+++ b/arch/m68k/sun3/mmu_emu.c
@@ -23,7 +23,6 @@
 #include <linux/uaccess.h>
 #include <asm/page.h>
 #include <asm/sun3mmu.h>
-#include <asm/segment.h>
 #include <asm/oplib.h>
 #include <asm/mmu_context.h>
 #include <asm/dvma.h>
@@ -191,14 +190,13 @@ void __init mmu_emu_init(unsigned long bootmem_end)
 	for(seg = 0; seg < PAGE_OFFSET; seg += SUN3_PMEG_SIZE)
 		sun3_put_segmap(seg, SUN3_INVALID_PMEG);
 
-	set_fs(MAKE_MM_SEG(3));
+	set_fc(3);
 	for(seg = 0; seg < 0x10000000; seg += SUN3_PMEG_SIZE) {
 		i = sun3_get_segmap(seg);
 		for(j = 1; j < CONTEXTS_NUM; j++)
 			(*(romvec->pv_setctxt))(j, (void *)seg, i);
 	}
-	set_fs(KERNEL_DS);
-
+	set_fc(USER_DATA);
 }
 
 /* erase the mappings for a dead context.  Uses the pg_dir for hints
diff --git a/arch/m68k/sun3/sun3ints.c b/arch/m68k/sun3/sun3ints.c
index 41ae422119d3..36cc280a4505 100644
--- a/arch/m68k/sun3/sun3ints.c
+++ b/arch/m68k/sun3/sun3ints.c
@@ -11,7 +11,6 @@
 #include <linux/sched.h>
 #include <linux/kernel_stat.h>
 #include <linux/interrupt.h>
-#include <asm/segment.h>
 #include <asm/intersil.h>
 #include <asm/oplib.h>
 #include <asm/sun3ints.h>
diff --git a/arch/m68k/sun3x/prom.c b/arch/m68k/sun3x/prom.c
index 74d2fe57524b..64c23bfaa90c 100644
--- a/arch/m68k/sun3x/prom.c
+++ b/arch/m68k/sun3x/prom.c
@@ -14,7 +14,6 @@
 #include <asm/traps.h>
 #include <asm/sun3xprom.h>
 #include <asm/idprom.h>
-#include <asm/segment.h>
 #include <asm/sun3ints.h>
 #include <asm/openprom.h>
 #include <asm/machines.h>
-- 
2.30.2

