From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 2/2] m68k/atari - atafb: convert allocation of fb ram to new interface
Date: Sat, 22 Mar 2014 21:47:08 +1300
Message-ID: <1395478028-17274-3-git-send-email-schmitz@debian.org>
References: <1395213784-3249-1-git-send-email-schmitz@debian.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:42729 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750841AbaCVIrX (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 22 Mar 2014 04:47:23 -0400
Received: by mail-pa0-f51.google.com with SMTP id kq14so3353483pab.24
        for <linux-m68k@vger.kernel.org>; Sat, 22 Mar 2014 01:47:23 -0700 (PDT)
In-Reply-To: <1395213784-3249-1-git-send-email-schmitz@debian.org>
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
 drivers/video/atafb.c |   27 +++++++++++++++++----------
 1 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/video/atafb.c b/drivers/video/atafb.c
index e21d1f5..b0d3e42 100644
--- a/drivers/video/atafb.c
+++ b/drivers/video/atafb.c
@@ -790,7 +790,7 @@ static void tt_get_par(struct atafb_par *par)
 	addr = ((shifter.bas_hi & 0xff) << 16) |
 	       ((shifter.bas_md & 0xff) << 8)  |
 	       ((shifter.bas_lo & 0xff));
-	par->screen_base = phys_to_virt(addr);
+	par->screen_base = atari_stram_to_virt(addr);
 }
 
 static void tt_set_par(struct atafb_par *par)
@@ -1584,7 +1584,7 @@ static void falcon_get_par(struct atafb_par *par)
 	addr = (shifter.bas_hi & 0xff) << 16 |
 	       (shifter.bas_md & 0xff) << 8  |
 	       (shifter.bas_lo & 0xff);
-	par->screen_base = phys_to_virt(addr);
+	par->screen_base = atari_stram_to_virt(addr);
 
 	/* derived parameters */
 	hw->ste_mode = (hw->f_shift & 0x510) == 0 && hw->st_shift == 0x100;
@@ -1980,7 +1980,7 @@ static void stste_get_par(struct atafb_par *par)
 	       ((shifter.bas_md & 0xff) << 8);
 	if (ATARIHW_PRESENT(EXTD_SHIFTER))
 		addr |= (shifter.bas_lo & 0xff);
-	par->screen_base = phys_to_virt(addr);
+	par->screen_base = atari_stram_to_virt(addr);
 }
 
 static void stste_set_par(struct atafb_par *par)
@@ -2039,7 +2039,7 @@ static int stste_detect(void)
 static void stste_set_screen_base(void *s_base)
 {
 	unsigned long addr;
-	addr = virt_to_phys(s_base);
+	addr = atari_stram_to_phys(s_base);
 	/* Setup Screen Memory */
 	shifter.bas_hi = (unsigned char)((addr & 0xff0000) >> 16);
 	shifter.bas_md = (unsigned char)((addr & 0x00ff00) >> 8);
@@ -2286,7 +2286,7 @@ static void set_screen_base(void *s_base)
 {
 	unsigned long addr;
 
-	addr = virt_to_phys(s_base);
+	addr = atari_stram_to_phys(s_base);
 	/* Setup Screen Memory */
 	shifter.bas_hi = (unsigned char)((addr & 0xff0000) >> 16);
 	shifter.bas_md = (unsigned char)((addr & 0x00ff00) >> 8);
@@ -2433,7 +2433,8 @@ static void atafb_set_disp(struct fb_info *info)
 	atafb_get_var(&info->var, info);
 	atafb_get_fix(&info->fix, info);
 
-	info->screen_base = (void *)info->fix.smem_start;
+	/* Note: smem_start derives from real_screen_base, not screen_base! */
+	info->screen_base = atari_stram_to_virt(info->fix.smem_start);
 }
 
 static int atafb_setcolreg(u_int regno, u_int red, u_int green, u_int blue,
@@ -3166,15 +3167,21 @@ int __init atafb_init(void)
 		memset(screen_base, 0, mem_req);
 		pad = -(unsigned long)screen_base & (PAGE_SIZE - 1);
 		screen_base += pad;
-		real_screen_base = screen_base + ovsc_offset;
+		real_screen_base = (void *) atari_stram_to_phys(screen_base + ovsc_offset);
 		screen_len = (mem_req - pad - ovsc_offset) & PAGE_MASK;
 		st_ovsc_switch();
 		if (CPU_IS_040_OR_060) {
 			/* On a '040+, the cache mode of video RAM must be set to
 			 * write-through also for internal video hardware! */
-			cache_push(virt_to_phys(screen_base), screen_len);
-			kernel_set_cachemode(screen_base, screen_len,
-					     IOMAP_WRITETHROUGH);
+			if ((unsigned long) screen_base & 0xFF000000) {
+				/* If the kernel is not residing in ST-RAM, we use 
+				 * the mapping set up in head.S for the low 4MB of
+				 * ST-RAM. This mapping is nocache/serialized so 
+				 * no tweaking of cache mode is needed here */
+				cache_push(atari_stram_to_phys(screen_base), screen_len);
+				kernel_set_cachemode(screen_base, screen_len,
+						     IOMAP_WRITETHROUGH);
+			}        
 		}
 		printk("atafb: screen_base %p real_screen_base %p screen_len %d\n",
 			screen_base, real_screen_base, screen_len);
-- 
1.7.0.4
