From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 2/2] m68k/atari - atafb: convert allocation of fb ram to new interface
Date: Wed, 19 Mar 2014 20:23:04 +1300
Message-ID: <1395213784-3249-2-git-send-email-schmitz@debian.org>
References: <1395213784-3249-1-git-send-email-schmitz@debian.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f50.google.com ([209.85.160.50]:46229 "EHLO
	mail-pb0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753162AbaCSHXY (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 19 Mar 2014 03:23:24 -0400
Received: by mail-pb0-f50.google.com with SMTP id md12so8483630pbc.37
        for <linux-m68k@vger.kernel.org>; Wed, 19 Mar 2014 00:23:23 -0700 (PDT)
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

FIXME - currently double faukts at fb init.

Signed-off-by: Michael Schmitz <schmitz@debian.org>
---
 drivers/video/atafb.c |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/video/atafb.c b/drivers/video/atafb.c
index e21d1f5..40d105e 100644
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
+	addr = (unsigned long) atari_stram_to_phys((unsigned long) s_base);
 	/* Setup Screen Memory */
 	shifter.bas_hi = (unsigned char)((addr & 0xff0000) >> 16);
 	shifter.bas_md = (unsigned char)((addr & 0x00ff00) >> 8);
@@ -2286,7 +2286,7 @@ static void set_screen_base(void *s_base)
 {
 	unsigned long addr;
 
-	addr = virt_to_phys(s_base);
+	addr = (unsigned long) atari_stram_to_phys((unsigned long) s_base);
 	/* Setup Screen Memory */
 	shifter.bas_hi = (unsigned char)((addr & 0xff0000) >> 16);
 	shifter.bas_md = (unsigned char)((addr & 0x00ff00) >> 8);
@@ -3166,7 +3166,7 @@ int __init atafb_init(void)
 		memset(screen_base, 0, mem_req);
 		pad = -(unsigned long)screen_base & (PAGE_SIZE - 1);
 		screen_base += pad;
-		real_screen_base = screen_base + ovsc_offset;
+		real_screen_base = atari_stram_to_phys((unsigned long) (screen_base + ovsc_offset));
 		screen_len = (mem_req - pad - ovsc_offset) & PAGE_MASK;
 		st_ovsc_switch();
 		if (CPU_IS_040_OR_060) {
-- 
1.7.0.4
