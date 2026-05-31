Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491D43914F5
	for <linux-m68k@lists.linux-m68k.org>; Sun, 31 May 2026 15:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780241170; cv=none; b=lvceP2xdwTlWgi8VPqI9Kbu2prnFNGCz9yszPIvByU7HuhB8Vzto9j7Bo49S5x1yKsB8Y3Y1LsBRFKX6PcUyUOVeknrqh98SemNjz/5inE9wNJjuRO4GNErdKE6HPKxqvmn9xQg0SOQg3N/b6HPl1LyLtr7jFIimNvNgAaNjrDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780241170; c=relaxed/simple;
	bh=8RKxR0hxfr6wm13GbICX0czxMc/i5q+wZsMjKm9dQKQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qn57efF4mwwvlVLV0NO2oA6OMC7oG52g6atmiF62pCBIW/QYRya/MQj65Z7vuzMtumzU8sdqjifXCPB3yH5skSA8B2gOZ65WypVCeFTi5fNgmOzlpt8K9uYPPdrBzfUINBdgLA4FIfFHU4Q/x/SriUIQxIDH24iko/KbzZBE5IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=OzlR8RBI; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="OzlR8RBI"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45ef189aa1cso1904714f8f.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 31 May 2026 08:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780241166; x=1780845966; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l3Dc6zoyWnXEvMeETDcz4Z1/oT967FAbFkpJkYlcBjs=;
        b=OzlR8RBI2DDgm8z6UbrAaiugm5JrTd4gqGhu/F382Q6/lmrf/lp9+Ga7woJjgqEsRu
         4CpMqNLA68MEPY2hkYA2ZaPpd9toL/4GjAABj7kP9ZgXAc0gA+ckoLb+8faqqNm2ruw8
         ASeYatp26T2hvoxahsUT0z0OnQABGFLWti2mhTbc3+If7vo64XjZ1ZgHsqMxhB7aXobB
         EM8JTTMDZ7lHZRTgWg4iZxRkrww7m6s9Oey+kCf41bx6EVlULnp7ulxaOphepnpRffLL
         64ahWDuvx9WE/em9uTe6L+BNOmNPYe6oeAWHUpd4dSN1npw1VFmEo5GtnoSnUaitedsv
         PDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780241166; x=1780845966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l3Dc6zoyWnXEvMeETDcz4Z1/oT967FAbFkpJkYlcBjs=;
        b=j8VlmchLIsn7xQudxk8BYBmhOd/A495Of5AUje2YFThr5FgUja/cEKLXCMgYdWEFty
         fz/YO6ghsPvu8rnvMMrxUVgCnxWNjrxmQtKHK7Xdcbs4IqDZ0adKSyg9OrZcCf4CQtE2
         qJ5B4suFdV+HJGHBrp582ypsiKsmN3igZAD3gjHzGb+1ud8gnegPO5SMiZFaWNiouUYg
         t08a+H3I6mvO6EzIUqQK0SJgyad1Zre/VgqZNl06vFlf4ynaRX9RcgVJSbgDahDE7bAm
         QJ1v7+8C/78Z90ayJbadLChnzYI6rTuC1A1abG5lR8SvNqoP5H74YuHauo74/HEC6hVn
         oxIA==
X-Forwarded-Encrypted: i=1; AFNElJ+9HI1znDBkcK+h9Zgo1ciQBb++KxU/3sXlJaUFCzfJIWvhygX/R0Y1cOPc+cwCkeVG7RHRL4YAqwM/@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzzJRoa172aYMiJceWxPFUC/YSuxyPYdRmuOr3DhxjL/2adX6QG
	N6USz0xiTeCK7NTCqiaATK4fOI8eAUGEXuBE3zHrCaiLy7V8jmDNm0ie7szrJGtC8S4=
X-Gm-Gg: Acq92OHl+/s3n1KvnLABn1GHrOMHj0MBwhb63PuAcHtTFwF1o8TYX/rhH58DyyEb8q0
	dgxfq61E2MvOOOA9tiEThOChjE7Lbf9nj0ygTkrac47/Wo8oLMwnJtsko+Rh7+/F5/XI2t4KgA3
	kAj1M19uiMksTC3p6pcbDM7VRz8YGeNAoTrKD722BdFFHBo/OJW38rmhAFdMRXyFc/KgrLQr0JQ
	xwVtBS6300b4n1PfftsZc6XKtqKm6c1pjHy4p7rnauTD6MMi4jfICms7HQqvUEClmnc4IesrR+4
	m10yqmkF4GSSYcCe7zM9zw/KnnL5jC8g8g33YQ35szlRZ5yjAU1W5pdg1WUyluPeslEpWiGPJ4P
	MHk7m+EO1PuOkzindOrGwfF8hub9rTtiY/9gWi4OIE/dNRb13vfAL6mS39w5XkgMYoMfi4MEAWQ
	XxnfN4bCbvDyad4bjkD+9TjF+dNpKDccgRTAZgXGeHIA==
X-Received: by 2002:a05:6000:4b08:b0:45e:fa17:a1d5 with SMTP id ffacd0b85a97d-45efa17a416mr12030094f8f.33.1780241165693;
        Sun, 31 May 2026 08:26:05 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354cf0dsm18526622f8f.17.2026.05.31.08.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 08:26:05 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Sun, 31 May 2026 17:26:00 +0200
Subject: [PATCH v4 07/11] m68k: mcf5441x: add CCR MISCCR2 bitfields
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-wip-stmark2-dac-v4-7-7e65ab4215dd@baylibre.com>
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

