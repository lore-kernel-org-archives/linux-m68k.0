Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A608390CBD
	for <linux-m68k@lists.linux-m68k.org>; Sun, 31 May 2026 15:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780241172; cv=none; b=QkZBzQWv/QTG7Y7JwTUJvUp3vgo4RYyqM+J0cRKO+FGC912pVbQcLEnq2I99KdRdV+Gx3/X4FeZ0JxPztNsGzJMpOYxupPbPTZPQtg3wp1+aLlzC43jBaEblHb8bH2S7sW+BEkaXQmrtitzuv3KbV9nca18Sx0czRyl7WL1PS7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780241172; c=relaxed/simple;
	bh=fG9dTQd6OKY4ybUsIIQRbILKv3sfqdu7vBpdDFZ8pvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qoo6Q7CohJHyvHtv5XoNn2iipN0sajZxbQ1iPWjE0SlAcJ7z17EvEhhYdfsVVHR74TbdPBfvHnyZdgXhPiueO711gLrsyHhsA6VpGEhPy2N+8HNmwpv/EG2V1RCwhsPWUie95OCJE330WA2NIAFg7A6TBTd3LC1nqxoUFwqgiRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=I4bBee+W; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="I4bBee+W"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45ed18d8a1bso3407736f8f.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 31 May 2026 08:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780241169; x=1780845969; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vo148tLRdvHB4Hf8KQfkCKci/SYla3jkLQmLRXKSwIw=;
        b=I4bBee+WISEL9vd+tAOcGklqE80tZdXDaYeaEzu7R1USt4yFnHhSLTwWTKu9Hl61Sr
         Kd4ME3VvHaVUlOp0eS891VxTMl3y+iQ14VqWp1P7iLWaEVYxkqJcJWxFVV4l986QtrM7
         1FehTH088TAHMyK65Jb8ljt72Wm/KA6GlK/Gguaa3ru81qEMyyi/GrurykEYT47x9rvG
         mMzqgS0MTIzcgkRgcP7ns4y4u2goGnWrvGtYp5FgRJ+lGEbuXE1dhKSkFFkdLURvhx7x
         5IiN9+lKjGNs61cFbEt3YtkD7LE0sFP8B8U8yfi7T+PA308sw6Z0oYGujbfYFNkakcmp
         wU5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780241169; x=1780845969;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vo148tLRdvHB4Hf8KQfkCKci/SYla3jkLQmLRXKSwIw=;
        b=swrX/jRSza/Lphwsae5eRcv51j5bgbo8Y9KRMvT3MX3ux6DPZxtd9BXRCZrkDa1c14
         AXlQ0P/G52XWyXLtLomQld9JQcJPkNscQkyZVrLeb/N+8q7oF/oW5DMYQpRWmB0v0Zsa
         PoqEoq9jwTI8jn8bb/SxhaLJZePB5QbdbcXgifLhYdmDhoK2R7YPZKPyZP8zkjvSowUE
         E7y+uceBk9VpTETJMrzJhOSbZZVOYyjCcrvNeJ+b1ksP1L2FaXtBKuhIWcLCPFWNuEl0
         VWZbuyBIh5YRZX8tfXv2mXkQldIqm8NcNHa9RA1fQG6+/HQc3E/NMTL2agKjoxP/X8QX
         WyoA==
X-Forwarded-Encrypted: i=1; AFNElJ+sLsWlPFjRMpqF0JMIfQNqeVMpdy1vh9y+xd8yIGiFVjuAznHreoZBfRlsSWVjlMqjni0Kfi4IeRGQ@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzeooFG2ehi31sA2bXqAiTCrnD8l7wMFRU/6OcXSHzLMMIwLP22
	rjJ7mZ2zsZ9y11nrGRvY/+HvpRKENvjX9nTe/QTwdGkLgMU1ok4TfIS9U5y4eI45FWo=
X-Gm-Gg: Acq92OHkU92veCqC2yn6r+mkE0y/sM2iT6JWkRtP64anLOIOGVPvK/mFxYPOwin+GDH
	VJcxwyAlhG9h6vzPEwK7bmfkbh6+gz4FduWs94sl1I2fRkB4kWb0+KJQwBpG2cUSnN7FOrw0hly
	uFjHeTLEzleXf4jnhAG9K+UuK8Tz4WEKqgAPQGkCvRAQO0ILUtrochcRkUX1vjZAAqVtPa8SkEE
	aLOr7moroFpuagHqfEakDFCNqI+EO9k0X1Mi6XVYF8xqbnueasIiQ/IC0BOmxXdWw3tULciR/ue
	Xe9zh+Kg458E9cOO8OkloEKf0vxweYt91FYXP7UHTrPqyd90rLWT1RvixtiBEFxnLTSNW8EMqAH
	M/UCFo7fyKB3lxCqSSGjYPVEbYIh5A69tcrzYP2wssH6WGfbRLSAE3TTKrYCtUgcg2YOJH2ESnd
	0b+Yr6RWb53+116wy9Iawej1sZURu7ahfMESVt1hs7ng==
X-Received: by 2002:adf:f690:0:b0:45e:ed10:8dff with SMTP id ffacd0b85a97d-45ef6b7fe7dmr10702843f8f.24.1780241168825;
        Sun, 31 May 2026 08:26:08 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354cf0dsm18526622f8f.17.2026.05.31.08.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 08:26:08 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Sun, 31 May 2026 17:26:03 +0200
Subject: [PATCH v4 10/11] m68k: stmark2: enable DACs outputs
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-wip-stmark2-dac-v4-10-7e65ab4215dd@baylibre.com>
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
index d3be4b2953fd..8aa9286e85d2 100644
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

