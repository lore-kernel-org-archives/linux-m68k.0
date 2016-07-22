From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 1/3] m68k: fix bFLT executable running on MMU enabled systems
Date: Fri, 22 Jul 2016 10:40:07 +1000
Message-ID: <1469148009-25426-2-git-send-email-gerg@linux-m68k.org>
References: <1469148009-25426-1-git-send-email-gerg@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out5.external.iinet.net.au ([203.59.1.221]:64836
	"EHLO icp-osb-irony-out5.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752818AbcGVAsi (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Thu, 21 Jul 2016 20:48:38 -0400
In-Reply-To: <1469148009-25426-1-git-send-email-gerg@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@linux-m68k.org>

Even after recent changes to support running flat format executables on
MMU enabled systems (by nicolas.pitre@linaro.org) they still failed to
run on m68k/ColdFire MMU enabled systems. On trying to run a flat format
binary the application would immediately crash with a SIGSEGV.

Code to setup the D5 register with the base of the application data
region was only in the non-MMU code path, so it was not being set for
the MMU enabled case. Flat binaries on m68k/ColdFire use this to support
GOT/PIC flat built application code.

Fix this so that D5 is always setup when loading/running a bFLT executable
on m68k systems.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/include/asm/flat.h      | 6 ++++++
 arch/m68k/include/asm/processor.h | 2 --
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/include/asm/flat.h b/arch/m68k/include/asm/flat.h
index f3f592d..a97c479 100644
--- a/arch/m68k/include/asm/flat.h
+++ b/arch/m68k/include/asm/flat.h
@@ -19,4 +19,10 @@ static inline int flat_set_persistent(unsigned long relval,
 	return 0;
 }
 
+#define FLAT_PLAT_INIT(regs) \
+	do { \
+		if (current->mm) \
+			(regs)->d5 = current->mm->start_data; \
+	} while (0)
+
 #endif /* __M68KNOMMU_FLAT_H__ */
diff --git a/arch/m68k/include/asm/processor.h b/arch/m68k/include/asm/processor.h
index a6ce2ec..46672d1 100644
--- a/arch/m68k/include/asm/processor.h
+++ b/arch/m68k/include/asm/processor.h
@@ -131,8 +131,6 @@ extern int handle_kernel_fault(struct pt_regs *regs);
 do {                                                    \
 	(_regs)->pc = (_pc);                            \
 	setframeformat(_regs);                          \
-	if (current->mm)                                \
-		(_regs)->d5 = current->mm->start_data;  \
 	(_regs)->sr &= ~0x2000;                         \
 	wrusp(_usp);                                    \
 } while(0)
-- 
1.9.1
