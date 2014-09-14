From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] USB: isp116x: Fix EtherNAT if !CONFIG_ATARI_ROM_ISA
Date: Sun, 14 Sep 2014 11:39:20 +0200
Message-ID: <1410687560-10169-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:59279 "EHLO
	baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752336AbaINJjS (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 14 Sep 2014 05:39:18 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-m68k@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Commit eece8a651c96a2a3 ("USB: isp116x: isa_rom_*() calls should depend
on CONFIG_ATARI_ROM_ISA") broke USB on EtherNAT if CONFIG_ATARI_ROM_ISA
is not set, as USB on EtherNAT requires byte-swapped I/O accessors.

Add a separate #elif section for Atari without ROM port ISA to fix this.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
To be folded into "m68k/atari: USB - add ISP1160 USB host controller
support"
---
 drivers/usb/host/isp116x.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/host/isp116x.h b/drivers/usb/host/isp116x.h
index 634258df159b..adebe0251574 100644
--- a/drivers/usb/host/isp116x.h
+++ b/drivers/usb/host/isp116x.h
@@ -369,6 +369,14 @@ struct isp116x_ep {
 #define isp_writew(v, p)	((((unsigned long)(__pa(p)) & 0x00000F00) == 0x00000300UL) ? isa_rom_writew_raw((v), __pa(p)) : __raw_writew((v), (p)))
 #define isp_raw_readw(p)	((((unsigned long)(__pa(p)) & 0x00000F00) == 0x00000300UL) ? isa_rom_readw(__pa(p)) : readw((p)))
 #define isp_raw_writew(v, p)	((((unsigned long)(__pa(p)) & 0x00000F00) == 0x00000300UL) ? isa_rom_writew((v), __pa(p)) : writew((v), (p)))
+#elif defined(CONFIG_ATARI)
+  /*
+   * 16 bit data bus byte swapped in hardware on EtherNAT only.
+   */
+#define isp_readw		__raw_readw
+#define isp_writew		__raw_writew
+#define isp_raw_readw		readw
+#define isp_raw_writew		writew
 #else
   /* sane hardware */
 #define isp_readw		readw
-- 
1.9.1
