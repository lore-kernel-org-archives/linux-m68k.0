From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 1/3] m68k/mm: Check for mm != NULL in do_page_fault() debug code
Date: Tue, 10 Dec 2013 12:11:58 +0100
Message-ID: <1386673920-5670-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

When DEBUG is enabled, do_page_fault() may dereference a NULL pointer,
causing recursive bus errors.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/mm/fault.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/m68k/mm/fault.c b/arch/m68k/mm/fault.c
index eb1d61f68725..c7725f1de05d 100644
--- a/arch/m68k/mm/fault.c
+++ b/arch/m68k/mm/fault.c
@@ -77,8 +77,7 @@ int do_page_fault(struct pt_regs *regs, unsigned long address,
 
 #ifdef DEBUG
 	printk ("do page fault:\nregs->sr=%#x, regs->pc=%#lx, address=%#lx, %ld, %p\n",
-		regs->sr, regs->pc, address, error_code,
-		current->mm->pgd);
+		regs->sr, regs->pc, address, error_code, mm ? mm->pgd : NULL);
 #endif
 
 	/*
-- 
1.7.9.5
