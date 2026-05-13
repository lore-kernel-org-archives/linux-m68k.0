Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C4926FD93
	for <linux-m68k@lists.linux-m68k.org>; Wed, 13 May 2026 09:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778663684; cv=none; b=VQH/1FWnl3Z9I1d4y6/IJgPRfrDUYPbk7MS3OnT6aheCqg7zSeFLFqKTCt+8+42Pgpmhz3lHsHnbVRGofuN9OzttTAols/LVzOLM+WbF2WxteEIf0cM/zCuuBOEAy6B76I7b/4bUwDcE3mfSb5uVxZhcUYJuOiochvly1y99/bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778663684; c=relaxed/simple;
	bh=MIaaE/2mzFPAjGyRfiNactxhQ4J82Q69lpAJVLJ9J+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mKVmMyZkNr+ywZHu47Po0oJMhj5IaTxXtaKms/hTNpu2NWyWlDBsOhAHvvDdP5wnLZhiji4JuzLl+cPNvqGDW/3TJmpF8D7hNI40O4nDwqwYpE1VQhJErsHEHWYxuytKnXnrJ2xxReotSaZz5rxhPUP5m8ohXjN2Bc3708vbktU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=xoP1dA/m; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="xoP1dA/m"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-449d6c68ed8so5590201f8f.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 May 2026 02:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778663681; x=1779268481; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1oxdFj4Oh6M9kXl1w5/7S95bL1PgDTh+f8B3yZnortM=;
        b=xoP1dA/m1KX5CKC2y6qTrYaU9fcRze5ZLFuEFWOVYnNGRu99KKIiX2HR9fDbWtwFYo
         +s9klL2j5oxhiaI9w1RHEIKhcJZaBqSkNbCs5o+0b+rX7g11dbCkt3lCVrpejtta/Ghe
         yjTyWpXh7IJedhFw1a224tgpdpI/dk5XX2hp3ofLCtnU+whNYoi1BCw4ReG5TW2BO0e+
         n1o1LUe6JOTbQLG4LqHupvjX9oFOZg960u+0DigO7TFnCAQwyIELuMPThRUqWER+l4t+
         jWakpDm+2uLOyQqkR9O95bGwGjWzx+crneXPRnWdC6x3woRJotAghymk40/k6RSZ/EFC
         AdJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778663681; x=1779268481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1oxdFj4Oh6M9kXl1w5/7S95bL1PgDTh+f8B3yZnortM=;
        b=m+/0T6SU0QUQx9M4GKxzsZlrNbTpYbuXYjKbkRC58wj9rKHPeeNYndX2q7EFTLaUQK
         5vFCtXBf3JM8KZDy/+MUKOe26V5FWy3KDePLOQvCM25QMPQb0f5UefmIFQIIrE2QpLGI
         qczO/oyXkfZFTxOcFfvpIj+b3kvGPHjfiuIiTBaNBQMkrIhh6I/ocN2KyJyO4WqKJMib
         2jAPLw7xwoTLTrCDdnzvrMtSNXvo0o6mVIJ8x+Gg6tbUF2b4hD4L5i4m6Ki4T7wPUhPI
         5pfd/RkWnfMLQHoE0exeonq9AbCSXjRQQfdQZj8jbGwd9/RDOeoHYI6/kZoSGViy26bG
         HYAg==
X-Forwarded-Encrypted: i=1; AFNElJ9alKDqMxRjxiP/AUOAk3L/z0Dm2lugEb+g4Ef5q0x1W6vXY+d6wfKo7NeGLlhUAuRaWxdhBczFJKsC@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwzAovuRgwbHQ5PEmfLfewfIg0zETebRPSBMQHSNIe1KBcUU0s2
	eu3mSslGmJbrBWUjZHYY8W3YIUUYFzHctxo9GLOp4twVLUYcYkIrNP2fAJ3Oas3iQel8sAR90XG
	F4Q/D9v4=
X-Gm-Gg: Acq92OEva9c/uwWw4TrA6xP4Utw1Uo97gmtDYV0jHez+i3E2lygiw/AZWrT1BbabQ7l
	3e/h40KHYI+zqRD7ZHw9LIdjiKHbh0HC9DaxQXwuY6uerYAxudElxIUdgKSJxjr92nYea97qFAa
	wmFnFUBVBfSJK+32J9a8B0iF1G6ZETuZmL2iMPruGlLr15USQ5Y6uu/TcJ/MYMhdGEb5ej5v8Rr
	06M5JylYMAdFac1kk1cT0FrVm4OLAWcGQPDVsORFA4U/Rqa7lSPpMEYMXcapGjH9UCVWrIwPyrO
	wcN4i0Mdw4PgUgGNaZRCre2m/YNpYcznq9QVCsl4nxGfgEZwnm9rjDL6xfDSRbhwRJADOyqgA4V
	A3kulFiMIZztka90HuCDmkJqQilA8sqajzrfKbGoD13cAI0/mWEnKgs2tPXGMNK6r1Yjz9f86L/
	PocfMH1y6vHalYyeLIchLwt+kMn5F3iW4=
X-Received: by 2002:a5d:5f51:0:b0:453:f951:4e5b with SMTP id ffacd0b85a97d-45c584a86acmr3767577f8f.13.1778663680934;
        Wed, 13 May 2026 02:14:40 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a66bfsm34590821f8f.4.2026.05.13.02.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 02:14:40 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 13 May 2026 11:14:25 +0200
Subject: [PATCH v2 01/11] m68k: mcf5441x: fix clocks numbering
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-wip-stmark2-dac-v2-1-fcdae50cf51a@baylibre.com>
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

