Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A4C38425A
	for <linux-m68k@lists.linux-m68k.org>; Fri, 22 May 2026 21:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779484881; cv=none; b=EOAfr4/k3NjQgBc3IQraZ0vNvYcGIiLSbfsom/0syFWMsHELgNiMEpSS/zxzPnAFVnpMnGQtPL8Q35r0Pnxz0eVTbMeRRr6t3bU9eytYsymukSwkn9dk52UfMDxORrjXY9yPnWBBxzwx5zdQOEgYyhZ+IJ9lQvfklsgJfc0fku0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779484881; c=relaxed/simple;
	bh=AIY4P522I6mAiy1VKzYtffjJj8yluqaVUv3znf+Q8Qc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tLIx7X5jDofhsAGoKHHdHOKbJvHG9kSG0wHaeeb0OHuohbb/ZiZFPhgZuoSBrgStg5RqMaIUthUGWCE2F3vYzwdiBSw7fIt8xGv4PeR5bbz0/MRzSFNUF/xMgTik8C02Ggj2Z1CkQ/MgV8yVliopr3a88aB6xtngc4m7A234ZZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=AOBDyP1z; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="AOBDyP1z"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so59610615e9.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 22 May 2026 14:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779484878; x=1780089678; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h/JC/lCvJB29DmlH+qRhnlQ7JKVcjCcbMoFC+b+6/88=;
        b=AOBDyP1z5O05DRMv4yvMjRSdcTE9Oo85r8Nvj4UtYiRxxkVjPJGjwSuwd2bThV0wH6
         V0Tp7MsFUzVXmvXq52JBw1QX9KGjCQa2AZ2d7TfibarRgLTgn/y97BX7iB+Qkj109rqR
         gdlURTFR7ZmBQPFNRK4vKi3a8g7eQuGCqip5JOeHuMiUGPQgYHOmzi98+DVzf3CC7HQt
         4qE5o6yKZZPgn9Q62GyANXTNMOjPPdKloUoUKrpmuKqmGO3hNXU+l7Aqiz5wz/1cT2Wq
         LcWhxedIkH+nMEFCeyzfJwPTUykNs+0tNx7Sk5okxfhOTeSgwXXkQcttuppeZnBbxu0C
         oU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779484878; x=1780089678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h/JC/lCvJB29DmlH+qRhnlQ7JKVcjCcbMoFC+b+6/88=;
        b=V9EpJswsQAgUuTd2TVywcF+i7B6rmzdO0dZwtu7+Tv8o2OQ8YgnFH0ATsJnz7nOkTw
         Pr+uGGuPuGyocsz6w+dPBXb0RniyBGjdO5aC9mSGzWx1tg9ocWkVj88sruK9KU2FMhHT
         zDkC1JWejUtGtxTg5a2awFNT5GL1lQxz5MRPx+kflk7jA/odvZX5Dv2Nwv7mGfGsOM5S
         c2sWN6O/mFJKFv/UuroSjRLZVIfWZ9jXgo6hcxuGQp1+q6OcPGokNDjGjP7nlkVIOqvu
         +fIi4P1Q/bCMRNpTIKq15bWNsSOVz/nowfqglHSaCMtw+QgBAfk29Lwq9oO8Hi+xLD7m
         wNdQ==
X-Forwarded-Encrypted: i=1; AFNElJ8rbIyM1vaDkKZJyGJSsCUzniUlvr8lHPGXRtkIlQXrVELSZtD+YUfNEczjy9QK0QSkxTEzaO+q5RJ3@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxF/yjY+UzF6lwYTwTadeqV04tNU1j3XSamPhAj9nVfEqtT1Ci2
	3pSBEHJPILnkynSy/Sm32kgP82L8J63BipJBapqevgiNAkfYMw4VDcWsqUMMABQg7OQ=
X-Gm-Gg: Acq92OHgMXwTevMgAMEe5TQpllksJMvAdKdK45UtEy1Mlhb/gd6+VsQKg+QY0aGNnyg
	yzuy/NLrHUa8daswMq7IkXx7/sBW7S2Fr7RWDLbSuaP7y5ikIGYC6hytb0yeciaqagbu9VZZoNI
	UW/buyzdvBsBRsAUp7Bv2ctt1Qsv48+7rDrT5k05oftKMoRslEOy/diWhFim4+U8k6OghoKsnNi
	YlDLfGmpGKkiFuiT1fNvTQOec8jXwpKildqKlguV7+kFse2AP2vI/b9fe7V4MJVZChgMxGLjKFd
	TuArLVDm/OTar26Ofa88RCqheQGFnFXnZtyKonl+qszdE4EMcYj6F04HXPX2irPyh7jPOfP1qpU
	wBk4IoH40bQ77xQijNGEpPJ/W9fqtlHG8Zmw2QYVXQ7u+FVkAx7wMhmsBSXnwJncEGuoBoD0p2o
	8Hlzk1No1fr2W8P5DReZ12t2TToDENXP8=
X-Received: by 2002:a05:600c:5298:b0:48e:7854:1608 with SMTP id 5b1f17b1804b1-490428dd523mr79562455e9.25.1779484877951;
        Fri, 22 May 2026 14:21:17 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b82sm73312225e9.9.2026.05.22.14.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 14:21:17 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Fri, 22 May 2026 23:20:30 +0200
Subject: [PATCH v3 02/11] m68k: mcf5441x: add clock for DAC channel 1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-wip-stmark2-dac-v3-2-16be0ad35a67@baylibre.com>
References: <20260522-wip-stmark2-dac-v3-0-16be0ad35a67@baylibre.com>
In-Reply-To: <20260522-wip-stmark2-dac-v3-0-16be0ad35a67@baylibre.com>
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

