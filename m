Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D2A409134
	for <linux-m68k@lists.linux-m68k.org>; Mon, 29 Jun 2026 13:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739693; cv=none; b=GNDEkTk2Y1mk4KkTgsO62ZGi8Hr1cFbP/1H7SQFAKEVqAGIZ4HF/9Nu2EQGTbZHMZ3NJRYyUQ0GTC8GH5sY6De2MZvbXixGUJLHT5j8k+pEf/X5GbusGRHlLcmnK19tpg6Cb+r1TPSEUjNbbkWznQqmrmtNt9SkNymFG2ppEfRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739693; c=relaxed/simple;
	bh=GNKP1XlJXRKFJBUq6P1pWbPm0LmF/k3EOFPIlsHhd0M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nJ9CaoGUmGw88VGmMeXUU+vMA5imQv5h2K2/bBORIzdlm/p8K/IqeL9YIywSULqHdjuCUVXKxt4BAzjxPi4Lb7mrB5nCuiiMEDD9A4e/hXF8AkDd4zxAz1XWDNaRZrXnlHkaj1luR8gUJ6iEJM9q2W9r2PpYotok2H9g/YWGdvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l+Bjn0TW; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l+Bjn0TW"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CFDF460008;
	Mon, 29 Jun 2026 13:28:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 090611F000E9;
	Mon, 29 Jun 2026 13:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782739691;
	bh=AbxQxhI8jkWFpggqqu0BJxCVlmjNB8rVpnB3U/bG9/8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=l+Bjn0TWuJNScCkv2eF3hy4+9W/x+N/FOa0Y6J7K1PFzRKxbGv4SQUtde7aDOLy8B
	 jZkrFSnHT6Vb61R5R/ETfTSspiaEh+nheFllga8qyHXfV3yUxDZSenK4zIhVp2ALI+
	 nzRCJXHiieCva9BC4U/A20qdEbhgbI/dhbWcdg/Jt7oAcq2GDapzVbIFKbACjvCd9P
	 uYVxIeyS3AcefXCPNeybaedPhtAmuQ8NxzQKp3Kq4z2cU2T7FaobBGokfDAJ0YP4jO
	 D6rFiTomsxEP9rkITDZ/6mMxQ/dBT7Rjpc7U1oDKGDNycGwvTBYGhfgJLQfBm3ssL7
	 lcm3OEdYqXtkw==
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
Subject: [PATCH 12/13] gpib: gpio: replace linux/gpio.h inclusion
Date: Mon, 29 Jun 2026 15:26:32 +0200
Message-Id: <20260629132633.1300009-13-arnd@kernel.org>
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

linux/gpio.h is going away, so use linux/gpio/consumer.h instead.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpib/gpio/gpib_bitbang.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpib/gpio/gpib_bitbang.c b/drivers/gpib/gpio/gpib_bitbang.c
index 0e227980b493..2e8d895db06a 100644
--- a/drivers/gpib/gpio/gpib_bitbang.c
+++ b/drivers/gpib/gpio/gpib_bitbang.c
@@ -64,7 +64,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 #include <linux/gpio/machine.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/irq.h>
 
 static int sn7516x_used = 1, sn7516x;
-- 
2.39.5

