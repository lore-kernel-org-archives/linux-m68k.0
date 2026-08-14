Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBEE3D3481
	for <linux-m68k@vger.kernel.org>; Fri, 14 Aug 2026 03:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786677479; cv=none; b=Lg2zTjl0IrVQ5+Y1dh73z2bQAx2TcDY65RqbJ7O7UGRTscKa3EJWJ+4x37pWTZPNpbDC3gUGTEqOSEziQtfanMygTa+CkBsILOhRclSprPi+onlSev7Eusi3TR4To7BL5bq5mQvG0vGCpX5ltzxm4HpkikVtMmXxZNb5EdVNDU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786677479; c=relaxed/simple;
	bh=7406v4ewSxXj++skwOac1/7EeZvaZMjbdU3StqNl/Ek=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hTq4fGQvwwATk5u7gfYKLpH8MFKfYYfuQ9uwRjtS/Y6KOuOXMKIk6Z19vnLA/EKuuZa2E1xpYH6YK48bU9cRhDT7dBPFW+JLioayOz3N/RnmWZiXe9H+CX+NZ3S+iWbLnEKozMci5tZjrg7z9teQczyUp+bgXGOUtbH5qHBRxos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y8bGyL6F; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y8bGyL6F"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so627794a12.2
        for <linux-m68k@vger.kernel.org>; Thu, 13 Aug 2026 20:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786677477; x=1787282277; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=48VzVhyyp3IJ6+PjA2DDzoO5HTDdzJgImB+JZR5N7fA=;
        b=Y8bGyL6FxnpRKnIya3SuHt2/xyy1hEoc8ykyyaHuBQNJMdpmSnwFwEt+RaVE5wSevA
         fddLSay1rPp1/w21jVNx8tZdjt+XvyoFSv2h4upvyHPTEWNrv+t/L68E8ylBxmc0VTRB
         9cMhm+ozM1/gVXZ2MZc+7TgpIHUzpPWuPYR2TQ57XyIi/kj1BwK9fJxDkjWlxxiNb+eP
         x4cwllFyYn0Ggo1xSreF9DoOkr2SR5A/i4yQFAtfA8XdcxPHVeE4pxW5Aqrqom+GSxsM
         oPYpfIND3CLdJhcwVSi4ucN+47fSSyT36Zo7cEnP3PDTIUSCjdV18XSRE8DxlczdYCDw
         0yGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786677477; x=1787282277;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=48VzVhyyp3IJ6+PjA2DDzoO5HTDdzJgImB+JZR5N7fA=;
        b=i3QihJ7vXY2JzggeeHjBibAay561tiiqDoWtlOH13T/KBuH29HZj0t+MS9Krem3ZPz
         t0LkLo5YkExN1UAr020UIL5EcXVAGhgZ+2WL3FEzkw8bKjVz1fqeP2F+Xu4+TNfSin1O
         Mretq4f43dvMWwVVFhWG2ApG7WV18MQ3x3lEqVnxDi4WYKIfCj5jiH6sFUn2TbH0vyw7
         ZfuZkXmg6QewBrOnRWht8il/D6P9svgisVYDZCpYojurJIeqbrUUvu7sULT81XQ9/q0e
         Md8POLgPB6AkI0oiacVv+eaWVQpsBphETGi47941YLMWeJIliAmspU8qBGvtX9TcoJK6
         3/xQ==
X-Gm-Message-State: AOJu0YyUQGE2osAmTwNaCBFsX62TCqgUbRBi8FuwYyur9eyoAbxrI074
	MJK7AJRhKnrXmSiap3jHujK0zNB9B1ilycvKJwWe5IEPe+/cnuYSK2AH
X-Gm-Gg: AR+sD12HAmiYWOWsurqHv1rnu0B8rqhhinUZs+krMCmfr1g+u/9GYfJQ92VXFaogo3s
	GlxgY1VOkBxQNBI7kxJGU2Rf0h0aZWDWO2rNv+pNH1pikLcKeJB3Fe+Ox5CwMR5AmMF3dkG6gKK
	x5HNWKH4ltiUCivR0IqfqtVCLQy6ZSDflz5Rdl6IA3Bhcsy/rFkb/8hlY0sqEcuap3yOK7nKXbZ
	gPnFgUiq3v2UvZPmpnk+WhjiEmoyYtO/h++RsThb+sHyGgz8UIMr2SHQOp6mIobLKSVrJD7wl12
	MvCocZQOdF0KOnheA0YsQ3HPlEr6FylP2qrZ48jBqDkgGyeSZB648ZoueIbR6tcDT1Qr0wVBp2s
	dEZ6kdQZ3QWAKTAtc/rq1cvzDddz5ZndHxVNiKshen+3jrZZm7r4+5+OVechxzOIvAtlc84EBl0
	YxbfZN43ma05xnB+WXd+D4y7xEO6Hf1K8qLXAUUGA7tNyF8KSs2UbXhGaEo7uBKk0dx9OsYUm/f
	jMk66rO4gSmxgTmLPz0p20t/s8YojXcOb+1PxpoG6HMG306oN/6ig==
X-Received: by 2002:a05:6a21:6e8e:b0:3c3:64cc:311a with SMTP id adf61e73a8af0-3cc71d7a211mr3120820637.22.1786677477062;
        Thu, 13 Aug 2026 20:17:57 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-152-170-159-fibre.sparkbb.co.nz. [222.152.170.159])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebc760524sm13806378eec.1.2026.08.13.20.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 20:17:56 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
	id 2FE09360495; Fri, 14 Aug 2026 15:17:53 +1200 (NZST)
From: Michael Schmitz <schmitzmic@gmail.com>
To: linux-m68k@vger.kernel.org,
	geert@linux-m68k.org
Cc: schmitzmic@gmail.com,
	Miro Kropacek <miro.kropacek@gmail.com>,
	linux-fbdev@vger.kernel.org
Subject: [PATCH 3/5] fbdev: Add support for further video bit depths on atafb:external
Date: Fri, 14 Aug 2026 15:17:43 +1200
Message-Id: <20260814031745.17140-4-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260814031745.17140-1-schmitzmic@gmail.com>
References: <20260814031745.17140-1-schmitzmic@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Miro Kropacek <miro.kropacek@gmail.com>

Supervidel offers additional video bit depths (8-bit chunky, 16-bit
RGB565 (also on the originaln Videl) and ARGB888.

Add code to support these bit depths.

Signed-off-by: Miro Kropacek <miro.kropacek@gmail.com>
Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>
Cc: <linux-fbdev@vger.kernel.org>
Link: https://lists.debian.org/debian-68k/2026/08/msg00000.html
---
 drivers/video/fbdev/atafb.c | 89 ++++++++++++++++++++++++++++++++++---
 1 file changed, 82 insertions(+), 7 deletions(-)

diff --git a/drivers/video/fbdev/atafb.c b/drivers/video/fbdev/atafb.c
index 3d540803dc2b..50853d7a08e3 100644
--- a/drivers/video/fbdev/atafb.c
+++ b/drivers/video/fbdev/atafb.c
@@ -2081,8 +2081,12 @@ static int ext_encode_fix(struct fb_fix_screeninfo *fix, struct atafb_par *par)
 			 external_pmode == FB_TYPE_PACKED_PIXELS) ?
 				FB_VISUAL_MONO10 : FB_VISUAL_MONO01;
 	} else {
-		/* Use STATIC if we don't know how to access color registers */
-		int visual = external_vgaiobase ?
+		/* Use STATIC if we don't know how to access color registers;
+		 * SuperVidel 8bpp chunky (fb in SV RAM) uses the Falcon palette
+		 */
+		int visual = (external_vgaiobase ||
+			      (external_depth == 8 &&
+			       external_addr >= 0xa0000000)) ?
 					 FB_VISUAL_PSEUDOCOLOR :
 					 FB_VISUAL_STATIC_PSEUDOCOLOR;
 		switch (external_pmode) {
@@ -2159,6 +2163,35 @@ static int ext_encode_var(struct fb_var_screeninfo *var, struct atafb_par *par)
 	var->transp.offset = 0;
 	var->transp.length = 0;
 	var->transp.msb_right = 0;
+	if (external_pmode == -1 && external_depth == 16) {
+		/* RGB565 truecolor (e.g. SuperVidel native mode) */
+		var->red.offset = 11;
+		var->red.length = 5;
+		var->green.offset = 5;
+		var->green.length = 6;
+		var->blue.offset = 0;
+		var->blue.length = 5;
+	} else if (external_pmode == -1 && external_depth == 32) {
+		/* ARGB8888 truecolor (e.g. SuperVidel native mode) */
+		var->red.offset = 16;
+		var->red.length = 8;
+		var->green.offset = 8;
+		var->green.length = 8;
+		var->blue.offset = 0;
+		var->blue.length = 8;
+		var->transp.offset = 24;
+		var->transp.length = 8;
+	} else if (external_pmode == FB_TYPE_PACKED_PIXELS &&
+		   external_depth == 8 && external_addr >= 0xa0000000) {
+		/* SuperVidel 8bpp chunky: palette has 8 bits per channel.
+		 * Without this, fb_get_color_depth() sees length 0 and
+		 * fbcon falls back to its 2-color palette — the console
+		 * text (color 7) stays black on black.
+		 */
+		var->red.length = 8;
+		var->green.length = 8;
+		var->blue.length = 8;
+	}
 	var->yres_virtual = var->yres;
 	var->xoffset = 0;
 	var->yoffset = 0;
@@ -2193,6 +2226,38 @@ static int ext_setcolreg(unsigned int regno, unsigned int red,
 {
 	unsigned char colmask = (1 << external_bitspercol) - 1;
 
+	if (external_pmode == -1 && external_depth == 16) {
+		/* truecolor: only the pseudo palette for fbcon is needed */
+		if (regno > 15)
+			return 1;
+		((u32 *)info->pseudo_palette)[regno] = (red & 0xf800) |
+						       ((green & 0xfc00) >> 5) |
+						       ((blue & 0xf800) >> 11);
+		return 0;
+	}
+	if (external_pmode == -1 && external_depth == 32) {
+		/* ARGB8888, alpha forced opaque */
+		if (regno > 15)
+			return 1;
+		((u32 *)info->pseudo_palette)[regno] = 0xff000000 |
+						       ((red & 0xff00) << 8) |
+						       (green & 0xff00) |
+						       ((blue & 0xff00) >> 8);
+		return 0;
+	}
+	if (external_pmode == FB_TYPE_PACKED_PIXELS && external_depth == 8 &&
+	    external_addr >= 0xa0000000) {
+		/* SuperVidel native 8bpp chunky scans out via the Falcon
+		 * palette registers, honoring all 8 bits per channel
+		 */
+		if (regno > 255)
+			return 1;
+		f030_col[regno] = ((red & 0xff00) << 16) |
+				  ((green & 0xff00) << 8) |
+				  ((blue & 0xff00) >> 8);
+		return 0;
+	}
+
 	if (!external_vgaiobase)
 		return 1;
 
@@ -2422,7 +2487,9 @@ static void atafb_fillrect(struct fb_info *info, const struct fb_fillrect *rect)
 		return;
 
 #ifdef ATAFB_FALCON
-	if (info->var.bits_per_pixel == 16) {
+	/* chunky modes (Falcon hicolor, external packed/truecolor) */
+	if (info->fix.type == FB_TYPE_PACKED_PIXELS &&
+	    info->var.bits_per_pixel > 1) {
 		cfb_fillrect(info, rect);
 		return;
 	}
@@ -2463,7 +2530,9 @@ static void atafb_copyarea(struct fb_info *info, const struct fb_copyarea *area)
 	int rev_copy = 0;
 
 #ifdef ATAFB_FALCON
-	if (info->var.bits_per_pixel == 16) {
+	/* chunky modes (Falcon hicolor, external packed/truecolor) */
+	if (info->fix.type == FB_TYPE_PACKED_PIXELS &&
+	    info->var.bits_per_pixel > 1) {
 		cfb_copyarea(info, area);
 		return;
 	}
@@ -2517,7 +2586,9 @@ static void atafb_imageblit(struct fb_info *info, const struct fb_image *image)
 	u32 dx, dy, width, height, pitch;
 
 #ifdef ATAFB_FALCON
-	if (info->var.bits_per_pixel == 16) {
+	/* chunky modes (Falcon hicolor, external packed/truecolor) */
+	if (info->fix.type == FB_TYPE_PACKED_PIXELS &&
+	    info->var.bits_per_pixel > 1) {
 		cfb_imageblit(info, image);
 		return;
 	}
@@ -2753,7 +2824,7 @@ static void __init atafb_setup_ext(char *spec)
 		return;
 	depth = simple_strtoul(p, NULL, 10);
 	if (depth != 1 && depth != 2 && depth != 4 && depth != 8 &&
-	    depth != 16 && depth != 24)
+	    depth != 16 && depth != 24 && depth != 32)
 		return;
 
 	p = strsep(&spec, ";");
@@ -3131,7 +3202,11 @@ static int __init atafb_probe(struct platform_device *pdev)
 
 	atafb_set_disp(&fb_info);
 
-	fb_alloc_cmap(&(fb_info.cmap), 1 << fb_info.var.bits_per_pixel, 0);
+	/* truecolor visuals only need the 16-entry console palette; this
+	 * also avoids 1 << 32 overflowing at 32bpp
+	 */
+	fb_alloc_cmap(&(fb_info.cmap), fb_info.var.bits_per_pixel > 8 ?
+		      16 : 1 << fb_info.var.bits_per_pixel, 0);
 
 
 	dev_info(&pdev->dev, "Determined %dx%d, depth %d\n", fb_info.var.xres,
-- 
2.17.1

