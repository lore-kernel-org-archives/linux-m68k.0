From: <gerg@snapgear.com>
Subject: [PATCH] m68k: use CPU_HAS_NO_BITFIELDS for signal functions
Date: Mon, 4 Jul 2011 14:25:56 +1000
Message-ID: <1309753556-17462-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:38696 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750814Ab1GDEca (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 4 Jul 2011 00:32:30 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

When reworking bitops.h to be clean for all processor types we introduced
a CONFIG_CPU_HAS_NO_BITFIELDS define to signal whether this processor type
supported the bit field instructions. The ARCH_SIG_BITOPS functions for
m68k use these instruction types. We should base the use of these functions
(or the generic versions) on the CONFIG_CPU_HAS_NO_BITFIELDS define.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/signal.h |   15 +++++++--------
 1 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/m68k/include/asm/signal.h b/arch/m68k/include/asm/signal.h
index 5bc09c7..60e8866 100644
--- a/arch/m68k/include/asm/signal.h
+++ b/arch/m68k/include/asm/signal.h
@@ -150,7 +150,7 @@ typedef struct sigaltstack {
 #ifdef __KERNEL__
 #include <asm/sigcontext.h>
 
-#ifndef __uClinux__
+#ifndef CONFIG_CPU_HAS_NO_BITFIELDS
 #define __HAVE_ARCH_SIG_BITOPS
 
 static inline void sigaddset(sigset_t *set, int _sig)
@@ -199,15 +199,14 @@ static inline int sigfindinword(unsigned long word)
 	return word ^ 31;
 }
 
-struct pt_regs;
-extern void ptrace_signal_deliver(struct pt_regs *regs, void *cookie);
+#endif /* !CONFIG_CPU_HAS_NO_BITFIELDS */
 
-#else
-
-#undef __HAVE_ARCH_SIG_BITOPS
+#ifdef __uClinux__
 #define ptrace_signal_deliver(regs, cookie) do { } while (0)
-
+#else
+struct pt_regs;
+extern void ptrace_signal_deliver(struct pt_regs *regs, void *cookie);
 #endif /* __uClinux__ */
-#endif /* __KERNEL__ */
 
+#endif /* __KERNEL__ */
 #endif /* _M68K_SIGNAL_H */
-- 
1.7.0.4
