From: Yannick GICQUEL <yannick.gicquel@open.eurogiciel.org>
Subject: [RFC 2/8] m68k: fix build issue in setup_arch() when no FPU
Date: Wed,  8 Jul 2015 11:51:26 +0200
Message-ID: <1436349092-2214-3-git-send-email-yannick.gicquel@gmail.com>
References: <1436349092-2214-1-git-send-email-yannick.gicquel@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:36741 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933084AbbGHJvv (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 8 Jul 2015 05:51:51 -0400
Received: by widjy10 with SMTP id jy10so212030129wid.1
        for <linux-m68k@vger.kernel.org>; Wed, 08 Jul 2015 02:51:50 -0700 (PDT)
Received: from PCL140005.eurogiciel.fr (130.167.26.109.rev.sfr.net. [109.26.167.130])
        by smtp.gmail.com with ESMTPSA id k16sm2551260wjr.7.2015.07.08.02.51.49
        for <linux-m68k@vger.kernel.org>
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 08 Jul 2015 02:51:49 -0700 (PDT)
In-Reply-To: <1436349092-2214-1-git-send-email-yannick.gicquel@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

When MMU is activated, assembler generates an illegal
instruction on target without FPU.
Related code under FPU flag condition.

Signed-off-by: Yannick GICQUEL <yannick.gicquel@gmail.com>
---
 arch/m68k/kernel/setup_mm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
index 5b8ec4d..0bc6f77 100644
--- a/arch/m68k/kernel/setup_mm.c
+++ b/arch/m68k/kernel/setup_mm.c
@@ -245,7 +245,7 @@ void __init setup_arch(char **cmdline_p)
 	 * We should really do our own FPU check at startup.
 	 * [what do we do with buggy 68LC040s? if we have problems
 	 *  with them, we should add a test to check_bugs() below] */
-#ifndef CONFIG_M68KFPU_EMU_ONLY
+#if !defined(CONFIG_M68KFPU_EMU_ONLY) && defined(CONFIG_FPU)
 	/* clear the fpu if we have one */
 	if (m68k_fputype & (FPU_68881|FPU_68882|FPU_68040|FPU_68060|FPU_COLDFIRE)) {
 		volatile int zero = 0;
-- 
1.9.1.286.g5172cb3
