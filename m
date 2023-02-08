Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E25F2C05027
	for <linux-m68k@archiver.kernel.org>; Wed,  8 Feb 2023 17:36:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232012AbjBHRgs (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 8 Feb 2023 12:36:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232020AbjBHRfQ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 8 Feb 2023 12:35:16 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1D42521C4
        for <linux-m68k@lists.linux-m68k.org>; Wed,  8 Feb 2023 09:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675877660; x=1707413660;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=89Ua2SwK+9eoP7ii20ihjA/BcfunvekbP9EUK6guMxA=;
  b=V2EQsgrJ7nyJ2xzDTrcHOlJ1x4s7WnpJOX4Sk2rIOtKBL+47De044Xi8
   EHpP/5HNrVPdMNu9hesYiH9kwzcWR8YkBpyVq3rFaGVib8oUOsxzaXKSU
   /0wocNh00LV6+iGsk8+sls5BCmnNypJPTZl6ivw0UK1R3fgIZ4tEWQqx3
   tSXJw5EPs6iWYzzmlqoKed8L+7ng7hMmnYiDv6Icg4e9CZGlU4sL03j36
   +n80Rtn2oGDNSPHuAsNAzOudd9F9X1LZcd45+xY7oEJSEGkgIWM4gp3kV
   LPfHqMtdZIrgAvd4CQx5KTYD7W6ATENS/hs2L7YLj3EX23vIyNruNVwSa
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="310225645"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="310225645"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 09:33:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="697723069"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="697723069"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 08 Feb 2023 09:33:28 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 694D3590; Wed,  8 Feb 2023 19:33:48 +0200 (EET)
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
Subject: [PATCH v4 15/18] gpiolib: Drop unused forward declaration from driver.h
Date:   Wed,  8 Feb 2023 19:33:40 +0200
Message-Id: <20230208173343.37582-16-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208173343.37582-1-andriy.shevchenko@linux.intel.com>
References: <20230208173343.37582-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

There is no struct device_node pointers anywhere in the header,
drop unused forward declaration.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/gpio/driver.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index ccd8a512d854..262a84ce9bcb 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -16,7 +16,6 @@
 
 struct gpio_desc;
 struct of_phandle_args;
-struct device_node;
 struct seq_file;
 struct gpio_device;
 struct module;
-- 
2.39.1

