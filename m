From: <gerg@snapgear.com>
Subject: [PATCH 20/22] m68knommu: simplify the ColdFire 5307 GPIO struct setup
Date: Thu, 26 Apr 2012 10:26:00 +1000
Message-ID: <1335399962-10308-21-git-send-email-gerg@snapgear.com>
References: <1335399962-10308-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:25101 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932670Ab2DZA1W (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 25 Apr 2012 20:27:22 -0400
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
 arch/m68k/platform/5307/Makefile |    2 +-
 arch/m68k/platform/5307/config.c |    9 +++++++++
 arch/m68k/platform/5307/gpio.c   |   27 ---------------------------
 3 files changed, 10 insertions(+), 28 deletions(-)
 delete mode 100644 arch/m68k/platform/5307/gpio.c

diff --git a/arch/m68k/platform/5307/Makefile b/arch/m68k/platform/5307/Makefile
index d4293b7..fd08186 100644
--- a/arch/m68k/platform/5307/Makefile
+++ b/arch/m68k/platform/5307/Makefile
@@ -14,7 +14,7 @@
 
 asflags-$(CONFIG_FULLDEBUG) := -DDEBUGGER_COMPATIBLE_CACHE=1
 
-obj-y			+= config.o gpio.o
+obj-y			+= config.o
 obj-$(CONFIG_NETtel)	+= nettel.o
 obj-$(CONFIG_CLEOPATRA)	+= nettel.o
 
diff --git a/arch/m68k/platform/5307/config.c b/arch/m68k/platform/5307/config.c
index a568d28..93b4849 100644
--- a/arch/m68k/platform/5307/config.c
+++ b/arch/m68k/platform/5307/config.c
@@ -16,6 +16,7 @@
 #include <asm/machdep.h>
 #include <asm/coldfire.h>
 #include <asm/mcfsim.h>
+#include <asm/mcfgpio.h>
 #include <asm/mcfwdebug.h>
 
 /***************************************************************************/
@@ -28,6 +29,14 @@ unsigned char ledbank = 0xff;
 
 /***************************************************************************/
 
+struct mcf_gpio_chip mcf_gpio_chips[] = {
+	MCFGPS(PP, 0, 16, MCFSIM_PADDR, MCFSIM_PADAT, MCFSIM_PADAT),
+};
+
+unsigned int mcf_gpio_chips_size = ARRAY_SIZE(mcf_gpio_chips);
+
+/***************************************************************************/
+
 void __init config_BSP(char *commandp, int size)
 {
 #if defined(CONFIG_NETtel) || \
diff --git a/arch/m68k/platform/5307/gpio.c b/arch/m68k/platform/5307/gpio.c
deleted file mode 100644
index 7bbbea7..0000000
--- a/arch/m68k/platform/5307/gpio.c
+++ /dev/null
@@ -1,27 +0,0 @@
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
-	MCFGPS(PP, 0, 16, MCFSIM_PADDR, MCFSIM_PADAT, MCFSIM_PADAT),
-};
-
-unsigned int mcf_gpio_chips_size = ARRAY_SIZE(mcf_gpio_chips);
-- 
1.7.0.4
