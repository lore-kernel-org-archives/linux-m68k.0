From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [patch 12/18] HP input: kill warnings due to suseconds_t differences
Date: Mon, 13 Oct 2008 21:58:58 +0200
Message-ID: <20081013195919.407702332@mail.of.borg>
References: <20081013195846.674654386@mail.of.borg>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from monty.telenet-ops.be ([195.130.132.56]:53368 "EHLO
	monty.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752310AbYJMUFl (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 13 Oct 2008 16:05:41 -0400
Content-Disposition: inline; filename=m68k+parisc-hp_sdc_rtc-printf-format-warnings.diff
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, Helge Deller <deller@gmx.de>

From: Geert Uytterhoeven <geert@linux-m68k.org>

Kill compiler warnings related to printf() formats in the input drivers for
various HP9000 machines, which are shared between PA-RISC (suseconds_t is int)
and m68k (suseconds_t is long). As both are 32-bit, it's safe to cast to int.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Helge Deller <deller@gmx.de>
---
 drivers/input/misc/hp_sdc_rtc.c |   10 +++++-----
 drivers/input/serio/hp_sdc.c    |    2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

--- a/drivers/input/misc/hp_sdc_rtc.c
+++ b/drivers/input/misc/hp_sdc_rtc.c
@@ -458,35 +458,35 @@ static int hp_sdc_rtc_proc_output (char 
 		p += sprintf(p, "i8042 rtc\t: READ FAILED!\n");
 	} else {
 		p += sprintf(p, "i8042 rtc\t: %ld.%02d seconds\n", 
-			     tv.tv_sec, tv.tv_usec/1000);
+			     tv.tv_sec, (int)tv.tv_usec/1000);
 	}
 
 	if (hp_sdc_rtc_read_fhs(&tv)) {
 		p += sprintf(p, "handshake\t: READ FAILED!\n");
 	} else {
         	p += sprintf(p, "handshake\t: %ld.%02d seconds\n", 
-			     tv.tv_sec, tv.tv_usec/1000);
+			     tv.tv_sec, (int)tv.tv_usec/1000);
 	}
 
 	if (hp_sdc_rtc_read_mt(&tv)) {
 		p += sprintf(p, "alarm\t\t: READ FAILED!\n");
 	} else {
 		p += sprintf(p, "alarm\t\t: %ld.%02d seconds\n", 
-			     tv.tv_sec, tv.tv_usec/1000);
+			     tv.tv_sec, (int)tv.tv_usec/1000);
 	}
 
 	if (hp_sdc_rtc_read_dt(&tv)) {
 		p += sprintf(p, "delay\t\t: READ FAILED!\n");
 	} else {
 		p += sprintf(p, "delay\t\t: %ld.%02d seconds\n", 
-			     tv.tv_sec, tv.tv_usec/1000);
+			     tv.tv_sec, (int)tv.tv_usec/1000);
 	}
 
 	if (hp_sdc_rtc_read_ct(&tv)) {
 		p += sprintf(p, "periodic\t: READ FAILED!\n");
 	} else {
 		p += sprintf(p, "periodic\t: %ld.%02d seconds\n", 
-			     tv.tv_sec, tv.tv_usec/1000);
+			     tv.tv_sec, (int)tv.tv_usec/1000);
 	}
 
         p += sprintf(p,
--- a/drivers/input/serio/hp_sdc.c
+++ b/drivers/input/serio/hp_sdc.c
@@ -323,7 +323,7 @@ static void hp_sdc_tasklet(unsigned long
 			 * it back to the application. and be less verbose.
 			 */
 			printk(KERN_WARNING PREFIX "read timeout (%ius)!\n",
-			       tv.tv_usec - hp_sdc.rtv.tv_usec);
+			       (int)(tv.tv_usec - hp_sdc.rtv.tv_usec));
 			curr->idx += hp_sdc.rqty;
 			hp_sdc.rqty = 0;
 			tmp = curr->seq[curr->actidx];

-- 
Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

