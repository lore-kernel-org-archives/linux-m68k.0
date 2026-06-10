Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D6E48A2D8
	for <linux-m68k@lists.linux-m68k.org>; Wed, 10 Jun 2026 20:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781123719; cv=none; b=B0selFqZvroeQYSf4Bl8GtgoyltC9yQXiChgZ9+3W1Oe7QtWO7OaFZEdC+1tGS1wz1VuxRuUgQpjDdtLBkQ3jWEUSlTzZQ0Iq4W94wsuLtIACiNuOlHvMNp4hn+QIqp8TZaH8K2KcNg5h91UWpQzTf++OueQZPOIjVMlOu8rDwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781123719; c=relaxed/simple;
	bh=8RKxR0hxfr6wm13GbICX0czxMc/i5q+wZsMjKm9dQKQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vFPsdm5UNEjNvvCU2RRiCMqXFBJnyr7Dq/LLLjlYMtaDmYMwd9VcrzMg7o2LkF7RYPsDoGxPfQLQBy7BazDv0g/XrRyK4VyixDKlLZukkb/xGT3SQ4FiASgAUwYoBgCZ9TgE3bafwDKenCkzlDFq+IXhY/lUlifL60iFZ7jGbhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=dhK8Aa4R; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="dhK8Aa4R"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso60513845e9.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 10 Jun 2026 13:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781123716; x=1781728516; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l3Dc6zoyWnXEvMeETDcz4Z1/oT967FAbFkpJkYlcBjs=;
        b=dhK8Aa4RppSZMcmInqT/fb6ArigqWV0T1CFEc/JhQzU77tIAJkfwRPIZHvG64mjD4o
         xdnKA8CUC+Zk5ZocRlRfHWF3xF+obWYfZg4Rzas5qvbxThz9lqbBhCe4iHADzoIkLcVn
         F+7mxIk7j0EC7Ydv41rIKNsJsRKLLHKmWLp1iM04W9LpR/VQJ5qTEb6i4iSy7JdrSqjS
         IdjS9M6XlS2MHTOTuW7c7resvYKMEqM3ZozfIADFrMbgnkcvsb9kGConbK/iH8KAaotL
         NKo87e/FgV4mz4xkXYqJXNEZUTtd6Gi8iJQZq0bFuQSRgMzPiG7M/0s0n+iiEvhkV93T
         z7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781123716; x=1781728516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l3Dc6zoyWnXEvMeETDcz4Z1/oT967FAbFkpJkYlcBjs=;
        b=pBcIeAJXVtCtZUK2kAha+4IpGzkoNnyEhCR7vdXEFxp2oI5jqBXXhdrBSp6fJJ7hsr
         ZmGxHmwK7ZtAfvnfsrn2r6WDlwL2GYgz8xYhufUBNT60hfYpSzWFSfaATJ2Jh+e9geL8
         Eo20YjZrD3zCzaZ0QJGE6ZG6Pkv9yJNDJ3TNJFHXVo82xB9DJrjzsdqBNFTBB4pKJyUc
         /02AC9dI983FUXj58OPUx0Quh0B7jWzn7dXzPoKbQFxUSZpW2S+zeismLxCabWtpwW4F
         LPphXV5XYzMUcuRXjKrJU5I5HULO0SGrwTVXM9yrC717h0XL2AJfsrcVnjWlJ5VITmR7
         iFCw==
X-Forwarded-Encrypted: i=1; AFNElJ8UBusWPU0EiHnyD5Mz0S9mH3sJ+y2D8ZCcZPwhAZ57lmjLlNeoA+wYB++3cLaDLs//FHjraNKgFeLw@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzLO8uj1hBBS1vXVLm686SOic1uuPl/UVuA0wLKmv6hfc5in5F5
	FRtrJb87w5sEVWigOOLMvvLBHkXO7nJ/D+TwTkagDWRygUU22XTl1UkYi0WhMTTZOKE=
X-Gm-Gg: Acq92OGYCAh5azxF14JypIAA/4uWWtnLRO+kPGF47qRCpfHGtkXfdjy4PVhqjw9hNpP
	BzcMXTCx97fa3aay27pKbTc1miTr6sXEsAGqlpxxATC++MAwCgTmrWUQdJY5JvTqpYAsghHziqK
	vEj7P/S7+Ol9EltrJ7Hy4xRaXzCCGPmfwOp8sraMNodl3F0P9RlC4m4sKJ0cRT/Wgj4/IDkGhuP
	xUKNn2GLhwO4Kt8QLqh3TrMRxiqz9gJRqW39cdSxPaNdFAIP1o+4fa9CG8i+ZJjqM7fAjbrEGa7
	RHLfjn7uEidFz6GzEMWcrEZ4B7eUjQ02WVrvAbAIwJKPHwuauen/+Tnm6n3dhPuR8vzoR1e9qPB
	10KyrnJeUIRCbHHnn3Lo97HTrozKF/xFO+XhCq0JacLipIPAJChsnd1gq7jDJn7u7OSJhC+rsfZ
	6zYLajgJ70iVTV29djBlwgKObVlSR9Dv2w8+8T1nCO6Q==
X-Received: by 2002:a05:600c:620b:b0:490:b9c3:6c48 with SMTP id 5b1f17b1804b1-490d7234fffmr107606225e9.29.1781123716245;
        Wed, 10 Jun 2026 13:35:16 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490dc4715e4sm62390975e9.0.2026.06.10.13.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 13:35:15 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 10 Jun 2026 22:35:10 +0200
Subject: [PATCH v5 05/10] m68k: mcf5441x: add CCR MISCCR2 bitfields
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-wip-stmark2-dac-v5-5-b76b83366d5c@baylibre.com>
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

Add CCR MISCCR2 register bitfields.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Changes in v2:
- add "iwyu" include for BIT and GENMASK
- fix MCF_CCM_MISCCR2_PLL_MODE bitfield
---
 arch/m68k/include/asm/m5441xsim.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/m68k/include/asm/m5441xsim.h b/arch/m68k/include/asm/m5441xsim.h
index 9ce2cbb05316..ea01c7753b7b 100644
--- a/arch/m68k/include/asm/m5441xsim.h
+++ b/arch/m68k/include/asm/m5441xsim.h
@@ -8,6 +8,8 @@
 #ifndef m5441xsim_h
 #define m5441xsim_h
 
+#include <linux/bits.h>
+
 #define CPU_NAME		"COLDFIRE(m5441x)"
 #define CPU_INSTR_PER_JIFFY	2
 #define MCF_BUSCLK		(MCF_CLK / 2)
@@ -145,6 +147,21 @@
 #define MCF_CCM_SBFCR		0xec090022
 #define MCF_CCM_FNACR		0xec090024
 
+/* Bit definitions and macros for MCF_CCM_MISCCR2 */
+#define MCF_CCM_MISCCR2_ULPI		BIT(0)
+#define MCF_CCM_MISCCR2_FB_HALF		BIT(1)
+#define MCF_CCM_MISCCR2_ADC3_EN		BIT(2)
+#define MCF_CCM_MISCCR2_ADC7_EN		BIT(3)
+#define MCF_CCM_MISCCR2_ADC_EN		BIT(4)
+#define MCF_CCM_MISCCR2_DAC0_SEL	BIT(5)
+#define MCF_CCM_MISCCR2_DAC1_SEL	BIT(6)
+#define MCF_CCM_MISCCR2_DCC_BYP		BIT(7)
+#define MCF_CCM_MISCCR2_PLL_MODE	GENMASK(10, 8)
+#define MCF_CCM_MISCCR2_SWT_SCR		BIT(12)
+#define MCF_CCM_MISCCR2_RGPIO_HALF	BIT(13)
+#define MCF_CCM_MISCCR2_DDR2_CLK	BIT(14)
+#define MCF_CCM_MISCCR2_EXTCLK_BYP	BIT(15)
+
 /*
  *  UART module.
  */

-- 
2.54.0

