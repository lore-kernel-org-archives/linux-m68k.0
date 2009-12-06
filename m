From: Maxim Kuvyrkov <maxim@codesourcery.com>
Subject: [PATCH] NPTL support for uClinux
Date: Sun, 06 Dec 2009 22:04:38 +0300
Message-ID: <4B1C0046.6050207@codesourcery.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------050401050903060903080803"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.codesourcery.com ([38.113.113.100]:35379 "EHLO
	mail.codesourcery.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933978AbZLFTEl (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 6 Dec 2009 14:04:41 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

This is a multi-part message in MIME format.
--------------050401050903060903080803
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

The following patch makes NPTL syscalls work for m68knommu.

I didn't test this beyond building the kernel, there's no much point to 
it till uClibc support for NPTL on m68k is implemented.

The patch is basically a copy of original NPTL patch for usual m68k. 
The only real change is in atomic_cmpxchg syscall implementation: code 
that checked correctness of the memory reference was removed.

-- 
Maxim Kuvyrkov
CodeSourcery
maxim@codesourcery.com
(650) 331-3385 x724

--------------050401050903060903080803
Content-Type: text/plain; x-mac-type="0"; x-mac-creator="0";
 name="0001-NPTL-support-for-uClinux.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0001-NPTL-support-for-uClinux.patch"

>From a41f47134963de257e253ba1b8742c1670cc2621 Mon Sep 17 00:00:00 2001
From: Maxim Kuvyrkov <maxim@codesourcery.com>
Date: Sun, 6 Dec 2009 10:08:14 -0800
Subject: [PATCH] NPTL support for uClinux

Port syscalls for NPTL support to m68knommu.

Signed-off-by: Maxim Kuvyrkov <maxim@codesourcery.com>
---
 arch/m68k/include/asm/thread_info_no.h |    1 +
 arch/m68knommu/kernel/process.c        |    4 +++
 arch/m68knommu/kernel/ptrace.c         |    5 ++++
 arch/m68knommu/kernel/sys_m68k.c       |   39 ++++++++++++++++++++++++++++++++
 arch/m68knommu/kernel/syscalltable.S   |    4 +++
 5 files changed, 53 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/include/asm/thread_info_no.h b/arch/m68k/include/asm/thread_info_no.h
index c2bde5e..6f11d81 100644
--- a/arch/m68k/include/asm/thread_info_no.h
+++ b/arch/m68k/include/asm/thread_info_no.h
@@ -37,6 +37,7 @@ struct thread_info {
 	unsigned long	   flags;		/* low level flags */
 	int		   cpu;			/* cpu we're on */
 	int		   preempt_count;	/* 0 => preemptable, <0 => BUG */
+	unsigned long tp_value;
 	struct restart_block restart_block;
 };
 
diff --git a/arch/m68knommu/kernel/process.c b/arch/m68knommu/kernel/process.c
index 8f8f4ab..e685200 100644
--- a/arch/m68knommu/kernel/process.c
+++ b/arch/m68knommu/kernel/process.c
@@ -221,6 +221,10 @@ int copy_thread(unsigned long clone_flags,
 
 	p->thread.usp = usp;
 	p->thread.ksp = (unsigned long)childstack;
+
+	if (clone_flags & CLONE_SETTLS)
+		task_thread_info(p)->tp_value = regs->d5;
+
 	/*
 	 * Must save the current SFC/DFC value, NOT the value when
 	 * the parent was last descheduled - RGH  10-08-96
diff --git a/arch/m68knommu/kernel/ptrace.c b/arch/m68knommu/kernel/ptrace.c
index 4d38289..c77c115 100644
--- a/arch/m68knommu/kernel/ptrace.c
+++ b/arch/m68knommu/kernel/ptrace.c
@@ -319,6 +319,11 @@ long arch_ptrace(struct task_struct *child, long request, long addr, long data)
 		}
 #endif
 
+	case PTRACE_GET_THREAD_AREA:
+		ret = put_user(task_thread_info(child)->tp_value,
+				(unsigned long __user *) data);
+		break;
+
 		default:
 			ret = -EIO;
 			break;
diff --git a/arch/m68knommu/kernel/sys_m68k.c b/arch/m68knommu/kernel/sys_m68k.c
index efdd090..b931dbf 100644
--- a/arch/m68knommu/kernel/sys_m68k.c
+++ b/arch/m68knommu/kernel/sys_m68k.c
@@ -224,3 +224,42 @@ int kernel_execve(const char *filename, char *const argv[], char *const envp[])
 			: "d" (__a), "d" (__b), "d" (__c));
 	return __res;
 }
+
+asmlinkage unsigned long
+sys_read_tp(void)
+{
+	return current_thread_info()->tp_value;
+}
+
+asmlinkage int
+sys_write_tp(unsigned long tp)
+{
+	current_thread_info()->tp_value = tp;
+	return 0;
+}
+
+/* This syscall gets its arguments in A0 (mem), D2 (oldval) and
+   D1 (newval).  */
+asmlinkage int
+sys_atomic_cmpxchg_32(unsigned long newval, int oldval, int d3, int d4, int d5,
+		unsigned long __user *mem)
+{
+	struct mm_struct *mm = current->mm;
+	unsigned long mem_value;
+
+	down_read(&mm->mmap_sem);
+
+	mem_value = *mem;
+	if (mem_value == oldval)
+		*mem = newval;
+
+	up_read(&mm->mmap_sem);
+	return mem_value;
+}
+
+asmlinkage int
+sys_atomic_barrier(void)
+{
+	/* no code needed for uniprocs */
+	return 0;
+}
diff --git a/arch/m68knommu/kernel/syscalltable.S b/arch/m68knommu/kernel/syscalltable.S
index 23535cc..933a9e6 100644
--- a/arch/m68knommu/kernel/syscalltable.S
+++ b/arch/m68knommu/kernel/syscalltable.S
@@ -351,6 +351,10 @@ ENTRY(sys_call_table)
 	.long sys_pwritev		/* 330 */
 	.long sys_rt_tgsigqueueinfo
 	.long sys_perf_event_open
+	.long sys_read_tp
+	.long sys_write_tp
+	.long sys_atomic_cmpxchg_32	/* 335 */
+	.long sys_atomic_barrier
 
 	.rept NR_syscalls-(.-sys_call_table)/4
 		.long sys_ni_syscall
-- 
1.6.2.4


--------------050401050903060903080803--
