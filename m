Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E709C64EC5
	for <linux-m68k@archiver.kernel.org>; Wed,  8 Feb 2023 17:35:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231911AbjBHRfW (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 8 Feb 2023 12:35:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232215AbjBHRei (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 8 Feb 2023 12:34:38 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8565651C4F
        for <linux-m68k@lists.linux-m68k.org>; Wed,  8 Feb 2023 09:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675877653; x=1707413653;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NhIi3obsHF0CJ3XpiIKm/sUF6vE8x1aZjthOZQd64ls=;
  b=FYQIeZAsqAH4VMwvmD+QGegEjg6LMuwCRbijbghmZh5JMJZMPOtevfwc
   hfF3GegBqHu7I/XTVbnQr+BWpbJk1UBajYGEEIyGGgGdfVooV4MiblyMS
   WMaDpofUTieW/GVvly5Z6wDfh5WsjeLaozSeVvLtfYtBzEVUXQLgHKaN6
   jqtw27/+K5utJiMn6o//3Iky74RboVnUdQxmVUW6sLVvQEus/iio9NOS2
   WPcOBQH7/1fd/KfjTHVxMT9qJFws0WMaX7fwbpnHZP5zQk2k0zl+lK8AD
   o+ldZgOto4HCzWwhZ0B8TnY/yhiuj3t3nMY+g4+7fbWSbMVLHsPtdZuNN
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="310225572"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="310225572"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 09:33:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="660703982"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="660703982"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 08 Feb 2023 09:33:26 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 1E8DC3F1; Wed,  8 Feb 2023 19:33:48 +0200 (EET)
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
Subject: [PATCH v4 10/18] gpiolib: split linux/gpio/driver.h out of linux/gpio.h
Date:   Wed,  8 Feb 2023 19:33:35 +0200
Message-Id: <20230208173343.37582-11-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208173343.37582-1-andriy.shevchenko@linux.intel.com>
References: <20230208173343.37582-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

Almost all gpio drivers include linux/gpio/driver.h, and other
files should not rely on includes from this header.

Remove the indirect include from here and include the correct
headers directly from where they are used.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Lee Jones <lee@kernel.org>
---
 arch/arm/mach-omap1/irq.c                              | 1 +
 arch/arm/mach-orion5x/board-rd88f5182.c                | 1 +
 arch/arm/mach-sa1100/assabet.c                         | 1 +
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/led.c | 1 +
 include/linux/mfd/ucb1x00.h                            | 1 +
 5 files changed, 5 insertions(+)

diff --git a/arch/arm/mach-omap1/irq.c b/arch/arm/mach-omap1/irq.c
index 9ccc784fd614..bfc7ab010ae2 100644
--- a/arch/arm/mach-omap1/irq.c
+++ b/arch/arm/mach-omap1/irq.c
@@ -41,6 +41,7 @@
 #include <linux/sched.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/irqdomain.h>
 
 #include <asm/irq.h>
 #include <asm/exception.h>
diff --git a/arch/arm/mach-orion5x/board-rd88f5182.c b/arch/arm/mach-orion5x/board-rd88f5182.c
index 596601367989..1c14e49a90a6 100644
--- a/arch/arm/mach-orion5x/board-rd88f5182.c
+++ b/arch/arm/mach-orion5x/board-rd88f5182.c
@@ -9,6 +9,7 @@
 #include <linux/gpio.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pci.h>
 #include <linux/irq.h>
diff --git a/arch/arm/mach-sa1100/assabet.c b/arch/arm/mach-sa1100/assabet.c
index 2eba112f2ad8..d000c678b439 100644
--- a/arch/arm/mach-sa1100/assabet.c
+++ b/arch/arm/mach-sa1100/assabet.c
@@ -10,6 +10,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/errno.h>
+#include <linux/gpio/driver.h>
 #include <linux/gpio/gpio-reg.h>
 #include <linux/gpio/machine.h>
 #include <linux/gpio_keys.h>
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/led.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/led.c
index 9540a05247c2..89c8829528c2 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/led.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/led.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <net/mac80211.h>
 #include <linux/bcma/bcma_driver_chipcommon.h>
+#include <linux/gpio.h>
 #include <linux/gpio/driver.h>
 #include <linux/gpio/machine.h>
 #include <linux/gpio/consumer.h>
diff --git a/include/linux/mfd/ucb1x00.h b/include/linux/mfd/ucb1x00.h
index 43bcf35afe27..ede237384723 100644
--- a/include/linux/mfd/ucb1x00.h
+++ b/include/linux/mfd/ucb1x00.h
@@ -10,6 +10,7 @@
 #include <linux/device.h>
 #include <linux/mfd/mcp.h>
 #include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <linux/mutex.h>
 
 #define UCB_IO_DATA	0x00
-- 
2.39.1

