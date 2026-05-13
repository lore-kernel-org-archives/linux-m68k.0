Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2389B3E7159
	for <linux-m68k@lists.linux-m68k.org>; Wed, 13 May 2026 09:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778663690; cv=none; b=sntyXbdr6FkC/yzdBk0CWxNOcxC1iNKXbBA2Vy80s4I42Cv76zJOZN9cxWgmJaFMW6M26M04JGv8/QImWFngwD5rptALFvdhG3SUNPn+2hT/U1AAVppwDtj1eK4xvpgosAW90UMSRuRz6HNzi2NWxCuRQyunXpcp59XiEkLxpfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778663690; c=relaxed/simple;
	bh=n0b364dDBrWM4RGQrGIAbMsbTV+2t0ZGtLdE7nGAO9Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LIJjyKR603+ypbUklCWP8QpJ819CHCGKy6HClB3tcJBp981tYKthmOIPzpoAenVajwfhLIWuGn/rzDhk6VlvKF4VzgJ7/9YphiGxwNwkx/mdsvd76JKJ70R9FNgMfp6M+BA57pw8Z3NV7YMwfPrCNONKUYXe3FrqXepD9Qt9EFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=Ofkhv414; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="Ofkhv414"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43eb05b1875so3869659f8f.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 May 2026 02:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778663687; x=1779268487; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mqVoCiMOeXwzd334lL+Kbbn+xeppyD+CHd7jRk3nty8=;
        b=Ofkhv414+TNlmiqdTkwAGXUsYiBEEaWoLwzQWW12EDPFFNUJVEDzxCB2HGQvdje0H+
         6i7bM4fkokBsCm7bLayjTdhIDMQKi3f4PxUTQwbpRAS+gRRw9CUZdVGSx+zKdGYL5ZvD
         zucrsXHAoi9ELGQUy6P0+nR/ABO7TnjprodeI2jSzAMqeNMigaysSg1FYU/NWHTAwEVz
         2cM0mXvv3RqD4su3mhYULDFuXo5RbZ1l8hCuLPMWPA2KFcnok6Y0hQEOiU4QPoziKsLi
         mIKaM0PQisZ+W2sumKs592U5mW/9x9beW+19Va0VFPlUUQUJqo+g4zkFqmvV48KRVeGf
         +ndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778663687; x=1779268487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mqVoCiMOeXwzd334lL+Kbbn+xeppyD+CHd7jRk3nty8=;
        b=Q44DoYqfCpPWv8ErDi9BkEpQIW5EfoktNXSdPFQSgIdt+aGwcIoaVSESF/BwS86DiA
         b4B6chK20025QkWzQ6s2PJOByUG1MnAu6lSjASQDgaheGz8wJ80X8A6maRO3jmcheRcF
         l7mntgrGTwsaaTWYlV+tuJOPsK8Q9wUWTJvzm+JdpSXryZIw6tMOkh+GTQ7rmxgVOZcn
         FONA4ZJL6XDtiOiL5aOCsNONZoewKGOorHfunkvnJwlnOoRBR6zrGoBtWLVnF4PftmB4
         86vmpgSdxXfCUHdt9mlg7MvJ0Urp/842W3vkjOP5bycY1aSiH4BfRE4LCB5aTt12Wqnu
         8UOg==
X-Forwarded-Encrypted: i=1; AFNElJ/Nlr0OJoZlEU13xCJalUycJvW+x7WeDdzocdUY+2wDaslIc0LN/NcvJpqQm+JoDJbiHnzgIcPVUsf5@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yw/v7JqiaQq/ybD/q3+8moUZW8msBn09JR9XyJehkcJhuE1VSnT
	fnsCRQOM0JgTtDSVtc61jzM2DXPxDdQWQHFdIPV+Ftd0fE8YFa13ljT2KFo7hRvfPgY=
X-Gm-Gg: Acq92OEKJzOmMDgdyZBfRc6nOA63uF3+lRw4nibQhybKJbkY6/9xMWFOxzDjo8LtD+N
	8aAX1OgOUgRTroGLgtYA4nplmbXK3OZvyqHGULbKeyc02sFzf2pa7BO2pq/9iTnwXlmfasNJc5o
	WfiBFLRS+BMhSnCKrJ+xRda5TDS7Sqkc5++Iwq1Iuo850tq0jRiQXrfNxdGi2C4sjG2XnB23OlE
	gF5WKFQiXt19u3RbN34x6ziaze1UH31y0L3aMnmvHs2JaezonWB2wROpTpmZIRviL1twWr978L7
	z/PHDNDCMgzWu/yVHc+X+AWAYyxhfsfLWf3UdaDqW0K2BNIoFeO37udd2qkno8Bw+peD0DKyShN
	BKOC1TPMbOcztjgLkn5m5AAeISGA9VxdswXI2LYzTacw93rRBpe4TRAfFMfDVz7lUej84nAY/Ed
	PiT0xo9FUdbS8ZNuEe1D8WbPEX2uS1JUA=
X-Received: by 2002:a05:6000:3109:b0:43e:aa88:f1a1 with SMTP id ffacd0b85a97d-45c59702ee1mr3542834f8f.30.1778663686628;
        Wed, 13 May 2026 02:14:46 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a66bfsm34590821f8f.4.2026.05.13.02.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 02:14:46 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 13 May 2026 11:14:30 +0200
Subject: [PATCH v2 06/11] m68k: mcf5441x: add CCM registers
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-wip-stmark2-dac-v2-6-fcdae50cf51a@baylibre.com>
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

