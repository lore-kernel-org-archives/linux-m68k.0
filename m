From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 7/8] m68k: only generate FPU instructions of CONFIG_FPU
Date: Mon, 29 Aug 2016 21:43:23 +1000
Message-ID: <1472471004-4580-8-git-send-email-gerg@linux-m68k.org>
References: <1472471004-4580-1-git-send-email-gerg@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out9.external.iinet.net.au ([203.59.1.226]:49468
        "EHLO icp-osb-irony-out9.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S932814AbcH2LmV (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Mon, 29 Aug 2016 07:42:21 -0400
In-Reply-To: <1472471004-4580-1-git-send-email-gerg@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@linux-m68k.org>

Most of the m68k code that supports a hardware FPU is surrounded by
CONFIG_FPU. Except this setup code in setup_mm.c. Be consistent and
surround these hardware FPU instructions with CONFIG_FPU instead of
a check based on CONFIG_M68KFPU_EMU_ONLY.

The side effect of this is that we can now compile a kernel with no
m68k/ColdFire hardware support FPU instructions at all (if we do not
define CONFIG_FPU).

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/kernel/setup_mm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
index 13f4640..00290c4 100644
--- a/arch/m68k/kernel/setup_mm.c
+++ b/arch/m68k/kernel/setup_mm.c
@@ -245,7 +245,7 @@ void __init setup_arch(char **cmdline_p)
 	 * We should really do our own FPU check at startup.
 	 * [what do we do with buggy 68LC040s? if we have problems
 	 *  with them, we should add a test to check_bugs() below] */
-#ifndef CONFIG_M68KFPU_EMU_ONLY
+#ifdef CONFIG_FPU
 	/* clear the fpu if we have one */
 	if (m68k_fputype & (FPU_68881|FPU_68882|FPU_68040|FPU_68060|FPU_COLDFIRE)) {
 		volatile int zero = 0;
-- 
1.9.1
