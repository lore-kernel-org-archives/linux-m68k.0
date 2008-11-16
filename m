From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH/RFC] atafb and 16 bpp
Date: Sun, 16 Nov 2008 22:35:08 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0811162234250.20005@anakin>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from monty.telenet-ops.be ([195.130.132.56]:59123 "EHLO
	monty.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752468AbYKPVfK (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 16 Nov 2008 16:35:10 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Fix console on 16 bpp (tested on ARAnyM):
  o 16 bpp must use the cfb_*() ops
  o 16 bpp needs to set up info->pseudo_palette[] (was fbcon_cfb16_cmap[] on
    2.4.x)

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/video/atafb.c |   74 ++++++++++++++++++++------------------------------
 1 file changed, 30 insertions(+), 44 deletions(-)

--- a/drivers/video/atafb.c
+++ b/drivers/video/atafb.c
@@ -148,6 +148,7 @@ static struct atafb_par {
 			short mono;
 			short ste_mode;
 			short bpp;
+			u32 pseudo_palette[16];
 		} falcon;
 #endif
 		/* Nothing needed for external mode */
@@ -883,10 +884,6 @@ static int vdl_prescale[4][3] = {
 /* Default hsync timing [mon_type] in picoseconds */
 static long h_syncs[4] = { 3000000, 4875000, 4000000, 4875000 };
 
-#ifdef FBCON_HAS_CFB16
-static u16 fbcon_cfb16_cmap[16];
-#endif
-
 static inline int hxx_prescale(struct falcon_hw *hw)
 {
 	return hw->ste_mode ? 16
@@ -1728,10 +1725,10 @@ static int falcon_setcolreg(unsigned int
 			(((red & 0xe000) >> 13) | ((red & 0x1000) >> 12) << 8) |
 			(((green & 0xe000) >> 13) | ((green & 0x1000) >> 12) << 4) |
 			((blue & 0xe000) >> 13) | ((blue & 0x1000) >> 12);
-#ifdef FBCON_HAS_CFB16
-		fbcon_cfb16_cmap[regno] = ((red & 0xf800) |
-					   ((green & 0xfc00) >> 5) |
-					   ((blue & 0xf800) >> 11));
+#ifdef ATAFB_FALCON
+		((u32 *)info->pseudo_palette)[regno] = ((red & 0xf800) |
+						       ((green & 0xfc00) >> 5) |
+						       ((blue & 0xf800) >> 11));
 #endif
 	}
 	return 0;
@@ -2436,42 +2433,6 @@ static void atafb_set_disp(struct fb_inf
 	atafb_get_fix(&info->fix, info);
 
 	info->screen_base = (void *)info->fix.smem_start;
-
-	switch (info->fix.type) {
-	case FB_TYPE_INTERLEAVED_PLANES:
-		switch (info->var.bits_per_pixel) {
-		case 2:
-			// display->dispsw = &fbcon_iplan2p2;
-			break;
-		case 4:
-			// display->dispsw = &fbcon_iplan2p4;
-			break;
-		case 8:
-			// display->dispsw = &fbcon_iplan2p8;
-			break;
-		}
-		break;
-	case FB_TYPE_PACKED_PIXELS:
-		switch (info->var.bits_per_pixel) {
-#ifdef FBCON_HAS_MFB
-		case 1:
-			// display->dispsw = &fbcon_mfb;
-			break;
-#endif
-#ifdef FBCON_HAS_CFB8
-		case 8:
-			// display->dispsw = &fbcon_cfb8;
-			break;
-#endif
-#ifdef FBCON_HAS_CFB16
-		case 16:
-			// display->dispsw = &fbcon_cfb16;
-			// display->dispsw_data = fbcon_cfb16_cmap;
-			break;
-#endif
-		}
-		break;
-	}
 }
 
 static int atafb_setcolreg(u_int regno, u_int red, u_int green, u_int blue,
@@ -2542,6 +2503,13 @@ static void atafb_fillrect(struct fb_inf
 	if (!rect->width || !rect->height)
 		return;
 
+#ifdef ATAFB_FALCON
+	if (info->var.bits_per_pixel == 16) {
+		cfb_fillrect(info, rect);
+		return;
+	}
+#endif
+
 	/*
 	 * We could use hardware clipping but on many cards you get around
 	 * hardware clipping by writing to framebuffer directly.
@@ -2576,6 +2544,13 @@ static void atafb_copyarea(struct fb_inf
 	u32 dx, dy, sx, sy, width, height;
 	int rev_copy = 0;
 
+#ifdef ATAFB_FALCON
+	if (info->var.bits_per_pixel == 16) {
+		cfb_copyarea(info, area);
+		return;
+	}
+#endif
+
 	/* clip the destination */
 	x2 = area->dx + area->width;
 	y2 = area->dy + area->height;
@@ -2625,6 +2600,13 @@ static void atafb_imageblit(struct fb_in
 	const char *src;
 	u32 dx, dy, width, height, pitch;
 
+#ifdef ATAFB_FALCON
+	if (info->var.bits_per_pixel == 16) {
+		cfb_imageblit(info, image);
+		return;
+	}
+#endif
+
 	/*
 	 * We could use hardware clipping but on many cards you get around
 	 * hardware clipping by writing to framebuffer directly like we are
@@ -3217,6 +3199,10 @@ int __init atafb_init(void)
 	// tries to read from HW which may not be initialized yet
 	// so set sane var first, then call atafb_set_par
 	atafb_get_var(&fb_info.var, &fb_info);
+
+#ifdef ATAFB_FALCON
+	fb_info.pseudo_palette = current_par.hw.falcon.pseudo_palette;
+#endif
 	fb_info.flags = FBINFO_FLAG_DEFAULT;
 
 	if (!fb_find_mode(&fb_info.var, &fb_info, mode_option, atafb_modedb,

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
