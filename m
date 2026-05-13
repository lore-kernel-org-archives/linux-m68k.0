Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963F23E51F8
	for <linux-m68k@lists.linux-m68k.org>; Wed, 13 May 2026 09:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778663686; cv=none; b=EnkXHTbeZ2WBnhjklcUfxKMRBOFgP72KijWw4j6umAKrTw+uQvLVhcLrwBJwozaG0T4iL+tI8Xy+TPvwgnB4AuF8Bin8CuxsMVMWFvuSI8srbgEkg+qThhsqtS486YceywGhD0BHKYVaMNQ+IdaaOkTwwk94PbanH42Ch9jFW70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778663686; c=relaxed/simple;
	bh=AIY4P522I6mAiy1VKzYtffjJj8yluqaVUv3znf+Q8Qc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sydTssVjarmnqfHwG2hnmkGeOkmDNO9htCxgqLO2fbhRHS7dZ5B4BEi41GAUJjUQmvdEYVR4ZeW+1b3ZarBuEj2MJzD+vrHnVHMHNigAg8kk2M2lt6jg3/MBc2dXrSx2oWQE1t4Ybe55WdIoeV93BYJmecMZ+73arDqx8OfMGP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=jO+InOLd; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="jO+InOLd"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-44a044cb827so5170915f8f.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 May 2026 02:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778663683; x=1779268483; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h/JC/lCvJB29DmlH+qRhnlQ7JKVcjCcbMoFC+b+6/88=;
        b=jO+InOLdCGieUFJflFVoBGInH1b0cYYUp0x6A8ajrPuxCg5QQo2kn6VH/iGgwZZiLx
         cNxoGVu/tVpDwarsc3d3/vZw+XTZpPFKWAk+x4VNQctKgo0BiyzhaYvva8/3ZTm6C0+v
         IMP6G+2ecs/JE4Mt+rvcxHE0QsOelJX+1kV5JdS3Gl9FCFZv/qds2m8eEIEUfPjQQKkk
         pZfVjqmRvFN8W7I6DvQvAEo3LIqo9qtAKQ3rtZNOEXZUZaAz1OXuk6v4p2FT1Xkr9lkO
         Q2oBWaKxZYUI/6f1bk/4Jy9dOcujhukIb2c6LS9OmNDmwz6dampOruoitj8cQfmWFNVN
         7IHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778663683; x=1779268483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h/JC/lCvJB29DmlH+qRhnlQ7JKVcjCcbMoFC+b+6/88=;
        b=q+NkUiDJQj6XZ1zVX1y7LGOV0DWEsVjmmOZGgqB4BVT6PU7OP7s4WOBJxEFbArzivK
         FrUK/TsbRAU9kLdfpwE6FjLXbRe62MiDx3Q4gxI9xZflvK40nbEC53hofoSW90Nd8hBm
         D5gK8vJshbfLf3zRZKhAX0PZUPn/fut0p+MtIZJ4qzfwtOd/4r28HETmZvL3fpSV+qEr
         vztzuTJKC8Ku8h1B/qJnWqlSXAqLdG5F8uSKsb3QyGDFF+rU5PwNCGA8274qYhjGYGOg
         WgW2+gslpd3NTi6JtTjjWQORMDMansykT61fQj+SVf+eR6mG/ZUWDnSdasK8q/B/6VCU
         oChw==
X-Forwarded-Encrypted: i=1; AFNElJ861kI2bIMzz0ZGd7q7aaVK2HOYRt8044bH2EeaK8yIzGMhVeiIIi5hctKglBhbtiuhGPshANTj6Aoi@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyU1d9JMmZ1d+ACBZ4XWmD+ZBY8Jq9rabG3tZTQx+Ar19X8GGSV
	E3zo3FbZK6CkMFnfDrRVO/YRdw5dfv8hfDoGVceIW18JkHMj7etbjPc+F7xDglDiMGs=
X-Gm-Gg: Acq92OEGe7Fpe60RXN4hcr92LSvtpBITvBE2xZJzf9aEZT+VQPzQ+xNwMUhhYVOdgfo
	ADreVhvD90y4NE5slg86B7OgY5BhaPKu2upbQ7U9ATiG/gS8gRwpmm5bRCnVyAXRHpvhNRW/HU8
	/cT2nqhBG7I6Bu/cYyRz5IDzzyup/xQ8yxYzwzU7ijcg3HD5zoqkOOAHMrhN+NDTsMgzwhg/imr
	7clRWUadj9cDbvZSLP8HhNgtWtse2AZxOORbpi2Xb444W/5n6PR6miR40477jFFwLZBpmhczUkt
	aH506hSlmTTuqKp+pd1s7Q36D0Ki4lDBCh5Tl44M7TDSHCT8xypJbMpp0XtDoZZlqrznkXWEabW
	pr0lcmxY9xTtabvEpXTQtva7ILBQwv6U6Oe2+B2c+R05rSoOQ4AsHmrT/CM6rqgyk0asGCtjxeP
	zFKj/QI4PsX7uIMmhM9DZ6XdLs8vzXZHc=
X-Received: by 2002:a05:6000:400f:b0:45a:c0e1:37b with SMTP id ffacd0b85a97d-45c7b470819mr3099954f8f.32.1778663682506;
        Wed, 13 May 2026 02:14:42 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a66bfsm34590821f8f.4.2026.05.13.02.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 02:14:41 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 13 May 2026 11:14:26 +0200
Subject: [PATCH v2 02/11] m68k: mcf5441x: add clock for DAC channel 1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-wip-stmark2-dac-v2-2-fcdae50cf51a@baylibre.com>
References: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
In-Reply-To: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
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

