Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7C2481A8E
	for <linux-m68k@lists.linux-m68k.org>; Wed, 10 Jun 2026 20:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781123716; cv=none; b=iVH5fteK4xZCwZQ/rAL7y2SHNPVsuIyESdrY63VlT18z1SX2+DS2PZHcfBrR7N+S8K3OEYaGyiUR5PJLphBRfcy7RzhYn/P9N3/jcY/ePYC5HNnH3OiBq4AEV0agPLNAM2g5qiDf4CfIZTKhVOzA8OKITQ5D4XloHnmCX6tofqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781123716; c=relaxed/simple;
	bh=BTzMq5e9Ct1iS05RorpLyh1aN78tCIlpP86CvhH3+is=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SkvvtSXIUIr2JQMve/kTlyv6bdXyhFtmUjfX/OoyGLMAZmxzElx87hGEZ1+Se5HVxMZeytnp5ytYVFP6cXMUy6lvk4Pl+jOgkPMUT+gzVR+TcjzFUt7FnGPPUCAXVHqdkDHf0nTHP8bapjY/VtRrSzfkPccVEselKvVDaKQ4stY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=fdjVrSmI; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="fdjVrSmI"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490acbb0f89so49618975e9.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 10 Jun 2026 13:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781123713; x=1781728513; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=66sbIWl/UECZcngzqfN9gySpU5b7WSWy5FgqX8acPdE=;
        b=fdjVrSmI746hYjetgcte0k/aKTg4hDkMrUHZowv4wBa6CVyj3ClOtlPp1YRgCZtlo2
         x6kg1m1nhuJxDVWouQpr/fKFs8nxRY1raYyoEglA3itocVAxTQoG/umrbMrRjnzHN9zc
         OCEjM3PXo1O7rFyGrUYZzbO2YzH29A0Qd8iM2EfhckUjojmVvIb2z02JEJzLq9yHIADd
         Snzz0cOev2RWlE7XOVRe3b6mQ8VYZkOFfC4UdaNxRwzKFdfhdWlgCrTtxDhOQLxD01qT
         NnCkE1JodxeJZadO4iZ376qWiAY+JAoHH5W5xImfYigfmtXlMArsb1PW3wnlKhCu/SPl
         /qFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781123713; x=1781728513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=66sbIWl/UECZcngzqfN9gySpU5b7WSWy5FgqX8acPdE=;
        b=WbA8Fzxk19JtNnEm8Xm2H4S46qY9DSxe3CvZuUSTwS2Mw5KxJJx6ysHhuwFXNWxZXy
         HAFUSazXLphQJXmduK5K0KCp+L3xPSfWB7GIju+7qlySEidhT5ywp3VG2S+4VQJhkBrz
         7NVGvUTsWL28ackkuqbCLTrHNFEqspJ6iIc1hksjSHDcwj6wFh6/cxGAcl6MK0HJqQS4
         64mZXLBh9xWZUL+cAXGh7NFqxEkRC68EB04i7H90Zw7KdMZZ7GN6hIJTmMEBWYyGNvSy
         3uEoBlJhPwnn2x+yyQrv+3m6m7d1SCjokXpyYnL2yPvAd6Ad7Wb8EQIPef2LARuKPUyv
         VZgQ==
X-Forwarded-Encrypted: i=1; AFNElJ9lk+djA92Mwg4rD7J/wz07EiQutxTUSFwEcfwX9d+usFHQr3qHyrNAAaFuxKtHL6UVLEYXc5NHuOGX@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yww3FAs89TEJNl8ewWQN8I+948Edp5m8djFDbSwWDQl1zp83+sf
	nH/YTRjTfA2UuVvYcHOiGMI9Kog4rYtkFhwplLKHXKL7P064u5WTHT+EBuE+03udH0uwe8poGvn
	YYjYT
X-Gm-Gg: Acq92OEDL6ijAu4QqBBOMQ4yRLR5dLNBB7okXQwiHbcipGKhB5U4ZZB2Or2lxv1wVas
	LzvAtghl+Y+lesS3aSQFEWdrTN5q5Xrg/zJQQxh9lRAXRkbiiV2zLPjhrL51j2mi7u7hiRiqAP/
	Kel0+/a7V5JIMzuFJFsOCjEb24rylJklVIw+yXp1vMN8G8WTSt92kGLRcZBk7S+OETm4UlGznE3
	TCYGGW8OKJKycE91ebnjYI8dgo925hqWGvSN1a4tkhT9UAXHuwn4VgxdzQ9NFNJMWrF6Dgmf2eM
	8gWdyKbEdrVR0jIUAvXLSBpGisb3QFmATXHPtVYRSv5go+ilLmYYRJUTU6+XRWT37R0Vxgiph0D
	i0Rp5u/qeluHnFwNJhMBl2Ml6956AAUBPc03lleaJZIrkBqN8x9SxPTnioSE42xu7pabWP9BnfJ
	gGZeCBdg/qHqJ0G+YI0klpKwzSJXnCq2T4dmG1/qWJ8g==
X-Received: by 2002:a05:600c:529b:b0:48e:6db3:ff2e with SMTP id 5b1f17b1804b1-490c4e0219emr371553115e9.15.1781123713488;
        Wed, 10 Jun 2026 13:35:13 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490dc4715e4sm62390975e9.0.2026.06.10.13.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 13:35:13 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 10 Jun 2026 22:35:08 +0200
Subject: [PATCH v5 03/10] m68k: add DAC modules base addresses
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-wip-stmark2-dac-v5-3-b76b83366d5c@baylibre.com>
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

Add DAC controller 0 and 1 base addresses.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 arch/m68k/include/asm/m5441xsim.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/m68k/include/asm/m5441xsim.h b/arch/m68k/include/asm/m5441xsim.h
index f48cf63bd782..f5acc962bb95 100644
--- a/arch/m68k/include/asm/m5441xsim.h
+++ b/arch/m68k/include/asm/m5441xsim.h
@@ -191,6 +191,11 @@
 #define MCFEPORT_EPPAR		0xfc090000
 #define MCFEPORT_EPIER		0xfc090003
 #define MCFEPORT_EPFR		0xfc090006
+/*
+ * DAC Modules.
+ */
+#define MCFDAC_BASE0		0xfc098000
+#define MCFDAC_BASE1		0xfc09c000
 /*
  *  RTC Module.
  */

-- 
2.54.0

