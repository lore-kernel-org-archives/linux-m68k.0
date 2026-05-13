Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651D83EAC7C
	for <linux-m68k@lists.linux-m68k.org>; Wed, 13 May 2026 09:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778663694; cv=none; b=LRH0XKm8VOy0CLGH2ENY/ilpB57Fbj8Nq+UD7tJMr7swMaWe5IEdrLHJOZJ998BJnziHT9cLQ94WKrLL7UYFklNwxviwP0EwLdKgeIxIU261qUEJIrv4UQakz7Vdae+s15gHeQweGUa68Uw7otyECR60e0UUjx3yURZ3MP9Xcfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778663694; c=relaxed/simple;
	bh=tEtX8XXlTS2MqEgJr5MBxmS+I62Ko0qVZDquyT1rVu8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lqB0GehuhemuJjg/eStxBl1FLTD3Ma6qjmup+/KNCNc1cB26hZS3UjCRTjlDqKiS6Du2TPRpuSP1Rsg9NFoDbtmygJHIGWiw0UGDnEZjtV7eLZva4Fy59ZeLmBL/mUYybnwMGmn9LyR4gxKj9VtPYyXegJq+oTWoDfBmSpMsoaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=bM20Auxy; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="bM20Auxy"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d75312379so4926338f8f.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 May 2026 02:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778663689; x=1779268489; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n2w9rjHTs0iet/rZ6jwqd03mVv1gF87Jcorfz748ksg=;
        b=bM20Auxygk/GQ6LePv+dUMnGLC2UNOYdYIZKCp7283KuyVsR/wPe6an3u3HI51pfPu
         LdpfFPLXqb8hoNv2psw4abPxw7xQgW3TTjWznol5o4NnaNItQe35NubLb1yqlTDSNXOq
         Of6R/ozTzegD+eQ0GWgbWjXoOAHg+PeCocJ1+0AQaXHk4tx9MxOKFgjt1fvTRagvzrHL
         G/HsppUS/4uUm2VlGpbc+e/M7jCWPbGnwtYKzJfkzguu92AuGdozpdW7GSFxuade9X29
         8k5aEN8h29MicLGPkDTLelgCzDbEX/femZpXQ7WNH2cxJeick72zIpDLQp6S9ftRGGXm
         OvUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778663689; x=1779268489;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n2w9rjHTs0iet/rZ6jwqd03mVv1gF87Jcorfz748ksg=;
        b=MwgZ0OPgX+tqHK60W3TUxeDN2qLqY4YzRfmqMOCEOabjsR5DJkyTActcXpDBvbLxWh
         suq+fpAYLy9Gk9v5BA79bUB2FKetyce8AYjlWd4dGlBxCQeWygkmjzfZdnMakIp4XRFS
         Yg3Bvu+QRPSdMLbcnfJWVMhKUIxlIvpjs8JOIjN2Nc6S3QBJaCaQuuC5nf5KqCASrPl9
         z/7anTTScNnaR7SXptLssN2jIgODG0KcR3QfmkCpTzCzu9M8GpV46R/ZJDAQtWY8GlqO
         vH9l0OwjNMR61zG02oK8fIQYljOdvSqBPsRKL2FTZ/D9CbzmHo1UcXssQJ1EUzgX9TXR
         ZUTQ==
X-Forwarded-Encrypted: i=1; AFNElJ/IjZbcBflTdg2Dnr+VoLzX52N3cIL8Bt23Q7T0n9RJ/KKVY57qbvF/k6hRYKVTNrfjb4BCj/8b2ziy@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxQnBzAgTJMYIh0jVhL2lRAExMgGAznlRLO4L2+08tzQjo9qKg3
	OFzrIO0hV8MzxaZYXVqqmCQTq335k7yeL4uPQP7yQ3qzG+kN3m3OG4p3LkEDFyJo0jo=
X-Gm-Gg: Acq92OGVWkDgN44gi11ggAd09DFf9pq+uXOvD9cYBbAfN6p5wBEQ68embQt01rma/KM
	/g0qeKXkD0t00xd20s+edZWcUkWYlmzfVH6N/FTjtz6vidXj31i15svGyUkCUCMzMwAnMyG+D7S
	ryogw/6M+rYhcaj9qWmj7BH34gGWlIuatWO76PiPVO/bl8qKKxA6kcFEsHMLymTNnlcEfAB8Egj
	UToGmarOTPWAmOT2BOaSwdMqn0LIWm3yp07hk/kUw8l8N7b/4IlnA/+mVsK5HnnOR2x4tYu6M/t
	sDPpyRj4fKtYnRZRoxO/0vWXbVJuJ1sNgySzI9/J7GIKUjFBynR0XTM23aIm//ukrLYqwWdl9yg
	9xR8h8i5oPmKFWzAySJ3J64pFpNwGd82AS14+YgIb7n2USMP63JOLLaQM6hVn8kV+RH6fdvsL0h
	lebBTJu7GjVlrdR019hB6lnasnOqwshPs=
X-Received: by 2002:a05:6000:2289:b0:43e:b0f8:e019 with SMTP id ffacd0b85a97d-45c440bcda9mr4275393f8f.7.1778663689569;
        Wed, 13 May 2026 02:14:49 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a66bfsm34590821f8f.4.2026.05.13.02.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 02:14:49 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 13 May 2026 11:14:33 +0200
Subject: [PATCH v2 09/11] m68k: stmark2: use ioport.h macros for resources
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-wip-stmark2-dac-v2-9-fcdae50cf51a@baylibre.com>
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

Align also other resource declaration using DEFINE_RES_.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 arch/m68k/coldfire/stmark2.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/arch/m68k/coldfire/stmark2.c b/arch/m68k/coldfire/stmark2.c
index aa2b4d2a8a64..a5b36af8e70a 100644
--- a/arch/m68k/coldfire/stmark2.c
+++ b/arch/m68k/coldfire/stmark2.c
@@ -63,21 +63,10 @@ static struct fsl_dspi_platform_data dspi_spi0_info = {
 };
 
 static struct resource dspi_spi0_resource[] = {
-	[0] = {
-		.start = MCFDSPI_BASE0,
-		.end   = MCFDSPI_BASE0 + 0xFF,
-		.flags = IORESOURCE_MEM,
-		},
-	[1] = {
-		.start = 12,
-		.end   = 13,
-		.flags = IORESOURCE_DMA,
-	},
-	[2] = {
-		.start = MCF_IRQ_DSPI0,
-		.end   = MCF_IRQ_DSPI0,
-		.flags = IORESOURCE_IRQ,
-	},
+	DEFINE_RES_MEM(MCFDSPI_BASE0, 0x100),
+	DEFINE_RES_DMA(12),
+	DEFINE_RES_DMA(13),
+	DEFINE_RES_IRQ(MCF_IRQ_DSPI0),
 };
 
 static u64 stmark2_dspi_mask = DMA_BIT_MASK(32);

-- 
2.54.0

