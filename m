Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D493A4071FF
	for <linux-m68k@lists.linux-m68k.org>; Mon, 29 Jun 2026 13:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739651; cv=none; b=GhuGjiY2RTnM+6zM/t0v1bPaZWW//iX6Z9jMHVCE0i/gHlY4CEA+32vjnI1r2onxr85dxwL/HksQfdfagaOGSKiIDRvZx0z54uPGGEVsz3rwKTTUwXk1I16eqSXwa+49lL6z0DQS9u0UYkvgSc7f4S527AQiGKR1uBPP0Vo6nWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739651; c=relaxed/simple;
	bh=RAP4+Nkt32LFcpYRq+QfiZIEhW5kj+D8pewdiemsoN0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p8XCJJuDM/C69G3AAeDRfhdRKwXdghnvMWC2LJl4sDkjLw62sqJu6VEcklXNlb/2ylHbFr0Nz8So81rofTFGxubHeQ3AkK/7NGVchj3pGhO0HEQAVi1Bs1Zu9XX96QKfpPYcnl8AVLsIYjAdrDHSXAuTGDLn7bB9dxsPh9s4oT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FK3JXy8U; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FK3JXy8U"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9737A41A3A;
	Mon, 29 Jun 2026 13:27:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1AC31F000E9;
	Mon, 29 Jun 2026 13:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782739649;
	bh=eOck3k2GHZO/S3AlTEUqocjsRNiDXqKCWowdRT7XkWQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FK3JXy8U0qoXEQw7Ia7A2VdPMA6etYZxLO5R1hO0eG2bDFs9j3KWyic/u9Tbb30/T
	 0i4fbanW/FC5tBTOgKJSvN1vOquOpY2w/EZ4GNYNP/mk9OSCxR0jP9MBWkCjojecAM
	 QYf4OTn1oTrUX5tBhX91NPhYsWVc784JDB962NXCnay9DMWPkS4ab9jv6tRfUcz040
	 umhw+xmYJT3fQVGynYhdDfPo+x9vMpMWCnnSbr41bSHpwTdm0N8kL72KM0yqxHw5g3
	 rOigYSqSChhHf+P+lMgYawL7s91VVuZ6V+JINIHcElahI3LOVWmhse0Bb5sE7lMy+C
	 ewwreLb4k13Dg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <brgl@kernel.org>,
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
	Linus Walleij <linusw@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-phy@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 06/13] [net-next] net: replace linux/gpio.h inclusions
Date: Mon, 29 Jun 2026 15:26:26 +0200
Message-Id: <20260629132633.1300009-7-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260629132633.1300009-1-arnd@kernel.org>
References: <20260629132633.1300009-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

linux/gpio.h should no longer be used, change these in drivers/net to
linux/gpio/consumer.h where possible, with b53 being the only one still
using linux/gpio/legacy.h.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/dsa/b53/b53_priv.h                       | 3 ++-
 drivers/net/dsa/microchip/ksz8.c                     | 2 +-
 drivers/net/ethernet/allwinner/sun4i-emac.c          | 2 +-
 drivers/net/ethernet/apm/xgene/xgene_enet_main.c     | 2 +-
 drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c | 2 +-
 drivers/net/phy/mdio_device.c                        | 2 +-
 6 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_priv.h b/drivers/net/dsa/b53/b53_priv.h
index cd27a7344e89..29cca7945df7 100644
--- a/drivers/net/dsa/b53/b53_priv.h
+++ b/drivers/net/dsa/b53/b53_priv.h
@@ -23,6 +23,7 @@
 #include <linux/mutex.h>
 #include <linux/phylink.h>
 #include <linux/etherdevice.h>
+#include <linux/gpio/consumer.h>
 #include <net/dsa.h>
 
 #include "b53_regs.h"
@@ -467,7 +468,7 @@ static inline void b53_arl_search_read(struct b53_device *dev, u8 idx,
 #ifdef CONFIG_BCM47XX
 
 #include <linux/bcm47xx_nvram.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <bcm47xx_board.h>
 static inline struct gpio_desc *b53_switch_get_reset_gpio(struct b53_device *dev)
 {
diff --git a/drivers/net/dsa/microchip/ksz8.c b/drivers/net/dsa/microchip/ksz8.c
index 138f2ab0774e..586916570a84 100644
--- a/drivers/net/dsa/microchip/ksz8.c
+++ b/drivers/net/dsa/microchip/ksz8.c
@@ -18,7 +18,7 @@
 #include <linux/delay.h>
 #include <linux/dsa/ksz_common.h>
 #include <linux/export.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/if_vlan.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
diff --git a/drivers/net/ethernet/allwinner/sun4i-emac.c b/drivers/net/ethernet/allwinner/sun4i-emac.c
index fc7341a5cbb7..42174249ef61 100644
--- a/drivers/net/ethernet/allwinner/sun4i-emac.c
+++ b/drivers/net/ethernet/allwinner/sun4i-emac.c
@@ -15,7 +15,7 @@
 #include <linux/clk.h>
 #include <linux/etherdevice.h>
 #include <linux/ethtool.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/mii.h>
diff --git a/drivers/net/ethernet/apm/xgene/xgene_enet_main.c b/drivers/net/ethernet/apm/xgene/xgene_enet_main.c
index 3b2951030a38..507db46daf2b 100644
--- a/drivers/net/ethernet/apm/xgene/xgene_enet_main.c
+++ b/drivers/net/ethernet/apm/xgene/xgene_enet_main.c
@@ -7,7 +7,7 @@
  *	    Keyur Chudgar <kchudgar@apm.com>
  */
 
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include "xgene_enet_main.h"
 #include "xgene_enet_hw.h"
 #include "xgene_enet_sgmac.h"
diff --git a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
index 48b94ce77490..88c5c52e0e38 100644
--- a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
+++ b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
@@ -16,7 +16,7 @@
 #include <linux/net_tstamp.h>
 #include <linux/ptp_classify.h>
 #include <linux/ptp_pch.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 
 #define PCH_GBE_MAR_ENTRIES		16
 #define PCH_GBE_SHORT_PKT		64
diff --git a/drivers/net/phy/mdio_device.c b/drivers/net/phy/mdio_device.c
index 56080d3d2d25..a18263d5bb02 100644
--- a/drivers/net/phy/mdio_device.c
+++ b/drivers/net/phy/mdio_device.c
@@ -8,7 +8,7 @@
 
 #include <linux/delay.h>
 #include <linux/errno.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio/consumer.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
-- 
2.39.5

