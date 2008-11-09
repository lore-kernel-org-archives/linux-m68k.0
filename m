From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] fbdev: Add c2p support for Atari interleaved bitplanes
Date: Sun, 9 Nov 2008 16:38:45 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0811091635530.19341@anakin>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from edna.telenet-ops.be ([195.130.132.58]:49272 "EHLO
	edna.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755085AbYKIPis (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 9 Nov 2008 10:38:48 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Add c2p (Chunky-to-Planar) support for Atari interleaved bitplanes.
This fixes the garbled penguin logo.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
TODO:
  - Extract common code
  - Separate c2p_planar() and c2p_iplan2()
  - Optimize? (for bpp < 8, we can skip steps that just swap zeroes)

 drivers/video/amifb.c |    6 -
 drivers/video/atafb.c |   15 ---
 drivers/video/c2p.c   |  247 +++++++++++++++++++++++++++++++++++++++++---------
 drivers/video/c2p.h   |   11 +-
 4 files changed, 218 insertions(+), 61 deletions(-)

--- a/drivers/video/amifb.c
+++ b/drivers/video/amifb.c
@@ -2159,9 +2159,9 @@ static void amifb_imageblit(struct fb_in
 			src += pitch;
 		}
 	} else {
-		c2p(info->screen_base, image->data, dx, dy, width, height,
-		    par->next_line, par->next_plane, image->width,
-		    info->var.bits_per_pixel);
+		c2p_planar(info->screen_base, image->data, dx, dy, width,
+			   height, par->next_line, par->next_plane,
+			   image->width, info->var.bits_per_pixel);
 	}
 }
 
--- a/drivers/video/atafb.c
+++ b/drivers/video/atafb.c
@@ -122,7 +122,6 @@ static struct atafb_par {
 	void *screen_base;
 	int yres_virtual;
 	u_long next_line;
-	u_long next_plane;
 #if defined ATAFB_TT || defined ATAFB_STE
 	union {
 		struct {
@@ -1396,14 +1395,7 @@ set_screen_base:
 	par->screen_base = screen_base + var->yoffset * linelen;
 	par->hw.falcon.xoffset = 0;
 
-	// FIXME!!! sort of works, no crash
-	//par->next_line = linelen;
-	//par->next_plane = yres_virtual * linelen;
 	par->next_line = linelen;
-	par->next_plane = 2;
-	// crashes
-	//par->next_plane = linelen;
-	//par->next_line  = yres_virtual * linelen;
 
 	return 0;
 }
@@ -2702,10 +2694,9 @@ printk("fix->line_length = %u, cfb_image
 			src += pitch;
 		}
 	} else {
-		// only used for logo; broken
-		c2p(info->screen_base, image->data, dx, dy, width, height,
-		    par->next_line, par->next_plane, image->width,
-		    info->var.bits_per_pixel);
+		c2p_iplan2(info->screen_base, image->data, dx, dy, width,
+			   height, par->next_line, image->width,
+			   info->var.bits_per_pixel);
 	}
 }
 
--- a/drivers/video/c2p.c
+++ b/drivers/video/c2p.c
@@ -1,7 +1,7 @@
 /*
  *  Fast C2P (Chunky-to-Planar) Conversion
  *
- *  Copyright (C) 2003 Geert Uytterhoeven
+ *  Copyright (C) 2003-2008 Geert Uytterhoeven
  *
  *  NOTES:
  *    - This code was inspired by Scout's C2P tutorial
@@ -14,6 +14,7 @@
 
 #include <linux/module.h>
 #include <linux/string.h>
+
 #include "c2p.h"
 
 
@@ -54,7 +55,7 @@ static inline u32 get_mask(int n)
     return 0;
 }
 
-#define transp_nx1(d, n)				\
+#define transp8_nx1(d, n)				\
     do {						\
 	u32 mask = get_mask(n);				\
 	/* First block */				\
@@ -67,7 +68,7 @@ static inline u32 get_mask(int n)
 	_transp(d, 6, 7, n, mask);			\
     } while (0)
 
-#define transp_nx2(d, n)				\
+#define transp8_nx2(d, n)				\
     do {						\
 	u32 mask = get_mask(n);				\
 	/* First block */				\
@@ -78,40 +79,90 @@ static inline u32 get_mask(int n)
 	_transp(d, 5, 7, n, mask);			\
     } while (0)
 
-#define transp_nx4(d, n)				\
+#define transp8_nx4(d, n)				\
     do {						\
 	u32 mask = get_mask(n);				\
+	/* Single block */				\
 	_transp(d, 0, 4, n, mask);			\
 	_transp(d, 1, 5, n, mask);			\
 	_transp(d, 2, 6, n, mask);			\
 	_transp(d, 3, 7, n, mask);			\
     } while (0)
 
-#define transp(d, n, m)	transp_nx ## m(d, n)
+#define transp8(d, n, m)	transp8_nx ## m(d, n)
+
+
+#define transp4_nx1(d, n)				\
+    do {						\
+	u32 mask = get_mask(n);				\
+	/* First block */				\
+	_transp(d, 0, 1, n, mask);			\
+	/* Second block */				\
+	_transp(d, 2, 3, n, mask);			\
+    } while (0)
+
+#define transp4_nx2(d, n)				\
+    do {						\
+	u32 mask = get_mask(n);				\
+	/* Single block */				\
+	_transp(d, 0, 2, n, mask);			\
+	_transp(d, 1, 3, n, mask);			\
+    } while (0)
+
+#define transp4(d, n, m)	transp4_nx ## m(d, n)
+
+
+#define transp4x_nx2(d, n)				\
+    do {						\
+	u32 mask = get_mask(n);				\
+	/* Single block */				\
+	_transp(d, 2, 0, n, mask);			\
+	_transp(d, 3, 1, n, mask);			\
+    } while (0)
+
+#define transp4x(d, n, m)	transp4x_nx ## m(d, n)
 
 
     /*
      *  Perform a full C2P step on 32 8-bit pixels, stored in 8 32-bit words
      *  containing
      *    - 32 8-bit chunky pixels on input
-     *    - permuted planar data on output
+     *    - permutated planar data (1 plane per 32-bit word) on output
      */
 
-static void c2p_8bpp(u32 d[8])
+static void c2p_32x8(u32 d[8])
 {
-    transp(d, 16, 4);
-    transp(d, 8, 2);
-    transp(d, 4, 1);
-    transp(d, 2, 4);
-    transp(d, 1, 2);
+    transp8(d, 16, 4);
+    transp8(d, 8, 2);
+    transp8(d, 4, 1);
+    transp8(d, 2, 4);
+    transp8(d, 1, 2);
 }
 
 
     /*
-     *  Array containing the permution indices of the planar data after c2p
+     *  Perform a full C2P step on 16 8-bit pixels, stored in 4 32-bit words
+     *  containing
+     *    - 16 8-bit chunky pixels on input
+     *    - permutated planar data (2 planes per 32-bit word) on output
      */
 
-static const int perm_c2p_8bpp[8] = { 7, 5, 3, 1, 6, 4, 2, 0 };
+static void c2p_16x8(u32 d[4])
+{
+    transp4(d, 8, 2);
+    transp4(d, 1, 2);
+    transp4x(d, 16, 2);
+    transp4x(d, 2, 2);
+    transp4(d, 4, 1);
+}
+
+
+    /*
+     *  Array containing the permutation indices of the planar data after c2p
+     */
+
+static const int perm_c2p_32x8[8] = { 7, 5, 3, 1, 6, 4, 2, 0 };
+static const int perm_c2p_16x8[4] = { 1, 3, 0, 2 };
 
 
     /*
@@ -130,12 +181,12 @@ static inline unsigned long comp(unsigne
      *  Store a full block of planar data after c2p conversion
      */
 
-static inline void store_planar(char *dst, u32 dst_inc, u32 bpp, u32 d[8])
+static inline void store_planar(void *dst, u32 dst_inc, u32 bpp, u32 d[8])
 {
     int i;
 
     for (i = 0; i < bpp; i++, dst += dst_inc)
-	*(u32 *)dst = d[perm_c2p_8bpp[i]];
+	*(u32 *)dst = d[perm_c2p_32x8[i]];
 }
 
 
@@ -143,18 +194,44 @@ static inline void store_planar(char *ds
      *  Store a partial block of planar data after c2p conversion
      */
 
-static inline void store_planar_masked(char *dst, u32 dst_inc, u32 bpp,
+static inline void store_planar_masked(void *dst, u32 dst_inc, u32 bpp,
 				       u32 d[8], u32 mask)
 {
     int i;
 
     for (i = 0; i < bpp; i++, dst += dst_inc)
-	*(u32 *)dst = comp(d[perm_c2p_8bpp[i]], *(u32 *)dst, mask);
+	*(u32 *)dst = comp(d[perm_c2p_32x8[i]], *(u32 *)dst, mask);
+}
+
+
+    /*
+     *  Store a full block of iplan2 data after c2p conversion
+     */
+
+static inline void store_iplan2(void *dst, u32 bpp, u32 d[4])
+{
+    int i;
+
+    for (i = 0; i < bpp/2; i++, dst += 4)
+	*(u32 *)dst = d[perm_c2p_16x8[i]];
 }
 
 
     /*
-     *  c2p - Copy 8-bit chunky image data to a planar frame buffer
+     *  Store a partial block of iplan2 data after c2p conversion
+     */
+
+static inline void store_iplan2_masked(void *dst, u32 bpp, u32 d[4], u32 mask)
+{
+    int i;
+
+    for (i = 0; i < bpp/2; i++, dst += 4)
+	*(u32 *)dst = comp(d[perm_c2p_16x8[i]], *(u32 *)dst, mask);
+}
+
+
+    /*
+     *  c2p_planar - Copy 8-bit chunky image data to a planar frame buffer
      *  @dst: Starting address of the planar frame buffer
      *  @dx: Horizontal destination offset (in pixels)
      *  @dy: Vertical destination offset (in pixels)
@@ -166,18 +243,22 @@ static inline void store_planar_masked(c
      *  @bpp: Bits per pixel of the planar frame buffer (1-8)
      */
 
-void c2p(u8 *dst, const u8 *src, u32 dx, u32 dy, u32 width, u32 height,
-	 u32 dst_nextline, u32 dst_nextplane, u32 src_nextline, u32 bpp)
+void c2p_planar(void *dst, const void *src, u32 dx, u32 dy, u32 width,
+		u32 height, u32 dst_nextline, u32 dst_nextplane,
+		u32 src_nextline, u32 bpp)
 {
-    int dst_idx;
-    u32 d[8], first, last, w;
+    union {
+	u8 pixels[32];
+	u32 words[8];
+    } d;
+    u32 dst_idx, first, last, w;
     const u8 *c;
-    u8 *p;
+    void *p;
 
     dst += dy*dst_nextline+(dx & ~31);
     dst_idx = dx % 32;
-    first = ~0UL >> dst_idx;
-    last = ~(~0UL >> ((dst_idx+width) % 32));
+    first = 0xffffffffU >> dst_idx;
+    last = ~(0xffffffffU >> ((dst_idx+width) % 32));
     while (height--) {
 	c = src;
 	p = dst;
@@ -185,11 +266,11 @@ void c2p(u8 *dst, const u8 *src, u32 dx,
 	if (dst_idx+width <= 32) {
 	    /* Single destination word */
 	    first &= last;
-	    memset(d, 0, sizeof(d));
-	    memcpy((u8 *)d+dst_idx, c, width);
+	    memset(d.pixels, 0, sizeof(d));
+	    memcpy(d.pixels+dst_idx, c, width);
 	    c += width;
-	    c2p_8bpp(d);
-	    store_planar_masked(p, dst_nextplane, bpp, d, first);
+	    c2p_32x8(d.words);
+	    store_planar_masked(p, dst_nextplane, bpp, d.words, first);
 	    p += 4;
 	} else {
 	    /* Multiple destination words */
@@ -197,36 +278,118 @@ void c2p(u8 *dst, const u8 *src, u32 dx,
 	    /* Leading bits */
 	    if (dst_idx) {
 		w = 32 - dst_idx;
-		memset(d, 0, dst_idx);
-		memcpy((u8 *)d+dst_idx, c, w);
+		memset(d.pixels, 0, dst_idx);
+		memcpy(d.pixels+dst_idx, c, w);
 		c += w;
-		c2p_8bpp(d);
-		store_planar_masked(p, dst_nextplane, bpp, d, first);
+		c2p_32x8(d.words);
+		store_planar_masked(p, dst_nextplane, bpp, d.words, first);
 		p += 4;
 		w = width-w;
 	    }
 	    /* Main chunk */
 	    while (w >= 32) {
-		memcpy(d, c, 32);
+		memcpy(d.pixels, c, 32);
 		c += 32;
-		c2p_8bpp(d);
-		store_planar(p, dst_nextplane, bpp, d);
+		c2p_32x8(d.words);
+		store_planar(p, dst_nextplane, bpp, d.words);
 		p += 4;
 		w -= 32;
 	    }
 	    /* Trailing bits */
 	    w %= 32;
 	    if (w > 0) {
-		memcpy(d, c, w);
-		memset((u8 *)d+w, 0, 32-w);
-		c2p_8bpp(d);
-		store_planar_masked(p, dst_nextplane, bpp, d, last);
+		memcpy(d.pixels, c, w);
+		memset(d.pixels+w, 0, 32-w);
+		c2p_32x8(d.words);
+		store_planar_masked(p, dst_nextplane, bpp, d.words, last);
+	    }
+	}
+	src += src_nextline;
+	dst += dst_nextline;
+    }
+}
+EXPORT_SYMBOL_GPL(c2p_planar);
+
+
+    /*
+     *  c2p_iplan2 - Copy 8-bit chunky image data to an interleaved planar
+     *  frame buffer with 2 bytes of interleave
+     *  @dst: Starting address of the planar frame buffer
+     *  @dx: Horizontal destination offset (in pixels)
+     *  @dy: Vertical destination offset (in pixels)
+     *  @width: Image width (in pixels)
+     *  @height: Image height (in pixels)
+     *  @dst_nextline: Frame buffer offset to the next line (in bytes)
+     *  @src_nextline: Image offset to the next line (in bytes)
+     *  @bpp: Bits per pixel of the planar frame buffer (2, 4, or 8)
+     */
+
+void c2p_iplan2(void *dst, const void *src, u32 dx, u32 dy, u32 width,
+		u32 height, u32 dst_nextline, u32 src_nextline, u32 bpp)
+{
+    union {
+	u8 pixels[16];
+	u32 words[4];
+    } d;
+    u32 dst_idx, first, last, w;
+    const u8 *c;
+    void *p;
+
+    dst += dy*dst_nextline+(dx & ~15)*bpp;
+    dst_idx = dx % 16;
+    first = 0xffffU >> dst_idx;
+    first |= first << 16;
+    last = 0xffffU ^ (0xffffU >> ((dst_idx+width) % 16));
+    last |= last << 16;
+    while (height--) {
+	c = src;
+	p = dst;
+	w = width;
+	if (dst_idx+width <= 16) {
+	    /* Single destination word */
+	    first &= last;
+	    memset(d.pixels, 0, sizeof(d));
+	    memcpy(d.pixels+dst_idx, c, width);
+	    c += width;
+	    c2p_16x8(d.words);
+	    store_iplan2_masked(p, bpp, d.words, first);
+	    p += bpp*2;
+	} else {
+	    /* Multiple destination words */
+	    w = width;
+	    /* Leading bits */
+	    if (dst_idx) {
+		w = 16 - dst_idx;
+		memset(d.pixels, 0, dst_idx);
+		memcpy(d.pixels+dst_idx, c, w);
+		c += w;
+		c2p_16x8(d.words);
+		store_iplan2_masked(p, bpp, d.words, first);
+		p += bpp*2;
+		w = width-w;
+	    }
+	    /* Main chunk */
+	    while (w >= 16) {
+		memcpy(d.pixels, c, 16);
+		c += 16;
+		c2p_16x8(d.words);
+		store_iplan2(p, bpp, d.words);
+		p += bpp*2;
+		w -= 16;
+	    }
+	    /* Trailing bits */
+	    w %= 16;
+	    if (w > 0) {
+		memcpy(d.pixels, c, w);
+		memset(d.pixels+w, 0, 16-w);
+		c2p_16x8(d.words);
+		store_iplan2_masked(p, bpp, d.words, last);
 	    }
 	}
 	src += src_nextline;
 	dst += dst_nextline;
     }
 }
-EXPORT_SYMBOL_GPL(c2p);
+EXPORT_SYMBOL_GPL(c2p_iplan2);
 
 MODULE_LICENSE("GPL");
--- a/drivers/video/c2p.h
+++ b/drivers/video/c2p.h
@@ -1,7 +1,7 @@
 /*
  *  Fast C2P (Chunky-to-Planar) Conversion
  *
- *  Copyright (C) 2003 Geert Uytterhoeven
+ *  Copyright (C) 2003-2008 Geert Uytterhoeven
  *
  *  This file is subject to the terms and conditions of the GNU General Public
  *  License. See the file COPYING in the main directory of this archive
@@ -10,7 +10,10 @@
 
 #include <linux/types.h>
 
-extern void c2p(u8 *dst, const u8 *src, u32 dx, u32 dy, u32 width, u32 height,
-		u32 dst_nextline, u32 dst_nextplane, u32 src_nextline,
-		u32 bpp);
+extern void c2p_planar(void *dst, const void *src, u32 dx, u32 dy, u32 width,
+		       u32 height, u32 dst_nextline, u32 dst_nextplane,
+		       u32 src_nextline, u32 bpp);
 
+extern void c2p_iplan2(void *dst, const void *src, u32 dx, u32 dy, u32 width,
+		       u32 height, u32 dst_nextline, u32 src_nextline,
+		       u32 bpp);

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
