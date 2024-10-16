Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0127165EF8
	for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Oct 2024 07:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729063507; cv=none; b=tu54Y8mkBE7ZdcGudAG8N8Tli+HvDLLSMgqHkqcwHap5JrkMHfxwm6nEIQ1F111+xnbBU5UveuWOaEX5v6Wu0mY5rhtW/NArXdbCRchiw3/dIcj8wLnCJ0xrqcCEKX9EmG5kyars6K4no7uStn2H+e/PMMQis3u5MuJckefyxGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729063507; c=relaxed/simple;
	bh=sQtppI46jofVYXJMLskwbpEoElbEeD/xky33S8tLjVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SF2ClZqFM7PFw8n7l2WxQCKWqBud4zFDv9m02GvufOCMqKveJpBvKXCtKxiPxsDue1ouXWTtUsRt+KSzbfZKMx/rGhdyL8DagTQ7jEpfoJo+RhjBzusKPDRfQ/wnvWDpJ2B4BPz8Elhz3UlUlH6T8qjUOEzCMadhoD6oz2TLP2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=none smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=hYiFKKJ2; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="hYiFKKJ2"
Received: by mail.gandi.net (Postfix) with ESMTPSA id B470A20003;
	Wed, 16 Oct 2024 07:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1729063504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JtlodXS/oAXgkasT5Pwo3ru1/a/PoSkgKb7TEH8Zw4I=;
	b=hYiFKKJ2rAg2XqkCFzdnubpTolhz0EbgecrMepRbAvKfBsvAQmXgAwKvHHWd3me4bvzTPs
	Xqbl5Iwj+I0s4QgJZgBySyFvI5LxjWVtDf19QTWF81KD/yARSJv80wj9jmP6p8Oxua0OXT
	Xn8Q8A3tgCGtVP3zDixWq9aTD/yanCej6GHYf9ArZYPJ3JrpG8x9q9257hAxyouOc0u5UD
	sCe63Bco0AyHGMDLG3wlwYNyjS2KqBlF6Ad4CxHTj7qHzDVhFTWJr+kMPaJ18u0HR4imFV
	EJewDZ0QcrKsEjG5TKcTp36rXlzwJQeh5VuDtkJHbN+8LaF4hFy2rvx5GB2RcA==
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Date: Wed, 16 Oct 2024 09:24:35 +0200
Subject: [PATCH v2] m68k: mcfgpio: Fix incorrect register offset for
 CONFIG_M5441x
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241016-fix-m5441x-gpio-v2-1-f419777bc90d@yoseli.org>
X-B4-Tracking: v=1; b=H4sIADJqD2cC/3WNQQqDMBBFr1Ky7hQTo9Wueo/iItFRB6qRGRFFv
 Huj+y7f/zzergSZUNTrtivGhYTCGMHcb6ru3dghUBNZmcRYnegcWlphyKzVK3QTBcD8qYs0zfL
 SWxUt7wTBsxvr/vQGJzPyeUyM0b1SnypyTzIH3q7yos/1f2TRoCFxpvTYNtYXzXsLgl96BO5Ud
 RzHD54BLCTIAAAA
To: Geert Uytterhoeven <geert@linux-m68k.org>, 
 Greg Ungerer <gerg@uclinux.org>, Steven King <sfking@fdwdc.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729063503; l=1330;
 i=jeanmichel.hautbois@yoseli.org; s=20240925; h=from:subject:message-id;
 bh=sQtppI46jofVYXJMLskwbpEoElbEeD/xky33S8tLjVU=;
 b=nErw8hBszYoZVMNgR3jA4KRGpb3OnUepNNvAWg10/rzM3OfamRR9Ddn9SOyHaGMt/yJWWu5ch
 O7XPafuwn2mBDSri7vwFyueHsKwx2FJa2DCGtMgYIZF9wYh9ql5QKQR
X-Developer-Key: i=jeanmichel.hautbois@yoseli.org; a=ed25519;
 pk=MsMTVmoV69wLIlSkHlFoACIMVNQFyvJzvsJSQsn/kq4=
X-GND-Sasl: jeanmichel.hautbois@yoseli.org

Fix a typo in the CONFIG_M5441x preprocessor condition, where the GPIO
register offset was incorrectly set to 8 instead of 0. This prevented
proper GPIO configuration for m5441x targets.

Fixes: bea8bcb12da0 ("m68knommu: Add support for the Coldfire m5441x.")
Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
Changes in v2:
- The commit fixed is not the one in v1
- Link to v1: https://lore.kernel.org/r/20241016-fix-m5441x-gpio-v1-1-0a29befd4b8d@yoseli.org
---
 arch/m68k/include/asm/mcfgpio.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/mcfgpio.h b/arch/m68k/include/asm/mcfgpio.h
index 019f24439546..9c91ecdafc45 100644
--- a/arch/m68k/include/asm/mcfgpio.h
+++ b/arch/m68k/include/asm/mcfgpio.h
@@ -136,7 +136,7 @@ static inline void gpio_free(unsigned gpio)
  * read-modify-write as well as those controlled by the EPORT and GPIO modules.
  */
 #define MCFGPIO_SCR_START		40
-#elif defined(CONFIGM5441x)
+#elif defined(CONFIG_M5441x)
 /* The m5441x EPORT doesn't have its own GPIO port, uses PORT C */
 #define MCFGPIO_SCR_START		0
 #else

---
base-commit: 8e929cb546ee42c9a61d24fae60605e9e3192354
change-id: 20241016-fix-m5441x-gpio-e671833569b4

Best regards,
-- 
Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>

