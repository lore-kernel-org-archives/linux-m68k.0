Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794531384;
	b=z2ng5wkEm/Ux1r9CpT0ZUgHiA3CB9LKfd2x8Ctw6ccT/HEYub01O2pm8nKeGYuIBVAoT
	 RmNsz2JOlwo4dxQHqqtYH5ePHDYO9RJqoohCKHuy9SiCmtkVrb5oKyiEqc6TCcVXDqFjY
	 DrAPoiEVmyUO/rkp6vvRaqqcd8Yy2luDnb2S6zxaDQmnazjBuBjJ8VJDLgwgKuGasuBsm
	 cQ1CCgUWzIq26H6vt3myxT+8SVkerM3olcx3X7hGIba5ZgeEF4bVyxdx8TI64vq64qJMF
	 8Hfz6mWFnsGDidJbBjmrRmfoC659BvC488Nh6WLpax6oJbc7X/c2oCJBaet5AMoEJUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794531384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=CtRGBfCvPjk6NMUwk6EELxmj4aN2F/fvH5mMHwm0bys=;
	b=GscEi2IQKuCG7j/JdGRTGgC5Kf66utcTWlbtvP91+jYG4Fn0lzdATHCXnZq1cDs132XI
	 LZQkQ2qBqYOXHw8J3erBdfgdF3VKZF/9lezIo1ughn6hUNI5yd7j8rYgj1noBZZFKg4T8
	 aKX7TFh1TfleTh+0MvbXvlYxK/qtN3QtlKcj41qCo8PfOajD0+BVewPNYg+BpMYnzdFEx
	 M4P3GiGHfN2pSfnAE4n5JN+sUsCSgUzLopt4D6z+4VIZzu2ktV10QT7TPcKSLInDq/Z1K
	 Xq/lCurvCialXUEmzM7z4rcvT/XCNZVxg89Wo4CPbmGyj+FdVOMwg3dBxU7Fznrru7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="YNwWTIA/";
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEB0606A321
	for <linux-m68k@lists.linux-m68k.org>; Fri, 13 Nov 2026 00:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BEB0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YNwWTIA/
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b0d0b80fb9so365623a91.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 12 Nov 2026 16:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794531383; x=1795136183; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CtRGBfCvPjk6NMUwk6EELxmj4aN2F/fvH5mMHwm0bys=;
        b=YNwWTIA/HZ2bjFtsG/6pfMBRSSX8BUBeixSGp5jcQbBKJGx+6D1vSqf9XUb53Bc205
         drMoENc+V3WF7WyeEf7SGNsFYBgGYrhS7M0n9AcA4qlKyINAreiLbqHnP39fxEE2kfqY
         oQ9kirHtw520rGeMi+lFrp7OB+qIKxtNcj7cG2JQ3U21Lrcwi6KmVnJ1NdU1Dgk6gvgx
         NyBOMQS6ovRccd01KZuMx1kAnKT59PBm0VHf5ClqSg4u5Vag1qqUvH1SbMM+UI2SYJTf
         4VM+rB2hdR6dbUDqd3BPgSRDrDnqGWy6TTFGkWT60LVqzkleDKXntPir5SoPHLP6nOBe
         trQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794531383; x=1795136183;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CtRGBfCvPjk6NMUwk6EELxmj4aN2F/fvH5mMHwm0bys=;
        b=pcIqCxfy0EsD90NPLzUF8JEWKy/mIvNDjdkdBLb5scdu9xhQmAyjDZjidui2CKciFv
         ndOIjHGZd14DzAbIyFr+VA5QxHaHcWhGyUJr98zd2uyrw1MwGwyMdZJhfu2I62ESUhaJ
         kJNMNOnMuym8wSAREBJ46E7wEH3XNHqBTVfdUcgZvie/yMMYm7A/bcseJSGmJhUXdz94
         v+xDNUIEYWcjtbgd7HBjeHWezEClf3GpgAaCSAJpqeuPYvmNHNnhl1Zn0oaLgFGskF+H
         ev/R+FPUFCRXQhJ8p90KZkIwgHsDM6xvTQ3jn3WdvL3/6zWJ7lmqKbkPanZTEM6zgYDA
         UCSA==
X-Forwarded-Encrypted: i=1; AL+hErGrqkZ/0GxOZNkwA4y0Ttdhl9Jc4d7CT1SjRQQhmVTI86MNSVFkA1s2yOlyNq5CxcNrD8Ye92EOOrLF@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z/VRxGU5/P20CKypO1sibgMn0LpRROGqDb5u6PM6Tz/gJQ1CPMk
	HQPTjvKrI5ARif4HAeBmYbfcwIIPsmdn6/q2XdePAqrsMrO1xlQ07wMn
X-Gm-Gg: AYBFou1Itrs/8/G+YfYXDqgY+fbBhIASaqItgemdRs4apZ0wOnkF4dI2LarhJ81Zy/P
	NErdjceX0+9nJ4pBQPCFizPs+fkCbrkqQG3w2pOHJuMh3C5uiBoVG9xkiLYjXT8X42mQGCkjuR6
	7DYrzTbGAROIVzppQAq+f9RayOupoOticxLgoeWkm3rhZ5cHd/1PVapBA3Q1BwWmk61vWQRN/ZV
	1HlOlBFC5K7A0ktqLeNsLp2RHVQufxf1XuTIH1TDE/kNTb44gLxubQUWYusOoEDKiKxdvj8nG4W
	n6iKG3niuZh50pg3vN+a3gNEIUpdI78WfoeixYDETKvqKH4PoTQKEc1J7zFLQzKtXW2wGT7TPA2
	8lS1zkGleKIwVhZsfRqe7ymm24D4tGyBtWMj8qqrg6PNvqT3SPjJ6/UBh6hfVJAEngxydjh6bIW
	L2chDjsP0HqUm+tBTS35ABwR/RWb/IFFQWWODMonqOlt/fnufTwKvplh5jEL8iXP52+wtgXpVuk
	JmYIwQt6UzfCWW9osMUQ+w80DQ5M+xjScWxM83J8YDuecIKKcI4KSbvGdimCvcmGiqxP8cXnIXF
	aXgzBT+u6qpuEccx+TZ6onvICNW+tF8yEBzY1JgjEqd1aIemVbEDYYz8hMlMuZkKJW0kG6T7Hy3
	qbJ0nU5EqPPmyFIHzarju2/FiI1xm0AQNdDHYbBfSMAJvP77k1wZueVWXcsrKjhqVplJDjZWdVy
	lGoNl8oWR3pKAaAMAgSnEMN6rI2GCivd4jo6UMiEAX0anRxV5HuW+M/LxLOM042cx0a/mVtVfOq
	/gkvOjxNoAssBDdo9fAFCY6
X-Received: by 2002:a17:90a:d883:b0:3a4:b74a:795c with SMTP id 98e67ed59e1d1-3b1b09f3b50mr619305a91.16.1794531383375;
        Thu, 12 Nov 2026 16:56:23 -0800 (PST)
Received: from lenovo.localdomain (42-155-215-210.ipv4.nexon.net.au. [210.215.155.42])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f75c86asm2351735ad.23.2026.11.12.16.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:56:22 -0800 (PST)
From: Miro Kropacek <miro.kropacek@gmail.com>
To: deller@gmx.de
Cc: geert@linux-m68k.org,
	schmitzmic@gmail.com,
	lilinmao@kylinos.cn,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Miro Kropacek <miro.kropacek@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] fbdev: atafb: Restrict SuperVidel handling to the Falcon
Date: Fri, 13 Nov 2026 10:56:16 +1000
Message-ID: <20261113005616.402721-1-miro.kropacek@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A framebuffer at 0xa0000000 or above is taken as being in SuperVidel
RAM. A TT with a VME graphics card such as the Nova has its framebuffer
there too, so in 8bpp it gets the Falcon palette registers instead of
the card's VGA DAC, and in 8, 16 and 32bpp the SuperBlitter, which it
does not have.

The SuperVidel exists only for the Falcon, so check for the Falcon video
hardware as well.

Fixes: 51df976c3268 ("fbdev: atafb: Add support for further video bit depths on atafb:external")
Fixes: d463633d63e6 ("fbdev: atafb: Add support for SuperVidel's SuperBlitter")
Cc: stable@vger.kernel.org
Reported-by: Christian Zietz <czietz@gmx.net>
Signed-off-by: Miro Kropacek <miro.kropacek@gmail.com>
---
 drivers/video/fbdev/atafb.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/atafb.c b/drivers/video/fbdev/atafb.c
index c32576cb1720..5d9265caa9ab 100644
--- a/drivers/video/fbdev/atafb.c
+++ b/drivers/video/fbdev/atafb.c
@@ -2065,6 +2065,15 @@ static void st_ovsc_switch(void)
 
 #ifdef ATAFB_EXT
 
+/*
+ * Only a Falcon can have a SuperVidel; a TT with a VME graphics card can
+ * have its framebuffer in the same address range.
+ */
+static bool ext_is_supervidel(void)
+{
+	return ATARIHW_PRESENT(VIDEL_SHIFTER) && external_addr >= 0xa0000000;
+}
+
 static int ext_encode_fix(struct fb_fix_screeninfo *fix, struct atafb_par *par)
 {
 	strcpy(fix->id, "Unknown Extern");
@@ -2083,8 +2092,7 @@ static int ext_encode_fix(struct fb_fix_screeninfo *fix, struct atafb_par *par)
 		 * SuperVidel 8bpp chunky (fb in SV RAM) uses the Falcon palette
 		 */
 		int visual = (external_vgaiobase ||
-			      (external_depth == 8 &&
-			       external_addr >= 0xa0000000)) ?
+			      (external_depth == 8 && ext_is_supervidel())) ?
 					 FB_VISUAL_PSEUDOCOLOR :
 					 FB_VISUAL_STATIC_PSEUDOCOLOR;
 		switch (external_pmode) {
@@ -2181,7 +2189,7 @@ static int ext_encode_var(struct fb_var_screeninfo *var, struct atafb_par *par)
 		var->transp.offset = 24;
 		var->transp.length = 8;
 	} else if (external_pmode == FB_TYPE_PACKED_PIXELS &&
-		   external_depth == 8 && external_addr >= 0xa0000000) {
+		   external_depth == 8 && ext_is_supervidel()) {
 		/* SuperVidel 8bpp chunky: palette has 8 bits per channel.
 		 * Without this, fb_get_color_depth() sees length 0 and
 		 * fbcon falls back to its 2-color palette — the console
@@ -2245,7 +2253,7 @@ static int ext_setcolreg(unsigned int regno, unsigned int red,
 		return 0;
 	}
 	if (external_pmode == FB_TYPE_PACKED_PIXELS && external_depth == 8 &&
-	    external_addr >= 0xa0000000) {
+	    ext_is_supervidel()) {
 		/* SuperVidel native 8bpp chunky scans out via the Falcon
 		 * palette registers, honoring all 8 bits per channel
 		 */
@@ -3336,7 +3344,7 @@ static int __init atafb_probe(struct platform_device *pdev)
 		memset (screen_base, 0, external_len);
 
 		/* framebuffer in SV RAM: enable the SuperBlitter */
-		if (external_addr >= 0xa0000000 &&
+		if (ext_is_supervidel() &&
 		    ((external_pmode == FB_TYPE_PACKED_PIXELS &&
 		      external_depth == 8) ||
 		     (external_pmode == -1 &&
-- 
2.43.0

