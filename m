Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA3C3C05027
	for <linux-m68k@archiver.kernel.org>; Wed,  8 Feb 2023 17:34:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231642AbjBHRd7 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 8 Feb 2023 12:33:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230482AbjBHRdz (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 8 Feb 2023 12:33:55 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD16534308
        for <linux-m68k@lists.linux-m68k.org>; Wed,  8 Feb 2023 09:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675877632; x=1707413632;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=APWUZYQ1vDYlUkV8BjfBfVaZaanhCPV3rpw0l2u2Gfs=;
  b=nebvRQyEYLpImP82AAE306NRFmTJvxJ+EPG4E0HoOvDWkPXe4AfZCB2b
   WvAIHd7WFNMrJ69C8ucX1ZCmJnek5aBZkcQkCJf34vwxXGRpCP45SLiX+
   zEuR8w7pZH8gkdhe8sqMaudauvDFTgKzufbQIc0miG9eHb0IdYhZ+wSBI
   rlJWNyuszvT42hwWk/GsojQOnkdW3KDNsHsAQkynSQSwQZUrgnw/2mQ3j
   ziKtPIF/3PoYuWYVEuphiiMZRKvIvBOUbXI8g5aZM2l/hJI3rD4WzUe+h
   x4G4195n2h+x+WJDSb93Ca9J3a6Bh3WeWW2AcTB6qPkzWlCiGntY4XnVT
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="327564197"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="327564197"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 09:33:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="644939028"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="644939028"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 08 Feb 2023 09:33:21 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id DFAD434D; Wed,  8 Feb 2023 19:33:47 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Vincenzo Palazzo <vincenzopalazzodev@gmail.com>,
        Devarsh Thakkar <devarsht@ti.com>,
        Michael Walle <michael@walle.cc>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Dipen Patel <dipenp@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Stefan Schmidt <stefan@datenfreihafen.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Lee Jones <lee@kernel.org>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc-tw-discuss@lists.sourceforge.net,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-input@vger.kernel.org, linux-media@vger.kernel.org,
        linux-wpan@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org,
        brcm80211-dev-list.pdl@broadcom.com,
        SHA-cyfmac-dev-list@infineon.com, linux-arch@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Hu Haowen <src.res@email.cn>,
        Russell King <linux@armlinux.org.uk>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Mun Yew Tham <mun.yew.tham@intel.com>,
        Keerthy <j-keerthy@ti.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alexander Aring <alex.aring@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Arend van Spriel <aspriel@gmail.com>,
        Franky Lin <franky.lin@broadcom.com>,
        Hante Meuleman <hante.meuleman@broadcom.com>,
        Kalle Valo <kvalo@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
        Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v4 07/18] gpiolib: remove asm-generic/gpio.h
Date:   Wed,  8 Feb 2023 19:33:32 +0200
Message-Id: <20230208173343.37582-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208173343.37582-1-andriy.shevchenko@linux.intel.com>
References: <20230208173343.37582-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The asm-generic/gpio.h file is now always included when
using gpiolib, so just move its contents into linux/gpio.h
with a few minor simplifications.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 MAINTAINERS                     |   1 -
 arch/m68k/include/asm/mcfgpio.h |   2 +-
 drivers/gpio/gpio-davinci.c     |   2 -
 drivers/pinctrl/core.c          |   1 -
 include/asm-generic/gpio.h      | 146 --------------------------------
 include/linux/gpio.h            |  94 +++++++++++++++++---
 6 files changed, 85 insertions(+), 161 deletions(-)
 delete mode 100644 include/asm-generic/gpio.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 94971603568b..955a513ac504 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8730,7 +8730,6 @@ F:	Documentation/admin-guide/gpio/
 F:	Documentation/devicetree/bindings/gpio/
 F:	Documentation/driver-api/gpio/
 F:	drivers/gpio/
-F:	include/asm-generic/gpio.h
 F:	include/dt-bindings/gpio/
 F:	include/linux/gpio.h
 F:	include/linux/gpio/
diff --git a/arch/m68k/include/asm/mcfgpio.h b/arch/m68k/include/asm/mcfgpio.h
index 27f32cc81da6..2cefe8445980 100644
--- a/arch/m68k/include/asm/mcfgpio.h
+++ b/arch/m68k/include/asm/mcfgpio.h
@@ -9,7 +9,7 @@
 #define mcfgpio_h
 
 #ifdef CONFIG_GPIOLIB
-#include <asm-generic/gpio.h>
+#include <linux/gpio.h>
 #else
 
 int __mcfgpio_get_value(unsigned gpio);
diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 26b1f7465e09..7fc83057990a 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -24,8 +24,6 @@
 #include <linux/spinlock.h>
 #include <linux/pm_runtime.h>
 
-#include <asm-generic/gpio.h>
-
 #define MAX_REGS_BANKS 5
 #define MAX_INT_PER_BANK 32
 
diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index d6e6c751255f..401886c81344 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -30,7 +30,6 @@
 
 #ifdef CONFIG_GPIOLIB
 #include "../gpio/gpiolib.h"
-#include <asm-generic/gpio.h>
 #endif
 
 #include "core.h"
diff --git a/include/asm-generic/gpio.h b/include/asm-generic/gpio.h
deleted file mode 100644
index 1c910d124423..000000000000
--- a/include/asm-generic/gpio.h
+++ /dev/null
@@ -1,146 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_GENERIC_GPIO_H
-#define _ASM_GENERIC_GPIO_H
-
-#include <linux/types.h>
-#include <linux/errno.h>
-
-#ifdef CONFIG_GPIOLIB
-
-#include <linux/compiler.h>
-#include <linux/gpio/consumer.h>
-
-/*
- * Platforms may implement their GPIO interface with library code,
- * at a small performance cost for non-inlined operations and some
- * extra memory (for code and for per-GPIO table entries).
- */
-
-/*
- * At the end we want all GPIOs to be dynamically allocated from 0.
- * However, some legacy drivers still perform fixed allocation.
- * Until they are all fixed, leave 0-512 space for them.
- */
-#define GPIO_DYNAMIC_BASE	512
-
-struct device;
-struct gpio;
-struct seq_file;
-struct module;
-struct device_node;
-struct gpio_desc;
-
-/* Always use the library code for GPIO management calls,
- * or when sleeping may be involved.
- */
-extern int gpio_request(unsigned gpio, const char *label);
-extern void gpio_free(unsigned gpio);
-
-static inline int gpio_direction_input(unsigned gpio)
-{
-	return gpiod_direction_input(gpio_to_desc(gpio));
-}
-static inline int gpio_direction_output(unsigned gpio, int value)
-{
-	return gpiod_direction_output_raw(gpio_to_desc(gpio), value);
-}
-
-static inline int gpio_set_debounce(unsigned gpio, unsigned debounce)
-{
-	return gpiod_set_debounce(gpio_to_desc(gpio), debounce);
-}
-
-static inline int gpio_get_value_cansleep(unsigned gpio)
-{
-	return gpiod_get_raw_value_cansleep(gpio_to_desc(gpio));
-}
-static inline void gpio_set_value_cansleep(unsigned gpio, int value)
-{
-	return gpiod_set_raw_value_cansleep(gpio_to_desc(gpio), value);
-}
-
-
-/* A platform's <asm/gpio.h> code may want to inline the I/O calls when
- * the GPIO is constant and refers to some always-present controller,
- * giving direct access to chip registers and tight bitbanging loops.
- */
-static inline int __gpio_get_value(unsigned gpio)
-{
-	return gpiod_get_raw_value(gpio_to_desc(gpio));
-}
-static inline void __gpio_set_value(unsigned gpio, int value)
-{
-	return gpiod_set_raw_value(gpio_to_desc(gpio), value);
-}
-
-static inline int __gpio_cansleep(unsigned gpio)
-{
-	return gpiod_cansleep(gpio_to_desc(gpio));
-}
-
-static inline int __gpio_to_irq(unsigned gpio)
-{
-	return gpiod_to_irq(gpio_to_desc(gpio));
-}
-
-extern int gpio_request_one(unsigned gpio, unsigned long flags, const char *label);
-extern int gpio_request_array(const struct gpio *array, size_t num);
-extern void gpio_free_array(const struct gpio *array, size_t num);
-
-/*
- * A sysfs interface can be exported by individual drivers if they want,
- * but more typically is configured entirely from userspace.
- */
-static inline int gpio_export(unsigned gpio, bool direction_may_change)
-{
-	return gpiod_export(gpio_to_desc(gpio), direction_may_change);
-}
-
-static inline void gpio_unexport(unsigned gpio)
-{
-	gpiod_unexport(gpio_to_desc(gpio));
-}
-
-#else	/* !CONFIG_GPIOLIB */
-
-#include <linux/kernel.h>
-
-/* platforms that don't directly support access to GPIOs through I2C, SPI,
- * or other blocking infrastructure can use these wrappers.
- */
-
-static inline int gpio_cansleep(unsigned gpio)
-{
-	return 0;
-}
-
-static inline int gpio_get_value_cansleep(unsigned gpio)
-{
-	might_sleep();
-	return __gpio_get_value(gpio);
-}
-
-static inline void gpio_set_value_cansleep(unsigned gpio, int value)
-{
-	might_sleep();
-	__gpio_set_value(gpio, value);
-}
-
-#endif /* !CONFIG_GPIOLIB */
-
-/*
- * "valid" GPIO numbers are nonnegative and may be passed to
- * setup routines like gpio_request().  only some valid numbers
- * can successfully be requested and used.
- *
- * Invalid GPIO numbers are useful for indicating no-such-GPIO in
- * platform data and other tables.
- */
-
-static inline bool gpio_is_valid(int number)
-{
-	/* only non-negative numbers are valid */
-	return number >= 0;
-}
-
-#endif /* _ASM_GENERIC_GPIO_H */
diff --git a/include/linux/gpio.h b/include/linux/gpio.h
index 2b75017b3aad..d5ce78e2bdd9 100644
--- a/include/linux/gpio.h
+++ b/include/linux/gpio.h
@@ -13,6 +13,7 @@
 #define __LINUX_GPIO_H
 
 #include <linux/errno.h>
+#include <linux/types.h>
 
 /* see Documentation/driver-api/gpio/legacy.rst */
 
@@ -54,26 +55,100 @@ struct gpio {
 };
 
 #ifdef CONFIG_GPIOLIB
-#include <asm-generic/gpio.h>
 
-static inline int gpio_get_value(unsigned int gpio)
+#include <linux/gpio/consumer.h>
+
+/*
+ * "valid" GPIO numbers are nonnegative and may be passed to
+ * setup routines like gpio_request().  Only some valid numbers
+ * can successfully be requested and used.
+ *
+ * Invalid GPIO numbers are useful for indicating no-such-GPIO in
+ * platform data and other tables.
+ */
+static inline bool gpio_is_valid(int number)
+{
+	/* only non-negative numbers are valid */
+	return number >= 0;
+}
+
+/*
+ * Platforms may implement their GPIO interface with library code,
+ * at a small performance cost for non-inlined operations and some
+ * extra memory (for code and for per-GPIO table entries).
+ */
+
+/*
+ * At the end we want all GPIOs to be dynamically allocated from 0.
+ * However, some legacy drivers still perform fixed allocation.
+ * Until they are all fixed, leave 0-512 space for them.
+ */
+#define GPIO_DYNAMIC_BASE	512
+
+/* Always use the library code for GPIO management calls,
+ * or when sleeping may be involved.
+ */
+int gpio_request(unsigned gpio, const char *label);
+void gpio_free(unsigned gpio);
+
+static inline int gpio_direction_input(unsigned gpio)
+{
+	return gpiod_direction_input(gpio_to_desc(gpio));
+}
+static inline int gpio_direction_output(unsigned gpio, int value)
+{
+	return gpiod_direction_output_raw(gpio_to_desc(gpio), value);
+}
+
+static inline int gpio_set_debounce(unsigned gpio, unsigned debounce)
+{
+	return gpiod_set_debounce(gpio_to_desc(gpio), debounce);
+}
+
+static inline int gpio_get_value_cansleep(unsigned gpio)
+{
+	return gpiod_get_raw_value_cansleep(gpio_to_desc(gpio));
+}
+static inline void gpio_set_value_cansleep(unsigned gpio, int value)
 {
-	return __gpio_get_value(gpio);
+	return gpiod_set_raw_value_cansleep(gpio_to_desc(gpio), value);
 }
 
-static inline void gpio_set_value(unsigned int gpio, int value)
+static inline int gpio_get_value(unsigned gpio)
+{
+	return gpiod_get_raw_value(gpio_to_desc(gpio));
+}
+static inline void gpio_set_value(unsigned gpio, int value)
 {
-	__gpio_set_value(gpio, value);
+	return gpiod_set_raw_value(gpio_to_desc(gpio), value);
 }
 
-static inline int gpio_cansleep(unsigned int gpio)
+static inline int gpio_cansleep(unsigned gpio)
 {
-	return __gpio_cansleep(gpio);
+	return gpiod_cansleep(gpio_to_desc(gpio));
 }
 
-static inline int gpio_to_irq(unsigned int gpio)
+static inline int gpio_to_irq(unsigned gpio)
 {
-	return __gpio_to_irq(gpio);
+	return gpiod_to_irq(gpio_to_desc(gpio));
+}
+
+int gpio_request_one(unsigned gpio, unsigned long flags, const char *label);
+int gpio_request_array(const struct gpio *array, size_t num);
+void gpio_free_array(const struct gpio *array, size_t num);
+
+/*
+ * A sysfs interface can be exported by individual drivers if they want,
+ * but more typically is configured entirely from userspace.
+ */
+static inline int gpio_export(unsigned gpio, bool direction_may_change)
+{
+	return gpiod_export(gpio_to_desc(gpio), direction_may_change);
+}
+
+static inline void gpio_unexport(unsigned gpio)
+{
+	gpiod_unexport(gpio_to_desc(gpio));
 }
 
 /* CONFIG_GPIOLIB: bindings for managed devices that want to request gpios */
@@ -88,7 +163,6 @@ int devm_gpio_request_one(struct device *dev, unsigned gpio,
 
 #include <linux/bug.h>
 #include <linux/kernel.h>
-#include <linux/types.h>
 
 struct device;
 struct gpio_chip;
-- 
2.39.1

