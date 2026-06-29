Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F08408602
	for <linux-m68k@lists.linux-m68k.org>; Mon, 29 Jun 2026 13:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739678; cv=none; b=QIqnAFnT951fEMIskCBOe/nJfVgnLYpnvJSeigfosl65ma1igYdF2v7fQyAiTk6IjKnMD8CvYZlIoOqUIwD8AJxiTZ7tmUmCPQ8C/yB9t5EES/gZvvC2W+5RTC3RwKMKBqpu9UhPFmNbbtR0sP/Fma1oOOeLfkklYCRmBeDLQDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739678; c=relaxed/simple;
	bh=72uRd1AeE4T9AuRdko8PY70YVYhCdOP3faXv7Q9n66s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QI9V6Rs/8okEU4LuC+vG5DQJwQ1RYhggL3v/Q0s6OCucTmQaY8yUz6MFiYvcmCTtjZxUuL1E53kt3CVZnqkYY1MZdhbAs9OSTY6cl6ZFIwLNg3YfDfUxvrby5J5QPU0vpMjmXeAm45Bj+8uJN4W/YSkRk4Bj2foU0OPRSyk+kA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TZSmSeEL; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TZSmSeEL"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A6F3941B4D;
	Mon, 29 Jun 2026 13:27:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B4591F000E9;
	Mon, 29 Jun 2026 13:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782739677;
	bh=0ZjvdwSdJ07ba044RbmZ4lMBBWJONpd196bqsB07784=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TZSmSeEL8sgvKsxzLVBT5TAIjiq50BaPGDH7s6aEVKHGJRfuuPn4I/iMdFZDjO53s
	 jqFhtjgdtyqoLwVzS4xubyYSELpN36RhrBRpwJo8DQkOgWrrOPC+z26qkMypse9F5k
	 JeSFvd8+QvoAjI4e1Adm9VOXH218T6FSYJ+f0PJr+Un77+NcEmdFFDtWjbIW0XjWJL
	 HqFuYsCmeYlDnygLpo1DE4N4k7c710ECsxCTB4zSt8LxG2F8o5RGv1WoM63YONijSy
	 V9+fsbUjy3dn8OowicDs5tvTDj4qE5Ymu09oumTTMON9uiDZ6FQY5x//Ts+fT2oR8n
	 KW1WQ8U7hPrhg==
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
Subject: [PATCH 10/13] media: replace linux/gpio.h inclusions
Date: Mon, 29 Jun 2026 15:26:30 +0200
Message-Id: <20260629132633.1300009-11-arnd@kernel.org>
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
either linux/gpio/consumer.h or linux/gpio/legacy.h as needed.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/pci/ddbridge/ddbridge.h                 | 2 +-
 drivers/media/platform/samsung/s3c-camif/camif-core.c | 2 +-
 drivers/media/usb/em28xx/em28xx-dvb.c                 | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/ddbridge/ddbridge.h b/drivers/media/pci/ddbridge/ddbridge.h
index f01ecdb0b627..cf50898f9a92 100644
--- a/drivers/media/pci/ddbridge/ddbridge.h
+++ b/drivers/media/pci/ddbridge/ddbridge.h
@@ -14,7 +14,7 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/dvb/ca.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
diff --git a/drivers/media/platform/samsung/s3c-camif/camif-core.c b/drivers/media/platform/samsung/s3c-camif/camif-core.c
index 221e3c447f36..c3d059224844 100644
--- a/drivers/media/platform/samsung/s3c-camif/camif-core.c
+++ b/drivers/media/platform/samsung/s3c-camif/camif-core.c
@@ -12,7 +12,7 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/errno.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
diff --git a/drivers/media/usb/em28xx/em28xx-dvb.c b/drivers/media/usb/em28xx/em28xx-dvb.c
index 938f1980d448..8482fc4045ea 100644
--- a/drivers/media/usb/em28xx/em28xx-dvb.c
+++ b/drivers/media/usb/em28xx/em28xx-dvb.c
@@ -29,7 +29,7 @@
 #include <media/dmxdev.h>
 #include <media/tuner.h>
 #include "tuner-simple.h"
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 
 #include "lgdt330x.h"
 #include "lgdt3305.h"
-- 
2.39.5

