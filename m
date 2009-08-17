From: Maxim Kuvyrkov <maxim@codesourcery.com>
Subject: Add private syscalls to support NPTL
Date: Tue, 18 Aug 2009 01:48:39 +0400
Message-ID: <4A89D037.7090807@codesourcery.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------060402010906090609010003"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.codesourcery.com ([65.74.133.4]:40499 "EHLO
	mail.codesourcery.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751679AbZHQVz2 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 17 Aug 2009 17:55:28 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andreas Schwab <schwab@linux-m68k.org>, linux-m68k@vger.kernel.org

This is a multi-part message in MIME format.
--------------060402010906090609010003
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello Geert,

The attached patches add kernel support for userspace NPTL bits for m68k.

Since the draft m68k/ColdFire NPTL ABI was posted at 
http://marc.info/?l=linux-m68k&m=119644992713696&w=2 several issues 
surfaced that called for syscall equivalents of the vDSO helpers; the 
main reason for the syscalls is that GLIBC does not support linking in 
vDSO for static binaries.

Another reason is that I'm having problems implementing user-space 
atomic_cmpxchg (for ColdFire) and context switching for user-space TP 
(both m68k and ColdFire).  I've spent quite some time trying to figure 
these two out, but couldn't make everything work reliably.  I'll follow 
up on this in a different thread.

These patches were tested on a ColdFire board running a 2.6.29 kernel, 
and the system passed GLIBC's nptl tests.

The one issue I know of with this patch is that strace needs update to 
pretty print the new [negative] syscalls.

Does the patches look fine?

Thanks,

--
Maxim K.
CodeSourcery

--------------060402010906090609010003
Content-Type: text/plain; x-mac-type="0"; x-mac-creator="0";
 name="0001-Add-syscalls-to-support-m68k-NPTL.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0001-Add-syscalls-to-support-m68k-NPTL.patch"

>From fda8fc4e5706e93f527c2cbc554813f090a1a3fe Mon Sep 17 00:00:00 2001
From: Maxim Kuvyrkov <maxim@codesourcery.com>
Date: Mon, 17 Aug 2009 12:16:36 -0700
Subject: [PATCH 1/2] Add syscalls to support m68k NPTL.

This patch adds several syscalls, private to M68K, that provide necessary
functionality to support NPTL.
The syscalls are read_tp, write_tp, atomic_cmpxchg_32 and atomic_barrier.
The cmpxchg syscall is required for ColdFire as it doesn't support 'cas'
instruction.

Signed-off-by: Maxim Kuvyrkov <maxim@codesourcery.com>
---
 arch/m68k/include/asm/thread_info_mm.h |    1 +
 arch/m68k/include/asm/unistd.h         |    7 +++
 arch/m68k/kernel/entry.S               |   10 ++++-
 arch/m68k/kernel/sys_m68k.c            |   78 ++++++++++++++++++++++++++++++++
 4 files changed, 95 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/include/asm/thread_info_mm.h b/arch/m68k/include/asm/thread_info_mm.h
index 6ea5c33..c24a353 100644
--- a/arch/m68k/include/asm/thread_info_mm.h
+++ b/arch/m68k/include/asm/thread_info_mm.h
@@ -10,6 +10,7 @@ struct thread_info {
 	struct exec_domain	*exec_domain;	/* execution domain */
 	int			preempt_count;	/* 0 => preemptable, <0 => BUG */
 	__u32 cpu; /* should always be 0 on m68k */
+	unsigned long tp_value;
 	struct restart_block    restart_block;
 };
 
diff --git a/arch/m68k/include/asm/unistd.h b/arch/m68k/include/asm/unistd.h
index aa29a86..619677c 100644
--- a/arch/m68k/include/asm/unistd.h
+++ b/arch/m68k/include/asm/unistd.h
@@ -335,9 +335,16 @@
 #define __NR_preadv		329
 #define __NR_pwritev		330
 
+/* Private syscalls.  */
+#define __M68K_NR_read_tp		0xffffffff
+#define __M68K_NR_write_tp		0xfffffffe
+#define __M68K_NR_atomic_cmpxchg_32	0xfffffffd
+#define __M68K_NR_atomic_barrier	0xfffffffc
+
 #ifdef __KERNEL__
 
 #define NR_syscalls		331
+#define M68K_NR_syscalls	0xfffffffb
 
 #define __ARCH_WANT_IPC_PARSE_VERSION
 #define __ARCH_WANT_OLD_READDIR
diff --git a/arch/m68k/kernel/entry.S b/arch/m68k/kernel/entry.S
index 8744f60..fc834d6 100644
--- a/arch/m68k/kernel/entry.S
+++ b/arch/m68k/kernel/entry.S
@@ -86,6 +86,8 @@ do_trace_entry:
 	movel	%sp@(PT_ORIG_D0),%d0
 	cmpl	#NR_syscalls,%d0
 	jcs	syscall
+	cmpl	#M68K_NR_syscalls,%d0
+	jcc	syscall
 badsys:
 	movel	#-ENOSYS,%sp@(PT_D0)
 	jra	ret_from_syscall
@@ -124,7 +126,9 @@ ENTRY(system_call)
 	tstb	%curptr@(TASK_INFO+TINFO_FLAGS+2)
 	jmi	do_trace_entry
 	cmpl	#NR_syscalls,%d0
-	jcc	badsys
+	jcs	syscall
+	cmpl	#M68K_NR_syscalls,%d0
+	jcs	badsys
 syscall:
 	jbsr	@(sys_call_table,%d0:l:4)@(0)
 	movel	%d0,%sp@(PT_D0)		| save the return value
@@ -423,6 +427,10 @@ resume:
 
 .data
 ALIGN
+	.long m68k_sys_atomic_barrier		/* 0xfffffffc */
+	.long m68k_sys_atomic_cmpxchg_32	/* 0xfffffffd */
+	.long m68k_sys_write_tp			/* 0xfffffffe */
+	.long m68k_sys_read_tp			/* 0xffffffff */
 sys_call_table:
 	.long sys_restart_syscall	/* 0 - old "setup()" system call, used for restarting */
 	.long sys_exit
diff --git a/arch/m68k/kernel/sys_m68k.c b/arch/m68k/kernel/sys_m68k.c
index 7f54efa..bc39ce6 100644
--- a/arch/m68k/kernel/sys_m68k.c
+++ b/arch/m68k/kernel/sys_m68k.c
@@ -29,6 +29,8 @@
 #include <asm/traps.h>
 #include <asm/page.h>
 #include <asm/unistd.h>
+#include <linux/elf.h>
+#include <asm/tlb.h>
 
 /* common code for old and new mmaps */
 static inline long do_mmap2(
@@ -663,3 +665,79 @@ int kernel_execve(const char *filename, char *const argv[], char *const envp[])
 			: "d" (__a), "d" (__b), "d" (__c));
 	return __res;
 }
+
+asmlinkage unsigned long
+m68k_sys_read_tp(void)
+{
+	return current_thread_info()->tp_value;
+}
+
+asmlinkage void
+m68k_sys_write_tp(unsigned long tp)
+{
+	current_thread_info()->tp_value = tp;
+}
+
+/* This syscall gets its arguments in A0 (mem), A1 (oldval) and
+   D1 (newval).  */
+asmlinkage int
+m68k_sys_atomic_cmpxchg_32(unsigned long newval, int d2, int d3, int d4, int d5,
+			unsigned long __user *mem, unsigned long oldval)
+{
+	/* This was borrowed from ARM's implementation.  */
+	for(;;) {
+		struct mm_struct *mm = current->mm;
+		pgd_t *pgd; pmd_t *pmd; pte_t *pte;
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
+	bad_access:
+		up_read(&mm->mmap_sem);
+		/* This is not necessarily a bad access, we can get here if
+		   a memory we're trying to write to should be copied-on-write.
+		   Make the kernel do the necessary page stuff, then re-iterate.
+		   Simulate a write access fault to do that.  */
+		{
+			int do_page_fault(struct pt_regs *, unsigned long,
+					unsigned long);
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
+asmlinkage void
+m68k_sys_atomic_barrier(void)
+{
+  /* no code needed for uniprocs */
+}
-- 
1.6.2.4


--------------060402010906090609010003
Content-Type: text/plain; x-mac-type="0"; x-mac-creator="0";
 name="0002-Update-m68k-s-clone_thread.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0002-Update-m68k-s-clone_thread.patch"

>From 14291fcace3b39c5302716f0b1972e586d2b991a Mon Sep 17 00:00:00 2001
From: Maxim Kuvyrkov <maxim@codesourcery.com>
Date: Mon, 17 Aug 2009 12:40:56 -0700
Subject: [PATCH 2/2] Update m68k's clone_thread.

This patch adds handling of CLONE_SETTLS flag to m68k's clone_thread.

Signed-off-by: Maxim Kuvyrkov <maxim@codesourcery.com>
---
 arch/m68k/kernel/process.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/kernel/process.c b/arch/m68k/kernel/process.c
index 72bad65..0d7f9ff 100644
--- a/arch/m68k/kernel/process.c
+++ b/arch/m68k/kernel/process.c
@@ -251,6 +251,10 @@ int copy_thread(unsigned long clone_flags, unsigned long usp,
 
 	p->thread.usp = usp;
 	p->thread.ksp = (unsigned long)childstack;
+
+	if (clone_flags & CLONE_SETTLS)
+	  task_thread_info(p)->tp_value = regs->d5;
+
 	/*
 	 * Must save the current SFC/DFC value, NOT the value when
 	 * the parent was last descheduled - RGH  10-08-96
-- 
1.6.2.4


--------------060402010906090609010003--
