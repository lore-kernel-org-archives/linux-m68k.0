Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54715372073
	for <linux-m68k@lists.linux-m68k.org>; Fri, 22 May 2026 21:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779484880; cv=none; b=fsFhdPfEbk7RTNE1TtAvf+olVgoZEX4ZBeuXn0drVR/Afanja4DAs+2ukfX6KdZEBP6C//AlIIimTxbRedQ4foYjJY30a7ZcBPmh1rAKJGtuB3EOuVdnfxg3jl1Ij/DmAdY6+oVeSQXN6feTIVZhm/OAELHZPk6u5QtpA+7xWqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779484880; c=relaxed/simple;
	bh=MIaaE/2mzFPAjGyRfiNactxhQ4J82Q69lpAJVLJ9J+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ddc+Yn7cvbkFP3kBG4I2ME/Jq92+/UQFk/ol3XBtjtD9tjTxB1C5I7stMFrxqmAvczOA4wzgQt+Boi0K50/Iajosu/HJZdW5B02CvfPnYQcDO80n1sg0l1w8vM4Dzq+zIkhI6MSlVK1tvJYwZR590IPOS4HMjkMLpk2yxaww39s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=l4SeQHgl; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="l4SeQHgl"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49040362e4aso18615135e9.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 22 May 2026 14:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779484877; x=1780089677; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1oxdFj4Oh6M9kXl1w5/7S95bL1PgDTh+f8B3yZnortM=;
        b=l4SeQHglsZa2ePdT3eLFQmhXYFQj1GFuDR1NrS+TbzUdoflCGR5qP25D5U3qMoUGKZ
         3oIdY4qIOxkZFiH8QF7JalSWBTNY0iYFCWzxVBnnm78WZGyQH9v3Q3HR9jUUod9P5d3F
         dbPaeMrN1oKQfxpDY7AZKxhabrmnKQr7cqq4RWvej+m8VzXn3FSDCOk0UOyn8zUmK/UU
         u6H333+nurouDPhDt7e9zeyNqiWrSZ+MMZwTdpEJ8f0ADqsex84gP3sjc/r7jTyfatxj
         JbQ84lrpni3Whvlq+amu5PR6i2qgMnwSTwt69/bxTnnr7iRMMKJE7t57wTpKrOMixNzI
         LZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779484877; x=1780089677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1oxdFj4Oh6M9kXl1w5/7S95bL1PgDTh+f8B3yZnortM=;
        b=Bubv8REclzbNn71e+dZRwGd9LX5NESgGSmqy1qGaZG/uzbXgPhs8V5M96bFfx1IAnA
         Lx0dcOx0tOIQdkx7H1BUWSPtsabVb4JIQ339276DS1onBT0S05nboCC4olPmyDB7UIn1
         2qRaUYQVteQxZwFoIILFNGS4Yt2ldEpmw6V/D341bXwSKQDgtJRQgKEcJB9/lU/24N/H
         V6lIrcOo2kaXvniR7MDQm46z9f0zHnabWWk95jyUNwpVyOc3v0A2vUcl1fAmuyV28f4q
         EJecCWDAyiB3LB4HzcujSUG/VMsxzYzYnoATSmmEXnELh4A7hf/Ih8GNud3VqpAF3aQD
         tvzQ==
X-Forwarded-Encrypted: i=1; AFNElJ9GbQ3zs05+L6n2VuwGhfhU7ir9RVwdDDpXXfQ3Iy1/ObTkwUXTOvsUBjUDhc/csUaop0+foNblmX86@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yyj9hls7l7XeuqrijlxEj21iV4AlpcT0yhLXNOWsv3MiNAJOWSZ
	ZSDBzPvCaCzIkXnpzLAwSlTjptEIHv/89KodhqczkzkMSjHU0dksY9JEpNz5pu1MpMs=
X-Gm-Gg: Acq92OF0GE84PU3B87UnNOsKO4XIPp16UWvjPdo9ak/yXoR3ZbEMDepNitiGSTXsRRR
	K/uZMiDWVN/HNzvKQaVrmWP6+KwMs20CaGSwIVA08XHUstoYLCEC4/xSPxoIMqwdwmxLS+uN/H/
	nSepHFnmbcHvi2qOTqI2lP+xbZbx8mV8P+2j1XUSGCQlkwsmRbU0FTel0t3auw6X1xA5XzADyEA
	ndY0Th29637MllTqIBBiYeErEnSlLeeYpcoPgO19DwjpTwsXUoel3DEknwZM+tz1KBmSoSL70ah
	wyYbqGODO5S0z7DLpOI3APtS0uXn5btUYVNE1L4ML17tUwi7PRJpLNDBjuOG2LF6Opr/fiSgYed
	Kht4Mi7zhxBwPJJVy+SKEQHcf0Z7eREp+7aSw76IIJLPcyaBhXdboOwfNz3RJ5pIlOPv+eKgOgp
	/kojuYRYzfixQI6tiL8ceg/SzjoLTCY0JI04anfvtDBg==
X-Received: by 2002:a7b:ca57:0:b0:490:4b89:535f with SMTP id 5b1f17b1804b1-4904b8956e5mr22552095e9.8.1779484876828;
        Fri, 22 May 2026 14:21:16 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b82sm73312225e9.9.2026.05.22.14.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 14:21:16 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Fri, 22 May 2026 23:20:29 +0200
Subject: [PATCH v3 01/11] m68k: mcf5441x: fix clocks numbering
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-wip-stmark2-dac-v3-1-16be0ad35a67@baylibre.com>
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

