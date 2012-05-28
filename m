From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: [PATCH 1/2] [m68k] Atari ROM port ISA adapter: implement 16 bit
 access for NetUSBee
Date: Mon, 28 May 2012 20:49:00 +1200
Message-ID: <CAOmrzkKkFY642wv4mUZdXQinPVnUeU5Ac9+T9bTYA25o_0LM=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:59043 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751264Ab2E1ItA (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 28 May 2012 04:49:00 -0400
Received: by pbbrp8 with SMTP id rp8so4393106pbb.19
        for <linux-m68k@vger.kernel.org>; Mon, 28 May 2012 01:49:00 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@zirkon.biophys.uni-duesseldorf.de>
Cc: linux-m68k@vger.kernel.org, geert@linux-m68k.org

Hi Geert,

this patch adds 16 bit read and write support to the Atari ROM port
code. 16 bit reads are done in one steps, writes are split in two byte
writes. This code is needed to support the ISP1160 chip on the
NetUSBee adapter. It compiles but is untested for lack of hardware.
Comments welcome (I'll fix formatting next time...)
If someone with access to a NetUSBee could give this code a try, I'd
really appreciate it.

  Michael


Signed-off-by: Michael Schmitz <schmitz@debian.org>
---
 arch/m68k/include/asm/raw_io.h |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/m68k/include/asm/raw_io.h b/arch/m68k/include/asm/raw_io.h
index b1d9119..1b3df20 100644
--- a/arch/m68k/include/asm/raw_io.h
+++ b/arch/m68k/include/asm/raw_io.h
@@ -77,18 +77,18 @@ extern void __iounmap(void *addr, unsigned long size);
 #define rom_in_8(addr) \
 	({ u16 __v = (*(__force volatile u16 *) (addr)); __v >>= 8; __v; })
 #define rom_in_be16(addr) \
-	({ u16 __v = (*(__force volatile u16 *) (addr)); __v >>= 8; __v; })
+	({ u16 __v = (*(__force volatile u16 *) (addr)); __v; })
 #define rom_in_be32(addr) \
-	({ u32 __v = (*(__force volatile u32 *) (addr)); __v >>= 8; __v; })
+	({ u32 __v = (*(__force volatile u32 *) (addr)); __v; })
 #define rom_in_le16(addr) \
-	({ u16 __v = le16_to_cpu(*(__force volatile u16 *) (addr)); __v >>= 8; __v; })
+	({ u16 __v = le16_to_cpu(*(__force volatile u16 *) (addr)); __v; })
 #define rom_in_le32(addr) \
-	({ u32 __v = le32_to_cpu(*(__force volatile u32 *) (addr)); __v >>= 8; __v; })
+	({ u32 __v = le32_to_cpu(*(__force volatile u32 *) (addr)); __v; })

 #define rom_out_8(addr, b)	({u8 __w, __v = (b); __w = ((*(__force
volatile u8 *)  ((addr) + 0x10000 + (__v<<1)))); })
-#define rom_out_be16(addr, w)	({u16 __w, __v = (w); __w = ((*(__force
volatile u16 *) ((addr) + 0x10000 + (__v<<1)))); })
+#define rom_out_be16(addr, w)	({u16 __w, __v = (w); __w = ((*(__force
volatile u16 *) ((addr) + 0x10000 + ((__v & 0xFF)<<1)))); __w =
((*(__force volatile u16 *) ((addr) + 0x10000 + ((__v >> 8)<<1)))); })
 #define rom_out_be32(addr, l)	({u32 __w, __v = (l); __w = ((*(__force
volatile u32 *) ((addr) + 0x10000 + (__v<<1)))); })
-#define rom_out_le16(addr, w)	({u16 __w, __v = cpu_to_le16(w); __w =
((*(__force volatile u16 *) ((addr) + 0x10000 + (__v<<1)))); })
+#define rom_out_le16(addr, w)	({u16 __w, __v = cpu_to_le16(w); __w =
((*(__force volatile u16 *) ((addr) + 0x10000 + ((__v & 0xFF)<<1))));
__w = ((*(__force volatile u16 *) ((addr) + 0x10000 + ((__v >>
8)<<1)))); })
 #define rom_out_le32(addr, l)	({u32 __w, __v = cpu_to_le32(l); __w =
((*(__force volatile u32 *) ((addr) + 0x10000 + (__v<<1)))); })

 #define raw_rom_inb rom_in_8
-- 
1.7.0.4
