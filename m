From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Fwd: [PATCH] m68k/irq - use polled IRQ flag for MFP timer cascaded interrupts
Date: Sun, 22 Dec 2013 11:19:04 +0100
Message-ID: <CAMuHMdWirPo7HSsBiLdQDKdMmP4sjKEhcB1hfW0HabhkpQ-Jxg@mail.gmail.com>
References: <1387611538-18305-1-git-send-email-schmitz@debian.org>
	<1387611538-18305-2-git-send-email-schmitz@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f172.google.com ([209.85.192.172]:33150 "EHLO
	mail-pd0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752418Ab3LVKTG (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 22 Dec 2013 05:19:06 -0500
Received: by mail-pd0-f172.google.com with SMTP id g10so4175928pdj.17
        for <linux-m68k@vger.kernel.org>; Sun, 22 Dec 2013 02:19:05 -0800 (PST)
In-Reply-To: <1387611538-18305-2-git-send-email-schmitz@debian.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@vger.kernel.org>

---------- Forwarded message ----------
From: Michael Schmitz <schmitzmic@gmail.com>
Date: Sat, Dec 21, 2013 at 8:38 AM
Subject: [PATCH] m68k/irq - use polled IRQ flag for MFP timer cascaded
interrupts
To: geert@linux-m68k.org
Cc: schmitzmic@gmail.com, Michael Schmitz <schmitz@debian.org>


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

-       m68k_setup_irq_controller(&atari_mfptimer_chip, handle_polled_irq,
+       m68k_setup_irq_controller(&atari_mfptimer_chip, handle_simple_irq,
                                  IRQ_MFP_TIMER1, 8);

+       irq_set_status_flags(IRQ_MFP_TIMER1, IRQ_IS_POLLED);
+       irq_set_status_flags(IRQ_MFP_TIMER2, IRQ_IS_POLLED);
+
        /* prepare timer D data for use as poll interrupt */
        /* set Timer D data Register - needs to be > 0 */
        st_mfp.tim_dt_d = 254;  /* < 100 Hz */
--
1.7.0.4
