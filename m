Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A142D3B7767
	for <linux-m68k@lists.linux-m68k.org>; Fri, 10 Jul 2026 21:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783718460; cv=none; b=AlZxf/AavFneRy/j2oht9zRBqfs6mxa9OOM3Q0MBeqCDsWIC6HrfVJEq/Z5N/SjmQkKOH8QENgw55Qnl0ILXdNB7mMjPXrCoLqaIUNP8XsgY1cR6zLowyn6LlAcJ7XXdsZcAyyFUoCgNAjiWqSNAX2eL2NEVn+2NSEtMmvTW664=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783718460; c=relaxed/simple;
	bh=6jteeCAcT3+N3BA7R9A6RQ5K/uVNwWbuABYnr08/LWw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JDQonYk3ra3HlTRADbAP2ZubtZh0YO52j57o6JzScqVDIdMX2kLhMJ5hK40cHxHBve9RWNqZLBHoQQNNXo1rvYOG9BChT8+psN5VS+9aborawQ43T1lE3Lyrvy23BZ89XW/ny9pUasvuNNk0eUWhWNTZNk4NmB+RXS+j8DQ/3yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HGyes/oH; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HGyes/oH"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B3624156D;
	Fri, 10 Jul 2026 21:20:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67B511F00A3D;
	Fri, 10 Jul 2026 21:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783718458;
	bh=b37fFY1bviqEnaLlbm41fcnqbx2JSx0mhMImAdcr6E0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HGyes/oHC8M+ATz3uD0lP9e+9cgWWjj6YY6Sz2mUhzsz6RPvOZG4q+VrnxpwAXGQW
	 6dJ2OVFIVAhWXAlxy3CCmtli9rDf4UfOZqtn3W8PENfRMoxJ2Ux3TvRaPMfUpSyhQU
	 xJuwmr4i7/Jz1E7ZzsAYwZQPrKp3C8p1Ad8ukCLGadL5rQwJ6p2A5Rr0Dsih8utYRe
	 SWfpYfCkS0cKQ2J461R6NUUdFZOyfbxio9fhJC4oZ59lGcq0f+BecEOa4sgYTj4bCn
	 hFpCDPCqBfseIR7u3HiwD10EIK4KXsm2m+0344hw/dScFOZD2BG9zHV/t2cMk0sJU+
	 r6lNKDBcS9llw==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-gpio@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-phy@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 08/10] phy: replace linux/gpio.h inclusions
Date: Fri, 10 Jul 2026 23:19:53 +0200
Message-Id: <20260710211954.1373336-9-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260710211954.1373336-1-arnd@kernel.org>
References: <20260710211954.1373336-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

linux/gpio.h should no longer be used, so remove those and
make sure linux/gpio/consumer.h is included instead.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c | 1 -
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 2 +-
 drivers/phy/ti/phy-j721e-wiz.c            | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c b/drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c
index 8473fa574529..171bf097a8b8 100644
--- a/drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c
+++ b/drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c
@@ -3,7 +3,6 @@
 
 #include <linux/delay.h>
 #include <linux/extcon-provider.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index fba35510d88c..d0d736a30d08 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -11,7 +11,7 @@
 #include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/mfd/syscon.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
diff --git a/drivers/phy/ti/phy-j721e-wiz.c b/drivers/phy/ti/phy-j721e-wiz.c
index 7531a8a04912..1f5dba49ace4 100644
--- a/drivers/phy/ti/phy-j721e-wiz.c
+++ b/drivers/phy/ti/phy-j721e-wiz.c
@@ -11,7 +11,6 @@
 #include <linux/slab.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/io.h>
 #include <linux/module.h>
-- 
2.39.5

