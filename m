Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E6D2C07E95
	for <linux-m68k@archiver.kernel.org>; Thu,  8 Jul 2021 01:48:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 17B9B61C5B
	for <linux-m68k@archiver.kernel.org>; Thu,  8 Jul 2021 01:48:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230164AbhGHBvH (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 7 Jul 2021 21:51:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230160AbhGHBvH (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 7 Jul 2021 21:51:07 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22D77C061574
        for <linux-m68k@lists.linux-m68k.org>; Wed,  7 Jul 2021 18:48:26 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id x21-20020a17090aa395b029016e25313bfcso2809134pjp.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 07 Jul 2021 18:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=ukpAD4zVl/IU9xOHj/6xeuxI1WAPOu+W83X+dw8kU+M=;
        b=uI1UcpCIkPkk5xH8sZI4UNankv764Om5UwL7nxX5e1scyVh3/CSeYVDqoNjN3VwzmP
         LQ8eH587McdXyn7wbHdDtzsL1Irh117bdb3jC5+WoTtQfU4zhbjH3auJ8k9QSqwrjGiq
         xtNY3hW6yyZS+WKUFYDEvCvIra/3uHaHukywe2pHjUgviFwNCvsE/mix/91FJDM7F+eV
         dk40zU09qC3GXBcYTZvylmuDmoDajgo9XHZBCUYBNZx/ij9/D0D4bZcpy/PkUA8mGHzC
         ems4ewYiOxt9dNSeCQriIr6Z5BGaQOmssdi6oSfLkrfBUpWWgF5N2BW0RAsf0K2C599B
         5N3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ukpAD4zVl/IU9xOHj/6xeuxI1WAPOu+W83X+dw8kU+M=;
        b=Ygw8sOXyoJJMPIJzTzgirAtG7kWxTLbm1v+kyitD93IvVJ8tpC3XLhhEX5ue+dL0Lb
         ylyVU/nSs0Kyz050ISK6PIY3UiQllsNWqBluIBDk9xse4FbOUSoG9b0PkLUt5anqXtxx
         vTj9t5AUDgNpjpQXg/Rb+9NRu2lXxv+pe/snKTAunNWl6g8xg/MOsiNpPyubFRZB6Xm6
         EsAZfP5PYM6TNy5W9tKYqMfDVd1sGORd3YXn9wHj6rBsYl2ya3YYmyAjbUvu+CXXKypb
         kVFroNXUnAUU4FhSuofwg+uulK1V1G3Pn07VktZjpxE2QhtiidPbjZ2g8bC9aVEJ0Odf
         Ngpw==
X-Gm-Message-State: AOAM533XlgBujat4hXnLWJbEE+prA+5lybP9LBjuV2t9KZLB6nVkhb0n
        DXAXJm+BVXjsyyJQWz9ed7k=
X-Google-Smtp-Source: ABdhPJxQM25Qyigk/Wv+ppx+Nqdrvnreoh8bYtgNfwA9Y0tWm8Xbz/GGTxE7nif/3puLnxiY9in81Q==
X-Received: by 2002:a17:90a:9a1:: with SMTP id 30mr29543725pjo.53.1625708905413;
        Wed, 07 Jul 2021 18:48:25 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-152-189-137-fibre.sparkbb.co.nz. [222.152.189.137])
        by smtp.gmail.com with ESMTPSA id c5sm503232pfn.144.2021.07.07.18.48.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Jul 2021 18:48:25 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id 1212B3603D8; Thu,  8 Jul 2021 13:48:21 +1200 (NZST)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org
Cc:     schmitzmic@gmail.com, Christoph Hellwig <hch@lst.de>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH RFC v2] m68k: remove get_fs()/set_fs()
Date:   Thu,  8 Jul 2021 13:48:19 +1200
Message-Id: <1625708899-29013-1-git-send-email-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Followup to my patch "Fixes to Linus' 'remove set_fs patch'", with
kernel mode copy macros used in __get/put_kernel_nofault().
(As soon as I use the same __get/put_user_asm() macros with
parameters, like in Christoph's patch, everything falls to pieces.)

The fact that I had to touch include/linux/uaccess.h at all means
I got something horribly wrong in my use of MAKE_MM_SEG() to
set the segments. This is just to show what does happen to boot
and run OK, and perhaps help work out the differences to Christoph's
version that sadly crashes for me.

Link: https://lore.kernel.org/r/1625527229-3224-1-git-send-email-schmitzmic@gmail.com
Link: https://lore.kernel.org/r/20210707142531.GA26080@lst.de
CC: Christoph Hellwig <hch@lst.de>
CC: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---
 arch/m68k/Kconfig                   |   1 -
 arch/m68k/include/asm/segment.h     |  21 +-----
 arch/m68k/include/asm/thread_info.h |   2 +-
 arch/m68k/include/asm/tlbflush.h    |   7 +-
 arch/m68k/include/asm/uaccess.h     | 146 +++++++++++++++++++++++++++++++++++-
 arch/m68k/kernel/process.c          |   2 +-
 arch/m68k/kernel/traps.c            |  16 ++--
 arch/m68k/mm/cache.c                |  23 +++---
 arch/m68k/mm/init.c                 |   2 +-
 arch/m68k/mm/motorola.c             |   2 +-
 arch/m68k/sun3/config.c             |   2 +-
 arch/m68k/sun3/mmu_emu.c            |   7 +-
 include/linux/uaccess.h             |   3 -
 13 files changed, 181 insertions(+), 53 deletions(-)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index deaea88..a9dd518 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -33,7 +33,6 @@ config M68K
 	select NO_DMA if !MMU && !COLDFIRE
 	select OLD_SIGACTION
 	select OLD_SIGSUSPEND3
-	select SET_FS
 	select UACCESS_MEMCPY if !MMU
 	select VIRT_TO_BUS
 
diff --git a/arch/m68k/include/asm/segment.h b/arch/m68k/include/asm/segment.h
index 2b5e68a..a9fabf7d 100644
--- a/arch/m68k/include/asm/segment.h
+++ b/arch/m68k/include/asm/segment.h
@@ -26,19 +26,9 @@ typedef struct {
 
 #ifdef CONFIG_CPU_HAS_ADDRESS_SPACES
 /*
- * Get/set the SFC/DFC registers for MOVES instructions
+ * Set the SFC/DFC registers for MOVES instructions
  */
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
+static inline void set_segment(mm_segment_t val)
 {
 	__asm__ __volatile__ ("movec %0,%/sfc\n\t"
 			      "movec %0,%/dfc\n\t"
@@ -46,14 +36,9 @@ static inline void set_fs(mm_segment_t val)
 }
 
 #else
-#define USER_DS		MAKE_MM_SEG(TASK_SIZE)
-#define KERNEL_DS	MAKE_MM_SEG(0xFFFFFFFF)
-#define get_fs()	(current_thread_info()->addr_limit)
-#define set_fs(x)	(current_thread_info()->addr_limit = (x))
+#define set_segment(x)	((void)(x))
 #endif
 
-#define uaccess_kernel()	(get_fs().seg == KERNEL_DS.seg)
-
 #endif /* __ASSEMBLY__ */
 
 #endif /* _M68K_SEGMENT_H */
diff --git a/arch/m68k/include/asm/thread_info.h b/arch/m68k/include/asm/thread_info.h
index d813fed..6a93808 100644
--- a/arch/m68k/include/asm/thread_info.h
+++ b/arch/m68k/include/asm/thread_info.h
@@ -37,7 +37,7 @@ struct thread_info {
 #define INIT_THREAD_INFO(tsk)			\
 {						\
 	.task		= &tsk,			\
-	.addr_limit	= KERNEL_DS,		\
+	.addr_limit	= MAKE_MM_SEG(SUPER_DATA),		\
 	.preempt_count	= INIT_PREEMPT_COUNT,	\
 }
 
diff --git a/arch/m68k/include/asm/tlbflush.h b/arch/m68k/include/asm/tlbflush.h
index 5337bc2..c6a85d4 100644
--- a/arch/m68k/include/asm/tlbflush.h
+++ b/arch/m68k/include/asm/tlbflush.h
@@ -13,13 +13,14 @@ static inline void flush_tlb_kernel_page(void *addr)
 	if (CPU_IS_COLDFIRE) {
 		mmu_write(MMUOR, MMUOR_CNL);
 	} else if (CPU_IS_040_OR_060) {
-		mm_segment_t old_fs = get_fs();
-		set_fs(KERNEL_DS);
+		preempt_disable();
+		set_segment(MAKE_MM_SEG(SUPER_DATA));
 		__asm__ __volatile__(".chip 68040\n\t"
 				     "pflush (%0)\n\t"
 				     ".chip 68k"
 				     : : "a" (addr));
-		set_fs(old_fs);
+		set_segment(MAKE_MM_SEG(USER_DATA));
+		preempt_enable();
 	} else if (CPU_IS_020_OR_030)
 		__asm__ __volatile__("pflush #4,#4,(%0)" : : "a" (addr));
 }
diff --git a/arch/m68k/include/asm/uaccess.h b/arch/m68k/include/asm/uaccess.h
index f98208c..e7273e7 100644
--- a/arch/m68k/include/asm/uaccess.h
+++ b/arch/m68k/include/asm/uaccess.h
@@ -182,6 +182,149 @@ asm volatile ("\n"					\
 })
 #define get_user(x, ptr) __get_user(x, ptr)
 
+#define HAVE_GET_KERNEL_NOFAULT
+
+#define __put_kernel_asm(res, x, ptr, bwl, reg, err)	\
+asm volatile ("\n"					\
+	"1:	move."#bwl"	%2,%1\n"		\
+	"2:\n"						\
+	"	.section .fixup,\"ax\"\n"		\
+	"	.even\n"				\
+	"10:	moveq.l	%3,%0\n"			\
+	"	jra 2b\n"				\
+	"	.previous\n"				\
+	"\n"						\
+	"	.section __ex_table,\"a\"\n"		\
+	"	.align	4\n"				\
+	"	.long	1b,10b\n"			\
+	"	.long	2b,10b\n"			\
+	"	.previous"				\
+	: "+d" (res), "=m" (*(ptr))			\
+	: #reg (x), "i" (err))
+
+#define __get_kernel_asm(res, x, ptr, type, bwl, reg, err) ({		\
+	type __gu_val;							\
+	asm volatile ("\n"						\
+		"1:	move."#bwl"	%2,%1\n"			\
+		"2:\n"							\
+		"	.section .fixup,\"ax\"\n"			\
+		"	.even\n"					\
+		"10:	move.l	%3,%0\n"				\
+		"	sub.l	%1,%1\n"				\
+		"	jra	2b\n"					\
+		"	.previous\n"					\
+		"\n"							\
+		"	.section __ex_table,\"a\"\n"			\
+		"	.align	4\n"					\
+		"	.long	1b,10b\n"				\
+		"	.previous"					\
+		: "+d" (res), "=&" #reg (__gu_val)			\
+		: "m" (*(ptr)), "i" (err));				\
+	(x) = (__force typeof(*(ptr)))(__force unsigned long)__gu_val;	\
+})
+
+
+#define __put_kernel_nofault(dst, src, type, err_label)			\
+do {									\
+	type __pu_val;					\
+	int __pu_err = 0;						\
+									\
+	__pu_val = *(__force type *)(src);				\
+	switch (sizeof(type)) {						\
+	case 1:								\
+		__put_kernel_asm(__pu_err, __pu_val, (type *)(dst), b, d, -EFAULT);	\
+		break;							\
+	case 2:								\
+		__put_kernel_asm(__pu_err, __pu_val, (type *)(dst), w, r, -EFAULT);	\
+		break;							\
+	case 4:								\
+		__put_kernel_asm(__pu_err, __pu_val, (type *)(dst), l, r, -EFAULT);	\
+		break;							\
+	case 8:								\
+ 	    {								\
+ 		const void __user *__pu_ptr = (type *)(dst);			\
+		asm volatile ("\n"					\
+			"1:	movel	%2,(%1)+\n"		\
+			"2:	movel	%R2,(%1)\n"		\
+			"3:\n"						\
+			"	.section .fixup,\"ax\"\n"		\
+			"	.even\n"				\
+			"10:	movel %3,%0\n"				\
+			"	jra 3b\n"				\
+			"	.previous\n"				\
+			"\n"						\
+			"	.section __ex_table,\"a\"\n"		\
+			"	.align 4\n"				\
+			"	.long 1b,10b\n"				\
+			"	.long 2b,10b\n"				\
+			"	.long 3b,10b\n"				\
+			"	.previous"				\
+			: "+d" (__pu_err), "+a" (__pu_ptr)		\
+			: "r" (__pu_val), "i" (-EFAULT)			\
+			: "memory");					\
+		break;							\
+	    }								\
+	default:							\
+		BUILD_BUG();						\
+		break;							\
+	}								\
+	if (unlikely(__pu_err))						\
+		goto err_label;						\
+} while (0)
+
+#define __get_kernel_nofault(dst, src, type, err_label)			\
+do {									\
+	int __gu_err;							\
+									\
+	switch (sizeof(type)) {						\
+	case 1:								\
+		__get_kernel_asm(__gu_err, *(type *)(dst), (__force type *)(src), u8, b, d, -EFAULT);	\
+		break;							\
+	case 2:								\
+		__get_kernel_asm(__gu_err, *(type *)(dst), (__force type *)(src), u16, w, r, -EFAULT);	\
+		break;							\
+	case 4:								\
+		__get_kernel_asm(__gu_err, *(type *)(dst), (__force type *)(src), u32, l, r, -EFAULT);	\
+		break;							\
+	case 8: {							\
+		const void __user *__gu_ptr = (__force type *)(src);			\
+		union {							\
+			u64 l;						\
+			__typeof__((__force type *)(src)) t;				\
+		} __gu_val;						\
+		asm volatile ("\n"					\
+			"1:	move.l	(%2)+,%1\n"		\
+			"2:	move.l	(%2),%R1\n"		\
+			"3:\n"						\
+			"	.section .fixup,\"ax\"\n"		\
+			"	.even\n"				\
+			"10:	move.l	%3,%0\n"			\
+			"	sub.l	%1,%1\n"			\
+			"	sub.l	%R1,%R1\n"			\
+			"	jra	3b\n"				\
+			"	.previous\n"				\
+			"\n"						\
+			"	.section __ex_table,\"a\"\n"		\
+			"	.align	4\n"				\
+			"	.long	1b,10b\n"			\
+			"	.long	2b,10b\n"			\
+			"	.previous"				\
+			: "+d" (__gu_err), "=&r" (__gu_val.l),		\
+			  "+a" (__gu_ptr)				\
+			: "i" (-EFAULT)					\
+			: "memory");					\
+		(dst) = __gu_val.t;				\
+		break;							\
+	}								\
+	default:							\
+		BUILD_BUG();						\
+		break;							\
+	}								\
+	if (unlikely(__gu_err))						\
+		goto err_label;						\
+} while (0)
+
+
 unsigned long __generic_copy_from_user(void *to, const void __user *from, unsigned long n);
 unsigned long __generic_copy_to_user(void __user *to, const void *from, unsigned long n);
 
@@ -380,9 +523,6 @@ raw_copy_to_user(void __user *to, const void *from, unsigned long n)
 #define INLINE_COPY_FROM_USER
 #define INLINE_COPY_TO_USER
 
-#define user_addr_max() \
-	(uaccess_kernel() ? ~0UL : TASK_SIZE)
-
 extern long strncpy_from_user(char *dst, const char __user *src, long count);
 extern __must_check long strnlen_user(const char __user *str, long n);
 
diff --git a/arch/m68k/kernel/process.c b/arch/m68k/kernel/process.c
index da83cc8..f1c3e68 100644
--- a/arch/m68k/kernel/process.c
+++ b/arch/m68k/kernel/process.c
@@ -155,7 +155,7 @@ int copy_thread(unsigned long clone_flags, unsigned long usp, unsigned long arg,
 	 * Must save the current SFC/DFC value, NOT the value when
 	 * the parent was last descheduled - RGH  10-08-96
 	 */
-	p->thread.fs = get_fs().seg;
+	p->thread.fs = USER_DATA;
 
 	if (unlikely(p->flags & (PF_KTHREAD | PF_IO_WORKER))) {
 		/* kernel thread */
diff --git a/arch/m68k/kernel/traps.c b/arch/m68k/kernel/traps.c
index 9e12614..f74205a 100644
--- a/arch/m68k/kernel/traps.c
+++ b/arch/m68k/kernel/traps.c
@@ -181,9 +181,9 @@ static inline void access_error060 (struct frame *fp)
 static inline unsigned long probe040(int iswrite, unsigned long addr, int wbs)
 {
 	unsigned long mmusr;
-	mm_segment_t old_fs = get_fs();
 
-	set_fs(MAKE_MM_SEG(wbs));
+	preempt_disable();
+	set_segment(MAKE_MM_SEG(wbs));
 
 	if (iswrite)
 		asm volatile (".chip 68040; ptestw (%0); .chip 68k" : : "a" (addr));
@@ -192,7 +192,8 @@ static inline unsigned long probe040(int iswrite, unsigned long addr, int wbs)
 
 	asm volatile (".chip 68040; movec %%mmusr,%0; .chip 68k" : "=r" (mmusr));
 
-	set_fs(old_fs);
+	set_segment(MAKE_MM_SEG(USER_DATA));
+	preempt_enable();
 
 	return mmusr;
 }
@@ -201,10 +202,9 @@ static inline int do_040writeback1(unsigned short wbs, unsigned long wba,
 				   unsigned long wbd)
 {
 	int res = 0;
-	mm_segment_t old_fs = get_fs();
 
-	/* set_fs can not be moved, otherwise put_user() may oops */
-	set_fs(MAKE_MM_SEG(wbs));
+	preempt_disable();
+	set_segment(MAKE_MM_SEG(wbs));
 
 	switch (wbs & WBSIZ_040) {
 	case BA_SIZE_BYTE:
@@ -218,8 +218,8 @@ static inline int do_040writeback1(unsigned short wbs, unsigned long wba,
 		break;
 	}
 
-	/* set_fs can not be moved, otherwise put_user() may oops */
-	set_fs(old_fs);
+	set_segment(MAKE_MM_SEG(USER_DATA));
+	preempt_enable();
 
 
 	pr_debug("do_040writeback1, res=%d\n", res);
diff --git a/arch/m68k/mm/cache.c b/arch/m68k/mm/cache.c
index b486c08..cb513f6 100644
--- a/arch/m68k/mm/cache.c
+++ b/arch/m68k/mm/cache.c
@@ -12,7 +12,7 @@
 #include <asm/traps.h>
 
 
-static unsigned long virt_to_phys_slow(unsigned long vaddr)
+static unsigned long virt_to_phys_slow(unsigned long vaddr, mm_segment_t seg)
 {
 	if (CPU_IS_060) {
 		unsigned long paddr;
@@ -55,7 +55,7 @@ static unsigned long virt_to_phys_slow(unsigned long vaddr)
 		asm volatile ("ptestr %3,%2@,#7,%0\n\t"
 			      "pmove %%psr,%1"
 			      : "=a&" (descaddr), "=m" (mmusr)
-			      : "a" (vaddr), "d" (get_fs().seg));
+			      : "a" (vaddr), "d" (seg.seg));
 		if (mmusr & (MMU_I|MMU_B|MMU_L))
 			return 0;
 		descaddr = phys_to_virt((unsigned long)descaddr);
@@ -73,7 +73,7 @@ static unsigned long virt_to_phys_slow(unsigned long vaddr)
 
 /* Push n pages at kernel virtual address and clear the icache */
 /* RZ: use cpush %bc instead of cpush %dc, cinv %ic */
-void flush_icache_user_range(unsigned long address, unsigned long endaddr)
+static void do_flush_icache_range(unsigned long address, unsigned long endaddr, mm_segment_t seg)
 {
 	if (CPU_IS_COLDFIRE) {
 		unsigned long start, end;
@@ -92,7 +92,7 @@ void flush_icache_user_range(unsigned long address, unsigned long endaddr)
 				      ".chip 68040\n\t"
 				      "cpushp %%bc,(%0)\n\t"
 				      ".chip 68k"
-				      : : "a" (virt_to_phys_slow(address)));
+				      : : "a" (virt_to_phys_slow(address, seg)));
 			address += PAGE_SIZE;
 		} while (address < endaddr);
 	} else {
@@ -105,13 +105,18 @@ void flush_icache_user_range(unsigned long address, unsigned long endaddr)
 	}
 }
 
-void flush_icache_range(unsigned long address, unsigned long endaddr)
+void flush_icache_user_range(unsigned long address, unsigned long endaddr)
 {
-	mm_segment_t old_fs = get_fs();
+	do_flush_icache_range(address, endaddr, MAKE_MM_SEG(USER_DATA));
+}
 
-	set_fs(KERNEL_DS);
-	flush_icache_user_range(address, endaddr);
-	set_fs(old_fs);
+void flush_icache_range(unsigned long address, unsigned long endaddr)
+{
+	preempt_disable();
+	set_segment(MAKE_MM_SEG(SUPER_DATA));
+	do_flush_icache_range(address, endaddr, MAKE_MM_SEG(SUPER_DATA));
+	set_segment(MAKE_MM_SEG(USER_DATA));
+	preempt_enable();
 }
 EXPORT_SYMBOL(flush_icache_range);
 
diff --git a/arch/m68k/mm/init.c b/arch/m68k/mm/init.c
index 1759ab8..7a8d2b6 100644
--- a/arch/m68k/mm/init.c
+++ b/arch/m68k/mm/init.c
@@ -96,7 +96,7 @@ void __init paging_init(void)
 	/*
 	 * Set up SFC/DFC registers (user data space).
 	 */
-	set_fs (USER_DS);
+	set_segment(USER_DATA);
 
 	max_zone_pfn[ZONE_DMA] = end_mem >> PAGE_SHIFT;
 	free_area_init(max_zone_pfn);
diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
index 3a653f0..307c3ad 100644
--- a/arch/m68k/mm/motorola.c
+++ b/arch/m68k/mm/motorola.c
@@ -467,7 +467,7 @@ void __init paging_init(void)
 	/*
 	 * Set up SFC/DFC registers
 	 */
-	set_fs(KERNEL_DS);
+	set_segment(MAKE_MM_SEG(SUPER_DATA));
 
 #ifdef DEBUG
 	printk ("before free_area_init\n");
diff --git a/arch/m68k/sun3/config.c b/arch/m68k/sun3/config.c
index f7dd472..0e72766 100644
--- a/arch/m68k/sun3/config.c
+++ b/arch/m68k/sun3/config.c
@@ -89,7 +89,7 @@ void __init sun3_init(void)
 	sun3_reserved_pmeg[249] = 1;
 	sun3_reserved_pmeg[252] = 1;
 	sun3_reserved_pmeg[253] = 1;
-	set_fs(KERNEL_DS);
+	set_segment(SUPER_DATA);
 }
 
 /* Without this, Bad Things happen when something calls arch_reset. */
diff --git a/arch/m68k/sun3/mmu_emu.c b/arch/m68k/sun3/mmu_emu.c
index 7aa879b..f5b57aa 100644
--- a/arch/m68k/sun3/mmu_emu.c
+++ b/arch/m68k/sun3/mmu_emu.c
@@ -191,14 +191,15 @@ void __init mmu_emu_init(unsigned long bootmem_end)
 	for(seg = 0; seg < PAGE_OFFSET; seg += SUN3_PMEG_SIZE)
 		sun3_put_segmap(seg, SUN3_INVALID_PMEG);
 
-	set_fs(MAKE_MM_SEG(3));
+	preempt_disable();
+	set_segment(MAKE_MM_SEG(3));
 	for(seg = 0; seg < 0x10000000; seg += SUN3_PMEG_SIZE) {
 		i = sun3_get_segmap(seg);
 		for(j = 1; j < CONTEXTS_NUM; j++)
 			(*(romvec->pv_setctxt))(j, (void *)seg, i);
 	}
-	set_fs(KERNEL_DS);
-
+	set_segment(SUPER_DATA);
+	preempt_enable();
 }
 
 /* erase the mappings for a dead context.  Uses the pg_dir for hints
diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index c05e903..ec43aff 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -29,9 +29,6 @@ static inline void force_uaccess_end(mm_segment_t oldfs)
 	set_fs(oldfs);
 }
 #else /* CONFIG_SET_FS */
-typedef struct {
-	/* empty dummy */
-} mm_segment_t;
 
 #ifndef TASK_SIZE_MAX
 #define TASK_SIZE_MAX			TASK_SIZE
-- 
2.7.4

