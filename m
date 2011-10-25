From: <gerg@snapgear.com>
Subject: [PATCH 04/36] m68k: make old interrupt code conditional on correct CPU types
Date: Tue, 25 Oct 2011 17:18:56 +1000
Message-ID: <1319527168-11166-5-git-send-email-gerg@snapgear.com>
References: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:25106 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753406Ab1JYHTV (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 25 Oct 2011 03:19:21 -0400
In-Reply-To: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The older interrupt handling support code is not so much conditional
on an MMU being present (CONFIG_MMU), as it is on which type of CPU
we are building for. So make the code conditional on the CPU types
instead.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/irq.h |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/include/asm/irq.h b/arch/m68k/include/asm/irq.h
index 69ed0d7..0f6db25 100644
--- a/arch/m68k/include/asm/irq.h
+++ b/arch/m68k/include/asm/irq.h
@@ -25,7 +25,8 @@
 #define NR_IRQS	0
 #endif
 
-#ifdef CONFIG_MMU
+#if defined(CONFIG_M68020) || defined(CONFIG_M68030) || \
+    defined(CONFIG_M68040) || defined(CONFIG_M68060)
 
 #include <linux/linkage.h>
 #include <linux/hardirq.h>
@@ -120,7 +121,7 @@ asmlinkage void __m68k_handle_int(unsigned int, struct pt_regs *);
 
 #else
 #define irq_canonicalize(irq)  (irq)
-#endif /* CONFIG_MMU */
+#endif /* !(CONFIG_M68020 || CONFIG_M68030 || CONFIG_M68040 || CONFIG_M68060) */
 
 asmlinkage void do_IRQ(int irq, struct pt_regs *regs);
 
-- 
1.7.0.4
