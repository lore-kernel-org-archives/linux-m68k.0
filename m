From: <gerg@snapgear.com>
Subject: [PATCH 21/22] m68knommu: simplify the ColdFire 532x GPIO struct setup
Date: Thu, 26 Apr 2012 10:26:01 +1000
Message-ID: <1335399962-10308-22-git-send-email-gerg@snapgear.com>
References: <1335399962-10308-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:25103 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932670Ab2DZA1X (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 25 Apr 2012 20:27:23 -0400
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
 arch/m68k/platform/532x/Makefile |    2 +-
 arch/m68k/platform/532x/config.c |   25 ++++++++++++++++++++++
 arch/m68k/platform/532x/gpio.c   |   43 --------------------------------------
 3 files changed, 26 insertions(+), 44 deletions(-)
 delete mode 100644 arch/m68k/platform/532x/gpio.c

diff --git a/arch/m68k/platform/532x/Makefile b/arch/m68k/platform/532x/Makefile
index ce01669..c0d8cf8 100644
--- a/arch/m68k/platform/532x/Makefile
+++ b/arch/m68k/platform/532x/Makefile
@@ -15,4 +15,4 @@
 asflags-$(CONFIG_FULLDEBUG) := -DDEBUGGER_COMPATIBLE_CACHE=1
 
 #obj-y := config.o usb-mcf532x.o spi-mcf532x.o
-obj-y := config.o gpio.o
+obj-y := config.o
diff --git a/arch/m68k/platform/532x/config.c b/arch/m68k/platform/532x/config.c
index 2bec347..a4dd3d8 100644
--- a/arch/m68k/platform/532x/config.c
+++ b/arch/m68k/platform/532x/config.c
@@ -26,10 +26,35 @@
 #include <asm/mcfsim.h>
 #include <asm/mcfuart.h>
 #include <asm/mcfdma.h>
+#include <asm/mcfgpio.h>
 #include <asm/mcfwdebug.h>
 
 /***************************************************************************/
 
+struct mcf_gpio_chip mcf_gpio_chips[] = {
+	MCFGPS(PIRQ, 0, 8, MCFEPORT_EPDDR, MCFEPORT_EPDR, MCFEPORT_EPPDR),
+	MCFGPF(FECH, 8, 8),
+	MCFGPF(FECL, 16, 8),
+	MCFGPF(SSI, 24, 5),
+	MCFGPF(BUSCTL, 32, 4),
+	MCFGPF(BE, 40, 4),
+	MCFGPF(CS, 49, 5),
+	MCFGPF(PWM, 58, 4),
+	MCFGPF(FECI2C, 64, 4),
+	MCFGPF(UART, 72, 8),
+	MCFGPF(QSPI, 80, 6),
+	MCFGPF(TIMER, 88, 4),
+	MCFGPF(LCDDATAH, 96, 2),
+	MCFGPF(LCDDATAM, 104, 8),
+	MCFGPF(LCDDATAL, 112, 8),
+	MCFGPF(LCDCTLH, 120, 1),
+	MCFGPF(LCDCTLL, 128, 8),
+};
+
+unsigned int mcf_gpio_chips_size = ARRAY_SIZE(mcf_gpio_chips);
+
+/***************************************************************************/
+
 #ifdef CONFIG_SPI_COLDFIRE_QSPI
 
 static void __init m532x_qspi_init(void)
diff --git a/arch/m68k/platform/532x/gpio.c b/arch/m68k/platform/532x/gpio.c
deleted file mode 100644
index 3e1b71d..0000000
--- a/arch/m68k/platform/532x/gpio.c
+++ /dev/null
@@ -1,43 +0,0 @@
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
-	MCFGPF(FECH, 8, 8),
-	MCFGPF(FECL, 16, 8),
-	MCFGPF(SSI, 24, 5),
-	MCFGPF(BUSCTL, 32, 4),
-	MCFGPF(BE, 40, 4),
-	MCFGPF(CS, 49, 5),
-	MCFGPF(PWM, 58, 4),
-	MCFGPF(FECI2C, 64, 4),
-	MCFGPF(UART, 72, 8),
-	MCFGPF(QSPI, 80, 6),
-	MCFGPF(TIMER, 88, 4),
-	MCFGPF(LCDDATAH, 96, 2),
-	MCFGPF(LCDDATAM, 104, 8),
-	MCFGPF(LCDDATAL, 112, 8),
-	MCFGPF(LCDCTLH, 120, 1),
-	MCFGPF(LCDCTLL, 128, 8),
-};
-
-unsigned int mcf_gpio_chips_size = ARRAY_SIZE(mcf_gpio_chips);
-- 
1.7.0.4
