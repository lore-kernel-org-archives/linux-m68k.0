Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2010480336
	for <linux-m68k@lists.linux-m68k.org>; Wed, 10 Jun 2026 20:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781123719; cv=none; b=stIqI7ykjnW6ZcXD/5lxF4OnXwhvRF40lbt2oK8x/nfCejjxf/rMNCyM4nSqLFNb9nhCmmYgNIe1Qq66mLHygUvvYbNQEvuq6wj5whvNrcBZpUIQv/OgBsbpjQjA255onqJUkMbX1n9pjaO1aN21YRJcZCbftX5I5hXvC7eqb/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781123719; c=relaxed/simple;
	bh=n0b364dDBrWM4RGQrGIAbMsbTV+2t0ZGtLdE7nGAO9Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qe35FuJeX6FLlw/Hpf001HUWW/qdW6HchKQniPFj8I3KUVjVKwTlEDJbSPvB64v1IzxBNuw6BUXYD+2uPb8o6m6ZSDAHJ2ztie4AdV+ieLP82vfdShOyLUOjyvgQjmL1HJiEOw25lSGdfO34yd+64pq5vqLn/sTNpUR/CLOIaDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=a/qlRFms; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="a/qlRFms"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490b613a17bso70915085e9.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 10 Jun 2026 13:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781123715; x=1781728515; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mqVoCiMOeXwzd334lL+Kbbn+xeppyD+CHd7jRk3nty8=;
        b=a/qlRFmsf/cz7S4gnchPbwKtZlXleIyAbUBf79BtKGW0LNKvufffYnrweONxN3bJes
         7g9bss4v7ZOm7W3Jc7hNQHxfDpdLJyHiZNzGDFeEjCTEfELzqrWCVSt4bWOAUnAISBuf
         XS0yc8Fq42x1exZOltbn8t/neTNio0A4Qy9j2fb+luTjz2YZz7sxLP+6LqgWb5TCSm2o
         CwaJYQRannqVPM/NY1TdkHQJil5O8z3y3FRoZQyA62NSUM58UOpX2aTmc06gl3uVS86m
         L5u5yWPoUOQUNjfriHbpqMeJ6PHVblbhKESSZ4PXiKND5Qb8jb8jD7YYQS1OttsXAelk
         f/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781123715; x=1781728515;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mqVoCiMOeXwzd334lL+Kbbn+xeppyD+CHd7jRk3nty8=;
        b=XxYM+Lba/mTSD95oYVKs0okgf6IudkR9qVcSuOaKWKksxmS2UBfqrpaQPKF409HkJI
         bd2vS8Ggh8v6dkF0szHnDvwTvX4qr7LiTAgBizlwt3URlFj8MCrB7a+AAeAoBB02ONQN
         EgYEzPLycq2k5D60crDKotl9yyLnbz+BIED8WZElyfK2kKgKjQF+kCVXUsinKZJ95Rm3
         8lxfSa2+WNf7WWv3mAjXCpLsmhp97kuGsyKEpUWgstH6OedCrV9niDHNJjOKBwNkoZB/
         P8+eoONgF8e0HlsMkokh20/UBM2ZlDUnKh/jNYzX7/rTF0DU1yLGC+gwqhXo+BbuQtW9
         O9lw==
X-Forwarded-Encrypted: i=1; AFNElJ8kaUPfUZjdqFah2UE+7EJkBkmbNgR9wNO3g6d2mLLQuSR/kxEgai8FeA9dYj445OsZYUjnQ0fvluUO@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yz7tQ/F9qJjAKLrexu9tYw9s+k4JcMXmZ2b73iZRBh5GGr+t6ll
	kCUF4lhIaRm0llR9uktkT7DhdhZanWhYjkfvKicuBPyHijGPIbdquCRCVVFsIBIWRN4=
X-Gm-Gg: Acq92OECP7BGG+nkeqULoOKHyCjo9YfTac/Tm3p9xW+1OCWgFajnluP6cgo8cZPPX1F
	i8nB/DKrnv+fONxqhWblJQDmUXL3xZkl+EBRHN175WI11+rwt5NLdz033Tz7vp6+Bbw5NrxrZZc
	Sw70xgq5ZRZfxPwysc3RLUYWW+oQEtQmB8Hc/6abXLBMFhJysRxDU8pmmu1xqTGlDax+GYri0DC
	zNN3r9Ipsm17A4/WrTomzSwB+XI7t/ySQ5J0ViIs5chGZ0376Z6olsMPn5ZNYggqcuEPHGYPeua
	gqmyYQXe/YzVKJGbPT7kkns5Jtv4J2q/v9ozPpdkKBa14prx0T5zhs6uumpZabSEIVMX5p6mzil
	BVKlsgXlF/zV2BOY2j56VahoMiW/mgkEilIgBqHuAAVGdQ8Yk5VIjBu/XcQZlyyCmmjXNzowIC7
	oON9wAI6VSuFodDOd03XosgYEcKstmjSAyP8AsGrAHRQ==
X-Received: by 2002:a05:600c:3e0f:b0:490:ce99:d2ee with SMTP id 5b1f17b1804b1-490d72058b7mr116681095e9.15.1781123714768;
        Wed, 10 Jun 2026 13:35:14 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490dc4715e4sm62390975e9.0.2026.06.10.13.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 13:35:14 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 10 Jun 2026 22:35:09 +0200
Subject: [PATCH v5 04/10] m68k: mcf5441x: add CCM registers
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-wip-stmark2-dac-v5-4-b76b83366d5c@baylibre.com>
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

Add CCM module register offsets.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 arch/m68k/include/asm/m5441xsim.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/m68k/include/asm/m5441xsim.h b/arch/m68k/include/asm/m5441xsim.h
index f5acc962bb95..9ce2cbb05316 100644
--- a/arch/m68k/include/asm/m5441xsim.h
+++ b/arch/m68k/include/asm/m5441xsim.h
@@ -125,6 +125,26 @@
 #define MCFPM_PPMHR1		0xfc040038
 #define MCFPM_PPMLR1		0xfc04003c
 #define MCFPM_LPCR		0xec090007
+
+/*
+ * Chip Configuration Module (CCM).
+ */
+#define MCF_CCM_CCR		0xec090004
+#define MCF_CCM_RCON		0xec090008
+#define MCF_CCM_CIR		0xec09000a
+#define MCF_CCM_MISCCR		0xec09000e
+#define MCF_CCM_CDRH		0xec090010
+#define MCF_CCM_CDRL		0xec090012
+#define MCF_CCM_UOCSR		0xec090014
+#define MCF_CCM_UHCSR		0xec090016
+#define MCF_CCM_MISCCR3		0xec090018
+#define MCF_CCM_MISCCR2		0xec09001a
+#define MCF_CCM_ADCTSR		0xec09001c
+#define MCF_CCM_DACTSR		0xec09001e
+#define MCF_CCM_SBFSR		0xec090020
+#define MCF_CCM_SBFCR		0xec090022
+#define MCF_CCM_FNACR		0xec090024
+
 /*
  *  UART module.
  */

-- 
2.54.0

