From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k/head.S: CONSOLE_DEBUG should depend on CONFIG_FONT_SUPPORT
Date: Tue, 27 May 2014 09:41:42 +0200
Message-ID: <1401176502-11664-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>

allmodconfig:

arch/m68k/kernel/head.o: In function `debug_cons_nputs':
(.init.text+0x1500): undefined reference to `font_vga_8x8'
make[3]: *** [vmlinux] Error 1

CONFIG_FONT_8x8=y, but CONFIG_FRAMEBUFFER_CONSOLE=m and
CONFIG_FONT_SUPPORT=m, causing the font to be modular.

Introduced by commit 0ff3cc858e74436c2234183ea2dd200474cba09a ("m68k:
Multi-platform EARLY_PRINTK"), which dropped a dependency on
CONFIG_FRAMEBUFFER_CONSOLE (FRAMEBUFFER_CONSOLE selects FONT_SUPPORT).

Make CONSOLE_DEBUG depend on CONFIG_FONT_SUPPORT to fix this.

Reported-by: kbuild test robot <fengguang.wu@intel.com>
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
To be folded into "m68k: Multi-platform EARLY_PRINTK" in m68k-queue and
for-3.16.

 arch/m68k/kernel/head.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/kernel/head.S b/arch/m68k/kernel/head.S
index 673dcaf0a55c..dbb118e1a4e0 100644
--- a/arch/m68k/kernel/head.S
+++ b/arch/m68k/kernel/head.S
@@ -273,7 +273,7 @@
 
 #ifdef CONFIG_EARLY_PRINTK
 #  define SERIAL_DEBUG
-#  ifdef CONFIG_MAC
+#  if defined(CONFIG_MAC) && defined(CONFIG_FONT_SUPPORT)
 #    define CONSOLE_DEBUG
 #  endif
 #endif
-- 
1.9.1
