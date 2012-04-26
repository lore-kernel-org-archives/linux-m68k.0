From: <gerg@snapgear.com>
Subject: [PATCH 14/22] m68knommu: simplify the ColdFire 520x GPIO struct setup
Date: Thu, 26 Apr 2012 10:25:54 +1000
Message-ID: <1335399962-10308-15-git-send-email-gerg@snapgear.com>
References: <1335399962-10308-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:25075 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932669Ab2DZA1O (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 25 Apr 2012 20:27:14 -0400
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
 arch/m68k/platform/520x/Makefile |    2 +-
 arch/m68k/platform/520x/config.c |   16 ++++++++++++++++
 arch/m68k/platform/520x/gpio.c   |   34 ----------------------------------
 3 files changed, 17 insertions(+), 35 deletions(-)
 delete mode 100644 arch/m68k/platform/520x/gpio.c

diff --git a/arch/m68k/platform/520x/Makefile b/arch/m68k/platform/520x/Makefile
index ad3f4e5..03e29d1 100644
--- a/arch/m68k/platform/520x/Makefile
+++ b/arch/m68k/platform/520x/Makefile
@@ -14,4 +14,4 @@
 
 asflags-$(CONFIG_FULLDEBUG) := -DDEBUGGER_COMPATIBLE_CACHE=1
 
-obj-y := config.o gpio.o
+obj-y := config.o
diff --git a/arch/m68k/platform/520x/config.c b/arch/m68k/platform/520x/config.c
index 2359478..ce3ed88 100644
--- a/arch/m68k/platform/520x/config.c
+++ b/arch/m68k/platform/520x/config.c
@@ -19,6 +19,22 @@
 #include <asm/coldfire.h>
 #include <asm/mcfsim.h>
 #include <asm/mcfuart.h>
+#include <asm/mcfgpio.h>
+
+/***************************************************************************/
+
+struct mcf_gpio_chip mcf_gpio_chips[] = {
+	MCFGPS(PIRQ, 0, 8, MCFEPORT_EPDDR, MCFEPORT_EPDR, MCFEPORT_EPPDR),
+	MCFGPF(CS, 9, 3),
+	MCFGPF(FECI2C, 16, 4),
+	MCFGPF(QSPI, 24, 4),
+	MCFGPF(TIMER, 32, 4),
+	MCFGPF(UART, 40, 8),
+	MCFGPF(FECH, 48, 8),
+	MCFGPF(FECL, 56, 8),
+};
+
+unsigned int mcf_gpio_chips_size = ARRAY_SIZE(mcf_gpio_chips);
 
 /***************************************************************************/
 
diff --git a/arch/m68k/platform/520x/gpio.c b/arch/m68k/platform/520x/gpio.c
deleted file mode 100644
index 49387c3..0000000
--- a/arch/m68k/platform/520x/gpio.c
+++ /dev/null
@@ -1,34 +0,0 @@
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
-	MCFGPS(PIRQ, 0, 8, MCFEPORT_EPDDR, MCFEPORT_EPDR, MCFEPORT_EPPDR),
-	MCFGPF(CS, 9, 3),
-	MCFGPF(FECI2C, 16, 4),
-	MCFGPF(QSPI, 24, 4),
-	MCFGPF(TIMER, 32, 4),
-	MCFGPF(UART, 40, 8),
-	MCFGPF(FECH, 48, 8),
-	MCFGPF(FECL, 56, 8),
-};
-
-unsigned int mcf_gpio_chips_size = ARRAY_SIZE(mcf_gpio_chips);
-- 
1.7.0.4
