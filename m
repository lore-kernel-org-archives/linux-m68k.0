From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68knommu: Mark config_BSP() __init
Date: Tue, 25 Jun 2013 21:40:12 +0200
Message-ID: <1372189212-12136-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@uclinux.org>
Cc: uclinux-dev@uclinux.org, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Some instances of config_BSP() lack an __init annotation.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/platform/68000/m68328.c   |    3 ++-
 arch/m68k/platform/68000/m68EZ328.c |    3 ++-
 arch/m68k/platform/68000/m68VZ328.c |    3 ++-
 arch/m68k/platform/68360/config.c   |    3 ++-
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/platform/68000/m68328.c b/arch/m68k/platform/68000/m68328.c
index a86eb66..e53caf4 100644
--- a/arch/m68k/platform/68000/m68328.c
+++ b/arch/m68k/platform/68000/m68328.c
@@ -15,6 +15,7 @@
 
 /***************************************************************************/
 
+#include <linux/init.h>
 #include <linux/types.h>
 #include <linux/kernel.h>
 #include <linux/rtc.h>
@@ -42,7 +43,7 @@ void m68328_reset (void)
 
 /***************************************************************************/
 
-void config_BSP(char *command, int len)
+void __init config_BSP(char *command, int len)
 {
   printk(KERN_INFO "\n68328 support D. Jeff Dionne <jeff@uclinux.org>\n");
   printk(KERN_INFO "68328 support Kenneth Albanowski <kjahds@kjshds.com>\n");
diff --git a/arch/m68k/platform/68000/m68EZ328.c b/arch/m68k/platform/68000/m68EZ328.c
index a6eb72d..332b5e8 100644
--- a/arch/m68k/platform/68000/m68EZ328.c
+++ b/arch/m68k/platform/68000/m68EZ328.c
@@ -13,6 +13,7 @@
 
 /***************************************************************************/
 
+#include <linux/init.h>
 #include <linux/types.h>
 #include <linux/kernel.h>
 #include <linux/rtc.h>
@@ -52,7 +53,7 @@ _bsc1(unsigned char *, gethwaddr, int, a)
 _bsc1(char *, getbenv, char *, a)
 #endif
 
-void config_BSP(char *command, int len)
+void __init config_BSP(char *command, int len)
 {
   unsigned char *p;
 
diff --git a/arch/m68k/platform/68000/m68VZ328.c b/arch/m68k/platform/68000/m68VZ328.c
index eb6964f..42e1ada 100644
--- a/arch/m68k/platform/68000/m68VZ328.c
+++ b/arch/m68k/platform/68000/m68VZ328.c
@@ -14,6 +14,7 @@
 
 /***************************************************************************/
 
+#include <linux/init.h>
 #include <linux/types.h>
 #include <linux/kernel.h>
 #include <linux/kd.h>
@@ -175,7 +176,7 @@ static void init_hardware(char *command, int size)
 #endif
 /***************************************************************************/
 
-void config_BSP(char *command, int size)
+void __init config_BSP(char *command, int size)
 {
 	printk(KERN_INFO "68VZ328 DragonBallVZ support (c) 2001 Lineo, Inc.\n");
 
diff --git a/arch/m68k/platform/68360/config.c b/arch/m68k/platform/68360/config.c
index 9877cef..0570741 100644
--- a/arch/m68k/platform/68360/config.c
+++ b/arch/m68k/platform/68360/config.c
@@ -11,6 +11,7 @@
  */
 
 #include <stdarg.h>
+#include <linux/init.h>
 #include <linux/types.h>
 #include <linux/kernel.h>
 #include <linux/mm.h>
@@ -140,7 +141,7 @@ _bsc1(char *, getbenv, char *, a)
 #endif
 
 
-void config_BSP(char *command, int len)
+void __init config_BSP(char *command, int len)
 {
   unsigned char *p;
 
-- 
1.7.9.5
