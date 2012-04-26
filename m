From: <gerg@snapgear.com>
Subject: [PATCH 17/22] m68knommu: simplify the ColdFire 5272 GPIO struct setup
Date: Thu, 26 Apr 2012 10:25:57 +1000
Message-ID: <1335399962-10308-18-git-send-email-gerg@snapgear.com>
References: <1335399962-10308-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:25087 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932670Ab2DZA1R (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 25 Apr 2012 20:27:17 -0400
In-Reply-To: <1335399962-10308-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, sfking@fdwdc.com
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The GPIO data struct setup is now the only remaining code in the platform
gpio.c file. So move it to the platform config.c code and remove the gpio.c
file.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/platform/5272/Makefile |    2 +-
 arch/m68k/platform/5272/config.c |   11 +++++++++++
 arch/m68k/platform/5272/gpio.c   |   29 -----------------------------
 3 files changed, 12 insertions(+), 30 deletions(-)
 delete mode 100644 arch/m68k/platform/5272/gpio.c

diff --git a/arch/m68k/platform/5272/Makefile b/arch/m68k/platform/5272/Makefile
index 34110fc..932ddab 100644
--- a/arch/m68k/platform/5272/Makefile
+++ b/arch/m68k/platform/5272/Makefile
@@ -14,5 +14,5 @@
 
 asflags-$(CONFIG_FULLDEBUG) := -DDEBUGGER_COMPATIBLE_CACHE=1
 
-obj-y := config.o gpio.o intc.o
+obj-y := config.o intc.o
 
diff --git a/arch/m68k/platform/5272/config.c b/arch/m68k/platform/5272/config.c
index e68bc7a..43e3606 100644
--- a/arch/m68k/platform/5272/config.c
+++ b/arch/m68k/platform/5272/config.c
@@ -19,6 +19,7 @@
 #include <asm/coldfire.h>
 #include <asm/mcfsim.h>
 #include <asm/mcfuart.h>
+#include <asm/mcfgpio.h>
 
 /***************************************************************************/
 
@@ -30,6 +31,16 @@ unsigned char ledbank = 0xff;
 
 /***************************************************************************/
 
+struct mcf_gpio_chip mcf_gpio_chips[] = {
+	MCFGPS(PA,  0, 16, MCFSIM_PADDR, MCFSIM_PADAT, MCFSIM_PADAT),
+	MCFGPS(PB, 16, 16, MCFSIM_PBDDR, MCFSIM_PBDAT, MCFSIM_PBDAT),
+	MCFGPS(Pc, 32, 16, MCFSIM_PCDDR, MCFSIM_PCDAT, MCFSIM_PCDAT),
+};
+
+unsigned int mcf_gpio_chips_size = ARRAY_SIZE(mcf_gpio_chips);
+
+/***************************************************************************/
+
 static void __init m5272_uarts_init(void)
 {
 	u32 v;
diff --git a/arch/m68k/platform/5272/gpio.c b/arch/m68k/platform/5272/gpio.c
deleted file mode 100644
index c029dab..0000000
--- a/arch/m68k/platform/5272/gpio.c
+++ /dev/null
@@ -1,29 +0,0 @@
-/*
- * Coldfire generic GPIO support
- *
- * (C) Copyright 2009, Steven King <sfking@fdwdc.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; version 2 of the License.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
-*/
-
-#include <linux/kernel.h>
-#include <linux/init.h>
-
-#include <asm/coldfire.h>
-#include <asm/mcfsim.h>
-#include <asm/mcfgpio.h>
-
-struct mcf_gpio_chip mcf_gpio_chips[] = {
-	MCFGPS(PA,  0, 16, MCFSIM_PADDR, MCFSIM_PADAT, MCFSIM_PADAT),
-	MCFGPS(PB, 16, 16, MCFSIM_PBDDR, MCFSIM_PBDAT, MCFSIM_PBDAT),
-	MCFGPS(Pc, 32, 16, MCFSIM_PCDDR, MCFSIM_PCDAT, MCFSIM_PCDAT),
-};
-
-unsigned int mcf_gpio_chips_size = ARRAY_SIZE(mcf_gpio_chips);
-- 
1.7.0.4
