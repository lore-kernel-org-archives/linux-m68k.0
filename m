From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: [PATCH] m68k: pull mach_beep in setup.c
Date: Thu, 28 Sep 2017 11:44:52 +0200
Message-ID: <20170928094452.4863-1-alexandre.belloni@free-electrons.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@free-electrons.com>

It is possible to select INPUT_M68K_BEEP in a nommu configuration. This
results in the following link error:

drivers/input/misc/m68kspkr.o: In function `m68kspkr_event':
m68kspkr.c:(.text+0x3a): undefined reference to `mach_beep'
m68kspkr.c:(.text+0x5e): undefined reference to `mach_beep'
m68kspkr.c:(.text+0x78): undefined reference to `mach_beep'
drivers/input/misc/m68kspkr.o: In function `m68kspkr_init':
m68kspkr.c:(.init.text+0x4): undefined reference to `mach_beep'

Pull the mach_beep definition in setup.c to avoid it.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---

I didn't merge both files because I don't have any way to test the result.

 arch/m68k/kernel/setup.c    | 5 +++++
 arch/m68k/kernel/setup_mm.c | 4 ----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/kernel/setup.c b/arch/m68k/kernel/setup.c
index 4bf129f1d2e2..81cadb55b2a2 100644
--- a/arch/m68k/kernel/setup.c
+++ b/arch/m68k/kernel/setup.c
@@ -3,3 +3,8 @@
 #else
 #include "setup_no.c"
 #endif
+
+#if IS_ENABLED(CONFIG_INPUT_M68K_BEEP)
+void (*mach_beep)(unsigned int, unsigned int);
+EXPORT_SYMBOL(mach_beep);
+#endif
diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
index 7a2c21212820..ac5c9ee9bbf9 100644
--- a/arch/m68k/kernel/setup_mm.c
+++ b/arch/m68k/kernel/setup_mm.c
@@ -105,10 +105,6 @@ EXPORT_SYMBOL(mach_heartbeat);
 #ifdef CONFIG_M68K_L2_CACHE
 void (*mach_l2_flush) (int);
 #endif
-#if IS_ENABLED(CONFIG_INPUT_M68K_BEEP)
-void (*mach_beep)(unsigned int, unsigned int);
-EXPORT_SYMBOL(mach_beep);
-#endif
 #if defined(CONFIG_ISA) && defined(MULTI_ISA)
 int isa_type;
 int isa_sex;
-- 
2.14.2
