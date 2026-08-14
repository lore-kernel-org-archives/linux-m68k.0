Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F445397930
	for <linux-m68k@vger.kernel.org>; Fri, 14 Aug 2026 03:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786677479; cv=none; b=h/9VatucDBE3IllmZG+M5SFPwTIT8lewpYb0OPsIUCledDiRSPejP5XYYyzNSiNf+x+CSlR9QGgTALPBehN2NoW5Y+wgR7ehdAgvbu3MGunQj3xkwrueCJYQUb2Xu+WNkAQg1eUzjUqltdq14l4VxWmbFDUWtpnp38mqKTKk0lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786677479; c=relaxed/simple;
	bh=QNmyyL1GqfrVQiXIMeRQdFao14rPCgVeW3j0oCbtQVw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r18lykmbmHuLUmi29yIxwkwCdAcrhtUC0cOHnICaE9ji+QDXP2FduhcloeyKwzA8ylw2kvHRvhHDiMQLDvI5lQ3m3IyhiX/KmagTk6GwqszlKOL5+aQoqs3pZcaW7WT17dTBYYDpRa351DBrFr3ZiTJ/v6gLaKDjuV3JgYuGbjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JRMQiT7F; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JRMQiT7F"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso468116a12.0
        for <linux-m68k@vger.kernel.org>; Thu, 13 Aug 2026 20:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786677478; x=1787282278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hhmZfEYf2i2o+O/iZ2UIpbbQaUJ3FHTsoQzHWHNjkTM=;
        b=JRMQiT7FOaYEP9cRiyEKHa9ZH66b/PcOdQA9SaogU86zjVUKpG+5h6oQEMN4Wgn5aT
         tCWHvWFLWhDQrj8wq+Phfx/2WsqUHEzpk9g1L5jjaO63LEo88GkgFkmqhtQrTy/5EJCN
         8ZlgfssEY9R4snMO8J/GsgsdyWCVL1WswlvKUX7kVqRUeK3Y2OSzAV/GqpEZPKBv9JgS
         okX4Nw61+tFQyfnhqNXU9fJlUiVJXYYvcz8wK95n7gPmfNeXTrRSfGGbbdl3s54DLYOQ
         OXkvS/9bx3fWsvAekVhrE+1RHGFXbsXludVxqbErM+APO73rcrSVlyw7hSiRVMsDvbk8
         zKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786677478; x=1787282278;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hhmZfEYf2i2o+O/iZ2UIpbbQaUJ3FHTsoQzHWHNjkTM=;
        b=haA/VzWyvxWESMBffr++M8g6sgoqZJuhIkBrdMbovWZH5uFbPhMy3wq0pRck4yFete
         5ZghZuar33QlPNuwt6Z0D0alxcHKqSJDQvi4E8khXQ/8zO1psMs//VOZkkWkQlTid7Fx
         lnd4f9dO5awDZPEWGqrHCNBZkWiKS6OIQFBYTtPKCSW09Yo9l+5x7FUHw88qA3TClZuc
         CRZu2YWTNTXg87cJpA/NxBT/MwWgRXn3qUcNqPuJCDOghQ7uAnxMRAywi5nqeN9BluvF
         jNjuv6kvhEF3HtlFPCnmPyRxO6+AyAQJ6424mES8oeJuZ4lwcl2ojQWJXvNaziZCdYQA
         a7MA==
X-Gm-Message-State: AOJu0Yx5HjdGI8BSaZS82aRprYUWPn85Sy1l2gNDIe9DbTAHmL2KzsZs
	6KQYtBxJVAFKCY/UyXjUvQcPX9GqXJsrxygvGu/h3bxjHvnIX39UOQ77xaZEGA==
X-Gm-Gg: AR+sD13p6QvsqE+4zJjEXZO+WFifNNda1r0/pab8J6alwPG104VzrRfyJo163jBPVpq
	u0eXEp7HsasoSPT7D68w0RlnBPgWz7GsNfOm2CCL/at3jk0uNTipp820UvROyEnLlsQ4vrqw5uo
	+rdrMJwtTM7Fe5U/H/thuhYXROHhQj3HweDofHNHNtBY6hHeaB3GERaID94T0kENwjd4x2Vgg24
	5TohEfsj1QYyyuhJp6z+/ZrQoj3/j5kOtyZWzgQexl7aFrhrVzWXqV/RHvmbcf01NKFo1goV4Z6
	WRmRI+4zQVtLC+37JQiNcsHxT6MCzsHKtEcvGnP1LzMdbWae+z7JBP6Ij2Re4EnyFEC2SRdJGOw
	Kzl0GjLOezpELgIztRQhuH8k2SuaqmukGTY89org0NQUQmWOViwQPeDm83dwFTCilnau4qGbMVk
	EPLNlPM2QymJbELseCf//ZTXmo7hZPymYrSUGRz1+2UvzHeV5BjEw2VD8DasckIX+kfyWIs1iMk
	v1K7AKH2Eq2cxzboW1mX2stlVRxEO5LyEknTW7RKrrc3hsbBzFMyA==
X-Received: by 2002:a05:6a21:d86:b0:3bf:a7d5:df38 with SMTP id adf61e73a8af0-3cc71b41dcbmr2969802637.9.1786677477807;
        Thu, 13 Aug 2026 20:17:57 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-152-170-159-fibre.sparkbb.co.nz. [222.152.170.159])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31f7c8018cdsm7292872eec.13.2026.08.13.20.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 20:17:57 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
	id 08AA53604D1; Fri, 14 Aug 2026 15:17:54 +1200 (NZST)
From: Michael Schmitz <schmitzmic@gmail.com>
To: linux-m68k@vger.kernel.org,
	geert@linux-m68k.org
Cc: schmitzmic@gmail.com,
	Miro Kropacek <miro.kropacek@gmail.com>,
	linux-fbdev@vger.kernel.org
Subject: [PATCH 4/5] fbdev: Add support for SuperVidel's SuperBlitter
Date: Fri, 14 Aug 2026 15:17:44 +1200
Message-Id: <20260814031745.17140-5-schmitzmic@gmail.com>
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

