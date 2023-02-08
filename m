Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BBADC64EC7
	for <linux-m68k@archiver.kernel.org>; Wed,  8 Feb 2023 17:35:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231942AbjBHRfX (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 8 Feb 2023 12:35:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232298AbjBHRfH (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 8 Feb 2023 12:35:07 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D761F4DBDF
        for <linux-m68k@lists.linux-m68k.org>; Wed,  8 Feb 2023 09:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675877657; x=1707413657;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n2JggXg7c02DPXLMJdm8s8NdvcTFU3e1l9o8DD11R0M=;
  b=ntgrAbHYd8WGzkoVwfaMKcD8ecfwtyZgRmsFU2BoZ71FlOakhIyhEluI
   7cC4tgHLhziHhc7e9ySyanQDod4jfSav3rClHS7Pg+sbl05W0MdChpFL+
   eR+yHqFCMp440Z3mYkA5d/x6aHddcJMO7PShcb06AzI5/CquXgl/IYwDH
   oboXcwHQYtT7guHCBegWcOSRM8B9OgumfVuW0pNzGk9xiEbzAKi1UhVWf
   4uVb61+lgScxb7QwB352rL1dMxIj39D/eKgG3f3DKkpvenrh5Ro+uxDzt
   koFKI1OSLPZVJfgVAfpK4HeqifRzsLaRgbn4ms3n7n64FJzbiivxmoykk
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="310225625"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="310225625"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 09:33:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="660703988"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="660703988"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 08 Feb 2023 09:33:28 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 3C05D4BE; Wed,  8 Feb 2023 19:33:48 +0200 (EET)
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
        Frank Rowand <frowand.list@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 12/18] gpio: aggregator: Add missing header(s)
Date:   Wed,  8 Feb 2023 19:33:37 +0200
Message-Id: <20230208173343.37582-13-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208173343.37582-1-andriy.shevchenko@linux.intel.com>
References: <20230208173343.37582-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Do not imply that some of the generic headers may be always included.
Instead, include explicitly what we are direct user of.

While at it, drop unused linux/gpio.h and split out the GPIO group of
headers.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/gpio-aggregator.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 6d17d262ad91..20a686f12df7 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -10,19 +10,20 @@
 #include <linux/bitmap.h>
 #include <linux/bitops.h>
 #include <linux/ctype.h>
-#include <linux/gpio.h>
-#include <linux/gpio/consumer.h>
-#include <linux/gpio/driver.h>
-#include <linux/gpio/machine.h>
 #include <linux/idr.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/overflow.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/string.h>
 
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/machine.h>
+
 #define AGGREGATOR_MAX_GPIOS 512
 
 /*
-- 
2.39.1

