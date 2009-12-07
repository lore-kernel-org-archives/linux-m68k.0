From: Maxim Kuvyrkov <maxim@codesourcery.com>
Subject: Re: Add private syscalls to support NPTL
Date: Mon, 07 Dec 2009 11:38:00 +0300
Message-ID: <4B1CBEE8.7000907@codesourcery.com>
References: <4A89D037.7090807@codesourcery.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040909060005060903080701"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.codesourcery.com ([38.113.113.100]:49345 "EHLO
	mail.codesourcery.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933632AbZLGIiC (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 7 Dec 2009 03:38:02 -0500
In-Reply-To: <4A89D037.7090807@codesourcery.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andreas Schwab <schwab@linux-m68k.org>, linux-m68k@vger.kernel.org

This is a multi-part message in MIME format.
--------------040909060005060903080701
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Maxim Kuvyrkov wrote:
> Hello Geert,
> 
> The attached patches add kernel support for userspace NPTL bits for m68k.

Here is yet another final version of the patch.  As Andreas pointed out 
in another thread, the indentation is off in couple of places, so I 
fixed that by formatting the code with scripts/Lindent.  I also 
forwarded the reformatted version of the uClinux patch to uclinux-dev@.

-- 
Maxim Kuvyrkov
CodeSourcery
maxim@codesourcery.com
(650) 331-3385 x724

--------------040909060005060903080701
Content-Type: text/plain; x-mac-type="0"; x-mac-creator="0";
 name="0001-Add-NPTL-support-for-m68k.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0001-Add-NPTL-support-for-m68k.patch"

>From 571248e741ab66392ec0296f4662f3e893a9d105 Mon Sep 17 00:00:00 2001
From: Maxim Kuvyrkov <maxim@codesourcery.com>
Date: Mon, 7 Dec 2009 00:24:27 -0800
Subject: [PATCH 1/2] Add NPTL support for m68k

This patch adds several syscalls, that provide necessary
functionality to support NPTL on m68k/ColdFire.
The syscalls are read_tp, write_tp, atomic_cmpxchg_32 and atomic_barrier.
The cmpxchg syscall is required for ColdFire as it doesn't support 'cas'
instruction.

Also a ptrace call PTRACE_GET_THREAD_AREA is added to allow debugger to
inspect the TLS storage.

Signed-off-by: Maxim Kuvyrkov <maxim@codesourcery.com>
---
 arch/m68k/include/asm/ptrace.h         |    2 +
 arch/m68k/include/asm/thread_info_mm.h |    1 +
 arch/m68k/include/asm/unistd.h         |    6 ++-
 arch/m68k/kernel/entry.S               |    4 ++
 arch/m68k/kernel/process.c             |    4 ++
 arch/m68k/kernel/ptrace.c              |    5 ++
 arch/m68k/kernel/sys_m68k.c            |   80 ++++++++++++++++++++++++++++++++
 7 files changed, 101 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/include/asm/ptrace.h b/arch/m68k/include/asm/ptrace.h
index a6ab663..43ab86a 100644
--- a/arch/m68k/include/asm/ptrace.h
+++ b/arch/m68k/include/asm/ptrace.h
@@ -71,6 +71,8 @@ struct switch_stack {
 #define PTRACE_GETFPREGS          14
 #define PTRACE_SETFPREGS          15
 
+#define PTRACE_GET_THREAD_AREA    25
+
 #define PTRACE_SINGLEBLOCK	33	/* resume execution until next branch */
 
 #ifdef __KERNEL__
diff --git a/arch/m68k/include/asm/thread_info_mm.h b/arch/m68k/include/asm/thread_info_mm.h
index 167e518..67c2f7b 100644
--- a/arch/m68k/include/asm/thread_info_mm.h
+++ b/arch/m68k/include/asm/thread_info_mm.h
@@ -16,6 +16,7 @@ struct thread_info {
 	struct exec_domain	*exec_domain;	/* execution domain */
 	int			preempt_count;	/* 0 => preemptable, <0 => BUG */
 	__u32 cpu; /* should always be 0 on m68k */
+	unsigned long tp_value;
 	struct restart_block    restart_block;
 };
 #endif /* __ASSEMBLY__ */
diff --git a/arch/m68k/include/asm/unistd.h b/arch/m68k/include/asm/unistd.h
index 48b87f5..d076bea 100644
--- a/arch/m68k/include/asm/unistd.h
+++ b/arch/m68k/include/asm/unistd.h
@@ -336,10 +336,14 @@
 #define __NR_pwritev		330
 #define __NR_rt_tgsigqueueinfo	331
 #define __NR_perf_event_open	332
+#define __NR_read_tp		333
+#define __NR_write_tp		334
+#define __NR_atomic_cmpxchg_32	335
+#define __NR_atomic_barrier	336
 
 #ifdef __KERNEL__
 
-#define NR_syscalls		333
+#define NR_syscalls		337
 
 #define __ARCH_WANT_IPC_PARSE_VERSION
 #define __ARCH_WANT_OLD_READDIR
diff --git a/arch/m68k/kernel/entry.S b/arch/m68k/kernel/entry.S
index 77fc7c1..4238ac3 100644
--- a/arch/m68k/kernel/entry.S
+++ b/arch/m68k/kernel/entry.S
@@ -761,4 +761,8 @@ sys_call_table:
 	.long sys_pwritev		/* 330 */
 	.long sys_rt_tgsigqueueinfo
 	.long sys_perf_event_open
+	.long sys_read_tp
+	.long sys_write_tp
+	.long sys_atomic_cmpxchg_32	/* 335 */
+	.long sys_atomic_barrier
 
diff --git a/arch/m68k/kernel/process.c b/arch/m68k/kernel/process.c
index 0529659..17c3f32 100644
--- a/arch/m68k/kernel/process.c
+++ b/arch/m68k/kernel/process.c
@@ -251,6 +251,10 @@ int copy_thread(unsigned long clone_flags, unsigned long usp,
 
 	p->thread.usp = usp;
 	p->thread.ksp = (unsigned long)childstack;
+
+	if (clone_flags & CLONE_SETTLS)
+		task_thread_info(p)->tp_value = regs->d5;
+
 	/*
 	 * Must save the current SFC/DFC value, NOT the value when
 	 * the parent was last descheduled - RGH  10-08-96
diff --git a/arch/m68k/kernel/ptrace.c b/arch/m68k/kernel/ptrace.c
index 1fc217e..616e597 100644
--- a/arch/m68k/kernel/ptrace.c
+++ b/arch/m68k/kernel/ptrace.c
@@ -245,6 +245,11 @@ long arch_ptrace(struct task_struct *child, long request, long addr, long data)
 			ret = -EFAULT;
 		break;
 
+	case PTRACE_GET_THREAD_AREA:
+		ret = put_user(task_thread_info(child)->tp_value,
+			       (unsigned long __user *)data);
+		break;
+
 	default:
 		ret = ptrace_request(child, request, addr, data);
 		break;
diff --git a/arch/m68k/kernel/sys_m68k.c b/arch/m68k/kernel/sys_m68k.c
index 7deb402..69b5f38 100644
--- a/arch/m68k/kernel/sys_m68k.c
+++ b/arch/m68k/kernel/sys_m68k.c
@@ -28,6 +28,11 @@
 #include <asm/traps.h>
 #include <asm/page.h>
 #include <asm/unistd.h>
+#include <linux/elf.h>
+#include <asm/tlb.h>
+
+asmlinkage int do_page_fault(struct pt_regs *regs, unsigned long address,
+			     unsigned long error_code);
 
 /* common code for old and new mmaps */
 static inline long do_mmap2(
@@ -662,3 +667,78 @@ int kernel_execve(const char *filename, char *const argv[], char *const envp[])
 			: "d" (__a), "d" (__b), "d" (__c));
 	return __res;
 }
+
+asmlinkage unsigned long sys_read_tp(void)
+{
+	return current_thread_info()->tp_value;
+}
+
+asmlinkage int sys_write_tp(unsigned long tp)
+{
+	current_thread_info()->tp_value = tp;
+	return 0;
+}
+
+/* This syscall gets its arguments in A0 (mem), D2 (oldval) and
+   D1 (newval).  */
+asmlinkage int
+sys_atomic_cmpxchg_32(unsigned long newval, int oldval, int d3, int d4, int d5,
+		      unsigned long __user * mem)
+{
+	/* This was borrowed from ARM's implementation.  */
+	for (;;) {
+		struct mm_struct *mm = current->mm;
+		pgd_t *pgd;
+		pmd_t *pmd;
+		pte_t *pte;
+		spinlock_t *ptl;
+		unsigned long mem_value;
+
+		down_read(&mm->mmap_sem);
+		pgd = pgd_offset(mm, (unsigned long)mem);
+		if (!pgd_present(*pgd))
+			goto bad_access;
+		pmd = pmd_offset(pgd, (unsigned long)mem);
+		if (!pmd_present(*pmd))
+			goto bad_access;
+		pte = pte_offset_map_lock(mm, pmd, (unsigned long)mem, &ptl);
+		if (!pte_present(*pte) || !pte_dirty(*pte)) {
+			pte_unmap_unlock(pte, ptl);
+			goto bad_access;
+		}
+
+		mem_value = *mem;
+		if (mem_value == oldval)
+			*mem = newval;
+
+		pte_unmap_unlock(pte, ptl);
+		up_read(&mm->mmap_sem);
+		return mem_value;
+
+	      bad_access:
+		up_read(&mm->mmap_sem);
+		/* This is not necessarily a bad access, we can get here if
+		   a memory we're trying to write to should be copied-on-write.
+		   Make the kernel do the necessary page stuff, then re-iterate.
+		   Simulate a write access fault to do that.  */
+		{
+			/* The first argument of the function corresponds to
+			   D1, which is the first field of struct pt_regs.  */
+			struct pt_regs *fp = (struct pt_regs *)&newval;
+
+			/* '3' is an RMW flag.  */
+			if (do_page_fault(fp, (unsigned long)mem, 3))
+				/* If the do_page_fault() failed, we don't
+				   have anything meaningful to return.
+				   There should be a SIGSEGV pending for
+				   the process.  */
+				return 0xdeadbeef;
+		}
+	}
+}
+
+asmlinkage int sys_atomic_barrier(void)
+{
+	/* no code needed for uniprocs */
+	return 0;
+}
-- 
1.6.2.4


--------------040909060005060903080701--
