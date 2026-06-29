Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179E54071FE
	for <linux-m68k@lists.linux-m68k.org>; Mon, 29 Jun 2026 13:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739623; cv=none; b=mizYzbyQAObB73TVz+wGaGyirH/WOMt74/LYx+qlHpT0imo9VhqrGZuXxuYmOBWBo9S/OcMlCrxVFm3SnprDalmOQ06Qg4CFAuKtB3eu0z0mErQdH2a5WnND7a1i89ZmvkNoj9p0IVIhEnJyNDCwapX9OayBkvKR2iRJzTK3dno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739623; c=relaxed/simple;
	bh=CIFo4F/TjZjdkEK1iFh6Btyi92KncgJpmBu1pe50EbU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QQwg+n3CrZqIZauvNfp02KV7nPwgZjDsrk9bkZRROREtywidpU5EUsovBze7Z8MeG2en9MVgFA05iT+WJJU1MDAhACIzZBMg6wr6uVt/bJnHhrCZv4T+PaXRrGwDmthTJJ2Zf6+1+3oqO3DdzWMm+sEb25GTsKAqO0a/8rvusYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W6BP/j9N; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W6BP/j9N"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A423E42B71;
	Mon, 29 Jun 2026 13:27:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09BAC1F000E9;
	Mon, 29 Jun 2026 13:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782739621;
	bh=gJ4maxiAXobdPO+NS6v/OujD2A0IbSgp/KMy9aEd41M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=W6BP/j9N3GBFGPNigPrWAIbO/5nFDLZKX/6xwWXCjCmGhCj6ArmnL8YaJPj9gS5wF
	 aGTzjEE20dtij3g3R+fUalNIcOfpKF2XbWBnq3dYuE6JYCS0w07Tqt87yunavUwBOT
	 W7G/QPhzqgqU9vmTJl/qfELGhqSD0syCs863CqZk6RaFACSODBgl5VObZNTNmB/YeW
	 7YOElEXVRTbynXC+mNchNlK6pipG/cMpc1sfSf1bpbY4wr0G2gDaPt32O7l0GIVDA1
	 18KsNmI9TxTvS3iwOH1d7qnESZR9uheZvkXM93Rr9VcL+qoICw5cmRG+nXk52msfOU
	 ep2bttKM+1R7A==
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
Subject: [PATCH 02/13] m68k/coldfire: replace linux/gpio.h inclusions
Date: Mon, 29 Jun 2026 15:26:22 +0200
Message-Id: <20260629132633.1300009-3-arnd@kernel.org>
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

linux/gpio.h should no longer be used, convert these instead to
linux/gpio/legacy.h for coldfire.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/m68k/coldfire/device.c     | 2 +-
 arch/m68k/include/asm/mcfgpio.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/coldfire/device.c b/arch/m68k/coldfire/device.c
index 1420bae0964f..9a0258acd998 100644
--- a/arch/m68k/coldfire/device.c
+++ b/arch/m68k/coldfire/device.c
@@ -12,7 +12,7 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/spi/spi.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <linux/fec.h>
 #include <linux/dmaengine.h>
 #include <asm/traps.h>
diff --git a/arch/m68k/include/asm/mcfgpio.h b/arch/m68k/include/asm/mcfgpio.h
index 7103cfa4edb6..29726aa40eb6 100644
--- a/arch/m68k/include/asm/mcfgpio.h
+++ b/arch/m68k/include/asm/mcfgpio.h
@@ -16,7 +16,7 @@ int __mcfgpio_request(unsigned gpio);
 void __mcfgpio_free(unsigned gpio);
 
 #ifdef CONFIG_GPIOLIB
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #else
 
 /* our alternate 'gpiolib' functions */
-- 
2.39.5

