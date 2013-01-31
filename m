From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 13/17] [m68k] Atari: implement 16 bit access macros for ROM port ISA
Date: Thu, 31 Jan 2013 13:29:32 +1300 (NZDT)
Message-ID: <20130131002932.ABA9F360095@xplor.waratah.dyndns.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f41.google.com ([209.85.160.41]:41329 "EHLO
	mail-pb0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754082Ab3AaA3i (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 30 Jan 2013 19:29:38 -0500
Received: by mail-pb0-f41.google.com with SMTP id ro12so1279822pbb.0
        for <linux-m68k@vger.kernel.org>; Wed, 30 Jan 2013 16:29:38 -0800 (PST)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org

[PATCH 13/17] [m68k] Atari: implement 16 bit access macros for ROM port ISA
        adapter cards, following debugging and clarification
        by David Galvez


Signed-off-by: Michael Schmitz <schmitz@debian.org>
---
 arch/m68k/include/asm/io_mm.h  |   16 ++++++++++++----
 arch/m68k/include/asm/raw_io.h |   32 ++++++++++++++++++++++----------
 2 files changed, 34 insertions(+), 14 deletions(-)

diff --git a/arch/m68k/include/asm/io_mm.h b/arch/m68k/include/asm/io_mm.h
index 6eb2834..20069a1 100644
--- a/arch/m68k/include/asm/io_mm.h
+++ b/arch/m68k/include/asm/io_mm.h
@@ -68,10 +68,10 @@
 #define enec_isa_read_base  0xfffa0000
 #define enec_isa_write_base 0xfffb0000
 
-#define ENEC_ISA_IO_B(ioaddr)	(enec_isa_read_base+((((unsigned long)(ioaddr))&0x1F)<<9))
-#define ENEC_ISA_IO_W(ioaddr)	(enec_isa_read_base+((((unsigned long)(ioaddr))&0x1F)<<9))
-#define ENEC_ISA_MEM_B(madr)	(enec_isa_read_base+((((unsigned long)(madr))&0x1F)<<9))
-#define ENEC_ISA_MEM_W(madr)	(enec_isa_read_base+((((unsigned long)(madr))&0x1F)<<9))
+#define ENEC_ISA_IO_B(ioaddr)	(enec_isa_read_base+((((unsigned long)(ioaddr))&0x7F)<<9))
+#define ENEC_ISA_IO_W(ioaddr)	(enec_isa_read_base+((((unsigned long)(ioaddr))&0x7F)<<9))
+#define ENEC_ISA_MEM_B(madr)	(enec_isa_read_base+((((unsigned long)(madr))&0x7F)<<9))
+#define ENEC_ISA_MEM_W(madr)	(enec_isa_read_base+((((unsigned long)(madr))&0x7F)<<9))
 
 #ifndef MULTI_ISA
 #define MULTI_ISA 0
@@ -277,11 +277,19 @@ static inline u16 __iomem *isa_mtw(unsigned long addr)
 #define isa_rom_readw(p)       \
 	(ISA_SEX ? rom_in_be16(isa_mtw((unsigned long)(p)))	\
 		 : rom_in_le16(isa_mtw((unsigned long)(p))))
+#define isa_rom_readw_swap(p)       \
+	(ISA_SEX ? rom_in_le16(isa_mtw((unsigned long)(p)))	\
+		 : rom_in_be16(isa_mtw((unsigned long)(p))))
+#define isa_rom_readw_raw(p)   rom_in_be16(isa_mtw((unsigned long)(p)))
 
 #define isa_rom_writeb(val, p)  rom_out_8(isa_mtb((unsigned long)(p)), (val))
 #define isa_rom_writew(val, p)  \
 	(ISA_SEX ? rom_out_be16(isa_mtw((unsigned long)(p)), (val))	\
 		 : rom_out_le16(isa_mtw((unsigned long)(p)), (val)))
+#define isa_rom_writew_swap(val, p)  \
+	(ISA_SEX ? rom_out_le16(isa_mtw((unsigned long)(p)), (val))	\
+		 : rom_out_be16(isa_mtw((unsigned long)(p)), (val)))
+#define isa_rom_writew_raw(val, p)  rom_out_be16(isa_mtw((unsigned long)(p)), (val))
 #endif /* CONFIG_ATARI_ROM_ISA */
 
 static inline void isa_delay(void)
diff --git a/arch/m68k/include/asm/raw_io.h b/arch/m68k/include/asm/raw_io.h
index b1d9119..6b7d1d7 100644
--- a/arch/m68k/include/asm/raw_io.h
+++ b/arch/m68k/include/asm/raw_io.h
@@ -77,19 +77,31 @@ extern void __iounmap(void *addr, unsigned long size);
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
-
-#define rom_out_8(addr, b)	({u8 __w, __v = (b); __w = ((*(__force volatile u8 *)  ((addr) + 0x10000 + (__v<<1)))); })
-#define rom_out_be16(addr, w)	({u16 __w, __v = (w); __w = ((*(__force volatile u16 *) ((addr) + 0x10000 + (__v<<1)))); })
-#define rom_out_be32(addr, l)	({u32 __w, __v = (l); __w = ((*(__force volatile u32 *) ((addr) + 0x10000 + (__v<<1)))); })
-#define rom_out_le16(addr, w)	({u16 __w, __v = cpu_to_le16(w); __w = ((*(__force volatile u16 *) ((addr) + 0x10000 + (__v<<1)))); })
-#define rom_out_le32(addr, l)	({u32 __w, __v = cpu_to_le32(l); __w = ((*(__force volatile u32 *) ((addr) + 0x10000 + (__v<<1)))); })
+	({ u32 __v = le32_to_cpu(*(__force volatile u32 *) (addr)); __v; })
+
+#define rom_out_8(addr, b)	\
+        ({u8 __w, __v = (b);  u32 _addr = ((u32) (addr)); \
+        __w = ((*(__force volatile u8 *)  ((_addr | 0x10000) + (__v<<1)))); })
+#define rom_out_be16(addr, w)	\
+        ({u16 __w, __v = (w); u32 _addr = ((u32) (addr)); \
+        __w = ((*(__force volatile u16 *) ((_addr & 0xFFFF0000UL) + ((__v & 0xFF)<<1)))); \
+        __w = ((*(__force volatile u16 *) ((_addr | 0x10000) + ((__v >> 8)<<1)))); })
+#define rom_out_be32(addr, l)	\
+        ({u32 __w, __v = (l);  u32 _addr = ((u32) (addr)); \
+        __w = ((*(__force volatile u32 *) ((_addr | 0x10000) + (__v<<1)))); })
+#define rom_out_le16(addr, w)	\
+        ({u16 __w, __v = cpu_to_le16(w); u32 _addr = ((u32) (addr)); \
+        __w = ((*(__force volatile u16 *) ((_addr & 0xFFFF0000UL) + ((__v & 0xFF)<<1)))); \
+        __w = ((*(__force volatile u16 *) ((_addr | 0x10000) + ((__v >> 8)<<1)))); })
+#define rom_out_le32(addr, l)	\
+        ({u32 __w, __v = cpu_to_le32(l); u32 _addr = ((u32) (addr)); \
+        __w = ((*(__force volatile u32 *) ((_addr | 0x10000) + (__v<<1)))); })
 
 #define raw_rom_inb rom_in_8
 #define raw_rom_inw rom_in_be16
-- 
1.7.0.4
