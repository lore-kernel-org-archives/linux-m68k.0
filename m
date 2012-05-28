From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: [PATCH] [m68k] Atari: support for NetUSBee register access to isp116x.h
Date: Tue, 29 May 2012 10:48:51 +1200
Message-ID: <CAOmrzkL4BNWr6aLijfpg91m8VKU4A0DRsx1mjOa22qWPrysqtQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:39300 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751870Ab2E1Wsw (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 28 May 2012 18:48:52 -0400
Received: by dady13 with SMTP id y13so4605505dad.19
        for <linux-m68k@vger.kernel.org>; Mon, 28 May 2012 15:48:52 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@zirkon.biophys.uni-duesseldorf.de>
Cc: linux-m68k@vger.kernel.org, geert@linux-m68k.org

Geert,

the following patch allows selecting the correct register access
macros depending on whether the EtherNAT or NetUSBee variant of the
ISP1160 chip is used. With this patch applied on top of the previous
two, it should be possible to test the NetUSBee USB port.

Cheers,

  Michael


index 198b4bb..c8f0612 100644
--- a/drivers/usb/host/isp116x.h
+++ b/drivers/usb/host/isp116x.h
@@ -367,16 +367,16 @@ struct isp116x_ep {

 #ifdef CONFIG_ATARI
   /* 16 bit data bus byte swapped in hardware */
-#define isp_readw               __raw_readw
-#define isp_writew              __raw_writew
-#define isp_raw_readw           readw
-#define isp_raw_writew          writew
+#define isp_readw(p)           (__pa(p) < 1024 ? raw_rom_inw((p)) :
__raw_readw((p)))
+#define isp_writew(v,p)                (__pa(p) < 1024 ?
raw_rom_outw((v),(p)) : __raw_writew((v),(p)))
+#define isp_raw_readw(p)       (__pa(p) < 1024 ? rom_in_le16((p)) : readw((p)))
+#define isp_raw_writew(v,p)    (__pa(p) < 1024 ?
rom_out_le16((p),(v)) : writew((v),(p)))
 #else
   /* sane hardware */
-#define isp_readw               readw
-#define isp_writew              writew
-#define isp_raw_readw           __raw_readw
-#define isp_raw_writew          __raw_writew
+#define isp_readw              readw
+#define isp_writew             writew
+#define isp_raw_readw          __raw_readw
+#define isp_raw_writew         __raw_writew
 #endif

 static inline void isp116x_write_addr(struct isp116x *isp116x, unsigned reg)
