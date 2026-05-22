Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816BA3750CF
	for <linux-m68k@lists.linux-m68k.org>; Fri, 22 May 2026 21:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779484881; cv=none; b=sR43zQg9c/tzEk2XhTj+RxsV1Jwkz4n/PxP5l4lrlUMB/TrjEVJCLWcxK0LwNuChBI3kGrr2DAwQiB7J+D7oPlgLxPXKSSLbYcXPVJdzUZylttSOoQ1IpSDa27Wz5BJ3P+G/EelwkG1BRaQvOJnuYEpra3vp85vAa7bro0Wc7y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779484881; c=relaxed/simple;
	bh=ryo7ah0jlufiyE4iotFulcpPYAtwtOR7H6GU73oSvhI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YRbJtUwealc/MX6DI5I+Vbh93WQL23Ll0eqQahkeKbrZp6tg5KiWvFMeQjnYSSU6tr9DRYzqitbc1zapxyS1s1NdjmdsbOjPpNsKeWyeob+effxTuNilRLGuA/qCch+IvpFg2iHLvj/nB9y3OUiAoQibKrTMFGCkpIbwPDiIl64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ndEsFQjK; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ndEsFQjK"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso68030555e9.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 22 May 2026 14:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779484879; x=1780089679; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=glJxT588UgnMfOXSLSAgwe+j1CYbc1X+ny/bK5Tp2LU=;
        b=ndEsFQjKMXJHIqM2es143KulM4w+LRdmdi7PArxG60wT40OtXZTVprpnL1w9EDKT5x
         nhpxRifvINCYLHzeuQzm96bsyrI4XR3iqOApORCMCyBOwHj5HIpXK3+6+64mf2CXtMOU
         GozlmYOQ6Tg4nzXXTumRWXB09c4yfTtVUUM2r8/0iwj6KQqxy+Sw6cS/r1gb0TC0kGZS
         MwDUI5n6FYwyhlKrGoWmbDGFahmAUtzfBKaw6nCdefyZqAi4QK+mg7o0uPLqSywUI5D1
         lk4dZpPQeCp5dvHIFPgPmXzYoo5rkVMwmtIIr8dDFygQyLxJLAAI/xD9TZywRV1nnpYA
         B+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779484879; x=1780089679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=glJxT588UgnMfOXSLSAgwe+j1CYbc1X+ny/bK5Tp2LU=;
        b=S11KzMX7IFF8ldH3jfEep+DRma7aebn8I941F6Oq6+Ai5bYJDj58MxWydDmwdOh7wd
         b5cvNagIW3BDKhp6r5OxuSb6bdymfp0WKb7o0RVWtsMg5pvT7ZEUh0ppE2RBYXVXO5NR
         FqARzO1M2ovzvRF9rHF9QNrSKcAB/MJ+blL1CCjMUbEvyZODvyw8e7pv1Fv1XznyzqYH
         /S6XDW/6OhfcYFhuSP//VSTm8rd3C6fa+fn2wl7S1O7MwP/CMzS/of5FCo+Dwccs5G3q
         cJwPoBNEEfwfDR+tceq8XAqj9uLxP7XxT414tufWE8/5vJ7aWnAXVe87CHFpOxq89i6/
         21Aw==
X-Forwarded-Encrypted: i=1; AFNElJ/zV88gJJSFMq6q2pv2EFBD+CzSLS8enFrjNLuIKwteKqJcbByPTo6y3hhVjauQv6i5AnjIAwen4KuU@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxwZjLsuc4k9mBWuUGvkfcXpPACxTJt9G7G6dX8copFvv0LcPtq
	L1WxrW9v4VVizWrJc3XuJMQZXm2JyvmlL29S0vW5Dmxve96vOYFMN+zJfCjCTN6P190=
X-Gm-Gg: Acq92OEhj6TlM/wdidlOWtVNAjKWQsqP9H90pesmaSJOo+TnY724iITjeiFXWQOJ12y
	1AjRYe+VwDXxrAEKI79eqQN2+B+94ZImdhlZfGX9pxC3x+QawJbAnaGkYiR8z//kNi9Z+sQItLZ
	/BugC8/GHH2RDM5JvM7dD9uNuSbieH8WgSH0FIrjAAllxm/87RqbucQxwobAkuntbaZATmU/QEM
	+WiqJDMQaCcqDTZikKl+a6koUVZIeTJLaVPq5c+FlYdWUmQhWLOeLCSrJk8xQ+yatGBaPuvhGmk
	EaLEi3XEEjV1bY1PsdiAFJbVYSYaLk0W1tHUhktdUrPP1MMfxCsG06Z3odLG+828jaIcdjBwGME
	0PtSrk+DOwIXy6WBDf8wj/4JMAbpVopwimTKChJrnXi7zN5ZPINCuN/44u1/dZknOMfKwyyKIZ9
	9Y/WlTTb68TzcJusJpPWqGni6+WeWQRVA=
X-Received: by 2002:a05:600c:a106:b0:48e:635a:18d2 with SMTP id 5b1f17b1804b1-490424a0d41mr53927465e9.2.1779484878961;
        Fri, 22 May 2026 14:21:18 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b82sm73312225e9.9.2026.05.22.14.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 14:21:18 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Fri, 22 May 2026 23:20:31 +0200
Subject: [PATCH v3 03/11] m68k: mcf5441x: initialize DAC clocks by iio DAC
 driver name
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-wip-stmark2-dac-v3-3-16be0ad35a67@baylibre.com>
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

Later in this patchset, the mcf54415 DAC driver is added.
Considering some other different ColdFire cpu DACs exists, the DAC driver
is named as "mcf54415_dac", related to the mcf5441x family SoCs with
DACs (mcf54415/6/7/8).

So updating DAC CLKDEDV_INIT with proper driver name.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Changes in v2:
- none
Changes in v3
- roll back clock names as they was originally
---
 arch/m68k/coldfire/m5441x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
index 5b5e09ecf487..b02ca2eb55a4 100644
--- a/arch/m68k/coldfire/m5441x.c
+++ b/arch/m68k/coldfire/m5441x.c
@@ -106,8 +106,8 @@ static struct clk_lookup m5411x_clk_lookup[] = {
 	CLKDEV_INIT("mcfpit.3", NULL, &__clk_0_35),
 	CLKDEV_INIT("mcfeport.0", NULL, &__clk_0_36),
 	CLKDEV_INIT("mcfadc.0", NULL, &__clk_0_37),
-	CLKDEV_INIT("mcfdac.0", NULL, &__clk_0_38),
-	CLKDEV_INIT("mcfdac.1", NULL, &__clk_0_39),
+	CLKDEV_INIT("mcf54415_dac.0", NULL, &__clk_0_38),
+	CLKDEV_INIT("mcf54415_dac.1", NULL, &__clk_0_39),
 	CLKDEV_INIT("mcfrtc.0", NULL, &__clk_0_42),
 	CLKDEV_INIT("mcfsim.0", NULL, &__clk_0_43),
 	CLKDEV_INIT("mcfusb-otg.0", NULL, &__clk_0_44),

-- 
2.54.0

