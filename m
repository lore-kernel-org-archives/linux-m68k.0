From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 3/3] m68k: use same start_thread() on MMU and no-MMU
Date: Fri, 22 Jul 2016 10:40:09 +1000
Message-ID: <1469148009-25426-4-git-send-email-gerg@linux-m68k.org>
References: <1469148009-25426-1-git-send-email-gerg@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out5.external.iinet.net.au ([203.59.1.221]:64836
	"EHLO icp-osb-irony-out5.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752818AbcGVAsk (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Thu, 21 Jul 2016 20:48:40 -0400
In-Reply-To: <1469148009-25426-1-git-send-email-gerg@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@linux-m68k.org>

The MMU and no-MMU versions of start_thread() are now identical, so use
the same common code for both.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/include/asm/processor.h | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/arch/m68k/include/asm/processor.h b/arch/m68k/include/asm/processor.h
index 46672d1..c84a218 100644
--- a/arch/m68k/include/asm/processor.h
+++ b/arch/m68k/include/asm/processor.h
@@ -110,7 +110,6 @@ struct thread_struct {
 #define setframeformat(_regs)	do { } while (0)
 #endif
 
-#ifdef CONFIG_MMU
 /*
  * Do necessary setup to start up a newly executed thread.
  */
@@ -123,24 +122,14 @@ static inline void start_thread(struct pt_regs * regs, unsigned long pc,
 	wrusp(usp);
 }
 
+#ifdef CONFIG_MMU
 extern int handle_kernel_fault(struct pt_regs *regs);
-
 #else
-
-#define start_thread(_regs, _pc, _usp)                  \
-do {                                                    \
-	(_regs)->pc = (_pc);                            \
-	setframeformat(_regs);                          \
-	(_regs)->sr &= ~0x2000;                         \
-	wrusp(_usp);                                    \
-} while(0)
-
 static inline  int handle_kernel_fault(struct pt_regs *regs)
 {
 	/* Any fault in kernel is fatal on non-mmu */
 	return 0;
 }
-
 #endif
 
 /* Forward declaration, a strange C thing */
-- 
1.9.1
