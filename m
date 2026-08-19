Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5773D954E
	for <linux-m68k@vger.kernel.org>; Wed, 19 Aug 2026 22:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787178538; cv=none; b=LkEoFoRR4CJ18nSnPuqxFgyxzo9eIOyZbn26ZqVCso7RBHxa5ZUWwVSxSq1XAvcFJadBFssPMmffyAlOa2UTgGGMNDBLuEcAxUIH7GA9TCCdGgqfcl/4Cbtp4EyhG6pvDRBSseFB5XJmIke2CDp0YaODUQNZp/Fd27Y225DOI+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787178538; c=relaxed/simple;
	bh=br4m2mbqAvPGTm+zJJQ2YU/1vn8BYIaN5BHm4Whjkvg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dGVS9qa9WrunSEC+V1s9yu/2gmxNSqvcD7MxEgIoSXmZfvvXJwtMwcsCO4XGldfH/ocXcXV6Rlj22k4MtA9/+v2+pdNj0uTpcwnhr1Od6UMyZWiP0fF1tEMD60R/7lCJSFIgHfOuR5cgb18P9Cm9UBhGVIZrlu+M2eYL+mYBU04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D5YBicDd; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D5YBicDd"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d530328efbso13743015ad.0
        for <linux-m68k@vger.kernel.org>; Wed, 19 Aug 2026 15:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787178537; x=1787783337; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CEW6KFIMNw5VcOVlr93xuWLGX5tz2KuDZc6WCxXPwrU=;
        b=D5YBicDdlcCes93zuOB2Y5XPjSuOkdUsjifWMMozCU8Ngcre2Yl2oGcVgMOzhIjSPY
         gujLFXUtWKCH6PeHVk2dZ/b4ARFMgsUSeHgMFgmUh001e3osViBkDVvTefBJZoRvp16V
         xO2i5pKgfG7nGL1KObqMi9z0PZ+RsufN8+pRXaKCs4F6O0BFVD0WWg1repVhxTj2dDfw
         6v7D65bxmURxe9SK1RRGzzzMJ1lszsc3Ljl46ta+sdGF75RXXB3QI77vpqaCO1KucEZe
         krTo3lhKRDsZ/KUCgB5A2yKV+2/Ehtm0lR/0R2OkIQQVmS5EmYaJPciwoMJorPPdanST
         InrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787178537; x=1787783337;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CEW6KFIMNw5VcOVlr93xuWLGX5tz2KuDZc6WCxXPwrU=;
        b=cLzkWbrbO/Kg9NUrI4SMQTneq/4LT90Ngtu14l197yj8gQM7w4zV58zqtrUySmZHQx
         ujqKBEVfXo9MKyT3AIRLM3gFt+RDj9GqGrHADA9/wj65r9Rmu76/geYJkdu2l/9mU4Gi
         nQ4q9m2bs5mbs/O9piKOcfe2SZOJDymbC7pWvZi/U66iNcS4c3G158tB4ZnJOrqpz1OQ
         hINX/od2Ol3jz0O7vos9n3W0FgPfvo3yOC4gxPObBJjlG/j3VnIHcAlT6s7H+vKuZ5Re
         PYMpAitMdy5F5uNkCTzJbajjgXuEY7M0kYZ8IhxSYk16H9eJy3IyNgAyRw6e2bwe9Jim
         Hidw==
X-Gm-Message-State: AFuF++n/HUijwb0rUajJ/JAHkYkMxsRqfwWohy0NO1yCdZTLgLSqUZ5n
	DH4SjCrMHG/qV1qqVnUWlOO45GT/SNTKM872cB5bMF+zMxnnthJIyckWDwhbUg==
X-Gm-Gg: AR+sD13hiqPU5KQ1jV6B2RaipknunKUv8lSLVGElNo1W0dJo+1d9qnMAP13HACMSIl9
	LrQKAR5pauNXEPtq2n8baLr9OsGR04Zls1o22XMvJe9sI69mNLKJvan3C1fL3lnWfCbySXpI3dP
	IoHBlfeAMBWg0dQdBVGZeGPDQObgyJYEE5dzHACN6cRPmYE6FmTTsHuZd1VQ2hqp1F1iJRNERp/
	mCGAQCSCc7ZhiarHU8Ajg6e7PnI2FOm1coENaMs/dns6rIyf8/TF/xN/S9Ik3X8nDBiBWmkso3h
	75zeAMYNsbKXgs80TMbuQTJCyPa7cT0NTmhHF7UBgjAK/6QGrpjtIjYViyQOkkmQ3TgUYpVMnim
	oZvp5D4tRbjN3NuGpXkDsZzs4eyP9iZqzegTHmKmbB6Oq3jQLmNnYT30/2N7HwDokQcPlbw7n84
	ddDzIC/jTv7AnLl9MPGpcGZVt6X76kfWePlr6lguI/RCaf1tVQGj4SBBgOhyu1mYITlo5ne7PKJ
	FJsZV2bCBH11ff49r9BdpesTuuDA/0pSRV2y/erSIwi2IH99KJ+6L6ZCkpB
X-Received: by 2002:a17:903:2bcb:b0:2cc:9179:32e with SMTP id d9443c01a7336-2d601e80fd8mr154826015ad.10.1787178536631;
        Wed, 19 Aug 2026 15:28:56 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (122-59-250-182-adsl.sparkbb.co.nz. [122.59.250.182])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef77bfcsm9027134eec.9.2026.08.19.15.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 15:28:56 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
	id F4084360572; Thu, 20 Aug 2026 10:28:51 +1200 (NZST)
From: Michael Schmitz <schmitzmic@gmail.com>
To: linux-m68k@vger.kernel.org,
	geert@linux-m68k.org
Cc: schmitzmic@gmail.com,
	Miro Kropacek <miro.kropacek@gmail.com>,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v3 3/5] fbdev: Add support for further video bit depths on atafb:external
Date: Thu, 20 Aug 2026 10:28:36 +1200
Message-Id: <20260819222838.21256-4-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260819222838.21256-1-schmitzmic@gmail.com>
References: <20260819222838.21256-1-schmitzmic@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

From: Miro Kropacek <miro.kropacek@gmail.com>

Supervidel offers additional video bit depths (8-bit chunky, 16-bit
RGB565 (also on the originaln Videl) and ARGB888.

Add code to support these bit depths.

Signed-off-by: Miro Kropacek <miro.kropacek@gmail.com>
Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
Cc: <linux-fbdev@vger.kernel.org>
Link: https://lists.debian.org/debian-68k/2026/08/msg00000.html

---

Changes in v3:

- adapt patch to fb_info -> *fb_info rewrite (in patch 2)
---
 drivers/video/fbdev/atafb.c | 89 ++++++++++++++++++++++++++++++++++---
 1 file changed, 82 insertions(+), 7 deletions(-)

diff --git a/drivers/video/fbdev/atafb.c b/drivers/video/fbdev/atafb.c
index a9be06ded5c9..1a245141560b 100644
--- a/drivers/video/fbdev/atafb.c
+++ b/drivers/video/fbdev/atafb.c
@@ -2079,8 +2079,12 @@ static int ext_encode_fix(struct fb_fix_screeninfo *fix, struct atafb_par *par)
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
@@ -2158,6 +2162,35 @@ static int ext_encode_var(struct fb_var_screeninfo *var, struct atafb_par *par)
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
@@ -2192,6 +2225,38 @@ static int ext_setcolreg(unsigned int regno, unsigned int red,
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
 
@@ -2421,7 +2486,9 @@ static void atafb_fillrect(struct fb_info *info, const struct fb_fillrect *rect)
 		return;
 
 #ifdef ATAFB_FALCON
-	if (info->var.bits_per_pixel == 16) {
+	/* chunky modes (Falcon hicolor, external packed/truecolor) */
+	if (info->fix.type == FB_TYPE_PACKED_PIXELS &&
+	    info->var.bits_per_pixel > 1) {
 		cfb_fillrect(info, rect);
 		return;
 	}
@@ -2462,7 +2529,9 @@ static void atafb_copyarea(struct fb_info *info, const struct fb_copyarea *area)
 	int rev_copy = 0;
 
 #ifdef ATAFB_FALCON
-	if (info->var.bits_per_pixel == 16) {
+	/* chunky modes (Falcon hicolor, external packed/truecolor) */
+	if (info->fix.type == FB_TYPE_PACKED_PIXELS &&
+	    info->var.bits_per_pixel > 1) {
 		cfb_copyarea(info, area);
 		return;
 	}
@@ -2516,7 +2585,9 @@ static void atafb_imageblit(struct fb_info *info, const struct fb_image *image)
 	u32 dx, dy, width, height, pitch;
 
 #ifdef ATAFB_FALCON
-	if (info->var.bits_per_pixel == 16) {
+	/* chunky modes (Falcon hicolor, external packed/truecolor) */
+	if (info->fix.type == FB_TYPE_PACKED_PIXELS &&
+	    info->var.bits_per_pixel > 1) {
 		cfb_imageblit(info, image);
 		return;
 	}
@@ -2752,7 +2823,7 @@ static void __init atafb_setup_ext(char *spec)
 		return;
 	depth = simple_strtoul(p, NULL, 10);
 	if (depth != 1 && depth != 2 && depth != 4 && depth != 8 &&
-	    depth != 16 && depth != 24)
+	    depth != 16 && depth != 24 && depth != 32)
 		return;
 
 	p = strsep(&spec, ";");
@@ -3137,7 +3208,11 @@ static int __init atafb_probe(struct platform_device *pdev)
 
 	atafb_set_disp(fb_info);
 
-	fb_alloc_cmap(&(fb_info->cmap), 1 << fb_info->var.bits_per_pixel, 0);
+	/* truecolor visuals only need the 16-entry console palette; this
+	 * also avoids 1 << 32 overflowing at 32bpp
+	 */
+	fb_alloc_cmap(&(fb_info->cmap), fb_info->var.bits_per_pixel > 8 ?
+		      16 : 1 << fb_info->var.bits_per_pixel, 0);
 
 	dev_info(&pdev->dev, "Determined %dx%d, depth %d\n", fb_info->var.xres,
 		 fb_info->var.yres, fb_info->var.bits_per_pixel);
-- 
2.17.1

