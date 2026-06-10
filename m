Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047DE47ECF2
	for <linux-m68k@lists.linux-m68k.org>; Wed, 10 Jun 2026 20:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781123716; cv=none; b=ucz22cj4McZISael21odBYePi4/SLVnsW+IA69IfaDP8YyO68xWy2hoW1VWiAW+GrhM+GniyluWWs7L5hBe7dA2zSdIlwAdvBcjPBMSPPij/EiPXgHjjLdLyBpOFAksoAosC9izEdhc2JsKzZqtm45oRucu0nwNr8xjfWR8GIeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781123716; c=relaxed/simple;
	bh=AIY4P522I6mAiy1VKzYtffjJj8yluqaVUv3znf+Q8Qc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pg2x7XauzZ/uH2M5G9iEI0NKwUfnMUTpfaL7sgxDeM2RwyJTAOURWK015maRS/BtTQj4oMrcLyemvLtJttTOmhw4FBtrpMXKZ6cZYPq8iQAjhE4+h7gp5WoF0yZRO7htX/fIRcugPkpaPfHTNgQOUhfCYoA5n6gvn4Pr0CJBolE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=FlYCUcIB; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="FlYCUcIB"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490cdae130cso25763285e9.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 10 Jun 2026 13:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781123712; x=1781728512; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h/JC/lCvJB29DmlH+qRhnlQ7JKVcjCcbMoFC+b+6/88=;
        b=FlYCUcIBbyPa8ZMV2IcLTJsRZStml9ZxfImXq10seMf8iIkzu6Gch84+92c/OAl0SK
         pS1Geg1ZDKrQFiF/PO2rm+mMkYIbi08ZOoTp9CC1v5aAj21MH2dewKGZYtgXnJJ4a7Nj
         SZSI/3wyIjPoxKVJ8UFWZZ/bcqW76dh134siscy94bk3N16Hwz/E44yJOlusi+m5dN2v
         zoPorMrP514cyU6bhJyj7Nir/B66sDN9n0ISxyXs339OrNBkGZ7NUGsJc3NbCJlJC78t
         32rlpH+3eAO8ONxuI+bvxd8bLF+6QgmqOuvA4Omf1EWRo24RyYlUWJA33bjwjRu4DvXd
         zuJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781123712; x=1781728512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h/JC/lCvJB29DmlH+qRhnlQ7JKVcjCcbMoFC+b+6/88=;
        b=S9LfUpqlrw1C351WQGNUMRpsCMm4VyI4a4+l8DAL3FWtxQ1uptNpa4My9Lj46/4MQB
         x22t3SHS+IJUh4OErGFMSH24yJPFr8q9iNstn8uOsjJBO4mfoE/dNmb9bUoFhAptS0ln
         M6LUkXec5NycdBZ6QyaDMfROpSYMR+aHhNSeaw6ON51q030fhalTi+NBRECfQgrIfaBM
         9cttHj5myMY1E0BbeyDWG2jf8942SwcbIG2ptPWewgL5hyvF0xBan/LPPAv/I9kAgKiO
         hw33evCqqooAWBlZ1Vc9vsSdW4cBQlRI1xPJBmJqCiMZ0rEOVt+Ja5096hJCbtJKpzFj
         3cbg==
X-Forwarded-Encrypted: i=1; AFNElJ9URgCYYmUeNgSj94GPLET+7q2xS1ULiK+a/sbPB80D39p+mjpryjZgIINog/20WdKM/f+pHbOA7SPl@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yx2+ZefFyKX6/UpiVI+RFHmBkWbusw3hcYb0oI8lTr4uzfuhG/+
	lSfYRwMrXnYVB2UG/yudbAyQUDEQBT/HvJdku0RB0hwetq4+rwBUx0OXWYi9OWrK3Jo=
X-Gm-Gg: Acq92OFySHoIhO5UNfY/662z0DXYi0ms8OM+BCTwPSJ6JGZEDVHLBhpefRszUFocGBG
	r+8dAtsTN4lpWbNVZjqJKCEF9qfFZLrOVnBeQtLv8M7qN8M4w95gpGQHneVKQwGO1hWmMqj6ZLI
	RGaTO4Fw+MWwLbjMKPSRPtkcPQbAc7qs+RckQM8BUdDBfjZQAbEM4gV5vgppa6ZBa2n9lvuH4kd
	U9QPm9WisJOfM/FvLrbRMS/7M/KSwxpQGQ3R8TB8uA3F7ViPiKYBsKafulFR/ideQq4xHNBIoLo
	CPwMYK4I5/3Arc+j/V92egeUwQe0dFzGCakZSn6MFBGUcooneuzjenl0StTeCeIETP0Ekn67Rvl
	mlVch5G3rWNxdbTLH7OU2aFzHWtUXxWinmNhVeQo9lobZ6959HmGM6PEE6yaejhmfyfh9DA36Rf
	C4LjVH23vldQVsdOxGQNWuGCnoWEAz/r2dgb8jkURbYQ==
X-Received: by 2002:a05:600c:628c:b0:48f:e26a:1744 with SMTP id 5b1f17b1804b1-490c25a87f5mr431093845e9.9.1781123712367;
        Wed, 10 Jun 2026 13:35:12 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490dc4715e4sm62390975e9.0.2026.06.10.13.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 13:35:11 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 10 Jun 2026 22:35:07 +0200
Subject: [PATCH v5 02/10] m68k: mcf5441x: add clock for DAC channel 1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-wip-stmark2-dac-v5-2-b76b83366d5c@baylibre.com>
References: <20260610-wip-stmark2-dac-v5-0-b76b83366d5c@baylibre.com>
In-Reply-To: <20260610-wip-stmark2-dac-v5-0-b76b83366d5c@baylibre.com>
To: Greg Ungerer <gerg@linux-m68k.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, 
 Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.15.2

From: Angelo Dureghello <adureghello@baylibre.com>

Add missing clock for mcf5441x DAC channel 1.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 arch/m68k/coldfire/m5441x.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
index 613b0275d9d8..5b5e09ecf487 100644
--- a/arch/m68k/coldfire/m5441x.c
+++ b/arch/m68k/coldfire/m5441x.c
@@ -44,6 +44,7 @@ DEFINE_CLK(0, "mcfpit.3", 35, MCF_BUSCLK);
 DEFINE_CLK(0, "mcfeport.0", 36, MCF_CLK);
 DEFINE_CLK(0, "mcfadc.0", 37, MCF_CLK);
 DEFINE_CLK(0, "mcfdac.0", 38, MCF_CLK);
+DEFINE_CLK(0, "mcfdac.1", 39, MCF_CLK);
 DEFINE_CLK(0, "mcfrtc.0", 42, MCF_CLK);
 DEFINE_CLK(0, "mcfsim.0", 43, MCF_CLK);
 DEFINE_CLK(0, "mcfusb-otg.0", 44, MCF_CLK);
@@ -106,6 +107,7 @@ static struct clk_lookup m5411x_clk_lookup[] = {
 	CLKDEV_INIT("mcfeport.0", NULL, &__clk_0_36),
 	CLKDEV_INIT("mcfadc.0", NULL, &__clk_0_37),
 	CLKDEV_INIT("mcfdac.0", NULL, &__clk_0_38),
+	CLKDEV_INIT("mcfdac.1", NULL, &__clk_0_39),
 	CLKDEV_INIT("mcfrtc.0", NULL, &__clk_0_42),
 	CLKDEV_INIT("mcfsim.0", NULL, &__clk_0_43),
 	CLKDEV_INIT("mcfusb-otg.0", NULL, &__clk_0_44),
@@ -176,6 +178,7 @@ static struct clk * const disable_clks[] __initconst = {
 	&__clk_0_35, /* pit.3 */
 	&__clk_0_37, /* adc */
 	&__clk_0_38, /* dac.0 */
+	&__clk_0_39, /* dac.1 */
 	&__clk_0_44, /* usb otg */
 	&__clk_0_45, /* usb host */
 	&__clk_0_47, /* ssi.0 */

-- 
2.54.0

