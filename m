Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E88388881
	for <linux-m68k@lists.linux-m68k.org>; Fri, 22 May 2026 21:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779484889; cv=none; b=KJQFcWQiyBYRc9NzCmJYXwewMRlSdDZ3gmIfnBoXUiqIDiPd35pLy1YTbhR878CoWkLPETF/MDoQwmxGsASetIWkpXmjFkoUtYhzhXTP1Vu9qE82TUZJ7aatk5egNUBx4yBeSa3oKtted6SPxdpdsEwKz8c6quIrIOdGEqUsts4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779484889; c=relaxed/simple;
	bh=48aemOcrWCaMuI9OaLb1kPeXmDDnY3b+T5yp/gEBE7s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HMtB/+UEq7YauLCXwsnLKI2us48G3bfsepmyoo9wSt989wPGfMJobrNoYTbMprrSNnWgZvd111SMGsOaVj31abdCfWeHx7B/Yj9u476+f5AsM9UcTasY4A2mphT2s5E9dIz0F6JKEG7mRMvsL5U/2iV+2z4G95eXMYuEpAC7/rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=YyPTL4sA; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="YyPTL4sA"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49040362e4aso18616365e9.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 22 May 2026 14:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779484886; x=1780089686; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PT9tXjqszedmkm8utnuW3FRNsoSqZ3umHWBcRjh1WUU=;
        b=YyPTL4sAGXfL2whN2+OiCHptGIOiH4CNrBv6c3kmrCPPMYK8phrE+ZR/N9OA+R/48Z
         UQBbiaRP/DIjHYokAzogFUGNNAOW1E/g9csXerGJSJNtzGOyyEQCIy4yFT147PBBj6h9
         7zlglO9xbVExOuWmQ1WplYARGnie4VSQOrcP2v+Zg+ZRtx14+/Ktk8gPx8AwkCmphZEr
         VO1hoqJqmhzH8JjkDTwMYxqydseXQRmqBTlZ4ZL/SLttSSWYCnyw3QEoq1n+dbyJIw3e
         QHoXg7PnPw+I0yjQFqbGW7k4FUxCYK0jWgwV5Dz6X7BEKPAPD1jTP6OM5ERTwKmy0Rmo
         LbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779484886; x=1780089686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PT9tXjqszedmkm8utnuW3FRNsoSqZ3umHWBcRjh1WUU=;
        b=LWsqaQcz4jX3d+maeIFl8uqkChCW6LbDquQm0Z4me4peKmXWdNBwo2CbLv58jVzPAl
         g98pIbigiJfPrJI+v4lbUToRlDN6tBQRqu37PyuOeliJuknJ8WK661vCoIyLKSHLFhFd
         hu9ADBpn2jpnSrA8gxU6vpjcVbCytopshi5huDIZESf2qYuAgyGpiwysNeIOY9dqcYc7
         Xv9DA6bDNYZS41wEiYJhxoGkoNAhy58EiwByKIvCA19cyHTyyx/jn7IZVXjQSHEvJfFQ
         wrgNawFDSpMM6gqOciLmJryQVLH3WdrJp1R4ZG3P93dV8j/emyvz7pXQNjT9Xz6IH7cZ
         C1kQ==
X-Forwarded-Encrypted: i=1; AFNElJ+c9yrAdPb4PQZHScEmN6Fgz+FTFbtcRh16PyrqHXbc7M8xYB06pNmQ/NwZltnrMMrMuyXp/u5I7BYY@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwDfU9bmPGNSn52Mi/tw3ZtknxrCJ/hIrRQ1np2aePZ8deVEWWX
	Ip7/lOGyDNmH2EfeBauPjXujrJKI9Jua+XcVH9O9EwZsH+/zhql1QudeCj8zydZnUP0=
X-Gm-Gg: Acq92OFXcgbu55wDXVS/VTcb3Y7qPu0yiy1eCCMw4Pri14dxATUmei3o1fw3GY2lgF3
	/SDXfUZtARFUr0g6oCTKWTFAEK55cXRm/q59e+CTv69n+/InIAsZeoy4rQuawVkS4kdcAdYIeSd
	Z56vGtOe1ZHT5BmOiLxKhHOZcTmPpqU55lHtsVJRu0W9hvZNjoHzB9hglnCJR0UzdhSmkyDuPDZ
	z6S/7rWdDH3qskkZIaXsRqqFBSt63IF0O5qoYTxMwJV7q7Jg01NMgXXv+nhZHZGx8lycnQOYFqB
	c6zsj50HorpQW8V+dUeArpxc26PUukZtWPvyMLXfJ6xHfEIX84Ua6l41lu+o7lFUpP/rxAN7KQi
	jDmnHsd69UbP8wPU/LPP7W68UgIRSgMMqioGJ/gr3ADWMMujl+tGPShZT8Kr+FVCCoCKyO+tOyG
	PFiACKouxWHuQDBDGLwwUE9iHpwJP0Al0OTNkQ5Fm35ZuFB6O6V93T
X-Received: by 2002:a05:600c:474d:b0:490:467e:a3d7 with SMTP id 5b1f17b1804b1-490467ea4a4mr57405925e9.30.1779484886067;
        Fri, 22 May 2026 14:21:26 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b82sm73312225e9.9.2026.05.22.14.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 14:21:25 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Fri, 22 May 2026 23:20:37 +0200
Subject: [PATCH v3 09/11] m68k: stmark2: add mcf5441x DAC platform devices
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-wip-stmark2-dac-v3-9-16be0ad35a67@baylibre.com>
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

Add mcf5441x DAC platform devices.

Reviewed-by: Jonathan Cameron <jic23@kernel.org>
Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Changes in v2:
- fix copy-paste error on naming
- use DEFINE_RES()
Changes in v3:
- simplified DACs as single resource entries in place of an array
---
 arch/m68k/coldfire/stmark2.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/m68k/coldfire/stmark2.c b/arch/m68k/coldfire/stmark2.c
index 536252ccb87e..d3be4b2953fd 100644
--- a/arch/m68k/coldfire/stmark2.c
+++ b/arch/m68k/coldfire/stmark2.c
@@ -8,6 +8,7 @@
  * for more details.
  */
 
+#include <linux/ioport.h>
 #include <linux/platform_device.h>
 #include <linux/mtd/partitions.h>
 #include <linux/spi/spi.h>
@@ -83,8 +84,28 @@ static struct platform_device dspi_spi0_device = {
 	},
 };
 
+static struct resource dac0_resource = DEFINE_RES_MEM(MCFDAC_BASE0, 0x100);
+
+static struct platform_device dac0_device = {
+	.name = "mcf54415_dac",
+	.id = 0,
+	.num_resources = 1,
+	.resource = &dac0_resource,
+};
+
+static struct resource dac1_resource = DEFINE_RES_MEM(MCFDAC_BASE1, 0x100);
+
+static struct platform_device dac1_device = {
+	.name = "mcf54415_dac",
+	.id = 1,
+	.num_resources = 1,
+	.resource = &dac1_resource,
+};
+
 static struct platform_device *stmark2_devices[] __initdata = {
 	&dspi_spi0_device,
+	&dac0_device,
+	&dac1_device,
 };
 
 /*

-- 
2.54.0

