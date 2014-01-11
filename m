From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH] m68k/irq - use polled IRQ flag for MFP timer cascaded interrupts
Date: Sat, 11 Jan 2014 14:01:31 +1300
Message-ID: <1389402091-20815-1-git-send-email-schmitz@debian.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:45110 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751609AbaAKBBj (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 10 Jan 2014 20:01:39 -0500
Received: by mail-pa0-f52.google.com with SMTP id kx10so1589144pab.11
        for <linux-m68k@vger.kernel.org>; Fri, 10 Jan 2014 17:01:38 -0800 (PST)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: linux-m68k@vger.kernel.org, Michael Schmitz <schmitz@debian.org>

Some Atari hardware has no capacity to raise interrupts (e.g.
network or USB adapter hardware attached via ROM port). The driver
interrupt routine is called from a timer interrupt (timer D) in
these cases, using chained device specific pseudo interrupts
(IRQ_MFP_TIMER1 ff.)

These interrupts will more often than not, return IRQ_NONE as
there is not always work for the device handler when called.
Too many unhandled interrupts will result in the interrupt
being disabled by the stuck interrupt watchdog.

As preferred option to flag interrupts as needing exclusion
from the watchdog mechanism, tglx added the IRQ_IS_POLLED flag
for use in such a case. Currently, two interrupts need to use
this flag. Add more users as needed.

This patch obsoletes the introduction of handle_polled_irq()
in the m68k tree.

Signed-off-By: Michael Schmitz <schmitz@debian.org>
---
 arch/m68k/atari/ataints.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/atari/ataints.c b/arch/m68k/atari/ataints.c
index 90f7a48..3e73a63 100644
--- a/arch/m68k/atari/ataints.c
+++ b/arch/m68k/atari/ataints.c
@@ -330,9 +330,12 @@ void __init atari_init_IRQ(void)
 	sound_ym.rd_data_reg_sel = 7;
 	sound_ym.wd_data = 0xff;
 
-	m68k_setup_irq_controller(&atari_mfptimer_chip, handle_polled_irq,
+	m68k_setup_irq_controller(&atari_mfptimer_chip, handle_simple_irq,
 				  IRQ_MFP_TIMER1, 8);
 
+	irq_set_status_flags(IRQ_MFP_TIMER1, IRQ_IS_POLLED);
+	irq_set_status_flags(IRQ_MFP_TIMER2, IRQ_IS_POLLED);
+
 	/* prepare timer D data for use as poll interrupt */
 	/* set Timer D data Register - needs to be > 0 */
 	st_mfp.tim_dt_d = 254;	/* < 100 Hz */
-- 
1.7.0.4
