From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH/RFC] atafb and panning
Date: Sun, 16 Nov 2008 22:36:06 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0811162235251.20005@anakin>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from harold.telenet-ops.be ([195.130.133.65]:59393 "EHLO
	harold.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752842AbYKPVgI (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 16 Nov 2008 16:36:08 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Fix panning on ARAnyM (Falcon emulation). Without this, `fbtest test011' fails
(for a 320x200x8 display with virtual 640x400).

As the original code in 2.4.x was the same, I'm wondering:
  o Is this a bug in the ARAnyM emulation?
  o xpanstep is 1, but judging from the visual output on ARAnyM, it looks like
    it should be 16?

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/video/atafb.c |    2 ++
 1 file changed, 2 insertions(+)

--- a/drivers/video/atafb.c
+++ b/drivers/video/atafb.c
@@ -1697,8 +1697,10 @@ static int falcon_pan_display(struct fb_
 	}
 	par->hw.falcon.line_offset = bpp *
 		(info->var.xres_virtual - info->var.xres) / 16;
+#if 0
 	if (par->hw.falcon.xoffset)
 		par->hw.falcon.line_offset -= bpp;
+#endif;
 	xoffset = var->xoffset - par->hw.falcon.xoffset;
 
 	par->screen_base = screen_base +

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
