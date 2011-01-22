From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: Kconfig - Remove unneeded "default n"
Date: Sat, 22 Jan 2011 23:25:59 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1101222325290.28325__33063.6212173433$1295735193$gmane$org@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@lists.linux-m68k.org>
Cc: Linux Kernel Development <linux-kernel@vger.kernel.org>

Reported-by: Phillip Lougher <phillip@lougher.demon.co.uk>
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/Kconfig |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 0911d7c..ab91cf0 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -18,11 +18,9 @@ config RWSEM_XCHGADD_ALGORITHM
 
 config ARCH_HAS_ILOG2_U32
 	bool
-	default n
 
 config ARCH_HAS_ILOG2_U64
 	bool
-	default n
 
 config GENERIC_HWEIGHT
 	bool
-- 
1.7.0.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
