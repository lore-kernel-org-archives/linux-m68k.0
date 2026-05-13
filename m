Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417A63E8C64
	for <linux-m68k@lists.linux-m68k.org>; Wed, 13 May 2026 09:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778663691; cv=none; b=CPjDqlfh+E6rlEwrpwJ7EcDvvmR45PSgOtWhEfjLlk69Lg+1YNtlIVHw7Py+P6m0mVF0UWPP3d+3ekxdhq/YWhbg9WZ7eYZxn7K9bP7AR8NlRGScT/xfdk9eVKFF7WqD38TbcoJSQcP0Y01ste3CuHsummyiSXHxTWVxc6JlokI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778663691; c=relaxed/simple;
	bh=8RKxR0hxfr6wm13GbICX0czxMc/i5q+wZsMjKm9dQKQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BHTYzNH+aIEDE9P54er8UGUADQnh364RyJENJxLsiMO0dK6S98a61srSqeBZmn6VKer9TSMPqwnRyuLtlgKRrYTKOt0cVCrqvEBQEbnzPLk9UZN7asVraVAvFeAxzx+TbX/rIBubuQVBDve2ZuZq7GxYQHY8vT+MI95D3WUJAy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=fz7YEwAr; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="fz7YEwAr"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48d146705b4so78725125e9.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 May 2026 02:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778663688; x=1779268488; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l3Dc6zoyWnXEvMeETDcz4Z1/oT967FAbFkpJkYlcBjs=;
        b=fz7YEwArhvhs1fHUxZcCzA9b9IjKGRw3zvwB9q7vE+qxZyxU7/sSlFWNbRvM6MWu+j
         ysPNTjEforbr8SXAcRCMp339VKZjG5Em9QB+7H5O3guKpEDW/vqtPGq6NNRikmxdzGZp
         yIdpekaHyw0XCMCvXe5ZQYyOwECIx4hNqMA9UoU5t1/FUwB9i9es1l2gWcxyhUC9vYj/
         7FgYL2UQXlfTHZEk6HuZa93V0RbYnRsKZphEnt9D7it+cLGvtS5QyeA5/RBHL37bQ8xF
         47sZFXB7CojW1A1CHJCvMQMB3MT1INcInHCOjpUfLvWAYSLnM3MBR5HEJHoYeCgAVdGc
         kByg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778663688; x=1779268488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l3Dc6zoyWnXEvMeETDcz4Z1/oT967FAbFkpJkYlcBjs=;
        b=ZMIOMDCrSDLE9OU3zkUXqGz3CIRanjsIo0w8SXSrInC/JsAMjTAByBsMN5qOOlS+9c
         1P5wORSfdPFyosbIZEKxwvEnG4Ojy3hi8Rqq2DizaTiXDbRkDHgzcXauPyayvImj6FI0
         EvWnRvG8dNKxnsq9/D9giRa9fk9gWW2Wl+8JB93oBf8ozLpFxxtll1/WwIzDlNn1gUj/
         HQF2MhotHDSdv8wN/YvP5q5oipLXcz5S26Y9TCwTAftLMhp9EZtYcQpzEy7wE2KaGy63
         l1d7QRMQY+NwDtQ7bQvOxKJZvnnmKXuqCPH2lEclF4rsK3Vh2voCYFTo4sjuKRe3TQJg
         1xqA==
X-Forwarded-Encrypted: i=1; AFNElJ92rXvuVxjTiQKzXsrL8X2vJURuNRR43k7DsBrNwgYnKloDwpd1qSAQvb7SgopYWsuX84tmtIHNy8vw@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yz41dQGMd3naue2yvPVoQtDax/WZpzKB93tQRq8aGGiiBM8oQ4A
	P0pulouIiePJ2gqGusq67qbQuUbaFOayqlqpXaypOorLsSfsNHgs1gqMRxkHoWkkls8=
X-Gm-Gg: Acq92OE6NP3k0ByT0kGUcQkmTXgOLhz+FX9cDuj0w+54/5b2QIBNAlG/7Odam35xWFe
	a43fmb7cZxSCjR5mzhyJPDi/gbJHJeGxUc9OgNWF7zl8r8ky3Kl7Cruj/DppejSh7mInWhB8al1
	y1HVO6lxk1b3K6Aa2CzZJIgsPF8gk4iPPltdWTidPjOnVAYfchgHtNz61Ngbk8LXgmeERYsPoqO
	NKJsbGyGp7gJjzVpsm704hHmvU+x7S/JHB+QQ3IwqW4lvROgUK8dopj/aZ32MM7sF2xXhhWbRkq
	HMaddh4KVbYImdkGPFIOAHzx0bZ/NXoJu+Y8wCF2a4SUIQr6xtYdByA4u+7DaqZfoeCCTbLb+Wz
	64D9uIeA/LWdnjOvQLvFhH3UzSYD2/xRzPXFFFOWCXFv6GLu1n8lSLtIGLZWkc1MgAFEUdxFxPg
	H3g57wh3fpNsGTs3AHOto46fVTDDtA8po=
X-Received: by 2002:a05:600c:190f:b0:487:1fb4:7e1 with SMTP id 5b1f17b1804b1-48fc9a4480emr35035905e9.22.1778663687681;
        Wed, 13 May 2026 02:14:47 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a66bfsm34590821f8f.4.2026.05.13.02.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 02:14:47 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 13 May 2026 11:14:31 +0200
Subject: [PATCH v2 07/11] m68k: mcf5441x: add CCR MISCCR2 bitfields
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-wip-stmark2-dac-v2-7-fcdae50cf51a@baylibre.com>
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

