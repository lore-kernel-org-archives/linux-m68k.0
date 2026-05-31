Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AEC390C8B
	for <linux-m68k@lists.linux-m68k.org>; Sun, 31 May 2026 15:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780241166; cv=none; b=ijmegcb4ZCIqmrNrsk3KJdD7NlzW3qtyRqmYz/sDsKVtj+kTejfwIxLcdAY5QDvCXD8xni+gnKOXAEhjUTO6eYcZc0v0Lf1+szdz0390jwglmGj/WFemFIgKd27izrP5eOmFfyrWQeEpS7S/XCg6UVu0MDDWedzlOMEc1PFrI5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780241166; c=relaxed/simple;
	bh=ryo7ah0jlufiyE4iotFulcpPYAtwtOR7H6GU73oSvhI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ou32+HAkc4tS5apNwp5U3voY5LNn5AoE50adnuHotaKalli71IKafIbA2XcfbNrybWsC3Gp0efxAZo13R47d8rAVtjOUCGQPtZjtamfhvdQ2o6cET5ojGYOr8d/PNLRxV+ikdU+HGUr/WWZTzOporhi6i0JHIDT3BqH5rV+1X+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=LfQJp+ok; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="LfQJp+ok"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4600ddc4017so370290f8f.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 31 May 2026 08:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780241162; x=1780845962; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=glJxT588UgnMfOXSLSAgwe+j1CYbc1X+ny/bK5Tp2LU=;
        b=LfQJp+okfbYaGmYHG5QPk2BCedRTvPkyfMlVHJdg1+QbvE/EkFeX/jPMKXRSw1wnH8
         u6encLymGy8kJ9YeQkUX8J3s55S0hED/3ue0w+ACHfQDjUcVtBxApGv7+J+RlwhlDYc6
         hP89KpuG2sRto/T+iOcb5a5uIeb5Yb9QGA2JfM6+Fm6CGCdKgqKRXwTIHfitvGuAZTLz
         T2LFsyM/w8q/c1xL0FCsXq+M44lltLw3Am6fSNyIaVp/GCF7FRvyJU+M6rB6vao4owTi
         Ib0DoImvtRcugPShSCqDDJwlZYCN63Eq8O0ONs4PHeJEK/becPiCPwHpRY8NUhwxj4B7
         dwJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780241162; x=1780845962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=glJxT588UgnMfOXSLSAgwe+j1CYbc1X+ny/bK5Tp2LU=;
        b=Kc0I8fKHWo19l7lAI4GAf84QuVFVwpYlLL3mTO9n+5Z1q4wmDYKtz9fpBE93ILdLVS
         vvGIjg2qMZlAme6z+qs8cWaZipU5Ygo3s4X0+r0f55SBu8lQDNQu3Z8TRvc1kyEFYy8Y
         CPzO6QQhrJG3fybPk8iQ2nFF6l60Tt199potbJX2vwKjTnFbNiM/JINdCYijuSb4eKUS
         IBOKtQVhfP8rg2Hy2Lj7WkF2/ue91lDOD74CiteGp4jhj56t9yn0twyBgbDOsLqmS0BH
         Z4rh8amv0AATWleP2cRhjMbfrM0W8VJVS6uSogtL0MZ/9+305311ubVqdeaBbjsYZCnk
         3upQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Z1IMGL4n1IGBr02rnNA2JOKU/izCAQMqcFmhLaDeuy+i11zIXBVsgDRKkMN4DqdCJzZgQJoAyrOmR@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Ywwfv3WGzINjvU0Nv//iV6KDGCVb2GqU71Gb/MC4l9s7Ho8FI7K
	20W9Xx0u+MRaMzTexzhsgROa+LpRLk88Gc9iJosqr9X1ywGGBUOMvC8okjmCw+d1IHQ=
X-Gm-Gg: Acq92OFwVkZE1aphbdOlXOhUnVkht9kWH/dp4eiRnkL7NLtGJ76vq5iYVdASEb1KxP2
	KkzEY6zfFt2Pv10KtgLyswg1jpClDrixzbpVxKkERaz41Hb87la1q0xD17ig018qMp1jdYek3u1
	fsnjxD8eTs+Vrtiocu+XCmV+ENNNo3BwF9qYSvfvxqww+oQK6XpQ9Q73g6diSi6CI/mK4nR0f+a
	j/sF7sjnWlfc9bOU4ilZtiUFj4hqM6md5nC81UrYnV2+Za+Z9xwnz9D0ul0MKeVFf1Y8AhcFxwt
	adXxxMRN2QRu6BIIaMiT4QvOXDUVKHEv6D4ZKaBRPDruIh1Vc+OiGafUokyfbam85x7LrvhuRDZ
	IK7KaaPBLK6l/srlQhhda2qppP9B8WB2c/qYofYwlDfheDTyvofBgoh+dxwyFD72EZoSoTV8be6
	tYRlGJ+zd33sUVIXYpXFirz60netl3bIvMKIMCPmZvMg==
X-Received: by 2002:adf:f089:0:b0:43d:77c6:be78 with SMTP id ffacd0b85a97d-45ef6ba1425mr10029801f8f.39.1780241161503;
        Sun, 31 May 2026 08:26:01 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354cf0dsm18526622f8f.17.2026.05.31.08.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 08:26:01 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Sun, 31 May 2026 17:25:56 +0200
Subject: [PATCH v4 03/11] m68k: mcf5441x: initialize DAC clocks by iio DAC
 driver name
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-wip-stmark2-dac-v4-3-7e65ab4215dd@baylibre.com>
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

