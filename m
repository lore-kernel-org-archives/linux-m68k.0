From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [patch 09/18] m68k: Define rtc_lock on Atari
Date: Mon, 13 Oct 2008 21:58:55 +0200
Message-ID: <20081013195917.355152928@mail.of.borg>
References: <20081013195846.674654386@mail.of.borg>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nelson.telenet-ops.be ([195.130.133.66]:34655 "EHLO
	nelson.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753076AbYJMUFl (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 13 Oct 2008 16:05:41 -0400
Content-Disposition: inline; filename=atari-define-rtc_lock.diff
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Schmitz <schmitz@debian.org>

From: Geert Uytterhoeven <geert@linux-m68k.org>

The nvram and rtc-cmos drivers use the spinlock rtc_lock to protect against
concurrent accesses to the CMOS memory. As m68k doesn't support SMP or preempt
yet, the spinlock calls tend to get optimized away, but not for all
configurations, causing in some rare cases:

| ERROR: "rtc_lock" [drivers/rtc/rtc-cmos.ko] undefined!
| ERROR: "rtc_lock" [drivers/char/nvram.ko] undefined!

Add the spinlock to the Atari core code to avoid this.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Michael Schmitz <schmitz@debian.org>
---
 arch/m68k/atari/time.c |    3 +++
 1 file changed, 3 insertions(+)

--- a/arch/m68k/atari/time.c
+++ b/arch/m68k/atari/time.c
@@ -20,6 +20,9 @@
 
 #include <asm/atariints.h>
 
+DEFINE_SPINLOCK(rtc_lock);
+EXPORT_SYMBOL_GPL(rtc_lock);
+
 void __init
 atari_sched_init(irq_handler_t timer_routine)
 {

-- 
Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

