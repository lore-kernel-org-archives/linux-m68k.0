From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v3 2/4] m68k/atari - atafb: convert allocation of fb ram to new interface
Date: Mon, 31 Mar 2014 21:06:06 +1300
Message-ID: <1396253168-25601-3-git-send-email-schmitz@debian.org>
References: <1396253168-25601-1-git-send-email-schmitz@debian.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f51.google.com ([209.85.160.51]:45289 "EHLO
	mail-pb0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753005AbaCaIG1 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 31 Mar 2014 04:06:27 -0400
Received: by mail-pb0-f51.google.com with SMTP id uo5so7885147pbc.10
        for <linux-m68k@vger.kernel.org>; Mon, 31 Mar 2014 01:06:27 -0700 (PDT)
In-Reply-To: <1396253168-25601-1-git-send-email-schmitz@debian.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org, debian-68k@lists.debian.org, Michael Schmitz <schmitz@debian.org>

The new atari_stram_alloc interface returns kernel virtual addresses
even if the kernel runs in FastRAM. These addresses are not
guaranteed to be identical with the physical addresses. Since ST-RAM
mappings have not been set up by mem_init, virt_to_phys() and its
cousin do not work and the atari_stram_to_phys() etc. helpers must
be used to determine physical addresses.

fb.fix->smem_start needs physical addresses, fb.par->screen_base
needs virtual addresses. Take care of the virt-to-phys conversion
both on fb init and par changes.

Signed-off-by: Michael Schmitz <schmitz@debian.org>
---
 drivers/video/atafb.c |   49 ++++++++++++++++++++++++++-----------------------
 1 files changed, 26 insertions(+), 23 deletions(-)

diff --git a/drivers/video/atafb.c b/drivers/video/atafb.c
index e21d1f5..bde9c31 100644
--- a/drivers/video/atafb.c
+++ b/drivers/video/atafb.c
@@ -191,7 +191,7 @@ static struct fb_info fb_info = {
 };
 
 static void *screen_base;	/* base address of screen */
-static void *real_screen_base;	/* (only for Overscan) */
+static unsigned long phys_screen_base;	/* (only for Overscan) */
 
 static int screen_len;
 
@@ -213,7 +213,8 @@ static unsigned int external_yres;
  */
 static unsigned int external_depth;
 static int external_pmode;
-static void *external_addr;
+static void *external_screen_base;
+static unsigned long external_addr;
 static unsigned long external_len;
 static unsigned long external_vgaiobase;
 static unsigned int external_bitspercol = 6;
@@ -592,7 +593,7 @@ static int tt_encode_fix(struct fb_fix_screeninfo *fix, struct atafb_par *par)
 	int mode;
 
 	strcpy(fix->id, "Atari Builtin");
-	fix->smem_start = (unsigned long)real_screen_base;
+	fix->smem_start = phys_screen_base;
 	fix->smem_len = screen_len;
 	fix->type = FB_TYPE_INTERLEAVED_PLANES;
 	fix->type_aux = 2;
@@ -790,7 +791,7 @@ static void tt_get_par(struct atafb_par *par)
 	addr = ((shifter.bas_hi & 0xff) << 16) |
 	       ((shifter.bas_md & 0xff) << 8)  |
 	       ((shifter.bas_lo & 0xff));
-	par->screen_base = phys_to_virt(addr);
+	par->screen_base = atari_stram_to_virt(addr);
 }
 
 static void tt_set_par(struct atafb_par *par)
@@ -888,7 +889,7 @@ static int falcon_encode_fix(struct fb_fix_screeninfo *fix,
 			     struct atafb_par *par)
 {
 	strcpy(fix->id, "Atari Builtin");
-	fix->smem_start = (unsigned long)real_screen_base;
+	fix->smem_start = phys_screen_base;
 	fix->smem_len = screen_len;
 	fix->type = FB_TYPE_INTERLEAVED_PLANES;
 	fix->type_aux = 2;
@@ -1584,7 +1585,7 @@ static void falcon_get_par(struct atafb_par *par)
 	addr = (shifter.bas_hi & 0xff) << 16 |
 	       (shifter.bas_md & 0xff) << 8  |
 	       (shifter.bas_lo & 0xff);
-	par->screen_base = phys_to_virt(addr);
+	par->screen_base = atari_stram_to_virt(addr);
 
 	/* derived parameters */
 	hw->ste_mode = (hw->f_shift & 0x510) == 0 && hw->st_shift == 0x100;
@@ -1814,7 +1815,7 @@ static int stste_encode_fix(struct fb_fix_screeninfo *fix,
 	int mode;
 
 	strcpy(fix->id, "Atari Builtin");
-	fix->smem_start = (unsigned long)real_screen_base;
+	fix->smem_start = phys_screen_base;
 	fix->smem_len = screen_len;
 	fix->type = FB_TYPE_INTERLEAVED_PLANES;
 	fix->type_aux = 2;
@@ -1980,7 +1981,7 @@ static void stste_get_par(struct atafb_par *par)
 	       ((shifter.bas_md & 0xff) << 8);
 	if (ATARIHW_PRESENT(EXTD_SHIFTER))
 		addr |= (shifter.bas_lo & 0xff);
-	par->screen_base = phys_to_virt(addr);
+	par->screen_base = atari_stram_to_virt(addr);
 }
 
 static void stste_set_par(struct atafb_par *par)
@@ -2039,7 +2040,7 @@ static int stste_detect(void)
 static void stste_set_screen_base(void *s_base)
 {
 	unsigned long addr;
-	addr = virt_to_phys(s_base);
+	addr = atari_stram_to_phys(s_base);
 	/* Setup Screen Memory */
 	shifter.bas_hi = (unsigned char)((addr & 0xff0000) >> 16);
 	shifter.bas_md = (unsigned char)((addr & 0x00ff00) >> 8);
@@ -2113,7 +2114,7 @@ static void st_ovsc_switch(void)
 static int ext_encode_fix(struct fb_fix_screeninfo *fix, struct atafb_par *par)
 {
 	strcpy(fix->id, "Unknown Extern");
-	fix->smem_start = (unsigned long)external_addr;
+	fix->smem_start = external_addr;
 	fix->smem_len = PAGE_ALIGN(external_len);
 	if (external_depth == 1) {
 		fix->type = FB_TYPE_PACKED_PIXELS;
@@ -2213,7 +2214,7 @@ static int ext_encode_var(struct fb_var_screeninfo *var, struct atafb_par *par)
 
 static void ext_get_par(struct atafb_par *par)
 {
-	par->screen_base = external_addr;
+	par->screen_base =external_screen_base;
 }
 
 static void ext_set_par(struct atafb_par *par)
@@ -2286,7 +2287,7 @@ static void set_screen_base(void *s_base)
 {
 	unsigned long addr;
 
-	addr = virt_to_phys(s_base);
+	addr = atari_stram_to_phys(s_base);
 	/* Setup Screen Memory */
 	shifter.bas_hi = (unsigned char)((addr & 0xff0000) >> 16);
 	shifter.bas_md = (unsigned char)((addr & 0x00ff00) >> 8);
@@ -2433,7 +2434,9 @@ static void atafb_set_disp(struct fb_info *info)
 	atafb_get_var(&info->var, info);
 	atafb_get_fix(&info->fix, info);
 
-	info->screen_base = (void *)info->fix.smem_start;
+	/* Note: smem_start derives from phys_screen_base, not screen_base! */
+	info->screen_base = (external_addr ? external_screen_base :
+				atari_stram_to_virt(info->fix.smem_start));
 }
 
 static int atafb_setcolreg(u_int regno, u_int red, u_int green, u_int blue,
@@ -2904,7 +2907,7 @@ static void __init atafb_setup_ext(char *spec)
 	external_yres = yres;
 	external_depth = depth;
 	external_pmode = planes;
-	external_addr = (void *)addr;
+	external_addr = addr;
 	external_len = len;
 
 	if (external_card_type == IS_MV300) {
@@ -3166,30 +3169,30 @@ int __init atafb_init(void)
 		memset(screen_base, 0, mem_req);
 		pad = -(unsigned long)screen_base & (PAGE_SIZE - 1);
 		screen_base += pad;
-		real_screen_base = screen_base + ovsc_offset;
+		phys_screen_base = atari_stram_to_phys(screen_base + ovsc_offset);
 		screen_len = (mem_req - pad - ovsc_offset) & PAGE_MASK;
 		st_ovsc_switch();
 		if (CPU_IS_040_OR_060) {
 			/* On a '040+, the cache mode of video RAM must be set to
 			 * write-through also for internal video hardware! */
-			cache_push(virt_to_phys(screen_base), screen_len);
+			cache_push(atari_stram_to_phys(screen_base), screen_len);
 			kernel_set_cachemode(screen_base, screen_len,
 					     IOMAP_WRITETHROUGH);
 		}
-		printk("atafb: screen_base %p real_screen_base %p screen_len %d\n",
-			screen_base, real_screen_base, screen_len);
+		printk("atafb: screen_base %p phys_screen_base %lx screen_len %d\n",
+			screen_base, phys_screen_base, screen_len);
 #ifdef ATAFB_EXT
 	} else {
 		/* Map the video memory (physical address given) to somewhere
 		 * in the kernel address space.
 		 */
-		external_addr = ioremap_writethrough((unsigned long)external_addr,
+		external_screen_base = ioremap_writethrough((unsigned long)external_addr,
 						     external_len);
 		if (external_vgaiobase)
 			external_vgaiobase =
 			  (unsigned long)ioremap(external_vgaiobase, 0x10000);
-		screen_base =
-		real_screen_base = external_addr;
+		screen_base = external_screen_base;
+		phys_screen_base = external_addr;
 		screen_len = external_len & PAGE_MASK;
 		memset (screen_base, 0, external_len);
 	}
@@ -3235,8 +3238,8 @@ int __init atafb_init(void)
 	if (register_framebuffer(&fb_info) < 0) {
 #ifdef ATAFB_EXT
 		if (external_addr) {
-			iounmap(external_addr);
-			external_addr = NULL;
+			iounmap(external_screen_base);
+			external_addr = 0;
 		}
 		if (external_vgaiobase) {
 			iounmap((void*)external_vgaiobase);
-- 
1.7.0.4
