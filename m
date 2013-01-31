From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 12/17] [m68k] Atari: remove unnecessary cruft from Atari interrupt setup
Date: Thu, 31 Jan 2013 13:28:46 +1300 (NZDT)
Message-ID: <20130131002846.CA263360095@xplor.waratah.dyndns.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f49.google.com ([209.85.160.49]:46967 "EHLO
	mail-pb0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755496Ab3AaA2w (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 30 Jan 2013 19:28:52 -0500
Received: by mail-pb0-f49.google.com with SMTP id xa12so1272576pbc.8
        for <linux-m68k@vger.kernel.org>; Wed, 30 Jan 2013 16:28:52 -0800 (PST)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org

[PATCH 12/17] [m68k] Atari: remove unnecessary cruft from Atari interrupt setup

Remove unneccesary calls to m68k_setup_irq_controller() and m68k_irq_startup_irq() from the
Atari interrupt setup.

Signed-off-by: Michael Schmitz <schmitz@debian.org>
---
 arch/m68k/atari/ataints.c |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/arch/m68k/atari/ataints.c b/arch/m68k/atari/ataints.c
index da40ab1..d0778cf 100644
--- a/arch/m68k/atari/ataints.c
+++ b/arch/m68k/atari/ataints.c
@@ -331,9 +331,6 @@ void __init atari_init_IRQ(void)
 
 	m68k_setup_irq_controller(&atari_mfptimer_chip, handle_polled_irq,
 				  IRQ_MFP_TIMER1, 8);
-	/* possibly unneeded */
-	m68k_setup_irq_controller(&atari_irq_chip, handle_simple_irq,
-				  IRQ_MFP_TIMD, 1);
 
 	/* prepare timer D data for use as poll interrupt */
 	/* set Timer D data Register - needs to be > 0 */
@@ -341,9 +338,6 @@ void __init atari_init_IRQ(void)
 	/* start timer D, div = 1:100 */
 	st_mfp.tim_ct_cd = (st_mfp.tim_ct_cd & 0xf0) | 0x6;
 
-	/* do we need this one ? */
-	m68k_irq_startup_irq(IRQ_MFP_TIMD);
-
 	/* request timer D dispatch handler */
 	if (request_irq(IRQ_MFP_TIMD, mfptimer_handler, IRQF_SHARED,
 			stmfp_base.name, &stmfp_base))
-- 
1.7.0.4
