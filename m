From: <gerg@snapgear.com>
Subject: [PATCH 04/35] m68k: make interrupt definitions conditional on correct CPU types
Date: Fri, 25 Nov 2011 13:40:49 +1000
Message-ID: <1322192480-22822-5-git-send-email-gerg@snapgear.com>
References: <1322192480-22822-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:16484 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751458Ab1KYDjE (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 24 Nov 2011 22:39:04 -0500
In-Reply-To: <1322192480-22822-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The interrupt handling support defines and code is not so much conditional
on an MMU being present (CONFIG_MMU), as it is on which type of CPU we are
building for. So make the code conditional on the CPU types instead. The
current irq.h is mostly specific to the interrupt code for the 680x0 CPUs,
so it should only be used for them.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/include/asm/irq.h |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/include/asm/irq.h b/arch/m68k/include/asm/irq.h
index 6198df5..0e89fa0 100644
--- a/arch/m68k/include/asm/irq.h
+++ b/arch/m68k/include/asm/irq.h
@@ -25,7 +25,8 @@
 #define NR_IRQS	0
 #endif
 
-#ifdef CONFIG_MMU
+#if defined(CONFIG_M68020) || defined(CONFIG_M68030) || \
+    defined(CONFIG_M68040) || defined(CONFIG_M68060)
 
 /*
  * Interrupt source definitions
@@ -80,7 +81,7 @@ extern unsigned int irq_canonicalize(unsigned int irq);
 
 #else
 #define irq_canonicalize(irq)  (irq)
-#endif /* CONFIG_MMU */
+#endif /* !(CONFIG_M68020 || CONFIG_M68030 || CONFIG_M68040 || CONFIG_M68060) */
 
 asmlinkage void do_IRQ(int irq, struct pt_regs *regs);
 extern atomic_t irq_err_count;
-- 
1.7.0.4
