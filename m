Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B818D480DCD
	for <linux-m68k@lists.linux-m68k.org>; Wed, 10 Jun 2026 20:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781123715; cv=none; b=Om+uwfwmuIXEWpEPuDUy5H2xAuMehCXq9HUsQslJxE3rVIF2vS/5+AthKbBlRl97nK9o80fQYjKJFQ1X+ur7vBTMnzMfyLTWz7XdC4jPR/7VzSqy61padbMxf3dyN9438Xvy/r+ehDhrEZ+UiZECNWQv8kS3dN6l3h9wQQyGrUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781123715; c=relaxed/simple;
	bh=MIaaE/2mzFPAjGyRfiNactxhQ4J82Q69lpAJVLJ9J+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fp37TBysIrfW/VIROalc9vxrR5InsBwX42yKopp603+ELQ7yBadpJcNv5EBfWdridtiIPyTYpe2S227vxdylZHhWUPXiHvtmALxVh0kyGYvl+Hee+oXGxLZnhpYIMPgxRMhd1a+U969h+zWeA5fyc4r3Lo/tEBQIG6cPoh6sDCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Tbk7A+Xl; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Tbk7A+Xl"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so2528465e9.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 10 Jun 2026 13:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781123711; x=1781728511; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1oxdFj4Oh6M9kXl1w5/7S95bL1PgDTh+f8B3yZnortM=;
        b=Tbk7A+Xl51xQdjstZh9GV1j/Wd25p2qHMZ+Qj+0LFW8WesHCXgLIQ5cEkPKS+KaSjk
         SewWZxMWYXnnulpxJ/iaCp8zvbtmB8VQHdtyqtJSw3Kw7WfBmQ571gX9NhfrlL7S9xQo
         G0Y2S2dOnrryH/Jrx/+GUv/+R1vth1GzPr1xmquW0fhYGJl5MekeoaqHlsr4oxkUvhqv
         qoT1alibsyD3R07kVEvO6EYe3Rr+3Ir0PLbsuPMnv9BRXdpg4/2A3Z4+/YgwZ3+A82Eg
         BjVib2aHs+PSe6KbXaSvPdoAk1l+w6NN+bXd7WCgQ+jaPwjmg0Zz3naEzMTAmWDi/9/D
         kk0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781123711; x=1781728511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1oxdFj4Oh6M9kXl1w5/7S95bL1PgDTh+f8B3yZnortM=;
        b=ZSe8BE6mhMxQ5gcUZuK+Ogf3gshj1+1ru+ZQSpkQvFj0r0oUaElE5Gp4DRm8iuxwYW
         nSzy0qphm1IQ4XlZpMqLRf11tKk2v29m/wotLC+IA25L76hVm0hvdYJL/fhyHQOXlKfC
         W5mm3xq9VCbSBZOP1I7MJ41niSjqD0moWnzSt8y0KTG6UIo/nP1alwKiC+KnZQTOKX4j
         o4AskA7VJrabS0oB1w1AmL+II0sk82ACijxOEUG2fRXiq87575iqmw65nLjtI+D1mT1E
         WP/ctAlUB8c0MhELh3eNDaUWUDag7BG939lWA5RA0U71MAOfLt157/Bs/zefFf4jzdJ0
         kPKA==
X-Forwarded-Encrypted: i=1; AFNElJ9TYc+cr8vqBFR8l40pttKoqoMHQV4dh2iuuRMah/JF6oilb3DjBfaS2vDTe01R2bkHsBsO/94xlPzn@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxFSJvMMnRRP/7hmjPvqRoXC3n3SBvtwO6AdOVKNdZXwXXdRofS
	MQHrB2vYkYu3piax2u3fZHB3xq+8h0OW0/I1x0SjfgA6AoIzeHiEM4q9WfHqZSk3/6E=
X-Gm-Gg: Acq92OGSrEin356dmtZu8cO9M9aRp21eTI6eAXOTLKrwTdrc5DJ2Tj688vdz1UYZglx
	PVgIprkYwFaTO4d0cpicpiL+roJtI0Cyjxin5XRrF9LAPQPWz8YxEg4KDhZ1OQfNvpyxihKhZOI
	fQweYA0Pv8ZnfZ0aZthWcVI1+MDFMkTrhLULwro985geIISvFEJyopD7nL+AhffLQJEwafiuPAB
	IwURNTjHUbrcZlS4k4Tubub0d4fseHYLFJJraiIGdoOpMSCctH+icReC8bF6gMhY0Q/LRziHB1J
	DzvRwFXyUJpLNo1sClOKMWkbEV5lIKgjnbVihDWwgGC0yqTIIACy/2fb6+kpF37v1EJEAXU6WaG
	8/wnv59JaVlBG5PcgmgMAU2L4x1nnEFlfI5Yv9y2E85bmQkCn8y73TKy2s+KHiglpyqPswwZK3z
	S0Bo1fA0/NgOFz6yNDc8DtzGfPfMgectW+ZcSPMEdbxA==
X-Received: by 2002:a05:600c:3d96:b0:490:e19b:9632 with SMTP id 5b1f17b1804b1-490e34ce241mr1647825e9.17.1781123711199;
        Wed, 10 Jun 2026 13:35:11 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490dc4715e4sm62390975e9.0.2026.06.10.13.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 13:35:10 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 10 Jun 2026 22:35:06 +0200
Subject: [PATCH v5 01/10] m68k: mcf5441x: fix clocks numbering
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-wip-stmark2-dac-v5-1-b76b83366d5c@baylibre.com>
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

Fix clocks numbering, set correct values for eport and DAC,
as per RM Rev 5, 05/2018, table 9.5.

Fixes: bea8bcb12da09 ("m68knommu: Add support for the Coldfire m5441x.")
Fixes: 007f84ede6e3e ("m68k: coldfire: remove private clk_get/clk_put")
Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 arch/m68k/coldfire/m5441x.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
index 6ce730098ff6..613b0275d9d8 100644
--- a/arch/m68k/coldfire/m5441x.c
+++ b/arch/m68k/coldfire/m5441x.c
@@ -41,9 +41,9 @@ DEFINE_CLK(0, "mcfpit.0", 32, MCF_BUSCLK);
 DEFINE_CLK(0, "mcfpit.1", 33, MCF_BUSCLK);
 DEFINE_CLK(0, "mcfpit.2", 34, MCF_BUSCLK);
 DEFINE_CLK(0, "mcfpit.3", 35, MCF_BUSCLK);
-DEFINE_CLK(0, "mcfeport.0", 37, MCF_CLK);
-DEFINE_CLK(0, "mcfadc.0", 38, MCF_CLK);
-DEFINE_CLK(0, "mcfdac.0", 39, MCF_CLK);
+DEFINE_CLK(0, "mcfeport.0", 36, MCF_CLK);
+DEFINE_CLK(0, "mcfadc.0", 37, MCF_CLK);
+DEFINE_CLK(0, "mcfdac.0", 38, MCF_CLK);
 DEFINE_CLK(0, "mcfrtc.0", 42, MCF_CLK);
 DEFINE_CLK(0, "mcfsim.0", 43, MCF_CLK);
 DEFINE_CLK(0, "mcfusb-otg.0", 44, MCF_CLK);
@@ -103,9 +103,9 @@ static struct clk_lookup m5411x_clk_lookup[] = {
 	CLKDEV_INIT("mcfpit.1", NULL, &__clk_0_33),
 	CLKDEV_INIT("mcfpit.2", NULL, &__clk_0_34),
 	CLKDEV_INIT("mcfpit.3", NULL, &__clk_0_35),
-	CLKDEV_INIT("mcfeport.0", NULL, &__clk_0_37),
-	CLKDEV_INIT("mcfadc.0", NULL, &__clk_0_38),
-	CLKDEV_INIT("mcfdac.0", NULL, &__clk_0_39),
+	CLKDEV_INIT("mcfeport.0", NULL, &__clk_0_36),
+	CLKDEV_INIT("mcfadc.0", NULL, &__clk_0_37),
+	CLKDEV_INIT("mcfdac.0", NULL, &__clk_0_38),
 	CLKDEV_INIT("mcfrtc.0", NULL, &__clk_0_42),
 	CLKDEV_INIT("mcfsim.0", NULL, &__clk_0_43),
 	CLKDEV_INIT("mcfusb-otg.0", NULL, &__clk_0_44),
@@ -156,7 +156,7 @@ static struct clk * const enable_clks[] __initconst = {
 	&__clk_0_27, /* uart3 */
 
 	&__clk_0_33, /* pit.1 */
-	&__clk_0_37, /* eport */
+	&__clk_0_36, /* eport */
 	&__clk_0_48, /* pll */
 	&__clk_0_51, /* esdhc */
 
@@ -174,8 +174,8 @@ static struct clk * const disable_clks[] __initconst = {
 	&__clk_0_32, /* pit.0 */
 	&__clk_0_34, /* pit.2 */
 	&__clk_0_35, /* pit.3 */
-	&__clk_0_38, /* adc */
-	&__clk_0_39, /* dac */
+	&__clk_0_37, /* adc */
+	&__clk_0_38, /* dac.0 */
 	&__clk_0_44, /* usb otg */
 	&__clk_0_45, /* usb host */
 	&__clk_0_47, /* ssi.0 */

-- 
2.54.0

