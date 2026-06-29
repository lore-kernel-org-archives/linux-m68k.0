Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884004071CA
	for <linux-m68k@lists.linux-m68k.org>; Mon, 29 Jun 2026 13:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739686; cv=none; b=scH58J0SuPq9FN50ItpNoBAL2sNNPlm2hsb4ZdZnZbkWYe3W/EMlVydSNuWeBYgX26/kFVsTZP7Gsd9aelW+X/S8uMelxPR0agJ/wbZdauDT7Bkuy/mDuK0MqyMJ9wgVh7sk9l6XL7HCwsUUaWtY/R/j9FiJ3CbCRhL2hEnzU8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739686; c=relaxed/simple;
	bh=obNPcB+BaZsnpRHlcsBGxQCruLKZ5xXtfc+XJI2PSpg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d8WiENgy7iSiVAy3bSlvEPe7+yKOpUsuAgQUWxSz0q/OVd50V7wKu7p09rc4sNhhGKlE41n2U99J1QPjS8unRS+LA0OKIGuZO/IxWG2v/aV910nal0IwL+qaJvfS+apjgwehtXBEYmU/aWnQ5gpe7Heijtxu838DXJdntKc/jJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MdfFbWJ+; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MdfFbWJ+"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D0C60600AA;
	Mon, 29 Jun 2026 13:28:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 095261F00A3D;
	Mon, 29 Jun 2026 13:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782739684;
	bh=NrdLJGMFs8wtvc4BJiEXLk7S18TXVPww8hdTab/uPp0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MdfFbWJ+eRFMBqPEa0RaoTx93bwz14wfILPGSeLWLBjlLfc3/sLoXDbWrIj5zm02+
	 Cf2hMRjwSDX/HAe9LEvEYerCFkB4Bk3PXB3dCOCCjACDoUXoZNbg8bIRYUlO4u3fYA
	 d+1jW1L/FhTyHKMjueY3fNJ+ZEn6tUHmVKdynuygFjwpm+i13U8Rgg7ESeNFEllxMf
	 MEenB1SREnePNOyBX0VPdLwMnOs4/5gV6TKMZk/7FolVupBaKJWIqfsANDATpC5cz+
	 GtYRhxo3yuIHrBGuNzZr02FwMfR28H0gTO6X9o6PxTogIxu8yfoYD9nvIRoXYg4F/d
	 k2IOqV+EaupRw==
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
Subject: [PATCH 11/13] Input: matrix_keyboard - replace linux/gpio.h inclusion
Date: Mon, 29 Jun 2026 15:26:31 +0200
Message-Id: <20260629132633.1300009-12-arnd@kernel.org>
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
 drivers/input/keyboard/matrix_keypad.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/matrix_keypad.c b/drivers/input/keyboard/matrix_keypad.c
index e50a6fea9a60..98d0269a978f 100644
--- a/drivers/input/keyboard/matrix_keypad.c
+++ b/drivers/input/keyboard/matrix_keypad.c
@@ -16,7 +16,7 @@
 #include <linux/interrupt.h>
 #include <linux/jiffies.h>
 #include <linux/module.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/input/matrix_keypad.h>
 #include <linux/slab.h>
 #include <linux/of.h>
-- 
2.39.5

