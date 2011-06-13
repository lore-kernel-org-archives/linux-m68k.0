From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] fbdev/atyfb: Fix 2 defined-but-not-used warnings
Date: Mon, 13 Jun 2011 20:12:58 +0200
Message-ID: <1307988778-21644-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from jacques.telenet-ops.be ([195.130.132.50]:52436 "EHLO
	jacques.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753970Ab1FMSNC (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 13 Jun 2011 14:13:02 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Paul Mundt <lethal@linux-sh.org>, Ville Syrjala <syrjala@sci.fi>
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

If CONFIG_FB_ATY_BACKLIGHT=3Dy but CONFIG_PCI=3Dn:

drivers/video/aty/atyfb_base.c:2272: warning: =E2=80=98aty_bl_exit=E2=80=
=99 defined but not used

If CONFIG_ATARI=3Dy for a modular build:

drivers/video/aty/atyfb_base.c:2794: warning: =E2=80=98store_video_par=E2=
=80=99 defined but not
used

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/video/aty/atyfb_base.c |   10 ++++------
 1 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/video/aty/atyfb_base.c b/drivers/video/aty/atyfb_b=
ase.c
index ebb893c..d7aaec5 100644
--- a/drivers/video/aty/atyfb_base.c
+++ b/drivers/video/aty/atyfb_base.c
@@ -248,10 +248,6 @@ static int atyfb_sync(struct fb_info *info);
=20
 static int aty_init(struct fb_info *info);
=20
-#ifdef CONFIG_ATARI
-static int store_video_par(char *videopar, unsigned char m64_num);
-#endif
-
 static void aty_get_crtc(const struct atyfb_par *par, struct crtc *crt=
c);
=20
 static void aty_set_crtc(const struct atyfb_par *par, const struct crt=
c *crtc);
@@ -2268,11 +2264,13 @@ error:
 	return;
 }
=20
+#ifdef CONFIG_PCI
 static void aty_bl_exit(struct backlight_device *bd)
 {
 	backlight_device_unregister(bd);
 	printk("aty: Backlight unloaded\n");
 }
+#endif /* CONFIG_PCI */
=20
 #endif /* CONFIG_FB_ATY_BACKLIGHT */
=20
@@ -2789,7 +2787,7 @@ aty_init_exit:
 	return ret;
 }
=20
-#ifdef CONFIG_ATARI
+#if defined(CONFIG_ATARI) && !defined(MODULE)
 static int __devinit store_video_par(char *video_str, unsigned char m6=
4_num)
 {
 	char *p;
@@ -2818,7 +2816,7 @@ static int __devinit store_video_par(char *video_=
str, unsigned char m64_num)
 	phys_vmembase[m64_num] =3D 0;
 	return -1;
 }
-#endif /* CONFIG_ATARI */
+#endif /* CONFIG_ATARI && !MODULE */
=20
 /*
  * Blank the display.
--=20
1.7.0.4
