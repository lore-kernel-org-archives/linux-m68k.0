Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9613E387578
	for <linux-m68k@lists.linux-m68k.org>; Fri, 22 May 2026 21:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779484887; cv=none; b=bhBEwio6/WjU5s+8JmS+B1+GTDPkdmyXwOMzxyfqZ8v3uLLcdgS6NyoxkLPa/VTkGJHogcqsC4SPYZmb+R6vKZpdyxP1aD/yGuMOU9K0ykAMbKfvuQ0CxA7HJveY2QwlwIuIHNZtVld/pMDzFRKcncQ81KWCT02kI760zIECIWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779484887; c=relaxed/simple;
	bh=8RKxR0hxfr6wm13GbICX0czxMc/i5q+wZsMjKm9dQKQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LH3mIp31hGGtDJM0D43yS4U588W3l3vCTVup/y41njFeGlvxNpuR7U0/7jk8OPTgjJ0bMeZLbDnzlLMv2ec6iF37N5XgPjh2iASh5SzMxpUW1M+WPbaSfNS2ATLdrjDu6mH4rHth5QNswtRMcH7WwOMfK/QDwxcB5woMAM1fGG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=JyRCcK2Q; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="JyRCcK2Q"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48fe26a177cso58817875e9.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 22 May 2026 14:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779484884; x=1780089684; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l3Dc6zoyWnXEvMeETDcz4Z1/oT967FAbFkpJkYlcBjs=;
        b=JyRCcK2Qm2t7MZnsjQGD95zrgx7gld/3lvixVEBiXZezJ2SSLVazW1giyC+katOkQJ
         TqKFdG1bB/92248kWZ+3AvPyfwj7kG5o/F9NPOaq6EaqUBivAEBH1FLq+ZwhZWD8pxWt
         wFq9Zp77DdnC/f+3tTm8dQElsIMHR8hCTqZo+N+hKIvrivPRdCC9Zy8K7arFcaIx5Q9v
         Fwg60xKOhrXYZG4poNJpdZX9o69XCXFOHdRKfDEZvRgXJiIGNizgWKFkmyCNvV+1HkWd
         evWM8VIIVGgwRH0ZJ26GRrNprtXKhQy6RhTefYMxngnzZA8rn2AXnqBqDiPKMqoeC+qf
         j7Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779484884; x=1780089684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l3Dc6zoyWnXEvMeETDcz4Z1/oT967FAbFkpJkYlcBjs=;
        b=UJIduJO6GLtr+jJMgVuvenPq5lTScUoSqsiNjmOD5/NVnUeNsSADzoVtsmcioXSKV3
         CMkU1/R3wwq7YO1m43USRkpFOb3Px8YnSsMU3PSdvUK1XVY25URxC44zD3FfQKbyxmV8
         l4RJqwY9EQGTNYwbkI0sFTWtfEYeVjPTO1cV+71ycXkldIq8PS5WHEO/9dkuypDoRJJe
         zUbMRLIU60OznCEMbfU3v2H0mS8sIeN68S5EJQcrw1q+flkLAelNxdSZOAHnNPIGFm0y
         jQDF8hKFp7EbXs9/8FodGKkIJ4NKL26mFKLzdwKDu/Spsdh7jeMjZhA2+dbBUc8I+C3W
         YrYg==
X-Forwarded-Encrypted: i=1; AFNElJ8kEoIcsyy/z1JZuFMu6R6DJTvQVlGk46OZ1JyBJRYP7hsK7SAP+t5K1GUuvui8h1pcz1v81p2dTF46@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yxjxhgn9N/1M+HIBAe6wP5jjmZ1k2kkbIzNqGfWVBokjLcM+h1B
	UkUmIvKz6ogo0aiF0Saz4DIJyqiIRX9z9wJYVwtjagKRD4/c8C3iLnZM8MUjhwqujV8=
X-Gm-Gg: Acq92OG9nK5NFgHdE0BiO02gW98X4AQQcogBQtBPaCD5pD+mI6rd2KEvwH47vw/Tpn/
	TmzCxq1k7Gr/CtxozhtlHHBwGEQkNpBysCUjIiGrmbsFEOYv+IhdbuLtigDI4g69oDxqJtq9zKg
	pWgFJcm9FU7WhbI0t+S76WAEYQDaifqdgdyGc959pG9M4HfMVJO+mbP+PNwOvPODGAgAifn2fVh
	Qe1R+xg5pGTkDyjdpzv5ZqKwtKLNMkPuGl+yFDvwMFto5AvIte0mQtu8dmzFpaObO7IhDNz/Qt1
	wQhBE9+vqliJgvRN4ifUeXCf1jYgQ8XYEz2KJy94wMmesrryI6+z+qNV/nmSwq5iwzbXTjVZpLj
	oRldZl3uPMslEpz6HORRAQ+XJqHHyBk4Ulqtm1lbbeLFyNZXU0cPgVmtwzIkK6pvWP0EdgeCr5s
	bvmF/1Cb0aF6ZDe35KMcAMOtb3yiIiZd0=
X-Received: by 2002:a05:600c:a402:b0:490:4033:d3df with SMTP id 5b1f17b1804b1-490426d7223mr56354025e9.23.1779484883834;
        Fri, 22 May 2026 14:21:23 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b82sm73312225e9.9.2026.05.22.14.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 14:21:23 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Fri, 22 May 2026 23:20:35 +0200
Subject: [PATCH v3 07/11] m68k: mcf5441x: add CCR MISCCR2 bitfields
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-wip-stmark2-dac-v3-7-16be0ad35a67@baylibre.com>
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

