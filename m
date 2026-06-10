Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BCD495500
	for <linux-m68k@lists.linux-m68k.org>; Wed, 10 Jun 2026 20:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781123723; cv=none; b=dCUjh3Nu2eFnadaiz6lmqVBQWr6ueE3DMNxoDVR0GJFuYfPhQOUIwvRylyPyDTzqP7VARcmaPgeXk0jVSyDRSQgvhoEJxtWoKQ0lSKz672OQJsF25Q1nV4xyMuTMqd5yDTMuSjVfEmUTdYPWgf/4aC69alh0DdpKXNZbDHFONy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781123723; c=relaxed/simple;
	bh=YWCo0UPczhvIV2SL2MXAUbqXZZjhlakNrPODxWaLZ98=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=urzJtzi26i8Ect9wJKIUxieFgmFYqPdaPeyg50Qvq5O3L5tpKponVMq/IGe+va2F7Aa2MVWFtq5QyfrdHVlLryLKUYlYLVXXetXinFvFrFp3yLxKWbs/EMfk+ZMxnyE1cS6jtKX4kNixim2GkQSuHlYMMnIFi/4CsSOjLDXk47Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=N7HTmoPD; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="N7HTmoPD"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4908b92904fso82825845e9.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 10 Jun 2026 13:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781123720; x=1781728520; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KL7s4MPM/6KRRYwpVkRdhAUbHaRI876v8WnTKEx4jhw=;
        b=N7HTmoPDQpuzz6mIpX5I/lnR1ewiRTjIH17mGxuX9KFG9UKyTPjcBcfevH1Dv7WrwN
         EQ1b2uq4oI850XQhaoZGUYkxq8Ktkc6MGcybBMyMiYWEGabn9FwL3LEI2AaBIrq67ga6
         ZyYN+9mWy3VXNFMi98Ll2YCH5ZNwOjXCHLgURYD8kmrqtoEpBUhuZAuwzEGuGMUKszHm
         wtXTRkHqZykf4C4mtDO89uHBB2bfcccTLZD1l9ksOzAyeE/MULJjn0IrpbxaDSy3Arg3
         v0lqG19Mw+4/9aXQGEabg96hSRSfuIPPNPhFat0yLfToMxINGDuU54JzHuLz6SuffPEt
         hNvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781123720; x=1781728520;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KL7s4MPM/6KRRYwpVkRdhAUbHaRI876v8WnTKEx4jhw=;
        b=DbMYtSwhj7Jn0YTzcZZGYpxgEwxPU5jb+z084QpoBQwPIVaU8hufLn5i6aYm6McfN4
         z35UHYcDQFTGw6H2SzdCpGR8XXsoSkz146k27MrjcnR6xbk20PfqvTigsevCP4WMRdj4
         bY9qwuQxGlM7KSSoHT0YVOzPiy2nRgzBMdCvDZ35Dy4lsrI2wuMmayeW93yiEeZTASXH
         QGv2rPlcP5PY3ER3bifrUFL+iwp797iTWlV3WlCmv05BmjWwPp3x0meX+5qmMFDHi06m
         tJdY4tDrfdWFvvEKCbv7CskflhT58G8V9Otf4XnyNF+QMQWuRO/MLJuQuOEwccQcw4RZ
         BvLw==
X-Forwarded-Encrypted: i=1; AFNElJ+bRM+cxx/hZhjr7YKcsZ69XCyH5WrY1dyyX+DZUyd5SU0DGwuUuK/uzoYbYTaR2+B+bGlnVhKXXfPr@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwyPZSv450Jnf+7XhFBKmU+9Ma2kYY29nxZb69kypoYnwypiKdQ
	0xma+i3faSeG0FbVkhpp+38elSOo6mSoUW8oxXFzENUT/0C4yJnWITQBL2adMXy/1bE=
X-Gm-Gg: Acq92OFnwcEtsfwaQPmDc0ADrYEfbkWwGnkBvm2HW9aai+dN1R0uUDqn3TwV1R1t502
	Od/U4a+hWwaZvQutJ6cfx3HrFLk11or/CEZCNFg5JGUDP83X2ZzG55KZioBcF64Swto2iS2rqdP
	GOqnnbNp900QSE1eWQGzQXxgWZGdKi+kPBamlioeBH18/rIgGmr6Wr1n67+5lrcXRscYB2DU/4h
	p9OAX7njygdESpmScwP7BzpKDVj6riGFNDCL7tVfYK638fR+BvsAnYMAzuAnfzxNCAqpGFPHe3l
	amfoOBcw2KFvpmlF5NS5Mlb3m0/WmFO7NXBv4f2FlXXN9P3ToLOFNWRxFU1Tf7qsokqijjAy/pH
	taeTlyGKcXyOeLMbOijrsntp79D/bCg0/C28fz9KNKHy3vi4mS/5qoZQ6HNvv+C/uBx86DoWbbY
	RnUv/q6acDYVh6/S5CTzO3dy7Wpb5mNincmYo3mlch1A==
X-Received: by 2002:a05:600c:1d99:b0:490:b8c0:d470 with SMTP id 5b1f17b1804b1-490e2e58474mr5692325e9.19.1781123720314;
        Wed, 10 Jun 2026 13:35:20 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490dc4715e4sm62390975e9.0.2026.06.10.13.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 13:35:19 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 10 Jun 2026 22:35:13 +0200
Subject: [PATCH v5 08/10] m68k: stmark2: enable DACs outputs
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-wip-stmark2-dac-v5-8-b76b83366d5c@baylibre.com>
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

Enabled DAC0 and DAC1 outpus disabling shared ADC inputs on ADC3 and ADC7.

Reviewed-by: Jonathan Cameron <jic23@kernel.org>
Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Changes in v2:
- using mcf_read16/mcf_write16
- remove unuseful comment
---
 arch/m68k/coldfire/stmark2.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/m68k/coldfire/stmark2.c b/arch/m68k/coldfire/stmark2.c
index a6f9eb3a75d8..25452079056b 100644
--- a/arch/m68k/coldfire/stmark2.c
+++ b/arch/m68k/coldfire/stmark2.c
@@ -113,6 +113,8 @@ static struct platform_device *stmark2_devices[] __initdata = {
  */
 static int __init init_stmark2(void)
 {
+	u16 val;
+
 	/* DSPI0, all pins as DSPI, and using CS1 */
 	mcf_write8(0x80, MCFGPIO_PAR_DSPIOWL);
 	mcf_write8(0xfc, MCFGPIO_PAR_DSPIOWH);
@@ -125,6 +127,11 @@ static int __init init_stmark2(void)
 	/* CAN pads */
 	mcf_write8(0x50, MCFGPIO_PAR_CANI2C);
 
+	val = mcf_read16(MCF_CCM_MISCCR2);
+	val &= ~(MCF_CCM_MISCCR2_ADC3_EN | MCF_CCM_MISCCR2_ADC7_EN);
+	val |= MCF_CCM_MISCCR2_DAC0_SEL | MCF_CCM_MISCCR2_DAC1_SEL;
+	mcf_write16(val, MCF_CCM_MISCCR2);
+
 	platform_add_devices(stmark2_devices, ARRAY_SIZE(stmark2_devices));
 
 	spi_register_board_info(stmark2_board_info,

-- 
2.54.0

