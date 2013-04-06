From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 04/12] m68k/atari: use polled interrupt handler for timer D interrupts
Date: Sat,  6 Apr 2013 13:26:38 +1300
Message-ID: <1365208006-16227-5-git-send-email-schmitz@debian.org>
References: <1365208006-16227-1-git-send-email-schmitz@debian.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-da0-f49.google.com ([209.85.210.49]:42666 "EHLO
	mail-da0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1163082Ab3DFA1R (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 5 Apr 2013 20:27:17 -0400
Received: by mail-da0-f49.google.com with SMTP id t11so1767009daj.8
        for <linux-m68k@vger.kernel.org>; Fri, 05 Apr 2013 17:27:17 -0700 (PDT)
In-Reply-To: <1365208006-16227-1-git-send-email-schmitz@debian.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: linux-m68k@vger.kernel.org, Michael Schmitz <schmitz@debian.org>

Make use of handle_polled_irq instead of handle_simple_irq for the MFP
timer D interrupts - this avoids 'unhandled interrupt' messages and
disabling of the timer interrupts after idle periods.

Signed-off-by: Michael Schmitz <schmitz@debian.org>
---
 arch/m68k/atari/ataints.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/atari/ataints.c b/arch/m68k/atari/ataints.c
index f699c82..2cf7349 100644
--- a/arch/m68k/atari/ataints.c
+++ b/arch/m68k/atari/ataints.c
@@ -255,7 +255,7 @@ void __init atari_init_IRQ(void)
 	sound_ym.rd_data_reg_sel = 7;
 	sound_ym.wd_data = 0xff;
 
-	m68k_setup_irq_controller(&atari_mfptimer_chip, handle_simple_irq,
+	m68k_setup_irq_controller(&atari_mfptimer_chip, handle_polled_irq,
 				  IRQ_MFP_TIMER1, 8);
 
 	/* prepare timer D data for use as poll interrupt */
-- 
1.7.0.4
