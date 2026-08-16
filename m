Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72CA3D565A
	for <linux-m68k@vger.kernel.org>; Sun, 16 Aug 2026 07:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786865885; cv=none; b=kiuJhVS9XI0mlfzqvud7kZMDNPP88izzBfygEiuJ9HTXcimO5R3HlyrO7P4d58mN38ta/g+G2RI19L3OmtSVxgEwdKecHY+zIz+nb/ZysYrpMmd+9/pYMRZGrL94uzBYdUebM9pEGBl3hIajbXW7zbbLdYY4QeCIE/u1PMNahUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786865885; c=relaxed/simple;
	bh=emsftyw5wyoadJa+IORXBvBSvTjmZyYai6RX0k/JApg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W1ft+mGUp+f1+HU0nuIcIGCjWayx2MIWdkIltLabgVU58gyLI2dEMCiHasYj7kmHU3oKJQL4qHRtumO0v2s9B10iQPzCv/76TnJOje37cZddR2x+TjnhADjjMOUUCbw1wZuuzVW3Ta//OAG7tOkVWcsf4Z/FSEzLsFK8jJJlkBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xau7D2Pw; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xau7D2Pw"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ccf2360620so23932135ad.3
        for <linux-m68k@vger.kernel.org>; Sun, 16 Aug 2026 00:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786865882; x=1787470682; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eivPPKqM37O/esXZcj/rxFYzR0cZV1VDclO2F/dhLtM=;
        b=Xau7D2PwnCKn21ymO8YlRFeVQbIHbABk+xISVpVHlDwi8MwXDvJxR9XhFndl/WyPtj
         9oc90OTBhYEWTJPg7AYjdceQjMHJx/vIVt+cWgrFiaJjeCgsXyF+APMxsTvASu4oDKzD
         Y8pB9eC3qFAHyonT60Hs/vf+1Noh/AHV1S/DuWRgAfW+Gn1aSIz/HPRNF1SCMQ/n9sY7
         yyzzj85Po4cxOnKrYwCXrEm1QhGJm07NEdV4JCdRgMSezsnB+I5HGHMwHVzmJeLK88+7
         72vrJu+wqYDKcSre8tNgbjMTlY7hdlxyeVNpssmTMJO0iywO4EvCsVZLiyqalqWJ4YZa
         NjzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786865882; x=1787470682;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eivPPKqM37O/esXZcj/rxFYzR0cZV1VDclO2F/dhLtM=;
        b=XD0mr5QwUjdXBe5n7gEkmKuZfLUmbyJYopOgfk/Dk64Aj/jrbAqEy335gDHoxhCIEb
         5C1o+6rBuf9FZXFN649qsrIVQMbCmOsoFsmC3uK8gyHnDnIf2hwvsGTubBpsNeAffdET
         KTLI5Tt5GuP3wf56xXj9wqgoR3hQGEnMKo/sLvOS95CI5So6XOA7ds0p4MGIfuSndxCJ
         ShShnK1RxpNhEcgJpPgXPSl7RvuaJTAQKmC7C6QGT0ZnRc+7YgiCWxnK2sYMOYTh+n9s
         FmAirToFlI5gZttH9AZu6WYCMCVXoGi5zZB5EeMs2+/02CvgDN164Xhgtlbfa655chWx
         dpeQ==
X-Gm-Message-State: AOJu0YzgAwFqojuUfHMidl6pS6/rPwNtu8dpg33+n36dKD4bnguveJY7
	jZ2kiCfkS/1ddDFjUVh17ipId/7GsLSqJpy97kzH/RUYavyEpfx5RszB
X-Gm-Gg: AR+sD10+spOUaKiJp/Q2dsVF1ZqChH/YkbcU3R7ZSuLtdcYw5g1jdEvQoQfFcGgokrI
	7Y2SylytqgJPmbe6jhInklN0Nv33ULBrG0eO5zjIuuTw0xH3/XKYc9Xo2OGxnsP9Yo9p4Vdx6/J
	OhB/WU+ulPShqWt6b5Wt3dQxiag0MGk7KdXAMI+OLsfdKMp1RMfAm6oWKf1kOYixWzPOVSMtpUe
	xmabOCR/o9jMrLOo7D1ABDFjotmHV2r+/6lI1lpmb0hMCi08t8kSEMJAk8JhuGT8j94ArHYX6Ig
	5GDN4+S2V7BjFa3UKHlH1taV/nNWtaUT0YJOgBdb8DxgFIGYHdKLRbG/I3ilXVPg2Ps+mpTO4SU
	xvsJi4s5EP6fkmyfMgcj+LtwxNXEEpeA1PwhCRSaLuU++n1+N7Qp0JpyQRtsnBuKFj+DN+FR+V3
	hwyFg67dR2KKuuKCZbIYX6QS8Jxh4hwi4ZsjBN+MIS4H1bzz4j+JNpUHNxCw1KzFqqA0agDC5Y1
	YnJ0Ez9pyz0a9sy/EOe3BJjUq+hGssfYiUfG5NwrSd1S/LVOFywrA==
X-Received: by 2002:a17:90b:3d48:b0:381:528a:808c with SMTP id 98e67ed59e1d1-3933b8939dfmr18940629a91.12.1786865882042;
        Sun, 16 Aug 2026 00:38:02 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-152-170-159-fibre.sparkbb.co.nz. [222.152.170.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39531e84244sm843306a91.6.2026.08.16.00.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 00:38:01 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
	id 11BB3360495; Sun, 16 Aug 2026 19:37:58 +1200 (NZST)
From: Michael Schmitz <schmitzmic@gmail.com>
To: linux-m68k@vger.kernel.org,
	geert@linux-m68k.org
Cc: schmitzmic@gmail.com,
	Miro Kropacek <miro.kropacek@gmail.com>,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v2 3/5] fbdev: Add support for further video bit depths on atafb:external
Date: Sun, 16 Aug 2026 19:37:50 +1200
Message-Id: <20260816073752.16656-4-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260816073752.16656-1-schmitzmic@gmail.com>
References: <20260816073752.16656-1-schmitzmic@gmail.com>
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
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
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

