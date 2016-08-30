From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCHv2 7/8] m68k: only generate FPU instructions if CONFIG_FPU enabled
Date: Tue, 30 Aug 2016 17:29:54 +1000
Message-ID: <1472542194-11743-1-git-send-email-gerg@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out4.external.iinet.net.au ([203.59.1.220]:13554
        "EHLO icp-osb-irony-out4.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751501AbcH3H2J (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Tue, 30 Aug 2016 03:28:09 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@linux-m68k.org>

Most of the m68k code that supports a hardware FPU is surrounded by
CONFIG_FPU. Be consistent and surround the hardware FPU instruction
setup in setup_mm.c with CONFIG_FPU as well as the check for
CONFIG_M68KFPU_EMU_ONLY.

The existing classic m68k architectures all define CONFIG_FPU, so they
see no change from this. But on ColdFire where we do not support the
emulated FP code we can now compile without CONFIG_FPU being set as well.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/kernel/setup_mm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
index 13f4640..adbb806 100644
--- a/arch/m68k/kernel/setup_mm.c
+++ b/arch/m68k/kernel/setup_mm.c
@@ -245,7 +245,7 @@ void __init setup_arch(char **cmdline_p)
 	 * We should really do our own FPU check at startup.
 	 * [what do we do with buggy 68LC040s? if we have problems
 	 *  with them, we should add a test to check_bugs() below] */
-#ifndef CONFIG_M68KFPU_EMU_ONLY
+#if defined(CONFIG_FPU) && !defined(CONFIG_M68KFPU_EMU_ONLY)
 	/* clear the fpu if we have one */
 	if (m68k_fputype & (FPU_68881|FPU_68882|FPU_68040|FPU_68060|FPU_COLDFIRE)) {
 		volatile int zero = 0;
-- 
1.9.1
