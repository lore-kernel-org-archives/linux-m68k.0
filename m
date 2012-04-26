From: <gerg@snapgear.com>
Subject: [PATCH 18/22] m68knommu: simplify the ColdFire 527x GPIO struct setup
Date: Thu, 26 Apr 2012 10:25:58 +1000
Message-ID: <1335399962-10308-19-git-send-email-gerg@snapgear.com>
References: <1335399962-10308-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:25088 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932670Ab2DZA1T (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 25 Apr 2012 20:27:19 -0400
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
 arch/m68k/platform/527x/Makefile |    2 +-
 arch/m68k/platform/527x/config.c |   43 ++++++++++++++++++++++++++
 arch/m68k/platform/527x/gpio.c   |   61 --------------------------------------
 3 files changed, 44 insertions(+), 62 deletions(-)
 delete mode 100644 arch/m68k/platform/527x/gpio.c

diff --git a/arch/m68k/platform/527x/Makefile b/arch/m68k/platform/527x/Makefile
index 6ac4b57..8755c9e 100644
--- a/arch/m68k/platform/527x/Makefile
+++ b/arch/m68k/platform/527x/Makefile
@@ -14,5 +14,5 @@
 
 asflags-$(CONFIG_FULLDEBUG) := -DDEBUGGER_COMPATIBLE_CACHE=1
 
-obj-y := config.o gpio.o
+obj-y := config.o
 
diff --git a/arch/m68k/platform/527x/config.c b/arch/m68k/platform/527x/config.c
index f91a532..d0502a8 100644
--- a/arch/m68k/platform/527x/config.c
+++ b/arch/m68k/platform/527x/config.c
@@ -20,6 +20,49 @@
 #include <asm/coldfire.h>
 #include <asm/mcfsim.h>
 #include <asm/mcfuart.h>
+#include <asm/mcfgpio.h>
+
+/***************************************************************************/
+
+struct mcf_gpio_chip mcf_gpio_chips[] = {
+#if defined(CONFIG_M5271)
+	MCFGPS(PIRQ, 1, 7, MCFEPORT_EPDDR, MCFEPORT_EPDR, MCFEPORT_EPPDR),
+	MCFGPF(ADDR, 13, 3),
+	MCFGPF(DATAH, 16, 8),
+	MCFGPF(DATAL, 24, 8),
+	MCFGPF(BUSCTL, 32, 8),
+	MCFGPF(BS, 40, 4),
+	MCFGPF(CS, 49, 7),
+	MCFGPF(SDRAM, 56, 6),
+	MCFGPF(FECI2C, 64, 4),
+	MCFGPF(UARTH, 72, 2),
+	MCFGPF(UARTL, 80, 8),
+	MCFGPF(QSPI, 88, 5),
+	MCFGPF(TIMER, 96, 8),
+#elif defined(CONFIG_M5275)
+	MCFGPS(PIRQ, 1, 7, MCFEPORT_EPDDR, MCFEPORT_EPDR, MCFEPORT_EPPDR),
+	MCFGPF(BUSCTL, 8, 8),
+	MCFGPF(ADDR, 21, 3),
+	MCFGPF(CS, 25, 7),
+	MCFGPF(FEC0H, 32, 8),
+	MCFGPF(FEC0L, 40, 8),
+	MCFGPF(FECI2C, 48, 6),
+	MCFGPF(QSPI, 56, 7),
+	MCFGPF(SDRAM, 64, 8),
+	MCFGPF(TIMERH, 72, 4),
+	MCFGPF(TIMERL, 80, 4),
+	MCFGPF(UARTL, 88, 8),
+	MCFGPF(FEC1H, 96, 8),
+	MCFGPF(FEC1L, 104, 8),
+	MCFGPF(BS, 114, 2),
+	MCFGPF(IRQ, 121, 7),
+	MCFGPF(USBH, 128, 1),
+	MCFGPF(USBL, 136, 8),
+	MCFGPF(UARTH, 144, 4),
+#endif
+};
+
+unsigned int mcf_gpio_chips_size = ARRAY_SIZE(mcf_gpio_chips);
 
 /***************************************************************************/
 
diff --git a/arch/m68k/platform/527x/gpio.c b/arch/m68k/platform/527x/gpio.c
deleted file mode 100644
index 1c8633b..0000000
--- a/arch/m68k/platform/527x/gpio.c
+++ /dev/null
@@ -1,61 +0,0 @@
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
-#if defined(CONFIG_M5271)
-	MCFGPS(PIRQ, 1, 7, MCFEPORT_EPDDR, MCFEPORT_EPDR, MCFEPORT_EPPDR),
-	MCFGPF(ADDR, 13, 3),
-	MCFGPF(DATAH, 16, 8),
-	MCFGPF(DATAL, 24, 8),
-	MCFGPF(BUSCTL, 32, 8),
-	MCFGPF(BS, 40, 4),
-	MCFGPF(CS, 49, 7),
-	MCFGPF(SDRAM, 56, 6),
-	MCFGPF(FECI2C, 64, 4),
-	MCFGPF(UARTH, 72, 2),
-	MCFGPF(UARTL, 80, 8),
-	MCFGPF(QSPI, 88, 5),
-	MCFGPF(TIMER, 96, 8),
-#elif defined(CONFIG_M5275)
-	MCFGPS(PIRQ, 1, 7, MCFEPORT_EPDDR, MCFEPORT_EPDR, MCFEPORT_EPPDR),
-	MCFGPF(BUSCTL, 8, 8),
-	MCFGPF(ADDR, 21, 3),
-	MCFGPF(CS, 25, 7),
-	MCFGPF(FEC0H, 32, 8),
-	MCFGPF(FEC0L, 40, 8),
-	MCFGPF(FECI2C, 48, 6),
-	MCFGPF(QSPI, 56, 7),
-	MCFGPF(SDRAM, 64, 8),
-	MCFGPF(TIMERH, 72, 4),
-	MCFGPF(TIMERL, 80, 4),
-	MCFGPF(UARTL, 88, 8),
-	MCFGPF(FEC1H, 96, 8),
-	MCFGPF(FEC1L, 104, 8),
-	MCFGPF(BS, 114, 2),
-	MCFGPF(IRQ, 121, 7),
-	MCFGPF(USBH, 128, 1),
-	MCFGPF(USBL, 136, 8),
-	MCFGPF(UARTH, 144, 4),
-#endif
-};
-
-unsigned int mcf_gpio_chips_size = ARRAY_SIZE(mcf_gpio_chips);
-- 
1.7.0.4
