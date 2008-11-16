From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH/RFC] atafb line length
Date: Sun, 16 Nov 2008 22:34:23 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0811162228270.20005@anakin>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from harold.telenet-ops.be ([195.130.133.65]:58575 "EHLO
	harold.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751827AbYKPVe0 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 16 Nov 2008 16:34:26 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Make sure fix->line_length is always set, as some applications need it because
they don't have fallback code if line_length is zero.

Works on ARAnyM (Falcon emulation), but par->next_line is not set on any other
Atari variant?

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/video/atafb.c |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

--- a/drivers/video/atafb.c
+++ b/drivers/video/atafb.c
@@ -613,7 +613,7 @@ static int tt_encode_fix(struct fb_fix_s
 	fix->xpanstep = 0;
 	fix->ypanstep = 1;
 	fix->ywrapstep = 0;
-	fix->line_length = 0;
+	fix->line_length = par->next_line;
 	fix->accel = FB_ACCEL_ATARIBLITT;
 	return 0;
 }
@@ -917,7 +917,8 @@ static int falcon_encode_fix(struct fb_f
 		fix->visual = FB_VISUAL_TRUECOLOR;
 		fix->xpanstep = 2;
 	}
-	fix->line_length = 0;
+	fix->line_length =
+		(par->hw.falcon.line_width + par->hw.falcon.line_offset) * 2;
 	fix->accel = FB_ACCEL_ATARIBLITT;
 	return 0;
 }
@@ -1844,7 +1845,7 @@ static int stste_encode_fix(struct fb_fi
 		fix->ypanstep = 0;
 	}
 	fix->ywrapstep = 0;
-	fix->line_length = 0;
+	fix->line_length = par->next_line;
 	fix->accel = FB_ACCEL_ATARIBLITT;
 	return 0;
 }
@@ -2161,7 +2162,7 @@ static int ext_encode_fix(struct fb_fix_
 	fix->xpanstep = 0;
 	fix->ypanstep = 0;
 	fix->ywrapstep = 0;
-	fix->line_length = 0;
+	fix->line_length = par->next_line;
 	return 0;
 }
 

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
