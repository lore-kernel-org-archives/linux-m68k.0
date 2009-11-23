From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH] macfb: trivial comment fixes
Date: Mon, 23 Nov 2009 15:37:05 +1100 (EST)
Message-ID: <alpine.OSX.2.00.0911231533320.533@localhost>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:43591 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756335AbZKWEhA (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 22 Nov 2009 23:37:00 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-fbdev-devel@lists.sourceforge.net, linux-m68k@vger.kernel.org


Some corrections to the comments which escaped my previous macfb patch.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

---
 drivers/video/macfb.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

Index: linux-2.6.31/drivers/video/macfb.c
===================================================================
--- linux-2.6.31.orig/drivers/video/macfb.c	2009-11-21 19:42:44.000000000 +1100
+++ linux-2.6.31/drivers/video/macfb.c	2009-11-23 15:28:39.000000000 +1100
@@ -228,6 +228,7 @@ static int v8_brazil_setpalette(unsigned
 	return 0;
 }
 
+/* RAM-Based Video */
 static int rbv_setpalette(unsigned int regno, unsigned int red,
                           unsigned int green, unsigned int blue,
                           struct fb_info *info)
@@ -345,8 +346,6 @@ static int jet_setpalette(unsigned int r
  * input and viewing the screen at the same time!  The 840AV
  * Can add another 1MB RAM to give the two framebuffers
  * 1MB RAM apiece.
- *
- * FIXME: this doesn't seem to work anymore.
  */
 static int civic_setpalette(unsigned int regno, unsigned int red,
                             unsigned int green, unsigned int blue,
