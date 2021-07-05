Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B51A5C07E99
	for <linux-m68k@archiver.kernel.org>; Mon,  5 Jul 2021 23:20:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8CC0161961
	for <linux-m68k@archiver.kernel.org>; Mon,  5 Jul 2021 23:20:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231640AbhGEXXP (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 5 Jul 2021 19:23:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229733AbhGEXXP (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 5 Jul 2021 19:23:15 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F886C061574
        for <linux-m68k@lists.linux-m68k.org>; Mon,  5 Jul 2021 16:20:36 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id t9so19670774pgn.4
        for <linux-m68k@lists.linux-m68k.org>; Mon, 05 Jul 2021 16:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=vaHcFFinRNb+tVlOyakYQ4i6XPyXz6ZHQ5Po8Y4nVNg=;
        b=eLsLvEiJqIwDJSS6X0XyBWyKw9gkY1m+NckoBDgKRV1S75T2FuBpJp6QRe32ijP5n1
         DqoaMM+xrsgF9wuqAwszOR5ivkCQEHDlALS3rjIqoJW6ZGKCA8dPJs+dmz5z8TrvBd7S
         0T1+kWOACympBpQSFTT/gh13dx+J9czcW5X6T2UdXjEbopQWEpd9jZTgU5hm35e8tYcu
         WN+m6mtswzjbW9aU81CtT1sOj0FGnLsCJ5KIbK8HsLqiI/0INrST7hj4HVXt4xjBxa1c
         85FL7+dCtAzHQ+lnQac75tEEnE/94X5Seg7FvAq24Bh0+XOoRNUyHpnmgPNjqUx+W53i
         ZwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=vaHcFFinRNb+tVlOyakYQ4i6XPyXz6ZHQ5Po8Y4nVNg=;
        b=AyKlO/WUhXWAf70vXYUzRTVJhamWuHrCShusJLZNKBqJFWDq2LBqYl3t5dPGr1H862
         dS803uXYlojP+ZE4Q+mF7IZ4P6DYDdxyKy6NxeNl6Gx5ja/dyOJtG4UUn61ABB/7r5Xd
         0NaQu6sK1oba8z5E0sp/drLmOoOnXBQQ3xZbqxNvxzmWcWwyE/nAtSpfyCxrnkJU33bf
         X+P3lU5/nkybo1G4SxGHb1JGB+sDQ48sx18NG7PoQ9fLkC0FFVnYDrbyEGAKDkE4orIC
         j273SW3arllaWiLDH1NFgHicViVJqJK1eFkOfLaFsr2+oC8DIdecdS6a1VyMX6bTZxUY
         JPIA==
X-Gm-Message-State: AOAM5334CfaejwInLiASwZkzqQkmetxpx5XnNYMza8U4/iaIv1lsEMot
        yoa0bMVl4mytQ3GeblwmI4s=
X-Google-Smtp-Source: ABdhPJyp0dIUAiS0FyMx0iMmCI0vrfk11WwafKfxoOcIW0TPoFVTF1rSwtCQ3523JwfEXZqaCveEOw==
X-Received: by 2002:a62:8603:0:b029:31c:5cb3:ca2e with SMTP id x3-20020a6286030000b029031c5cb3ca2emr11627804pfd.1.1625527235770;
        Mon, 05 Jul 2021 16:20:35 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-152-189-137-fibre.sparkbb.co.nz. [222.152.189.137])
        by smtp.gmail.com with ESMTPSA id c9sm12141167pja.7.2021.07.05.16.20.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Jul 2021 16:20:35 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id 2A8A93603D8; Tue,  6 Jul 2021 11:20:31 +1200 (NZST)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org
Cc:     torvalds@linux-foundation.org,
        Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH RFC] Fixes to Linus' 'remove set_fs patch'
Date:   Tue,  6 Jul 2021 11:20:29 +1200
Message-Id: <1625527229-3224-1-git-send-email-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Linus' patch didn't compile out of the box. I'm a little
worried that I had to patch mm/maccess.c, but I didn't
apply Christoph's patches first (plain v5.13). 

This (on top of Linus' patch) compiles and boots for m68k/mmu
(tested on ARAnyM, ramdisk and disk image).

Link: https://lore.kernel.org/r/CAHk-=wgjWebav7K_F7WS7KiwOAYr8KktsZiaV+jYP5LU5RB3Sg@mail.gmail.com
CC: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---
 arch/m68k/include/asm/thread_info.h |  2 +-
 arch/m68k/include/asm/tlbflush.h    |  4 ++--
 arch/m68k/include/asm/uaccess.h     |  3 ---
 arch/m68k/kernel/process.c          |  2 +-
 arch/m68k/kernel/traps.c            |  4 ++--
 arch/m68k/mm/cache.c                | 10 +++++-----
 arch/m68k/mm/motorola.c             |  2 +-
 include/linux/uaccess.h             |  3 ---
 mm/maccess.c                        | 15 ++++++---------
 9 files changed, 18 insertions(+), 27 deletions(-)

diff --git a/arch/m68k/include/asm/thread_info.h b/arch/m68k/include/asm/thread_info.h
index d813fed..4753d52 100644
--- a/arch/m68k/include/asm/thread_info.h
+++ b/arch/m68k/include/asm/thread_info.h
@@ -37,7 +37,7 @@ struct thread_info {
 #define INIT_THREAD_INFO(tsk)			\
 {						\
 	.task		= &tsk,			\
-	.addr_limit	= KERNEL_DS,		\
+	.addr_limit	= MAKE_MM_SEG(SUPER_DATA),	\
 	.preempt_count	= INIT_PREEMPT_COUNT,	\
 }
 
diff --git a/arch/m68k/include/asm/tlbflush.h b/arch/m68k/include/asm/tlbflush.h
index 47d4c3b..c6a85d4 100644
--- a/arch/m68k/include/asm/tlbflush.h
+++ b/arch/m68k/include/asm/tlbflush.h
@@ -14,12 +14,12 @@ static inline void flush_tlb_kernel_page(void *addr)
 		mmu_write(MMUOR, MMUOR_CNL);
 	} else if (CPU_IS_040_OR_060) {
 		preempt_disable();
-		set_segment(SUPER_DATA);
+		set_segment(MAKE_MM_SEG(SUPER_DATA));
 		__asm__ __volatile__(".chip 68040\n\t"
 				     "pflush (%0)\n\t"
 				     ".chip 68k"
 				     : : "a" (addr));
-		set_segment(USER_DATA);
+		set_segment(MAKE_MM_SEG(USER_DATA));
 		preempt_enable();
 	} else if (CPU_IS_020_OR_030)
 		__asm__ __volatile__("pflush #4,#4,(%0)" : : "a" (addr));
diff --git a/arch/m68k/include/asm/uaccess.h b/arch/m68k/include/asm/uaccess.h
index f98208c..95f661e 100644
--- a/arch/m68k/include/asm/uaccess.h
+++ b/arch/m68k/include/asm/uaccess.h
@@ -380,9 +380,6 @@ raw_copy_to_user(void __user *to, const void *from, unsigned long n)
 #define INLINE_COPY_FROM_USER
 #define INLINE_COPY_TO_USER
 
-#define user_addr_max() \
-	(uaccess_kernel() ? ~0UL : TASK_SIZE)
-
 extern long strncpy_from_user(char *dst, const char __user *src, long count);
 extern __must_check long strnlen_user(const char __user *str, long n);
 
diff --git a/arch/m68k/kernel/process.c b/arch/m68k/kernel/process.c
index 8298574..f1c3e68 100644
--- a/arch/m68k/kernel/process.c
+++ b/arch/m68k/kernel/process.c
@@ -155,7 +155,7 @@ int copy_thread(unsigned long clone_flags, unsigned long usp, unsigned long arg,
 	 * Must save the current SFC/DFC value, NOT the value when
 	 * the parent was last descheduled - RGH  10-08-96
 	 */
-	p->thread.fs = USER_DATA.seg;
+	p->thread.fs = USER_DATA;
 
 	if (unlikely(p->flags & (PF_KTHREAD | PF_IO_WORKER))) {
 		/* kernel thread */
diff --git a/arch/m68k/kernel/traps.c b/arch/m68k/kernel/traps.c
index 8586318..f74205a 100644
--- a/arch/m68k/kernel/traps.c
+++ b/arch/m68k/kernel/traps.c
@@ -192,7 +192,7 @@ static inline unsigned long probe040(int iswrite, unsigned long addr, int wbs)
 
 	asm volatile (".chip 68040; movec %%mmusr,%0; .chip 68k" : "=r" (mmusr));
 
-	set_segment(USER_DATA);
+	set_segment(MAKE_MM_SEG(USER_DATA));
 	preempt_enable();
 
 	return mmusr;
@@ -218,7 +218,7 @@ static inline int do_040writeback1(unsigned short wbs, unsigned long wba,
 		break;
 	}
 
-	set_segment(USER_DATA);
+	set_segment(MAKE_MM_SEG(USER_DATA));
 	preempt_enable();
 
 
diff --git a/arch/m68k/mm/cache.c b/arch/m68k/mm/cache.c
index 80e311aa..cb513f6 100644
--- a/arch/m68k/mm/cache.c
+++ b/arch/m68k/mm/cache.c
@@ -73,7 +73,7 @@ static unsigned long virt_to_phys_slow(unsigned long vaddr, mm_segment_t seg)
 
 /* Push n pages at kernel virtual address and clear the icache */
 /* RZ: use cpush %bc instead of cpush %dc, cinv %ic */
-static void do_flush_icache_user_range(unsigned long address, unsigned long endaddr, mm_segment_t seg)
+static void do_flush_icache_range(unsigned long address, unsigned long endaddr, mm_segment_t seg)
 {
 	if (CPU_IS_COLDFIRE) {
 		unsigned long start, end;
@@ -107,15 +107,15 @@ static void do_flush_icache_user_range(unsigned long address, unsigned long enda
 
 void flush_icache_user_range(unsigned long address, unsigned long endaddr)
 {
-	do_flush_icache_range(address, endaddr, USER_DATA);
+	do_flush_icache_range(address, endaddr, MAKE_MM_SEG(USER_DATA));
 }
 
 void flush_icache_range(unsigned long address, unsigned long endaddr)
 {
 	preempt_disable();
-	set_segment(SUPER_DATA);
-	do_flush_icache_range(address, endaddr, SUPER_DATA);
-	set_segment(USER_DATA);
+	set_segment(MAKE_MM_SEG(SUPER_DATA));
+	do_flush_icache_range(address, endaddr, MAKE_MM_SEG(SUPER_DATA));
+	set_segment(MAKE_MM_SEG(USER_DATA));
 	preempt_enable();
 }
 EXPORT_SYMBOL(flush_icache_range);
diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
index 7af7d5a..b0063f3 100644
--- a/arch/m68k/mm/motorola.c
+++ b/arch/m68k/mm/motorola.c
@@ -467,7 +467,7 @@ void __init paging_init(void)
 	/*
 	 * Set up SFC/DFC registers
 	 */
-	set_segment(USER_DATA);
+	set_segment(MAKE_MM_SEG(USER_DATA));
 
 #ifdef DEBUG
 	printk ("before free_area_init\n");
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
diff --git a/mm/maccess.c b/mm/maccess.c
index 3bd7040..690e9bb 100644
--- a/mm/maccess.c
+++ b/mm/maccess.c
@@ -105,17 +105,16 @@ long strncpy_from_kernel_nofault(char *dst, const void *unsafe_addr, long count)
 long copy_from_kernel_nofault(void *dst, const void *src, size_t size)
 {
 	long ret;
-	mm_segment_t old_fs = get_fs();
 
 	if (!copy_from_kernel_nofault_allowed(src, size))
 		return -ERANGE;
 
-	set_fs(KERNEL_DS);
+	set_segment(MAKE_MM_SEG(SUPER_DATA));
 	pagefault_disable();
 	ret = __copy_from_user_inatomic(dst, (__force const void __user *)src,
 			size);
 	pagefault_enable();
-	set_fs(old_fs);
+	set_segment(MAKE_MM_SEG(USER_DATA));
 
 	if (ret)
 		return -EFAULT;
@@ -135,13 +134,12 @@ EXPORT_SYMBOL_GPL(copy_from_kernel_nofault);
 long copy_to_kernel_nofault(void *dst, const void *src, size_t size)
 {
 	long ret;
-	mm_segment_t old_fs = get_fs();
 
-	set_fs(KERNEL_DS);
+	set_segment(MAKE_MM_SEG(SUPER_DATA));
 	pagefault_disable();
 	ret = __copy_to_user_inatomic((__force void __user *)dst, src, size);
 	pagefault_enable();
-	set_fs(old_fs);
+	set_segment(MAKE_MM_SEG(USER_DATA));
 
 	if (ret)
 		return -EFAULT;
@@ -169,7 +167,6 @@ long copy_to_kernel_nofault(void *dst, const void *src, size_t size)
  */
 long strncpy_from_kernel_nofault(char *dst, const void *unsafe_addr, long count)
 {
-	mm_segment_t old_fs = get_fs();
 	const void *src = unsafe_addr;
 	long ret;
 
@@ -178,7 +175,7 @@ long strncpy_from_kernel_nofault(char *dst, const void *unsafe_addr, long count)
 	if (!copy_from_kernel_nofault_allowed(unsafe_addr, count))
 		return -ERANGE;
 
-	set_fs(KERNEL_DS);
+	set_segment(MAKE_MM_SEG(SUPER_DATA));
 	pagefault_disable();
 
 	do {
@@ -187,7 +184,7 @@ long strncpy_from_kernel_nofault(char *dst, const void *unsafe_addr, long count)
 
 	dst[-1] = '\0';
 	pagefault_enable();
-	set_fs(old_fs);
+	set_segment(MAKE_MM_SEG(USER_DATA));
 
 	return ret ? -EFAULT : src - unsafe_addr;
 }
-- 
2.7.4

