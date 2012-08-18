From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] fbdev/amifb: Remove write-only variable amifb_inverse
Date: Sat, 18 Aug 2012 15:30:21 +0200
Message-ID: <1345296621-15367-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from georges.telenet-ops.be ([195.130.137.68]:56465 "EHLO
	georges.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754924Ab2HRNa1 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 18 Aug 2012 09:30:27 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
Cc: linux-fbdev@vger.kernel.org, linux-m68k@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/video/amifb.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/drivers/video/amifb.c b/drivers/video/amifb.c
index 887df9d..7fa1bf8 100644
--- a/drivers/video/amifb.c
+++ b/drivers/video/amifb.c
@@ -949,7 +949,6 @@ static int round_down_bpp = 1;	/* for mode probing */
 
 
 static int amifb_ilbm = 0;	/* interleaved or normal bitplanes */
-static int amifb_inverse = 0;
 
 static u32 amifb_hfmin __initdata;	/* monitor hfreq lower limit (Hz) */
 static u32 amifb_hfmax __initdata;	/* monitor hfreq upper limit (Hz) */
@@ -2355,7 +2354,6 @@ static int __init amifb_setup(char *options)
 		if (!*this_opt)
 			continue;
 		if (!strcmp(this_opt, "inverse")) {
-			amifb_inverse = 1;
 			fb_invert_cmaps();
 		} else if (!strcmp(this_opt, "ilbm"))
 			amifb_ilbm = 1;
-- 
1.7.0.4
