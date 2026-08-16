Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A103D522C
	for <linux-m68k@vger.kernel.org>; Sun, 16 Aug 2026 07:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786865886; cv=none; b=It6Y9gAAUA9veCUy/VhcIEha2fVoOUotgdboqFcdbQD0U8oR7LLJZwHfPvJ0FPd36M60zuK570aWJC+9k6cqhFKyv1+OpLZnSk8zfl1AhcAxYGpTxBuomeHiDpIt6J9uNWxmHNHu1t8lr9YZF6mK+Mk5dxRDtentTb+T5gv8l1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786865886; c=relaxed/simple;
	bh=eeWVDwEacRSJnz7aoqjRiOchVpKPLLINO8827HPeYyI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YnO4ov99SIfFOUOuV1Eyi/pm06uF7VvWbGggf5cJHZtnGDJLs5gPDQlKbuSlAzcedzl34ecMuMWBcp16jMAuCW64ff+yJpgLf97En/k2+VcPgmAhRsSb3Cx9/LYbUDYBkQB3XMrVrqh0ickGoh3t7OdyA5S+1EyEMA2UaDHnOKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mTSRSwo4; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mTSRSwo4"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2caced6038eso26777135ad.0
        for <linux-m68k@vger.kernel.org>; Sun, 16 Aug 2026 00:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786865884; x=1787470684; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RQI3AyX99exIaNSvIi7NmGMw2tFAjvIHhhh2QgMhw7g=;
        b=mTSRSwo42XnCWdCi0IA9E0RXIxUZ7IO9rsX48emeq/CjviDQT+fcXF7oM5oc4RXfCy
         oO++VXFrwbyoKnJx9ZBeocReCfF0TkYyDmK+FjbN0N44078FMW6zNRV2uHt7Q8F2IrU6
         clkT3/XMJsQIUkifV7UK2qj0jFod1I8HzScwCqeLbxA6sd+dYQeaq+Bqt6jl+Xtw5fLO
         QlnGxzY0ngNTUGUOzDH7xf0atH+forx9qqQIkQyRqZC78blchpFPAuLxHJM4lJTn+rwO
         GHipLO2F5UVB2OI2ocVsO1uGR2xoUv6StXu2k8iy1jX7Nb+gZD097pcgzmU6W2YryZhg
         h/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786865884; x=1787470684;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RQI3AyX99exIaNSvIi7NmGMw2tFAjvIHhhh2QgMhw7g=;
        b=fMMC4MaJsq50Sst1FiZ1GMiHVS1tdhfHl0K7o/O78o+oPkInx3QbcmFy49bIGK9MxT
         S6ZujmmAM+lKgH+FL+9Ge6K7AGDgbnrGnaZeI458b1HIV1KndB7cT5rYPhyWROU9/6fl
         dCo9w+m5YuDqZgaI5deolKZjSGRge1lYcfHFSJHOuTljPfAScPg3EbK7zvAt0IhXr7A9
         vvcVmiU0avV/rLP7gNEsFuVSGiLy/l0v1SI9UwpGpGN2m9YdNAnFJfo6gHVeI70J/sov
         RpRbAfMTgi+rKX4PG4UtHgF5nzSBasNsIK0N3F7B7CJRiEhZ9u2AsliNaOnHoMl3Qwa2
         yMLA==
X-Gm-Message-State: AOJu0YzjQdcs9F1CgsxHf4iBZh84eFJTko0cYFQ1F9L5bre8nOowU/Au
	YchwPwXC5YHwd+jGeeghdYjrEpgxxQ0iqWYj7XugJtzXw6nWegwnkkeT
X-Gm-Gg: AR+sD13LcOj7FZeKy9g7+XsRBK/85f+ZhpWOSmRKIizJD/IHqRZ6hL+m1EJFY+CEN07
	EeWrSymD/1+DqyTKTEOdl1/MAua8GQBqaSlWAmuXCiRZLEQtvq0QcYUkfMCMqvRwslN2LrI9X0U
	a3a8w6sgFZf26Uz24ubik5d84VDnudsnNBoyoGjpCE0D1+MO6ZOEZgi4dJWuciaIFLOYiOK04ow
	FW562NpxQVClU9j3Pu4/sR+jXgGFVlDuofKunhHSwC5ocCKPVsBYyBu6FmZEnyAlDnBm/SI40bz
	k2VVIZRFiQykPYo8llOqur5W22Qgx2HO50AbUfHe2XH7/Rri/N0XOZUHX+LkNY19zP1V6aVeliQ
	0RDz+InYF7jmQnDR/cLytQsgOw3BjMbTDZuryeGFOtREHpwsGkojQH4celIHm9iv0c69vIeFHQP
	KgEwnmIOYUT4cWLadranOifoMIC89FkQ02osZpZeFW9b3gzT80LLz9wJG3U/M7QgI5WG9UqWxTO
	A/7fSd5lhxW0g98PjobseHGnmFjS4cCb3L/npgVm8TPge0gVbnBAg==
X-Received: by 2002:a17:902:f68a:b0:2cc:fa13:dcab with SMTP id d9443c01a7336-2d3afe6fe0dmr131629665ad.8.1786865884435;
        Sun, 16 Aug 2026 00:38:04 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-152-170-159-fibre.sparkbb.co.nz. [222.152.170.159])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d563165e19sm5381745ad.42.2026.08.16.00.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 00:38:04 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
	id C2DFE3604D1; Sun, 16 Aug 2026 19:37:58 +1200 (NZST)
From: Michael Schmitz <schmitzmic@gmail.com>
To: linux-m68k@vger.kernel.org,
	geert@linux-m68k.org
Cc: schmitzmic@gmail.com,
	Miro Kropacek <miro.kropacek@gmail.com>,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v2 4/5] fbdev: Add support for SuperVidel's SuperBlitter
Date: Sun, 16 Aug 2026 19:37:51 +1200
Message-Id: <20260816073752.16656-5-schmitzmic@gmail.com>
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

The SuperVidel graphics FPGA includes a hardware blitter (bit block
transfer engine) operating within the SuperVidel DDR2 video RAM.

Two versions of this blitter exist. Later versions (>= 9) of the
SuperVidel firmware support an asynchronous command FIFO, older
versions must be polled for command completion.

Add hardware-accelerated copyarea, fillrect and imageblit fb
operations (falling back to the non-accelerated versions for
anything that exceeds blitter capabilities).

Signed-off-by: Miro Kropacek <miro.kropacek@gmail.com>
Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
Cc: <linux-fbdev@vger.kernel.org>
Link: https://lists.debian.org/debian-68k/2026/08/msg00000.html
---
 drivers/video/fbdev/atafb.c | 197 ++++++++++++++++++++++++++++++++++++
 1 file changed, 197 insertions(+)

diff --git a/drivers/video/fbdev/atafb.c b/drivers/video/fbdev/atafb.c
index 50853d7a08e3..dc2d4154e1b6 100644
--- a/drivers/video/fbdev/atafb.c
+++ b/drivers/video/fbdev/atafb.c
@@ -2304,6 +2304,185 @@ static int ext_detect(void)
 	return 1;
 }
 
+/* ------------------- SuperVidel SuperBlitter ---------------------- */
+
+/*
+ * Hardware blitter in the SuperVidel FPGA, operating within SV DDR2 RAM.
+ * FW revision >= 9 provides a command FIFO (async operation); older
+ * revisions are programmed directly with busy-polling.
+ */
+#define SVBLIT_REGS_PHYS	0x80010000
+#define SVBLIT_SRC1		0x58	/* bits 26:0 */
+#define SVBLIT_SRC2		0x5c
+#define SVBLIT_DST		0x60
+#define SVBLIT_COUNT		0x64	/* bytes per line - 1 */
+#define SVBLIT_SRC1_OFFSET	0x68	/* line start to next line start */
+#define SVBLIT_SRC2_OFFSET	0x6c
+#define SVBLIT_DST_OFFSET	0x70
+#define SVBLIT_MASK_AND_LINES	0x74	/* bits 11:0: number of lines */
+#define SVBLIT_CONTROL		0x78	/* bit 0: busy/start, bits 4:1: mode */
+#define SVBLIT_VERSION		0x7c	/* bits 9:0: FW revision */
+#define SVBLIT_FIFO		0x80	/* wr: data; rd: bit 0 empty, bit 1 full */
+
+/*
+ * SuperBlitter bug: Instead of declared 2048 bytes, 2032 is the real maximum.
+ */
+#define SVBLIT_MAX_SPAN	2032
+
+static void __iomem *svblit_regs;
+static int svblit_fw;
+
+static inline u32 svblit_rd(unsigned int reg)
+{
+	return __raw_readl(svblit_regs + reg);
+}
+
+static inline void svblit_wr(unsigned int reg, u32 val)
+{
+	__raw_writel(val, svblit_regs + reg);
+}
+
+/* wait until all queued blits have finished */
+static void svblit_wait(void)
+{
+	if (svblit_fw >= 9)
+		/* FIFO empty flag = fewer than 9 longwords queued */
+		while (!(svblit_rd(SVBLIT_FIFO) & 1))
+			cpu_relax();
+	while (svblit_rd(SVBLIT_CONTROL) & 1)
+		cpu_relax();
+}
+
+/*
+ * FW >= 9 queues commands through the 512-longword FIFO: a command is
+ * 9 longwords (registers 0x58..0x78 in order), executed whenever >= 9
+ * words are queued and the blitter is idle. The full flag rises at
+ * >= 500 queued words, so below it there is always room for a whole
+ * command — one flag check per command prevents overflow (dropped
+ * words would desync the 9-word framing until an SV reinit, which is
+ * exactly what overflowing did before this guard existed). Older FW
+ * is programmed directly with busy-polling.
+ *
+ * The line byte count field is 11 bits but see SVBLIT_MAX_SPAN.
+ */
+static void svblit_copy(u32 src, u32 dst, u32 nbytes, u32 src_offset,
+			u32 dst_offset, u32 lines)
+{
+	while (nbytes) {
+		u32 chunk = min(nbytes, SVBLIT_MAX_SPAN);
+
+		if (svblit_fw >= 9) {
+			while (svblit_rd(SVBLIT_FIFO) & 2)
+				cpu_relax();
+			svblit_wr(SVBLIT_FIFO, src);
+			svblit_wr(SVBLIT_FIFO, 0);
+			svblit_wr(SVBLIT_FIFO, dst);
+			svblit_wr(SVBLIT_FIFO, chunk - 1);
+			svblit_wr(SVBLIT_FIFO, src_offset);
+			svblit_wr(SVBLIT_FIFO, 0);
+			svblit_wr(SVBLIT_FIFO, dst_offset);
+			svblit_wr(SVBLIT_FIFO, lines);
+			svblit_wr(SVBLIT_FIFO, 0x01);
+		} else {
+			while (svblit_rd(SVBLIT_CONTROL) & 1)
+				cpu_relax();
+			svblit_wr(SVBLIT_SRC1, src);
+			svblit_wr(SVBLIT_SRC2, 0);
+			svblit_wr(SVBLIT_DST, dst);
+			svblit_wr(SVBLIT_COUNT, chunk - 1);
+			svblit_wr(SVBLIT_SRC1_OFFSET, src_offset);
+			svblit_wr(SVBLIT_SRC2_OFFSET, 0);
+			svblit_wr(SVBLIT_DST_OFFSET, dst_offset);
+			svblit_wr(SVBLIT_MASK_AND_LINES, lines);
+			svblit_wr(SVBLIT_CONTROL, 0x01);
+		}
+
+		src += chunk;
+		dst += chunk;
+		nbytes -= chunk;
+	}
+}
+
+static int svblit_sync(struct fb_info *info)
+{
+	svblit_wait();
+	return 0;
+}
+
+static void svblit_copyarea(struct fb_info *info,
+			    const struct fb_copyarea *area)
+{
+	u32 bytespp = info->var.bits_per_pixel / 8;
+	u32 pitch = info->fix.line_length;
+
+	/*
+	 * The blitter walks lines in ascending order, so overlapping
+	 * moves down/right would read already overwritten data. Those
+	 * are rare for fbcon (scrolling backwards); leave them and
+	 * oversized areas to the CPU.
+	 */
+	if (area->height > 4095 ||
+	    area->dy > area->sy ||
+	    (area->dy == area->sy && area->dx > area->sx)) {
+		svblit_wait();
+		cfb_copyarea(info, area);
+		return;
+	}
+
+	svblit_copy(external_addr + area->sy * pitch + area->sx * bytespp,
+		    external_addr + area->dy * pitch + area->dx * bytespp,
+		    area->width * bytespp, pitch, pitch, area->height);
+	/* async: every CPU access to the fb goes through svblit_wait() */
+}
+
+static void svblit_fillrect(struct fb_info *info,
+			    const struct fb_fillrect *rect)
+{
+	u32 bytespp = info->var.bits_per_pixel / 8;
+	u32 pitch = info->fix.line_length;
+	u8 *line;
+	u32 pix;
+
+	svblit_wait();		/* the CPU is about to touch the fb */
+
+	if (rect->rop != ROP_COPY || rect->height <= 1 ||
+	    rect->height > 4096) {
+		cfb_fillrect(info, rect);
+		return;
+	}
+
+	pix = (info->fix.visual == FB_VISUAL_TRUECOLOR) ?
+		((u32 *)info->pseudo_palette)[rect->color] : rect->color;
+
+	/* draw the first line with the CPU ... */
+	line = (u8 *)info->screen_base + rect->dy * pitch +
+	       rect->dx * bytespp;
+	switch (bytespp) {
+	case 1:
+		memset(line, pix, rect->width);
+		break;
+	case 2:
+		memset16((u16 *)line, pix, rect->width);
+		break;
+	default:
+		memset32((u32 *)line, pix, rect->width);
+		break;
+	}
+
+	/* ... and let the blitter replicate it into the other lines */
+	svblit_copy(external_addr + rect->dy * pitch + rect->dx * bytespp,
+		    external_addr + (rect->dy + 1) * pitch +
+		    rect->dx * bytespp,
+		    rect->width * bytespp, 0, pitch, rect->height - 1);
+}
+
+static void svblit_imageblit(struct fb_info *info,
+			     const struct fb_image *image)
+{
+	svblit_wait();		/* CPU rendering must not race queued blits */
+	cfb_imageblit(info, image);
+}
+
 #endif /* ATAFB_EXT */
 
 /* ------ This is the same for most hardware types -------- */
@@ -3168,6 +3347,24 @@ static int __init atafb_probe(struct platform_device *pdev)
 		phys_screen_base = external_addr;
 		screen_len = external_len & PAGE_MASK;
 		memset (screen_base, 0, external_len);
+
+		/* framebuffer in SV RAM: enable the SuperBlitter */
+		if (external_addr >= 0xa0000000) {
+			svblit_regs = ioremap(SVBLIT_REGS_PHYS, 0x100);
+			if (svblit_regs) {
+				svblit_fw = svblit_rd(SVBLIT_VERSION) & 0x1ff;
+				atafb_ops.fb_fillrect = svblit_fillrect;
+				atafb_ops.fb_copyarea = svblit_copyarea;
+				atafb_ops.fb_imageblit = svblit_imageblit;
+				atafb_ops.fb_sync = svblit_sync;
+				fb_info.flags |= FBINFO_HWACCEL_COPYAREA |
+						 FBINFO_HWACCEL_FILLRECT;
+				dev_info(&pdev->dev,
+					 "SuperBlitter enabled, FW revision %d (%s)\n",
+					 svblit_fw, svblit_fw >= 9 ?
+					 "async FIFO" : "sync");
+			}
+		}
 	}
 #endif /* ATAFB_EXT */
 
-- 
2.17.1

