From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 01/12] m68k/atari: ROM port ISA adapter support
Date: Sat, 30 Mar 2013 13:27:41 +1300
Message-ID: <1364603272-8148-2-git-send-email-schmitz@debian.org>
References: <1364603272-8148-1-git-send-email-schmitz@debian.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-da0-f54.google.com ([209.85.210.54]:58053 "EHLO
	mail-da0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757302Ab3C3A2y (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 29 Mar 2013 20:28:54 -0400
Received: by mail-da0-f54.google.com with SMTP id p1so383880dad.13
        for <linux-m68k@vger.kernel.org>; Fri, 29 Mar 2013 17:28:54 -0700 (PDT)
In-Reply-To: <1364603272-8148-1-git-send-email-schmitz@debian.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: linux-m68k@vger.kernel.org, Michael Schmitz <schmitz@opal.biophys.uni-duesseldorf.de>, Michael Schmitz <schmitz@debian.org>

From: Michael Schmitz <schmitz@opal.biophys.uni-duesseldorf.de>

Atari ROM port ISA adapter support for EtherNEC and NetUSBee adapters

16 bit access for ROM port adapters follows debugging and
clarification by David Galvez <dgalvez75@gmail.com>. The NetUSBee
ISP1160 USB chip uses these macros.

Signed-off-by: Michael Schmitz <schmitz@debian.org>
---
 arch/m68k/Kconfig.bus          |   10 +++
 arch/m68k/include/asm/io_mm.h  |  136 ++++++++++++++++++++++++++++++++++++++--
 arch/m68k/include/asm/raw_io.h |  109 +++++++++++++++++++++++++++++++-
 arch/m68k/kernel/setup_mm.c    |    6 ++
 4 files changed, 254 insertions(+), 7 deletions(-)

diff --git a/arch/m68k/Kconfig.bus b/arch/m68k/Kconfig.bus
index 93ef034..675b087 100644
--- a/arch/m68k/Kconfig.bus
+++ b/arch/m68k/Kconfig.bus
@@ -45,6 +45,16 @@ config ISA
 	  (MCA) or VESA.  ISA is an older system, now being displaced by PCI;
 	  newer boards don't support it.  If you have ISA, say Y, otherwise N.
 
+config ATARI_ROM_ISA
+	bool "Atari ROM port ISA adapter support"
+	depends on ATARI
+	help
+	  This option enables support for the ROM port ISA adapter used to
+	  operate ISA cards on Atari. Only 8  bit cards are supported, and
+	  no interrupt lines are connected.
+	  The only driver currently using this adapter is the EtherNEC
+	  driver for RTL8019AS based NE2000 compatible network cards.
+
 config GENERIC_ISA_DMA
 	def_bool ISA
 
diff --git a/arch/m68k/include/asm/io_mm.h b/arch/m68k/include/asm/io_mm.h
index a6686d2..ffdf54f 100644
--- a/arch/m68k/include/asm/io_mm.h
+++ b/arch/m68k/include/asm/io_mm.h
@@ -63,6 +63,23 @@
 #endif
 #endif /* AMIGA_PCMCIA */
 
+#ifdef CONFIG_ATARI_ROM_ISA
+
+#define enec_isa_read_base  0xfffa0000
+#define enec_isa_write_base 0xfffb0000
+
+#define ENEC_ISA_IO_B(ioaddr)	(enec_isa_read_base+((((unsigned long)(ioaddr))&0x7F)<<9))
+#define ENEC_ISA_IO_W(ioaddr)	(enec_isa_read_base+((((unsigned long)(ioaddr))&0x7F)<<9))
+#define ENEC_ISA_MEM_B(madr)	(enec_isa_read_base+((((unsigned long)(madr))&0x7F)<<9))
+#define ENEC_ISA_MEM_W(madr)	(enec_isa_read_base+((((unsigned long)(madr))&0x7F)<<9))
+
+#ifndef MULTI_ISA
+#define MULTI_ISA 0
+#else
+#undef MULTI_ISA
+#define MULTI_ISA 1
+#endif
+#endif /* ATARI_ROM_ISA */
 
 
 #if defined(CONFIG_PCI) && defined(CONFIG_COLDFIRE)
@@ -111,14 +128,15 @@ void mcf_pci_outsl(u32 addr, const u32 *buf, u32 len);
 #define readw(addr)	in_le16(addr)
 #define writew(v, addr)	out_le16((addr), (v))
 
-#elif defined(CONFIG_ISA)
+#elif defined(CONFIG_ISA) || defined(CONFIG_ATARI_ROM_ISA)
 
 #if MULTI_ISA == 0
 #undef MULTI_ISA
 #endif
 
-#define ISA_TYPE_Q40 (1)
-#define ISA_TYPE_AG  (2)
+#define ISA_TYPE_Q40  (1)
+#define ISA_TYPE_AG   (2)
+#define ISA_TYPE_ENEC (3)
 
 #if defined(CONFIG_Q40) && !defined(MULTI_ISA)
 #define ISA_TYPE ISA_TYPE_Q40
@@ -128,6 +146,10 @@ void mcf_pci_outsl(u32 addr, const u32 *buf, u32 len);
 #define ISA_TYPE ISA_TYPE_AG
 #define ISA_SEX  1
 #endif
+#if defined(CONFIG_ATARI_ROM_ISA) && !defined(MULTI_ISA)
+#define ISA_TYPE ISA_TYPE_ENEC
+#define ISA_SEX  0
+#endif
 
 #ifdef MULTI_ISA
 extern int isa_type;
@@ -152,6 +174,9 @@ static inline u8 __iomem *isa_itb(unsigned long addr)
 #ifdef CONFIG_AMIGA_PCMCIA
     case ISA_TYPE_AG: return (u8 __iomem *)AG_ISA_IO_B(addr);
 #endif
+#ifdef CONFIG_ATARI_ROM_ISA
+    case ISA_TYPE_ENEC: return (u8 __iomem *)ENEC_ISA_IO_B(addr);
+#endif
     default: return NULL; /* avoid warnings, just in case */
     }
 }
@@ -165,6 +190,9 @@ static inline u16 __iomem *isa_itw(unsigned long addr)
 #ifdef CONFIG_AMIGA_PCMCIA
     case ISA_TYPE_AG: return (u16 __iomem *)AG_ISA_IO_W(addr);
 #endif
+#ifdef CONFIG_ATARI_ROM_ISA
+    case ISA_TYPE_ENEC: return (u16 __iomem *)ENEC_ISA_IO_W(addr);
+#endif
     default: return NULL; /* avoid warnings, just in case */
     }
 }
@@ -188,6 +216,9 @@ static inline u8 __iomem *isa_mtb(unsigned long addr)
 #ifdef CONFIG_AMIGA_PCMCIA
     case ISA_TYPE_AG: return (u8 __iomem *)addr;
 #endif
+#ifdef CONFIG_ATARI_ROM_ISA
+    case ISA_TYPE_ENEC: return (u8 __iomem *)ENEC_ISA_MEM_B(addr);
+#endif
     default: return NULL; /* avoid warnings, just in case */
     }
 }
@@ -201,6 +232,9 @@ static inline u16 __iomem *isa_mtw(unsigned long addr)
 #ifdef CONFIG_AMIGA_PCMCIA
     case ISA_TYPE_AG: return (u16 __iomem *)addr;
 #endif
+#ifdef CONFIG_ATARI_ROM_ISA
+    case ISA_TYPE_ENEC: return (u16 __iomem *)ENEC_ISA_MEM_W(addr);
+#endif
     default: return NULL; /* avoid warnings, just in case */
     }
 }
@@ -222,6 +256,36 @@ static inline u16 __iomem *isa_mtw(unsigned long addr)
 	(ISA_SEX ? out_be16(isa_mtw((unsigned long)(p)),(val))	\
 		 : out_le16(isa_mtw((unsigned long)(p)),(val)))
 
+#ifdef CONFIG_ATARI_ROM_ISA
+#define isa_rom_inb(port)      rom_in_8(isa_itb(port))
+#define isa_rom_inw(port)	\
+	(ISA_SEX ? rom_in_be16(isa_itw(port))	\
+		 : rom_in_le16(isa_itw(port)))
+
+#define isa_rom_outb(val, port) rom_out_8(isa_itb(port), (val))
+#define isa_rom_outw(val, port)	\
+	(ISA_SEX ? rom_out_be16(isa_itw(port), (val))	\
+		 : rom_out_le16(isa_itw(port), (val)))
+
+#define isa_rom_readb(p)       rom_in_8(isa_mtb((unsigned long)(p)))
+#define isa_rom_readw(p)       \
+	(ISA_SEX ? rom_in_be16(isa_mtw((unsigned long)(p)))	\
+		 : rom_in_le16(isa_mtw((unsigned long)(p))))
+#define isa_rom_readw_swap(p)       \
+	(ISA_SEX ? rom_in_le16(isa_mtw((unsigned long)(p)))	\
+		 : rom_in_be16(isa_mtw((unsigned long)(p))))
+#define isa_rom_readw_raw(p)   rom_in_be16(isa_mtw((unsigned long)(p)))
+
+#define isa_rom_writeb(val, p)  rom_out_8(isa_mtb((unsigned long)(p)), (val))
+#define isa_rom_writew(val, p)  \
+	(ISA_SEX ? rom_out_be16(isa_mtw((unsigned long)(p)), (val))	\
+		 : rom_out_le16(isa_mtw((unsigned long)(p)), (val)))
+#define isa_rom_writew_swap(val, p)  \
+	(ISA_SEX ? rom_out_le16(isa_mtw((unsigned long)(p)), (val))	\
+		 : rom_out_be16(isa_mtw((unsigned long)(p)), (val)))
+#define isa_rom_writew_raw(val, p)  rom_out_be16(isa_mtw((unsigned long)(p)), (val))
+#endif /* CONFIG_ATARI_ROM_ISA */
+
 static inline void isa_delay(void)
 {
   switch(ISA_TYPE)
@@ -232,6 +296,9 @@ static inline void isa_delay(void)
 #ifdef CONFIG_AMIGA_PCMCIA
     case ISA_TYPE_AG: break;
 #endif
+#ifdef CONFIG_ATARI_ROM_ISA
+    case ISA_TYPE_ENEC: break;
+#endif
     default: break; /* avoid warnings */
     }
 }
@@ -263,6 +330,29 @@ static inline void isa_delay(void)
                   raw_outsw_swapw(isa_itw(port), (u16 *)(buf), (nr)<<1))
 
 
+#ifdef CONFIG_ATARI_ROM_ISA
+#define isa_rom_inb_p(p)	({ u8 _v = isa_rom_inb(p); isa_delay(); _v; })
+#define isa_rom_inw_p(p)	({ u16 _v = isa_rom_inw(p); isa_delay(); _v; })
+#define isa_rom_outb_p(v, p)	({ isa_rom_outb((v), (p)); isa_delay(); })
+#define isa_rom_outw_p(v, p)	({ isa_rom_outw((v), (p)); isa_delay(); })
+
+#define isa_rom_insb(port, buf, nr) raw_rom_insb(isa_itb(port), (u8 *)(buf), (nr))
+
+#define isa_rom_insw(port, buf, nr)     \
+       (ISA_SEX ? raw_rom_insw(isa_itw(port), (u16 *)(buf), (nr)) :    \
+		  raw_rom_insw_swapw(isa_itw(port), (u16 *)(buf), (nr)))
+
+#define isa_rom_outsb(port, buf, nr) raw_rom_outsb(isa_itb(port), (u8 *)(buf), (nr))
+
+#define isa_rom_outsw(port, buf, nr)    \
+       (ISA_SEX ? raw_rom_outsw(isa_itw(port), (u16 *)(buf), (nr)) :  \
+		  raw_rom_outsw_swapw(isa_itw(port), (u16 *)(buf), (nr)))
+#endif /* CONFIG_ATARI_ROM_ISA */
+
+#endif  /* CONFIG_ISA || CONFIG_ATARI_ROM_ISA */
+
+
+#if defined(CONFIG_ISA) && !defined(CONFIG_ATARI_ROM_ISA)
 #define inb     isa_inb
 #define inb_p   isa_inb_p
 #define outb    isa_outb
@@ -285,9 +375,43 @@ static inline void isa_delay(void)
 #define readw   isa_readw
 #define writeb  isa_writeb
 #define writew  isa_writew
+#endif  /* CONFIG_ISA && !CONFIG_ATARI_ROM_ISA */
 
-#else  /* CONFIG_ISA */
-
+#ifdef CONFIG_ATARI_ROM_ISA
+/*
+ * kernel with both ROM port ISA and IDE compiled in, those have
+ * conflicting defs for in/out. Simply consider port < 1024
+ * ROM port ISA and everything else regular ISA for IDE. read,write defined
+ * below.
+ */
+#define inb(port)	((port) < 1024 ? isa_rom_inb(port) : in_8(port))
+#define inb_p(port)	((port) < 1024 ? isa_rom_inb_p(port) : in_8(port))
+#define inw(port)	((port) < 1024 ? isa_rom_inw(port) : in_le16(port))
+#define inw_p(port)	((port) < 1024 ? isa_rom_inw_p(port) : in_le16(port))
+#define inl		isa_inl
+#define inl_p		isa_inl_p
+
+#define outb(val, port)	((port) < 1024 ? isa_rom_outb((val), (port)) : out_8((port), (val)))
+#define outb_p(val, port) ((port) < 1024 ? isa_rom_outb_p((val), (port)) : out_8((port), (val)))
+#define outw(val, port)	((port) < 1024 ? isa_rom_outw((val), (port)) : out_le16((port), (val)))
+#define outw_p(val, port) ((port) < 1024 ? isa_rom_outw_p((val), (port)) : out_le16((port), (val)))
+#define outl		isa_outl
+#define outl_p		isa_outl_p
+
+#define insb(port, buf, nr)	((port) < 1024 ? isa_rom_insb((port), (buf), (nr)) : isa_insb((port), (buf), (nr)))
+#define insw(port, buf, nr)	((port) < 1024 ? isa_rom_insw((port), (buf), (nr)) : isa_insw((port), (buf), (nr)))
+#define insl			isa_insl
+#define outsb(port, buf, nr)	((port) < 1024 ? isa_rom_outsb((port), (buf), (nr)) : isa_outsb((port), (buf), (nr)))
+#define outsw(port, buf, nr)	((port) < 1024 ? isa_rom_outsw((port), (buf), (nr)) : isa_outsw((port), (buf), (nr)))
+#define outsl			isa_outsl
+
+#define readb(addr)		in_8(addr)
+#define writeb(val, addr)	out_8((addr), (val))
+#define readw(addr)		in_le16(addr)
+#define writew(val, addr)	out_le16((addr), (val))
+#endif /* CONFIG_ATARI_ROM_ISA */
+
+#if !defined(CONFIG_ISA) && !defined(CONFIG_ATARI_ROM_ISA)
 /*
  * We need to define dummy functions for GENERIC_IOMAP support.
  */
@@ -319,7 +443,7 @@ static inline void isa_delay(void)
 #define readw(addr)      in_le16(addr)
 #define writew(val,addr) out_le16((addr),(val))
 
-#endif /* CONFIG_ISA */
+#endif /* !CONFIG_ISA && !CONFIG_ATARI_ROM_ISA */
 
 #define readl(addr)      in_le32(addr)
 #define writel(val,addr) out_le32((addr),(val))
diff --git a/arch/m68k/include/asm/raw_io.h b/arch/m68k/include/asm/raw_io.h
index d9eb983..932faa3 100644
--- a/arch/m68k/include/asm/raw_io.h
+++ b/arch/m68k/include/asm/raw_io.h
@@ -10,7 +10,7 @@
 
 #ifdef __KERNEL__
 
-#include <asm/types.h>
+#include <asm/byteorder.h>
 
 
 /* Values for nocacheflag and cmode */
@@ -60,6 +60,57 @@ extern void __iounmap(void *addr, unsigned long size);
 #define __raw_writew(val,addr) out_be16((addr),(val))
 #define __raw_writel(val,addr) out_be32((addr),(val))
 
+/*
+ * Atari ROM port (cartridge port) ISA adapter, used for the EtherNEC NE2000
+ * network card driver.
+ * The ISA adapter connects address lines A9-A13 to ISA address lines A0-A4,
+ * and hardwires the rest of the ISA addresses for a base address of 0x300.
+ *
+ * Data lines D8-D15 are connected to ISA data lines D0-D7 for reading.
+ * For writes, address lines A1-A8 are latched to ISA data lines D0-D7
+ * (meaning the bit pattern on A1-A8 can be read back as byte).
+ *
+ * Read and write operations are distinguished by the base address used:
+ * reads are from the ROM A side range, writes are through the B side range
+ * addresses (A side base + 0x10000).
+ *
+ * Reads and writes are byte only.
+ *
+ * 16 bit reads and writes are necessary for the NetUSBee adapter's USB
+ * chipset - 16 bit words are read straight off the ROM port while 16 bit
+ * reads are split into two byte writes. The low byte is latched to the
+ * NetUSBee buffer by a read from the _read_ window (with the data pattern
+ * asserted as A1-A8 address pattern). The high byte is then written to the
+ * write range as usual, completing the write cycle.
+ */
+
+#if defined(CONFIG_ATARI_ROM_ISA)
+#define rom_in_8(addr) \
+	({ u16 __v = (*(__force volatile u16 *) (addr)); __v >>= 8; __v; })
+#define rom_in_be16(addr) \
+	({ u16 __v = (*(__force volatile u16 *) (addr)); __v; })
+#define rom_in_le16(addr) \
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
+
+#define raw_rom_inb rom_in_8
+#define raw_rom_inw rom_in_be16
+
+#define raw_rom_outb(val, port) rom_out_8((port), (val))
+#define raw_rom_outw(val, port) rom_out_be16((port), (val))
+#endif /* CONFIG_ATARI_ROM_ISA */
+
 static inline void raw_insb(volatile u8 __iomem *port, u8 *buf, unsigned int len)
 {
 	unsigned int i;
@@ -342,6 +393,62 @@ static inline void raw_outsw_swapw(volatile u16 __iomem *port, const u16 *buf,
 		: "d0", "a0", "a1", "d6");
 }
 
+
+#if defined(CONFIG_ATARI_ROM_ISA)
+static inline void raw_rom_insb(volatile u8 __iomem *port, u8 *buf, unsigned int len)
+{
+	unsigned int i;
+
+	for (i = 0; i < len; i++)
+		*buf++ = rom_in_8(port);
+}
+
+static inline void raw_rom_outsb(volatile u8 __iomem *port, const u8 *buf,
+			     unsigned int len)
+{
+	unsigned int i;
+
+	for (i = 0; i < len; i++)
+		rom_out_8(port, *buf++);
+}
+
+static inline void raw_rom_insw(volatile u16 __iomem *port, u16 *buf,
+				   unsigned int nr)
+{
+	unsigned int i;
+
+	for (i = 0; i < nr; i++)
+		*buf++ = rom_in_be16(port);
+}
+
+static inline void raw_rom_outsw(volatile u16 __iomem *port, const u16 *buf,
+				   unsigned int nr)
+{
+	unsigned int i;
+
+	for (i = 0; i < nr; i++)
+		rom_out_be16(port, *buf++);
+}
+
+static inline void raw_rom_insw_swapw(volatile u16 __iomem *port, u16 *buf,
+				   unsigned int nr)
+{
+	unsigned int i;
+
+	for (i = 0; i < nr; i++)
+		*buf++ = rom_in_le16(port);
+}
+
+static inline void raw_rom_outsw_swapw(volatile u16 __iomem *port, const u16 *buf,
+				   unsigned int nr)
+{
+	unsigned int i;
+
+	for (i = 0; i < nr; i++)
+		rom_out_le16(port, *buf++);
+}
+#endif /* CONFIG_ATARI_ROM_ISA */
+
 #endif /* __KERNEL__ */
 
 #endif /* _RAW_IO_H */
diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
index 80cfbe5..e67e531 100644
--- a/arch/m68k/kernel/setup_mm.c
+++ b/arch/m68k/kernel/setup_mm.c
@@ -381,6 +381,12 @@ void __init setup_arch(char **cmdline_p)
 		isa_sex = 1;
 	}
 #endif
+#ifdef CONFIG_ATARI_ROM_ISA
+	if (MACH_IS_ATARI) {
+		isa_type = ISA_TYPE_ENEC;
+		isa_sex = 0;
+	}
+#endif
 #endif
 }
 
-- 
1.7.0.4
