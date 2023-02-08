Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E759C636CC
	for <linux-m68k@archiver.kernel.org>; Wed,  8 Feb 2023 17:38:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbjBHRig (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 8 Feb 2023 12:38:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231918AbjBHRgs (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 8 Feb 2023 12:36:48 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5499518E4
        for <linux-m68k@lists.linux-m68k.org>; Wed,  8 Feb 2023 09:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675877675; x=1707413675;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EMgvq11k4/U6XFohBqROl1X58vyMfMqw1Azfwz74ROY=;
  b=CYPYn4o5wK8e8SWxw9D0qx2ZaX9dGLqAYEhCTpLrVUIRhzwz6KTTbVGy
   g6UKqgswpX9SEoC/t6WcwLtHztBdZbm80NQMciNK8Makvyrk7Ff3fFo3I
   meOGWp1GeDS/Pp0bou2VV6651if7pdT+lXv7KUXU+0uxFjgiy+gDyxjFp
   OHn0V3w7YUl7ntTO+Tpur+1jwvuBztc4QsHOSjd6ExsnmmaeDRqFzidF6
   jBp1S0zKPXy+UPg3s1n+zjO8tGhYxS8xrx1jn3s20Z76uHBtMI32W+uev
   oalw+4vwQeSI+kDdLtydlFolZllpbCskakwCwtJ5F1PdHLIxf3OUG8/92
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="310225671"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="310225671"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 09:33:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="660703990"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="660703990"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 08 Feb 2023 09:33:28 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 4A69C4C9; Wed,  8 Feb 2023 19:33:48 +0200 (EET)
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
Subject: [PATCH v4 13/18] gpio: reg: Add missing header(s)
Date:   Wed,  8 Feb 2023 19:33:38 +0200
Message-Id: <20230208173343.37582-14-andriy.shevchenko@linux.intel.com>
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

While at it, split out the GPIO group of headers.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-reg.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-reg.c b/drivers/gpio/gpio-reg.c
index d35169bde25a..73c7260d89c0 100644
--- a/drivers/gpio/gpio-reg.c
+++ b/drivers/gpio/gpio-reg.c
@@ -4,11 +4,19 @@
  *
  * Copyright (C) 2016 Russell King
  */
-#include <linux/gpio/driver.h>
-#include <linux/gpio/gpio-reg.h>
+#include <linux/bits.h>
+#include <linux/container_of.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/errno.h>
 #include <linux/io.h>
+#include <linux/irqdomain.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/types.h>
+
+#include <linux/gpio/driver.h>
+#include <linux/gpio/gpio-reg.h>
 
 struct gpio_reg {
 	struct gpio_chip gc;
-- 
2.39.1

