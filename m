From: gerg@uclinux.org
Subject: [PATCH] m68knommu: fix trap on execing /bin/init
Date: Wed,  6 Feb 2013 16:28:11 +1000
Message-ID: <1360132091-9307-1-git-send-email-gerg@uclinux.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nschwqsrv01p.mx.bigpond.com ([61.9.189.231]:26875 "EHLO
	nschwqsrv01p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752114Ab3BFHd7 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 6 Feb 2013 02:33:59 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: ljalvs@gmail.com, viro@ZenIV.linux.org.uk, Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

As of commit fea82210 ("m68k: switch to saner kernel_execve() semantics")
the non-mmu m68k targets have trapped on booting. The execing of /bin/init
causes the exec path to try and return through a 0x0 return address - thus
trapping or otherwise hanging or crashing.

The problem isn't in the exec path as such though, but rather in the
m68knommu start_thread() macro. It is trying to clear the a6 register that
it assumes is part of a struct switch_stack below the thread registers on
our stack. But that is not what the stack frames look like when this is run.
So it ends up corrupting our call stack and zeroing out a function return
address that is sitting there.

The clearing of a6 was introduced many years ago in commit 7bf9a37d8d
("m68knommu: force stack alignment on ColdFire"). It used to work because
the kernel init exec code path had a short cut back to the exception return
code, and it didn't need to return through the calls on the stack.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/processor.h |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/include/asm/processor.h b/arch/m68k/include/asm/processor.h
index ae700f4..b0768a6 100644
--- a/arch/m68k/include/asm/processor.h
+++ b/arch/m68k/include/asm/processor.h
@@ -130,7 +130,6 @@ extern int handle_kernel_fault(struct pt_regs *regs);
 #define start_thread(_regs, _pc, _usp)                  \
 do {                                                    \
 	(_regs)->pc = (_pc);                            \
-	((struct switch_stack *)(_regs))[-1].a6 = 0;    \
 	setframeformat(_regs);                          \
 	if (current->mm)                                \
 		(_regs)->d5 = current->mm->start_data;  \
-- 
1.7.0.4
