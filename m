From: <gerg@snapgear.com>
Subject: [PATCH] m68knommu: fix broken boot logo inclusion
Date: Fri, 30 Dec 2011 10:32:43 +1000
Message-ID: <1325205163-11228-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:20439 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754910Ab1L3AdL (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 29 Dec 2011 19:33:11 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Compiling for the m68knommu/68328 Palm/Pilot target you get:

  AS      arch/m68k/platform/68328/head-pilot.o
arch/m68k/platform/68328/head-pilot.S:37:23: fatal error: bootlogo.rh: No such file or directory

The build for this target used to do a conversion on a C coded boot logo
and include this in the head assembler code. This got broken by changes to
the local Makefile.

Clean all this up by just including the C coded boot logo struct in the
C code. With the appropriate alignment attribute there is no difference
to the way it can be used.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/platform/68328/Makefile     |    6 +-----
 arch/m68k/platform/68328/bootlogo.h   |    2 +-
 arch/m68k/platform/68328/bootlogo.pl  |   10 ----------
 arch/m68k/platform/68328/config.c     |    3 +++
 arch/m68k/platform/68328/head-pilot.S |   16 ++--------------
 arch/m68k/platform/68328/head-rom.S   |    9 ++-------
 6 files changed, 9 insertions(+), 37 deletions(-)
 delete mode 100644 arch/m68k/platform/68328/bootlogo.pl

diff --git a/arch/m68k/platform/68328/Makefile b/arch/m68k/platform/68328/Makefile
index e4dfd8f..ee61bf8 100644
--- a/arch/m68k/platform/68328/Makefile
+++ b/arch/m68k/platform/68328/Makefile
@@ -14,12 +14,8 @@ obj-$(CONFIG_M68328)	+= config.o
 obj-$(CONFIG_ROM)	+= romvec.o
 
 extra-y			:= head.o
-extra-$(CONFIG_M68328)	+= bootlogo.rh head.o
-
-$(obj)/bootlogo.rh: $(src)/bootlogo.h
-	perl $(src)/bootlogo.pl < $(src)/bootlogo.h > $(obj)/bootlogo.rh
 
 $(obj)/head.o: $(obj)/$(head-y)
 	ln -sf $(head-y) $(obj)/head.o
 
-clean-files := $(obj)/bootlogo.rh $(obj)/head.o $(head-y)
+clean-files := $(obj)/head.o $(head-y)
diff --git a/arch/m68k/platform/68328/bootlogo.h b/arch/m68k/platform/68328/bootlogo.h
index 67bc2c1..b896c93 100644
--- a/arch/m68k/platform/68328/bootlogo.h
+++ b/arch/m68k/platform/68328/bootlogo.h
@@ -1,6 +1,6 @@
 #define bootlogo_width 160
 #define bootlogo_height 160
-static unsigned char bootlogo_bits[] = {
+unsigned char __attribute__ ((aligned(16))) bootlogo_bits[] = {
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x55, 0x01, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x40, 0x55, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
diff --git a/arch/m68k/platform/68328/bootlogo.pl b/arch/m68k/platform/68328/bootlogo.pl
deleted file mode 100644
index b04ae3f..0000000
--- a/arch/m68k/platform/68328/bootlogo.pl
+++ /dev/null
@@ -1,10 +0,0 @@
-
-$_ = join("", <>);
-
-s/(0x[0-9a-f]{2})/sprintf("0x%.2x",ord(pack("b8",unpack("B8",chr(hex($1))))))/gei;
-
-s/^ /	.byte /gm;
-s/[,};]+$//gm;
-s/^static.*//gm;
-
-print $_;
diff --git a/arch/m68k/platform/68328/config.c b/arch/m68k/platform/68328/config.c
index a7bd21d..d70bf26 100644
--- a/arch/m68k/platform/68328/config.c
+++ b/arch/m68k/platform/68328/config.c
@@ -20,6 +20,9 @@
 #include <asm/system.h>
 #include <asm/machdep.h>
 #include <asm/MC68328.h>
+#if defined(CONFIG_PILOT) || defined(CONFIG_INIT_LCD)
+#include "bootlogo.h"
+#endif
 
 /***************************************************************************/
 
diff --git a/arch/m68k/platform/68328/head-pilot.S b/arch/m68k/platform/68328/head-pilot.S
index aecff53..255c28d 100644
--- a/arch/m68k/platform/68328/head-pilot.S
+++ b/arch/m68k/platform/68328/head-pilot.S
@@ -24,19 +24,7 @@
 .global _ramstart
 .global _ramend
 
-.global penguin_bits
-
-#ifdef CONFIG_PILOT
-
-#define IMR 0xFFFFF304
-
-	.data
-	.align 16
-
-penguin_bits:	
-#include "bootlogo.rh"
-
-#endif
+.global bootlogo_bits
 
 /*****************************************************************************/
 
@@ -196,7 +184,7 @@ L3:
 	DBG_PUTC('H')
 
 #ifdef CONFIG_PILOT
-	movel	#penguin_bits, 0xFFFFFA00
+	movel	#bootlogo_bits, 0xFFFFFA00
 	moveb	#10, 0xFFFFFA05
 	movew	#160, 0xFFFFFA08
 	movew	#160, 0xFFFFFA0A
diff --git a/arch/m68k/platform/68328/head-rom.S b/arch/m68k/platform/68328/head-rom.S
index 6ec77d3..a5ff96d 100644
--- a/arch/m68k/platform/68328/head-rom.S
+++ b/arch/m68k/platform/68328/head-rom.S
@@ -8,7 +8,7 @@
 	.global _ramend
 
 #ifdef CONFIG_INIT_LCD
-	.global splash_bits
+	.global bootlogo_bits
 #endif
 
 	.data
@@ -29,16 +29,11 @@ _ramend:
 
 #define	RAMEND	(CONFIG_RAMBASE + CONFIG_RAMSIZE)
 
-#ifdef CONFIG_INIT_LCD
-splash_bits:
-#include "bootlogo.rh"
-#endif
-	
 	.text
 _start:
 _stext:	movew	#0x2700,%sr
 #ifdef CONFIG_INIT_LCD
-	movel	#splash_bits, 0xfffffA00 /* LSSA */
+	movel	#bootlogo_bits, 0xfffffA00 /* LSSA */
 	moveb	#0x28,   0xfffffA05	/* LVPW */
 	movew	#0x280,  0xFFFFFa08	/* LXMAX */
 	movew	#0x1df,  0xFFFFFa0a	/* LYMAX */
-- 
1.7.0.4
