From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 2/4] m68k/atari - atafb: convert allocation of fb ram to new interface
Date: Sun, 30 Mar 2014 13:01:24 +1300
Message-ID: <1396137686-32678-3-git-send-email-schmitz@debian.org>
References: <1396137686-32678-1-git-send-email-schmitz@debian.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f181.google.com ([209.85.192.181]:36435 "EHLO
	mail-pd0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752157AbaC3ABi (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 29 Mar 2014 20:01:38 -0400
Received: by mail-pd0-f181.google.com with SMTP id p10so6369399pdj.40
        for <linux-m68k@vger.kernel.org>; Sat, 29 Mar 2014 17:01:37 -0700 (PDT)
In-Reply-To: <1396137686-32678-1-git-send-email-schmitz@debian.org>
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
 drivers/video/atafb.c |   17 +++++++++--------
 1 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/video/atafb.c b/drivers/video/atafb.c
index e21d1f5..6c13b70 100644
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
@@ -3166,13 +3167,13 @@ int __init atafb_init(void)
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
+			cache_push(atari_stram_to_phys(screen_base), screen_len);
 			kernel_set_cachemode(screen_base, screen_len,
 					     IOMAP_WRITETHROUGH);
 		}
-- 
1.7.0.4
