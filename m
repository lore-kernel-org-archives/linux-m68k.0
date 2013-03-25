From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 11/14] m68k/atari: Implement 16 bit access macros for ROM port
Date: Mon, 25 Mar 2013 14:16:29 +1300
Message-ID: <1364174192-25406-12-git-send-email-schmitz@debian.org>
References: <1364174192-25406-1-git-send-email-schmitz@debian.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f53.google.com ([209.85.160.53]:63920 "EHLO
	mail-pb0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756496Ab3CYBRB (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 24 Mar 2013 21:17:01 -0400
Received: by mail-pb0-f53.google.com with SMTP id un1so3855229pbc.40
        for <linux-m68k@vger.kernel.org>; Sun, 24 Mar 2013 18:17:00 -0700 (PDT)
In-Reply-To: <1364174192-25406-1-git-send-email-schmitz@debian.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: linux-m68k@vger.kernel.org, debian-68k@lists.debian.org, Michael Schmitz <schmitz@debian.org>

Implement 16 bit access for ROM port adapter cards, following debugging
and clarification by David Galvez <dgalvez75@gmail.com>

Remove 32 bit ROM port access macros introduced in original ROM port
access patch. 32 bit writes are impossible to Atari ROM port adapters
without dropping the top bits - even 16 bit writes are done as two 8 bit
ones in order to keep room for the address and chip select bits.
32 bit read should work but there's no adapter hardware that would use these.

Signed-off-by: Michael Schmitz <schmitz@debian.org>
---
 arch/m68k/include/asm/io_mm.h  |   44 ++++++++++++------------------
 arch/m68k/include/asm/raw_io.h |   57 +++++++++++++++++----------------------
 2 files changed, 43 insertions(+), 58 deletions(-)

diff --git a/arch/m68k/include/asm/io_mm.h b/arch/m68k/include/asm/io_mm.h
index 6eb2834..40884fe 100644
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
@@ -261,27 +261,29 @@ static inline u16 __iomem *isa_mtw(unsigned long addr)
 #define isa_rom_inw(port)	\
 	(ISA_SEX ? rom_in_be16(isa_itw(port))	\
 		 : rom_in_le16(isa_itw(port)))
-#define isa_rom_inl(port)	\
-	(ISA_SEX ? rom_in_be32(isa_itw(port))	\
-		 : rom_in_le32(isa_itw(port)))
 
 #define isa_rom_outb(val, port) rom_out_8(isa_itb(port), (val))
 #define isa_rom_outw(val, port)	\
 	(ISA_SEX ? rom_out_be16(isa_itw(port), (val))	\
 		 : rom_out_le16(isa_itw(port), (val)))
-#define isa_rom_outl(val, port)	\
-	(ISA_SEX ? rom_out_be32(isa_itw(port), (val))	\
-		 : rom_out_le32(isa_itw(port), (val)))
 
 #define isa_rom_readb(p)       rom_in_8(isa_mtb((unsigned long)(p)))
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
@@ -331,10 +333,8 @@ static inline void isa_delay(void)
 #ifdef CONFIG_ATARI_ROM_ISA
 #define isa_rom_inb_p(p)	({ u8 _v = isa_rom_inb(p); isa_delay(); _v; })
 #define isa_rom_inw_p(p)	({ u16 _v = isa_rom_inw(p); isa_delay(); _v; })
-#define isa_rom_inl_p(p)	({ u32 _v = isa_rom_inl(p); isa_delay(); _v; })
 #define isa_rom_outb_p(v, p)	({ isa_rom_outb((v), (p)); isa_delay(); })
 #define isa_rom_outw_p(v, p)	({ isa_rom_outw((v), (p)); isa_delay(); })
-#define isa_rom_outl_p(v, p)	({ isa_rom_outl((v), (p)); isa_delay(); })
 
 #define isa_rom_insb(port, buf, nr) raw_rom_insb(isa_itb(port), (u8 *)(buf), (nr))
 
@@ -342,19 +342,11 @@ static inline void isa_delay(void)
        (ISA_SEX ? raw_rom_insw(isa_itw(port), (u16 *)(buf), (nr)) :    \
 		  raw_rom_insw_swapw(isa_itw(port), (u16 *)(buf), (nr)))
 
-#define isa_rom_insl(port, buf, nr)     \
-       (ISA_SEX ? raw_rom_insl(isa_itw(port), (u32 *)(buf), (nr)) :    \
-                  raw_rom_insw_swapw(isa_itw(port), (u16 *)(buf), (nr)<<1))
-
 #define isa_rom_outsb(port, buf, nr) raw_rom_outsb(isa_itb(port), (u8 *)(buf), (nr))
 
 #define isa_rom_outsw(port, buf, nr)    \
        (ISA_SEX ? raw_rom_outsw(isa_itw(port), (u16 *)(buf), (nr)) :  \
 		  raw_rom_outsw_swapw(isa_itw(port), (u16 *)(buf), (nr)))
-
-#define isa_rom_outsl(port, buf, nr)    \
-       (ISA_SEX ? raw_rom_outsl(isa_itw(port), (u32 *)(buf), (nr)) :  \
-                  raw_rom_outsw_swapw(isa_itw(port), (u16 *)(buf), (nr)<<1))
 #endif /* CONFIG_ATARI_ROM_ISA */
 
 #endif  /* CONFIG_ISA || CONFIG_ATARI_ROM_ISA */
@@ -396,22 +388,22 @@ static inline void isa_delay(void)
 #define inb_p(port)	((port) < 1024 ? isa_rom_inb_p(port) : in_8(port))
 #define inw(port)	((port) < 1024 ? isa_rom_inw(port) : in_le16(port))
 #define inw_p(port)	((port) < 1024 ? isa_rom_inw_p(port) : in_le16(port))
-#define inl(port)	((port) < 1024 ? isa_rom_inl(port) : in_le32(port))
-#define inl_p(port)	((port) < 1024 ? isa_rom_inl_p(port) : in_le32(port))
+#define inl     	isa_inl
+#define inl_p   	isa_inl_p
 
 #define outb(val, port)	((port) < 1024 ? isa_rom_outb((val), (port)) : out_8((port), (val)))
 #define outb_p(val, port) ((port) < 1024 ? isa_rom_outb_p((val), (port)) : out_8((port), (val)))
 #define outw(val, port)	((port) < 1024 ? isa_rom_outw((val), (port)) : out_le16((port), (val)))
 #define outw_p(val, port) ((port) < 1024 ? isa_rom_outw_p((val), (port)) : out_le16((port), (val)))
-#define outl(val, port)	((port) < 1024 ? isa_rom_outl((val), (port)) : out_le32((port), (val)))
-#define outl_p(val, port) ((port) < 1024 ? isa_rom_outl_p((val), (port)) : out_le32((port), (val)))
+#define outl    	isa_outl
+#define outl_p  	isa_outl_p
 
 #define insb(port, buf, nr)	((port) < 1024 ? isa_rom_insb((port), (buf), (nr)) : isa_insb((port), (buf), (nr)))
 #define insw(port, buf, nr)	((port) < 1024 ? isa_rom_insw((port), (buf), (nr)) : isa_insw((port), (buf), (nr)))
-#define insl(port, buf, nr)	((port) < 1024 ? isa_rom_insl((port), (buf), (nr)) : isa_insl((port), (buf), (nr)))
+#define insl    		isa_insl
 #define outsb(port, buf, nr)	((port) < 1024 ? isa_rom_outsb((port), (buf), (nr)) : isa_outsb((port), (buf), (nr)))
 #define outsw(port, buf, nr)	((port) < 1024 ? isa_rom_outsw((port), (buf), (nr)) : isa_outsw((port), (buf), (nr)))
-#define outsl(port, buf, nr)	((port) < 1024 ? isa_rom_outsl((port), (buf), (nr)) : isa_outsl((port), (buf), (nr)))
+#define outsl   		isa_outsl
 
 #define readb(addr)      in_8(addr)
 #define writeb(val,addr) out_8((addr),(val))
diff --git a/arch/m68k/include/asm/raw_io.h b/arch/m68k/include/asm/raw_io.h
index b1d9119..932faa3 100644
--- a/arch/m68k/include/asm/raw_io.h
+++ b/arch/m68k/include/asm/raw_io.h
@@ -70,34 +70,45 @@ extern void __iounmap(void *addr, unsigned long size);
  * For writes, address lines A1-A8 are latched to ISA data lines D0-D7
  * (meaning the bit pattern on A1-A8 can be read back as byte).
  *
+ * Read and write operations are distinguished by the base address used:
+ * reads are from the ROM A side range, writes are through the B side range
+ * addresses (A side base + 0x10000).
+ *
  * Reads and writes are byte only.
+ *
+ * 16 bit reads and writes are necessary for the NetUSBee adapter's USB
+ * chipset - 16 bit words are read straight off the ROM port while 16 bit
+ * reads are split into two byte writes. The low byte is latched to the
+ * NetUSBee buffer by a read from the _read_ window (with the data pattern
+ * asserted as A1-A8 address pattern). The high byte is then written to the
+ * write range as usual, completing the write cycle.
  */
 
 #if defined(CONFIG_ATARI_ROM_ISA)
 #define rom_in_8(addr) \
 	({ u16 __v = (*(__force volatile u16 *) (addr)); __v >>= 8; __v; })
 #define rom_in_be16(addr) \
-	({ u16 __v = (*(__force volatile u16 *) (addr)); __v >>= 8; __v; })
-#define rom_in_be32(addr) \
-	({ u32 __v = (*(__force volatile u32 *) (addr)); __v >>= 8; __v; })
+	({ u16 __v = (*(__force volatile u16 *) (addr)); __v; })
 #define rom_in_le16(addr) \
-	({ u16 __v = le16_to_cpu(*(__force volatile u16 *) (addr)); __v >>= 8; __v; })
-#define rom_in_le32(addr) \
-	({ u32 __v = le32_to_cpu(*(__force volatile u32 *) (addr)); __v >>= 8; __v; })
-
-#define rom_out_8(addr, b)	({u8 __w, __v = (b); __w = ((*(__force volatile u8 *)  ((addr) + 0x10000 + (__v<<1)))); })
-#define rom_out_be16(addr, w)	({u16 __w, __v = (w); __w = ((*(__force volatile u16 *) ((addr) + 0x10000 + (__v<<1)))); })
-#define rom_out_be32(addr, l)	({u32 __w, __v = (l); __w = ((*(__force volatile u32 *) ((addr) + 0x10000 + (__v<<1)))); })
-#define rom_out_le16(addr, w)	({u16 __w, __v = cpu_to_le16(w); __w = ((*(__force volatile u16 *) ((addr) + 0x10000 + (__v<<1)))); })
-#define rom_out_le32(addr, l)	({u32 __w, __v = cpu_to_le32(l); __w = ((*(__force volatile u32 *) ((addr) + 0x10000 + (__v<<1)))); })
+	({ u16 __v = le16_to_cpu(*(__force volatile u16 *) (addr)); __v; })
+
+#define rom_out_8(addr, b)	\
+	({u8 __w, __v = (b);  u32 _addr = ((u32) (addr)); \
+	__w = ((*(__force volatile u8 *)  ((_addr | 0x10000) + (__v<<1)))); })
+#define rom_out_be16(addr, w)	\
+	({u16 __w, __v = (w); u32 _addr = ((u32) (addr)); \
+	__w = ((*(__force volatile u16 *) ((_addr & 0xFFFF0000UL) + ((__v & 0xFF)<<1)))); \
+	__w = ((*(__force volatile u16 *) ((_addr | 0x10000) + ((__v >> 8)<<1)))); })
+#define rom_out_le16(addr, w)	\
+	({u16 __w, __v = (w); u32 _addr = ((u32) (addr)); \
+	__w = ((*(__force volatile u16 *) ((_addr & 0xFFFF0000UL) + ((__v >> 8)<<1)))); \
+	__w = ((*(__force volatile u16 *) ((_addr | 0x10000) + ((__v & 0xFF)<<1)))); })
 
 #define raw_rom_inb rom_in_8
 #define raw_rom_inw rom_in_be16
-#define raw_rom_inl rom_in_be32
 
 #define raw_rom_outb(val, port) rom_out_8((port), (val))
 #define raw_rom_outw(val, port) rom_out_be16((port), (val))
-#define raw_rom_outl(val, port) rom_out_be32((port), (val))
 #endif /* CONFIG_ATARI_ROM_ISA */
 
 static inline void raw_insb(volatile u8 __iomem *port, u8 *buf, unsigned int len)
@@ -436,24 +447,6 @@ static inline void raw_rom_outsw_swapw(volatile u16 __iomem *port, const u16 *bu
 	for (i = 0; i < nr; i++)
 		rom_out_le16(port, *buf++);
 }
-
-static inline void raw_rom_insl(volatile u16 __iomem *port, u32 *buf,
-				   unsigned int nr)
-{
-	unsigned int i;
-
-	for (i = 0; i < nr; i++)
-		*buf++ = rom_in_be32(port);
-}
-
-static inline void raw_rom_outsl(volatile u16 __iomem *port, const u32 *buf,
-				   unsigned int nr)
-{
-	unsigned int i;
-
-	for (i = 0; i < nr; i++)
-		rom_out_be32(port, *buf++);
-}
 #endif /* CONFIG_ATARI_ROM_ISA */
 
 #endif /* __KERNEL__ */
-- 
1.7.0.4
