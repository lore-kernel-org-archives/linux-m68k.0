From: <gerg@snapgear.com>
Subject: [PATCH 15/22] m68knommu: simplify the ColdFire 523x GPIO struct setup
Date: Thu, 26 Apr 2012 10:25:55 +1000
Message-ID: <1335399962-10308-16-git-send-email-gerg@snapgear.com>
References: <1335399962-10308-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:25076 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932670Ab2DZA1O (ORCPT
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
 arch/m68k/platform/523x/Makefile |    2 +-
 arch/m68k/platform/523x/config.c |   22 ++++++++++++++++++++
 arch/m68k/platform/523x/gpio.c   |   40 --------------------------------------
 3 files changed, 23 insertions(+), 41 deletions(-)
 delete mode 100644 arch/m68k/platform/523x/gpio.c

diff --git a/arch/m68k/platform/523x/Makefile b/arch/m68k/platform/523x/Makefile
index c04b8f7..e74be69 100644
--- a/arch/m68k/platform/523x/Makefile
+++ b/arch/m68k/platform/523x/Makefile
@@ -14,4 +14,4 @@
 
 asflags-$(CONFIG_FULLDEBUG) := -DDEBUGGER_COMPATIBLE_CACHE=1
 
-obj-y := config.o gpio.o
+obj-y := config.o
diff --git a/arch/m68k/platform/523x/config.c b/arch/m68k/platform/523x/config.c
index c8b405d..d2b7a73 100644
--- a/arch/m68k/platform/523x/config.c
+++ b/arch/m68k/platform/523x/config.c
@@ -19,6 +19,28 @@
 #include <asm/machdep.h>
 #include <asm/coldfire.h>
 #include <asm/mcfsim.h>
+#include <asm/mcfgpio.h>
+
+/***************************************************************************/
+
+struct mcf_gpio_chip mcf_gpio_chips[] = {
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
+	MCFGPF(ETPU, 104, 3),
+};
+
+unsigned int mcf_gpio_chips_size = ARRAY_SIZE(mcf_gpio_chips);
 
 /***************************************************************************/
 
diff --git a/arch/m68k/platform/523x/gpio.c b/arch/m68k/platform/523x/gpio.c
deleted file mode 100644
index 07806eb..0000000
--- a/arch/m68k/platform/523x/gpio.c
+++ /dev/null
@@ -1,40 +0,0 @@
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
-	MCFGPF(ETPU, 104, 3),
-};
-
-unsigned int mcf_gpio_chips_size = ARRAY_SIZE(mcf_gpio_chips);
-- 
1.7.0.4
