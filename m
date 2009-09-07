From: sfking@fdwdc.com
Subject: [RFC 22/31] proof of concept merge of m68k and m68knommu
Date: Sun,  6 Sep 2009 22:40:12 -0700
Message-ID: <8f43ed7055e315597a6f75d70cf391cca512204b.1252222134.git.sfking@fdwdc.com>
References: <cover.1252222129.git.sfking@fdwdc.com>
 <cfdcab7374087d5279ec9a1269831e8159d98f2b.1252222133.git.sfking@fdwdc.com>
 <8cb57205150fb96915e9d12c936be301a5e1e1e1.1252222133.git.sfking@fdwdc.com>
 <44c52df23985288bc2f4a819b73b3cc6da0826b9.1252222133.git.sfking@fdwdc.com>
 <6db080fb352e20adab49ed7762d3200831160b0f.1252222133.git.sfking@fdwdc.com>
 <c2e845e94079ee2a24e19456666f571c687f93f7.1252222133.git.sfking@fdwdc.com>
 <afa7a198356e79718b7682ea33cdfeec1933ae3d.1252222133.git.sfking@fdwdc.com>
 <f6625c80e8b3246063209517cccc855c056b2b71.1252222133.git.sfking@fdwdc.com>
 <55335001e487bd208ef4801c9df7e2d38a842ad3.1252222134.git.sfking@fdwdc.com>
 <1960838f2a4476b115b27420dcec29f81f0a15c1.1252222134.git.sfking@fdwdc.com>
 <491494a31232c4ce3a7fb96c3ed9db228f0ec5b4.1252222134.git.sfking@fdwdc.com>
 <b5baa71b2c543432ce8561ef7c18ef73201d47a8.1252222134.git.sfking@fdwdc.com>
 <fa246e049b7bc779d1c85def3f733a540463c3e2.1252222134.git.sfking@fdwdc.com>
 <c90263ddd638105b7df953128fd150d7fafc56ee.1252222134.git.sfking@fdwdc.com>
 <732b3e401d3708f1abf810ff0028e48d63df7e4b.1252222134.git.sfking@fdwdc.com>
 <9132c5b379a84a9b9a8762fc557abcae6e6ca479.1252222134.git.sfking@fdwdc.com>
 <f9216a12af8475d50631ae2dfea94d807aae1c1f.1252222134.git.sfking@fdwdc.com>
 <58c8b539029e276a7fc7ddeca2f2909845959c25.1252222134.git.sfking@fdwdc.com>
 <7916cd27beda9a78f37dcd9bef81229fcf67e7c6.1252222134.git.sfking@fdwdc.com>
 <f3cef3055f176a78514b07c083d19b5aec5f821f.1252222134.git.sfking@fdwdc.com>
 <572b33baa354e24a1e4ddfbaaf4b9ad71f262f0c.1252222134.git.sfking@fdwdc.com>
 <2e03009ed21c515946779f20bfbd182d04fa45fe.1252222134.git.sfking@fdwdc.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp109.biz.mail.mud.yahoo.com ([68.142.201.178]:34452 "HELO
	smtp109.biz.mail.mud.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1758941AbZIGFrU (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 7 Sep 2009 01:47:20 -0400
In-Reply-To: <2e03009ed21c515946779f20bfbd182d04fa45fe.1252222134.git.sfking@fdwdc.com>
In-Reply-To: <cover.1252222129.git.sfking@fdwdc.com>
References: <cover.1252222129.git.sfking@fdwdc.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: uclinux-dev@uclinux.org
Cc: gerg@snapgear.com, linux-m68k@lists.linux-m68k.org

---
 arch/m68k/mm/fault.c                              |  221 +--------------------
 arch/m68k/mm/{fault.c => fault_mm.c}              |    0 
 arch/{m68knommu/mm/fault.c => m68k/mm/fault_no.c} |    0 
 3 files changed, 4 insertions(+), 217 deletions(-)
 copy arch/m68k/mm/{fault.c => fault_mm.c} (100%)
 copy arch/{m68knommu/mm/fault.c => m68k/mm/fault_no.c} (100%)

diff --git a/arch/m68k/mm/fault.c b/arch/m68k/mm/fault.c
index d0e35cf..00e9bd2 100644
--- a/arch/m68k/mm/fault.c
+++ b/arch/m68k/mm/fault.c
@@ -1,218 +1,5 @@
-/*
- *  linux/arch/m68k/mm/fault.c
- *
- *  Copyright (C) 1995  Hamish Macdonald
- */
-
-#include <linux/mman.h>
-#include <linux/mm.h>
-#include <linux/kernel.h>
-#include <linux/ptrace.h>
-#include <linux/interrupt.h>
-#include <linux/module.h>
-
-#include <asm/setup.h>
-#include <asm/traps.h>
-#include <asm/system.h>
-#include <asm/uaccess.h>
-#include <asm/pgalloc.h>
-
-extern void die_if_kernel(char *, struct pt_regs *, long);
-extern const int frame_extra_sizes[]; /* in m68k/kernel/signal.c */
-
-int send_fault_sig(struct pt_regs *regs)
-{
-	siginfo_t siginfo = { 0, 0, 0, };
-
-	siginfo.si_signo = current->thread.signo;
-	siginfo.si_code = current->thread.code;
-	siginfo.si_addr = (void *)current->thread.faddr;
-#ifdef DEBUG
-	printk("send_fault_sig: %p,%d,%d\n", siginfo.si_addr, siginfo.si_signo, siginfo.si_code);
+#ifdef CONFIG_MMU
+#include "fault_mm.c"
+#else
+#include "fault_no.c"
 #endif
-
-	if (user_mode(regs)) {
-		force_sig_info(siginfo.si_signo,
-			       &siginfo, current);
-	} else {
-		const struct exception_table_entry *fixup;
-
-		/* Are we prepared to handle this kernel fault? */
-		if ((fixup = search_exception_tables(regs->pc))) {
-			struct pt_regs *tregs;
-			/* Create a new four word stack frame, discarding the old
-			   one.  */
-			regs->stkadj = frame_extra_sizes[regs->format];
-			tregs =	(struct pt_regs *)((ulong)regs + regs->stkadj);
-			tregs->vector = regs->vector;
-			tregs->format = 0;
-			tregs->pc = fixup->fixup;
-			tregs->sr = regs->sr;
-			return -1;
-		}
-
-		//if (siginfo.si_signo == SIGBUS)
-		//	force_sig_info(siginfo.si_signo,
-		//		       &siginfo, current);
-
-		/*
-		 * Oops. The kernel tried to access some bad page. We'll have to
-		 * terminate things with extreme prejudice.
-		 */
-		if ((unsigned long)siginfo.si_addr < PAGE_SIZE)
-			printk(KERN_ALERT "Unable to handle kernel NULL pointer dereference");
-		else
-			printk(KERN_ALERT "Unable to handle kernel access");
-		printk(" at virtual address %p\n", siginfo.si_addr);
-		die_if_kernel("Oops", regs, 0 /*error_code*/);
-		do_exit(SIGKILL);
-	}
-
-	return 1;
-}
-
-/*
- * This routine handles page faults.  It determines the problem, and
- * then passes it off to one of the appropriate routines.
- *
- * error_code:
- *	bit 0 == 0 means no page found, 1 means protection fault
- *	bit 1 == 0 means read, 1 means write
- *
- * If this routine detects a bad access, it returns 1, otherwise it
- * returns 0.
- */
-int do_page_fault(struct pt_regs *regs, unsigned long address,
-			      unsigned long error_code)
-{
-	struct mm_struct *mm = current->mm;
-	struct vm_area_struct * vma;
-	int write, fault;
-
-#ifdef DEBUG
-	printk ("do page fault:\nregs->sr=%#x, regs->pc=%#lx, address=%#lx, %ld, %p\n",
-		regs->sr, regs->pc, address, error_code,
-		current->mm->pgd);
-#endif
-
-	/*
-	 * If we're in an interrupt or have no user
-	 * context, we must not take the fault..
-	 */
-	if (in_atomic() || !mm)
-		goto no_context;
-
-	down_read(&mm->mmap_sem);
-
-	vma = find_vma(mm, address);
-	if (!vma)
-		goto map_err;
-	if (vma->vm_flags & VM_IO)
-		goto acc_err;
-	if (vma->vm_start <= address)
-		goto good_area;
-	if (!(vma->vm_flags & VM_GROWSDOWN))
-		goto map_err;
-	if (user_mode(regs)) {
-		/* Accessing the stack below usp is always a bug.  The
-		   "+ 256" is there due to some instructions doing
-		   pre-decrement on the stack and that doesn't show up
-		   until later.  */
-		if (address + 256 < rdusp())
-			goto map_err;
-	}
-	if (expand_stack(vma, address))
-		goto map_err;
-
-/*
- * Ok, we have a good vm_area for this memory access, so
- * we can handle it..
- */
-good_area:
-#ifdef DEBUG
-	printk("do_page_fault: good_area\n");
-#endif
-	write = 0;
-	switch (error_code & 3) {
-		default:	/* 3: write, present */
-			/* fall through */
-		case 2:		/* write, not present */
-			if (!(vma->vm_flags & VM_WRITE))
-				goto acc_err;
-			write++;
-			break;
-		case 1:		/* read, present */
-			goto acc_err;
-		case 0:		/* read, not present */
-			if (!(vma->vm_flags & (VM_READ | VM_EXEC | VM_WRITE)))
-				goto acc_err;
-	}
-
-	/*
-	 * If for any reason at all we couldn't handle the fault,
-	 * make sure we exit gracefully rather than endlessly redo
-	 * the fault.
-	 */
-
- survive:
-	fault = handle_mm_fault(mm, vma, address, write ? FAULT_FLAG_WRITE : 0);
-#ifdef DEBUG
-	printk("handle_mm_fault returns %d\n",fault);
-#endif
-	if (unlikely(fault & VM_FAULT_ERROR)) {
-		if (fault & VM_FAULT_OOM)
-			goto out_of_memory;
-		else if (fault & VM_FAULT_SIGBUS)
-			goto bus_err;
-		BUG();
-	}
-	if (fault & VM_FAULT_MAJOR)
-		current->maj_flt++;
-	else
-		current->min_flt++;
-
-	up_read(&mm->mmap_sem);
-	return 0;
-
-/*
- * We ran out of memory, or some other thing happened to us that made
- * us unable to handle the page fault gracefully.
- */
-out_of_memory:
-	up_read(&mm->mmap_sem);
-	if (is_global_init(current)) {
-		yield();
-		down_read(&mm->mmap_sem);
-		goto survive;
-	}
-
-	printk("VM: killing process %s\n", current->comm);
-	if (user_mode(regs))
-		do_group_exit(SIGKILL);
-
-no_context:
-	current->thread.signo = SIGBUS;
-	current->thread.faddr = address;
-	return send_fault_sig(regs);
-
-bus_err:
-	current->thread.signo = SIGBUS;
-	current->thread.code = BUS_ADRERR;
-	current->thread.faddr = address;
-	goto send_sig;
-
-map_err:
-	current->thread.signo = SIGSEGV;
-	current->thread.code = SEGV_MAPERR;
-	current->thread.faddr = address;
-	goto send_sig;
-
-acc_err:
-	current->thread.signo = SIGSEGV;
-	current->thread.code = SEGV_ACCERR;
-	current->thread.faddr = address;
-
-send_sig:
-	up_read(&mm->mmap_sem);
-	return send_fault_sig(regs);
-}
diff --git a/arch/m68k/mm/fault.c b/arch/m68k/mm/fault_mm.c
similarity index 100%
copy from arch/m68k/mm/fault.c
copy to arch/m68k/mm/fault_mm.c
diff --git a/arch/m68knommu/mm/fault.c b/arch/m68k/mm/fault_no.c
similarity index 100%
copy from arch/m68knommu/mm/fault.c
copy to arch/m68k/mm/fault_no.c
-- 
1.5.6.5

