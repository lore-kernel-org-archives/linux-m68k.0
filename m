Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC103E9C28
	for <linux-m68k@lists.linux-m68k.org>; Wed, 13 May 2026 09:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778663693; cv=none; b=M3HXZnKVdWPE3hwOjFc9DEQY7rX2WO5qNRk8R3UI9eT8WzPTJrmkY1wYKAE/4bWdYp+mhOgZxKP9GX+nk50bmzK4Mofgwwx4L/oUeci5g/U2Obl+H1G9zLFFrHQ/RaVO4BfTrpOnmW+zv1F5tv2BOxEfgp8FcvvhvgxL9bh3x1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778663693; c=relaxed/simple;
	bh=75fCaSjU8+i1CPGSdebVDw+f11JzpvCORP++yWtAblw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=amz49nVOKrfzmbnFo7o0DPGLp8P69ks3V8rrRItlEbIn2cOmitFHkxLupRzzgz11Xqm/n6nWD6W/ElN3aT+6ujfDkEfUYEZVZ7PDgb9lgzdjWKdT46TX5EK+IaM/yRGymO1g5c9mBkbeQDIPaKh7DyLYyHpvoP1QqEYxOI9gFnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=DYx9+XzT; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="DYx9+XzT"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso44416325e9.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 May 2026 02:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778663689; x=1779268489; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lE9EKx1/wkTsoQUzPsz6//nDZdCFOzQbMRqAhJ3rRGg=;
        b=DYx9+XzT2Mho46VrTb3OZn5kVmHd6VOb+NFUgCS9VOTR2fMdv95y3XeEtQs4p4n2t+
         Cy/t/Yql7/VxKGA10raVHXVZgaGleCQbaQa+Enkoji9ilpMdsmccKsRT2WwZScuSQSbl
         iK3ebPcq6+uOwmqao1DB5gQjrXOsRNSQbHmVH0q8JtlgRYeLF8MBgLZsSjQD9kNBZihZ
         QuuSlREfVn0lL4FSjxO28SHt+qlZarMU/aoElJb6fK2Nnc2RX4aHa+62y0hicDc15p+0
         ksxE+ZOjrgVilm5aejWfv8/ZH0XlHhMJyoXnotc04xds+e0fcn8sRSZftw4CVUAAWmOJ
         6hXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778663689; x=1779268489;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lE9EKx1/wkTsoQUzPsz6//nDZdCFOzQbMRqAhJ3rRGg=;
        b=T8AGrD1ucILH1aFhlt2Bsx8a/JD/GIrc0GslYJIxrFK5MKRyXIofo0TejhrTuKPfHS
         k7lkzDLc1MfTuOu48Z8kqT1cTUr5A9j9UyxcexoExi5w8f65HLnmQKrxPIoGlE86Mb02
         6A87f/Vch4SwaWtqajTnrBIUClXwvku5Ge0TfIfRcz1oL7QQndDiw1xuVRJcKOFPGlwj
         mhJBZpHcIwVKY9lpg8N1uZOnkv79KnD/w3ndgvWPSx8todQ6XsEzDD+xyqtUK1zHLZ28
         wsDz0vgft5taO+5CKHyOcr/4qEvoR10E/q8tRhGMyiDt1ctKaBEAOUqwXpiZQ1/GdtoV
         JHlw==
X-Forwarded-Encrypted: i=1; AFNElJ+/41c1ovfWYBgsa20G9saG646jWOU82Fuu/cPLs45odXJS/DGQkFOzTrAhxEntR4qlu3ibB4zsVl5k@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxxiDU38cOo5izHGj9Wxo69nGGK1z9fNk+3tWea8HZfxImF3+ZO
	Een+YeWHwvNWSY3XplFeD2VeveYcpfPjm++JV5TInqo+ela9sd1JxjnGygSsfLHKlHU=
X-Gm-Gg: Acq92OHESMfJVgnMQyk/zLZvSLGDkQvg4LGkHYFbszB1ZZ9fGvbzUX+nmw745RhM/1D
	ADZyWxEqL4pPgwrpBpwTelxcrWVheW/JL46o9Z97IECni3rtYkQWhRsooN8ohmBLnMOuKRhdT6g
	hu+a8m57CxH+NJrVFRxv/PX1S8NykSsDd34hboC5lzIGdpk7QZGBiETmWXnHl1U3OGvvXpnysWc
	tbFwuSsuXRqZ9SzBKdcWfH05zp924YuaOfz4XjRrFn13P/6m4sxSosiDmT77SWPPVrgphghh6fI
	SMWud7DJYbD8F6dm4uOaSVwbdojeQf6ERFQFLeEUyVvl7wAkgn2Q8g5QbMNKQHmwVbvdRzuWYa6
	OZm9WXS7+ktnBxPyGcy9kRl3MwNcOrreueqtZhT+PclK026rJr3Q0Q3FvfIeaa6pVSHU4Y30R4X
	P6+DKg3Xyv98QE7C8ezazLsCKP7FhAO30=
X-Received: by 2002:a05:600c:6096:b0:48a:592c:e63d with SMTP id 5b1f17b1804b1-48fc9a30d10mr33302395e9.14.1778663688627;
        Wed, 13 May 2026 02:14:48 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a66bfsm34590821f8f.4.2026.05.13.02.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 02:14:48 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 13 May 2026 11:14:32 +0200
Subject: [PATCH v2 08/11] m68k: stmark2: add mcf5441x DAC platform devices
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-wip-stmark2-dac-v2-8-fcdae50cf51a@baylibre.com>
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

Add mcf5441x DAC platform devices.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Changes in v2:
- fix copy-paste error on naming
- use DEFINE_RES()
---
 arch/m68k/coldfire/stmark2.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/m68k/coldfire/stmark2.c b/arch/m68k/coldfire/stmark2.c
index 9263b77bd09a..aa2b4d2a8a64 100644
--- a/arch/m68k/coldfire/stmark2.c
+++ b/arch/m68k/coldfire/stmark2.c
@@ -8,6 +8,7 @@
  * for more details.
  */
 
+#include <linux/ioport.h>
 #include <linux/platform_device.h>
 #include <linux/mtd/partitions.h>
 #include <linux/spi/spi.h>
@@ -94,8 +95,32 @@ static struct platform_device dspi_spi0_device = {
 	},
 };
 
+static struct resource dac0_resource[] = {
+	DEFINE_RES_MEM(MCFDAC_BASE0, 0x100),
+};
+
+static struct platform_device dac0_device = {
+	.name = "mcf54415_dac",
+	.id = 0,
+	.num_resources = ARRAY_SIZE(dac0_resource),
+	.resource = dac0_resource,
+};
+
+static struct resource dac1_resource[] = {
+	DEFINE_RES_MEM(MCFDAC_BASE1, 0x100),
+};
+
+static struct platform_device dac1_device = {
+	.name = "mcf54415_dac",
+	.id = 1,
+	.num_resources = ARRAY_SIZE(dac1_resource),
+	.resource = dac1_resource,
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

