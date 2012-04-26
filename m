From: <gerg@snapgear.com>
Subject: [PATCH 13/22] m68knommu: simplify the ColdFire 5206 GPIO struct setup
Date: Thu, 26 Apr 2012 10:25:53 +1000
Message-ID: <1335399962-10308-14-git-send-email-gerg@snapgear.com>
References: <1335399962-10308-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:25072 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932670Ab2DZA1L (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 25 Apr 2012 20:27:11 -0400
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
 arch/m68k/platform/5206/Makefile |    2 +-
 arch/m68k/platform/5206/config.c |    9 +++++++++
 arch/m68k/platform/5206/gpio.c   |   27 ---------------------------
 3 files changed, 10 insertions(+), 28 deletions(-)
 delete mode 100644 arch/m68k/platform/5206/gpio.c

diff --git a/arch/m68k/platform/5206/Makefile b/arch/m68k/platform/5206/Makefile
index b5db056..8a34a9d 100644
--- a/arch/m68k/platform/5206/Makefile
+++ b/arch/m68k/platform/5206/Makefile
@@ -14,5 +14,5 @@
 
 asflags-$(CONFIG_FULLDEBUG) := -DDEBUGGER_COMPATIBLE_CACHE=1
 
-obj-y := config.o gpio.o
+obj-y := config.o
 
diff --git a/arch/m68k/platform/5206/config.c b/arch/m68k/platform/5206/config.c
index 6bfbeeb..a8b81df 100644
--- a/arch/m68k/platform/5206/config.c
+++ b/arch/m68k/platform/5206/config.c
@@ -16,6 +16,15 @@
 #include <asm/machdep.h>
 #include <asm/coldfire.h>
 #include <asm/mcfsim.h>
+#include <asm/mcfgpio.h>
+
+/***************************************************************************/
+
+struct mcf_gpio_chip mcf_gpio_chips[] = {
+	MCFGPS(PP, 0, 8, MCFSIM_PADDR, MCFSIM_PADAT, MCFSIM_PADAT),
+};
+
+unsigned int mcf_gpio_chips_size = ARRAY_SIZE(mcf_gpio_chips);
 
 /***************************************************************************/
 
diff --git a/arch/m68k/platform/5206/gpio.c b/arch/m68k/platform/5206/gpio.c
deleted file mode 100644
index a652f8e..0000000
--- a/arch/m68k/platform/5206/gpio.c
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
-	MCFGPS(PP, 0, 8, MCFSIM_PADDR, MCFSIM_PADAT, MCFSIM_PADAT),
-};
-
-unsigned int mcf_gpio_chips_size = ARRAY_SIZE(mcf_gpio_chips);
-- 
1.7.0.4
