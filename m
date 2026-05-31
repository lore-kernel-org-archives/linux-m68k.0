Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9463909A3
	for <linux-m68k@lists.linux-m68k.org>; Sun, 31 May 2026 15:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780241163; cv=none; b=By50BlCA+ghwNh5u64iqiMWOYDeOONS4IQM/Gtga+tbNueiSP7lM5qbyUXxvfHpGzXyV/Mr3oxgPFOiGCFM0egQ16JAoTNaHwkm/p1Bvx2PvCJU2jB1I5FbyEZomJg5Hd/kxftbgKI04SiVoGnofPNNa5pcvHa/OUPAzsIP7zZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780241163; c=relaxed/simple;
	bh=AIY4P522I6mAiy1VKzYtffjJj8yluqaVUv3znf+Q8Qc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uXb5ZK56HjJDCllFu+8TaTWehDN2hVJsoD5+wDvcWArtAD1XiuYfXuD5RA170SqtQrkR+81WrP78z8iI8jsTxBeywTwGP1Ld5Rxj0wT4OVSovBjreneQ/woM2NgiPU7P6Txql01kVSfnly/s97gWsWNlGgSWTcD+hUQTsB5/A8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=pdyWdIYf; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="pdyWdIYf"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45e9f4a3510so5417133f8f.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 31 May 2026 08:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780241160; x=1780845960; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h/JC/lCvJB29DmlH+qRhnlQ7JKVcjCcbMoFC+b+6/88=;
        b=pdyWdIYftHUXLr+4YdBJB/vfy22i01j+yM4I4K+QfJ+V6ViaFoIwKGMH/n8wtzgMm2
         IzuaxJNlhobPqzxnX1IV+fXFYADqqYahhzoYm5HWoGdBE0F+wyQ/bOiGoa3I4lDPJpsW
         SyA/7vECiKdFqviZ18RVhGhlRuSsHeEM71SlzqKMRWORfv8u/VBY43kAUdRCxrOzpAcK
         Nfra6QRvFOwsUuHHSQkyNc6aHLECyR8e4I35eLUN1b5dpVCrJKx8jpYFPnAhy/Rb429I
         J8ITLOh64gLNvRZdITqcDhQnoz7oh3y7+hPoPFpEAnx0roD+qUel48eOMtXm8qsEXwxN
         mO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780241160; x=1780845960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h/JC/lCvJB29DmlH+qRhnlQ7JKVcjCcbMoFC+b+6/88=;
        b=NboULdRcK6Jfu5IJKb5iPTZZGV6JMXBPCNfhofC58SYCRiNRcStfG5F+NmwNd6ON2t
         nZTKn7U2XPF/1XgmjhvsXOMasp9VG90D8wMGTWsb4H84/0ixQdTz3OlmlQdIrgE221jm
         N19eiV091oTHghVTTBuWnyDFmVNME4cJ1XL8Suq+VkgrAAeiokg8yKpt4K7w+cWN3sgN
         P/hSZpbIGGDj8XX5QSCI6m8iU+dkwq9d670oaBP/32pH+XczLAQaflvTSP5eau0dbXMU
         /VCAVk4Y39cF27kVEkz2cUPZQWoRTnapOt6+d3H9HC+iFVr+G/irxHrtHS7fATEGFAI7
         MQ/Q==
X-Forwarded-Encrypted: i=1; AFNElJ+urqyYluRKAstLstYk/zDIK4vSmDNI7cAGZICJ+lie6ytJTijP4Od03Ziv4qFLDHMSiLCt2uahR8gR@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzqemwUjx/q/I2vKK5DMvQl5x3w/pl9z5A1swv3YGlPKIfEiaQU
	m6t75jNsHWNc3c/LnSVCb0b94Wg/oN0DT5Z/CcJ493BlFruNsmm5ahvFIplJVN6kkSI=
X-Gm-Gg: Acq92OHNRcPIA2WXt/J2eYi9ZJ9UMOKNrM01Iiu1jXm4pZXTN6vJj2+J9xsg8h3JskS
	MtVGRtzRfgrPVZUQZha7kcrkzsad931i236Zs1BUK0/+vlG79JL1RlcnzvZWbC379Z97jLsLbM+
	4TkU1LqHdfH5cSEmnJhDn2UuXc/+it338hCTg0G4Pg3DPTsHnZiDUtohST0GapggZm0gEQdRNVn
	zRX228wajl+QVWwo5J83E6vBrxXuDGT/sXm4U0MvL+Fndhx21G5bSKQNaVQzcb9jn6bZlj+rEcE
	f1eA3OwyGIwQMdDIPGz/7E01zYIdycKP2LGzdltpe6oVK19c4TwjehVSrCVOynCuEEqteqXhJf0
	2StsLDJybgFtqD5dbZg+IOGcsZHR7pnNvzCy0J/0vfHFeuXH4As5iUWbZuZlqxIsIa/UEzUPlcz
	LtDIQ4YVD2YbBRLujZuFdQIlntadaBeDMEXsBYtNJ5dg==
X-Received: by 2002:a5d:624e:0:b0:45d:3aa3:7f76 with SMTP id ffacd0b85a97d-45ef6b836a9mr11291781f8f.33.1780241160201;
        Sun, 31 May 2026 08:26:00 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354cf0dsm18526622f8f.17.2026.05.31.08.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 08:25:59 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Sun, 31 May 2026 17:25:55 +0200
Subject: [PATCH v4 02/11] m68k: mcf5441x: add clock for DAC channel 1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-wip-stmark2-dac-v4-2-7e65ab4215dd@baylibre.com>
References: <20260531-wip-stmark2-dac-v4-0-7e65ab4215dd@baylibre.com>
In-Reply-To: <20260531-wip-stmark2-dac-v4-0-7e65ab4215dd@baylibre.com>
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

