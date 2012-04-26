From: <gerg@snapgear.com>
Subject: [PATCH 16/22] m68knommu: simplify the ColdFire 5249 GPIO struct setup
Date: Thu, 26 Apr 2012 10:25:56 +1000
Message-ID: <1335399962-10308-17-git-send-email-gerg@snapgear.com>
References: <1335399962-10308-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:25085 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932670Ab2DZA1Q (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 25 Apr 2012 20:27:16 -0400
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
 arch/m68k/platform/5249/Makefile |    2 +-
 arch/m68k/platform/5249/config.c |   10 ++++++++++
 arch/m68k/platform/5249/gpio.c   |   28 ----------------------------
 3 files changed, 11 insertions(+), 29 deletions(-)
 delete mode 100644 arch/m68k/platform/5249/gpio.c

diff --git a/arch/m68k/platform/5249/Makefile b/arch/m68k/platform/5249/Makefile
index 4bed30f..8a0186b 100644
--- a/arch/m68k/platform/5249/Makefile
+++ b/arch/m68k/platform/5249/Makefile
@@ -14,5 +14,5 @@
 
 asflags-$(CONFIG_FULLDEBUG) := -DDEBUGGER_COMPATIBLE_CACHE=1
 
-obj-y := config.o gpio.o intc2.o
+obj-y := config.o intc2.o
 
diff --git a/arch/m68k/platform/5249/config.c b/arch/m68k/platform/5249/config.c
index bbf0513..0b67baa 100644
--- a/arch/m68k/platform/5249/config.c
+++ b/arch/m68k/platform/5249/config.c
@@ -16,6 +16,16 @@
 #include <asm/machdep.h>
 #include <asm/coldfire.h>
 #include <asm/mcfsim.h>
+#include <asm/mcfgpio.h>
+
+/***************************************************************************/
+
+struct mcf_gpio_chip mcf_gpio_chips[] = {
+	MCFGPS(GPIO0, 0, 32, MCFSIM2_GPIOENABLE, MCFSIM2_GPIOWRITE, MCFSIM2_GPIOREAD),
+	MCFGPS(GPIO1, 32, 32, MCFSIM2_GPIO1ENABLE, MCFSIM2_GPIO1WRITE, MCFSIM2_GPIO1READ),
+};
+
+unsigned int mcf_gpio_chips_size = ARRAY_SIZE(mcf_gpio_chips);
 
 /***************************************************************************/
 
diff --git a/arch/m68k/platform/5249/gpio.c b/arch/m68k/platform/5249/gpio.c
deleted file mode 100644
index 422e45f..0000000
--- a/arch/m68k/platform/5249/gpio.c
+++ /dev/null
@@ -1,28 +0,0 @@
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
-	MCFGPS(GPIO0, 0, 32, MCFSIM2_GPIOENABLE, MCFSIM2_GPIOWRITE, MCFSIM2_GPIOREAD),
-	MCFGPS(GPIO1, 32, 32, MCFSIM2_GPIO1ENABLE, MCFSIM2_GPIO1WRITE, MCFSIM2_GPIO1READ),
-};
-
-unsigned int mcf_gpio_chips_size = ARRAY_SIZE(mcf_gpio_chips);
-- 
1.7.0.4
