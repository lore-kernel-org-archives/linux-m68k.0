From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 19/28] m68k/mac: Convert Mac to genirq
Date: Sun, 11 Sep 2011 13:59:45 +0200
Message-ID: <1315742394-16036-20-git-send-email-geert__24847.1162435182$1315742706$gmane$org@linux-m68k.org>
References: <1315742394-16036-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1315742394-16036-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
v3: Added this changeset
---
 arch/m68k/Kconfig.mmu  |    1 -
 arch/m68k/mac/baboon.c |    3 +++
 arch/m68k/mac/oss.c    |    3 +++
 arch/m68k/mac/psc.c    |    3 +++
 arch/m68k/mac/via.c    |    3 +++
 5 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/Kconfig.mmu b/arch/m68k/Kconfig.mmu
index 20e27d1..24f39df 100644
--- a/arch/m68k/Kconfig.mmu
+++ b/arch/m68k/Kconfig.mmu
@@ -200,7 +200,6 @@ config SUN3
 
 config USE_GENERIC_HARDIRQS
 	bool "Use genirq"
-	depends on !MAC
 	depends on !APOLLO
 	depends on !MVME147
 	depends on !MVME16x
diff --git a/arch/m68k/mac/baboon.c b/arch/m68k/mac/baboon.c
index f264791..ff11746 100644
--- a/arch/m68k/mac/baboon.c
+++ b/arch/m68k/mac/baboon.c
@@ -11,6 +11,9 @@
 #include <linux/mm.h>
 #include <linux/delay.h>
 #include <linux/init.h>
+#ifdef CONFIG_GENERIC_HARDIRQS
+#include <linux/irq.h>
+#endif
 
 #include <asm/traps.h>
 #include <asm/bootinfo.h>
diff --git a/arch/m68k/mac/oss.c b/arch/m68k/mac/oss.c
index 1eb60f0..ed95270 100644
--- a/arch/m68k/mac/oss.c
+++ b/arch/m68k/mac/oss.c
@@ -19,6 +19,9 @@
 #include <linux/mm.h>
 #include <linux/delay.h>
 #include <linux/init.h>
+#ifdef CONFIG_GENERIC_HARDIRQS
+#include <linux/irq.h>
+#endif
 
 #include <asm/bootinfo.h>
 #include <asm/macintosh.h>
diff --git a/arch/m68k/mac/psc.c b/arch/m68k/mac/psc.c
index 26c2b65..0a34b7a 100644
--- a/arch/m68k/mac/psc.c
+++ b/arch/m68k/mac/psc.c
@@ -18,6 +18,9 @@
 #include <linux/mm.h>
 #include <linux/delay.h>
 #include <linux/init.h>
+#ifdef CONFIG_GENERIC_HARDIRQS
+#include <linux/irq.h>
+#endif
 
 #include <asm/traps.h>
 #include <asm/bootinfo.h>
diff --git a/arch/m68k/mac/via.c b/arch/m68k/mac/via.c
index af9ed33..bde156c 100644
--- a/arch/m68k/mac/via.c
+++ b/arch/m68k/mac/via.c
@@ -28,6 +28,9 @@
 #include <linux/delay.h>
 #include <linux/init.h>
 #include <linux/module.h>
+#ifdef CONFIG_GENERIC_HARDIRQS
+#include <linux/irq.h>
+#endif
 
 #include <asm/bootinfo.h>
 #include <asm/macintosh.h>
-- 
1.7.0.4
