From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH/RFC] atafb line length
Date: Wed, 17 Dec 2008 22:21:13 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0812172216220.17139@anakin>
References: <Pine.LNX.4.64.0811162228270.20005@anakin>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from monty.telenet-ops.be ([195.130.132.56]:57320 "EHLO
	monty.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752202AbYLQVVP (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 17 Dec 2008 16:21:15 -0500
In-Reply-To: <Pine.LNX.4.64.0811162228270.20005@anakin>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

On Sun, 16 Nov 2008, Geert Uytterhoeven wrote:
> Make sure fix->line_length is always set, as some applications need it because
> they don't have fallback code if line_length is zero.
> 
> Works on ARAnyM (Falcon emulation), but par->next_line is not set on any other
> Atari variant?

And this should fix the remaining ones. I cannot test it, though.

Without this, atafb is completely broken on anything but Falcon, as all the
text console drawing operations need a valid par->next_line.

On (emulated) Falcon, we can just use par->next_line, too.

I plan to clean up the atafb/c2p patch series, and get it into 2.6.29.

diff --git a/drivers/video/atafb.c b/drivers/video/atafb.c
index 8f70296..477ce55 100644
--- a/drivers/video/atafb.c
+++ b/drivers/video/atafb.c
@@ -691,6 +691,7 @@ static int tt_decode_var(struct fb_var_screeninfo *var, struct atafb_par *par)
 		return -EINVAL;
 	par->yres_virtual = yres_virtual;
 	par->screen_base = screen_base + var->yoffset * linelen;
+	par->next_line = linelen;
 	return 0;
 }
 
@@ -914,8 +915,7 @@ static int falcon_encode_fix(struct fb_fix_screeninfo *fix,
 		fix->visual = FB_VISUAL_TRUECOLOR;
 		fix->xpanstep = 2;
 	}
-	fix->line_length =
-		(par->hw.falcon.line_width + par->hw.falcon.line_offset) * 2;
+	fix->line_length = par->next_line;
 	fix->accel = FB_ACCEL_ATARIBLITT;
 	return 0;
 }
@@ -1900,6 +1900,7 @@ static int stste_decode_var(struct fb_var_screeninfo *var,
 		return -EINVAL;
 	par->yres_virtual = yres_virtual;
 	par->screen_base = screen_base + var->yoffset * linelen;
+	par->next_line = linelen;
 	return 0;
 }
 
@@ -2174,6 +2175,8 @@ static int ext_decode_var(struct fb_var_screeninfo *var, struct atafb_par *par)
 	    var->xoffset > 0 ||
 	    var->yoffset > 0)
 		return -EINVAL;
+
+	par->next_line = external_xres_virtual * external_depth / 8;
 	return 0;
 }
 

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
