From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: Make sure {read,write}s[bwl]() are always defined
Date: Sat, 21 Apr 2012 22:15:58 +0200
Message-ID: <1335039358-10772-1-git-send-email-geert__41825.555303558$1335039406$gmane$org@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

drivers/usb/musb/musb_io.h provides default implementations for
{read,write}s[bwl]() on most platforms, some of which will conflict soon
with platform-specific counterparts on m68k.

To avoid having to add more platform-specific checks to musb_io.h later,
make sure {read,write}s[bwl]() are always defined on m68k, and disable the
default implementations in musb_io.h on m68k, like is already done for
several other architectures.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Felipe Balbi <balbi@ti.com>
---
This is the proactive fix, before Atari ROM port ISA is introduced.

 arch/m68k/include/asm/io_mm.h |    7 +++++++
 drivers/usb/musb/musb_io.h    |    2 +-
 2 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/include/asm/io_mm.h b/arch/m68k/include/asm/io_mm.h
index 0fb3468..fa4324b 100644
--- a/arch/m68k/include/asm/io_mm.h
+++ b/arch/m68k/include/asm/io_mm.h
@@ -278,6 +278,13 @@ static inline void isa_delay(void)
 #define readl(addr)      in_le32(addr)
 #define writel(val,addr) out_le32((addr),(val))
 
+#define readsb(port, buf, nr)     raw_insb((port), (u8 *)(buf), (nr))
+#define readsw(port, buf, nr)     raw_insw((port), (u16 *)(buf), (nr))
+#define readsl(port, buf, nr)     raw_insl((port), (u32 *)(buf), (nr))
+#define writesb(port, buf, nr)    raw_outsb((port), (u8 *)(buf), (nr))
+#define writesw(port, buf, nr)    raw_outsw((port), (u16 *)(buf), (nr))
+#define writesl(port, buf, nr)    raw_outsl((port), (u32 *)(buf), (nr))
+
 #define mmiowb()
 
 static inline void __iomem *ioremap(unsigned long physaddr, unsigned long size)
diff --git a/drivers/usb/musb/musb_io.h b/drivers/usb/musb/musb_io.h
index 1d5eda2..f7c1c8e 100644
--- a/drivers/usb/musb/musb_io.h
+++ b/drivers/usb/musb/musb_io.h
@@ -40,7 +40,7 @@
 #if !defined(CONFIG_ARM) && !defined(CONFIG_SUPERH) \
 	&& !defined(CONFIG_AVR32) && !defined(CONFIG_PPC32) \
 	&& !defined(CONFIG_PPC64) && !defined(CONFIG_BLACKFIN) \
-	&& !defined(CONFIG_MIPS)
+	&& !defined(CONFIG_MIPS) && !defined(CONFIG_M68K)
 static inline void readsl(const void __iomem *addr, void *buf, int len)
 	{ insl((unsigned long)addr, buf, len); }
 static inline void readsw(const void __iomem *addr, void *buf, int len)
-- 
1.7.0.4
