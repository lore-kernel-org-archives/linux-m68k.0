Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369F438B7B1
	for <linux-m68k@lists.linux-m68k.org>; Fri, 22 May 2026 21:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779484884; cv=none; b=KZbmkwKEyz7caKCW4ipB1tbFZ6LmTrWlxRxTinOKWsawah8shijeZsd29H9+I+JL/wFqe18YhVFCOrD8Ar4djxpV9RLJj5r8gfaQIDjf/LU98nj5ZfmBNWYmXRMZmaLzwx91dWnKGhJY93Ca8pn9FF1WKrbvBZXIRAxVLhyE3o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779484884; c=relaxed/simple;
	bh=BTzMq5e9Ct1iS05RorpLyh1aN78tCIlpP86CvhH3+is=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YjMniOEQ3+oayxnk6sqnlFQ4Ck087JJCASDHPwGoaCmSIuB/p/skCNP82Z9nkKyQkBN9UY5ujbJ04hydKQLKgtoqygT8UITuRZIiuOSkq6CpLcWYjRb1Au5/chKs0JKLCao7Juogkw/NDicF3fCSv0sEmOULO9bSHhJPnaCUJBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=FheBdvO3; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="FheBdvO3"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4904fd4f6aeso1818295e9.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 22 May 2026 14:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779484881; x=1780089681; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=66sbIWl/UECZcngzqfN9gySpU5b7WSWy5FgqX8acPdE=;
        b=FheBdvO3pQplPTSDtc5maChXptJ65PNn9juLdPBcGHeg4vgRgyTNdXxNxnb6QOmCgS
         oVpioej0ezFpetCz4zh+sq6SYIYZMWTjJKv9/fujxxGkFc7M8ysz45H1y9khB/Ch+M/C
         bUp3IRFVTM29QoErZt7Hb9a7023/IR9P/2/QOZwRiC8P2ju7taP6jh4foI7Bi7sxdEN6
         L7VrG90ky5Qi1ARTTE14W3/S1uqxEjUQe8kjXIIWZVrrXZoGntiouY3ckbxDjP4eNX9X
         jG2SAIsUty1/bvFGJ1Is2h6hWlLDI2Y9VBGIA5B043WRJSjHkjb48pCk6Nv1FYNkbLLy
         4dAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779484881; x=1780089681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=66sbIWl/UECZcngzqfN9gySpU5b7WSWy5FgqX8acPdE=;
        b=crZLy14N25ZW5nNZEp3ri5VyWMNpwMoxPSqndywCfSONly53FJAOlAeKdx9BqUgn6+
         sBQ1PSYuMQr0ncbW3wzINaiNKQxXNPdz+GF6tl9lHRgCB3/fJuq9ELakYCsw3hn4osC4
         bvU0W6gFEwusXvizyqwOVRw/TFzm2soezfDCQCbv9xExyRCfBpnzP/HGAsyltaXkNPt8
         xN2Q4xYx6Nct+wKxfXZGaDTO22AWmSQlUFLLqdvOplSWQaAE7+Gw5Pg/Zet/jrWy+AF/
         ps0Jj0lD9UZIlOs+FSu6sEpEpkHnUb5mgcszTa6SAPxhEJtONmrSkft0M3Li+ykm9VNT
         7Jmw==
X-Forwarded-Encrypted: i=1; AFNElJ9dB5L0F5h4k8ivCcaS2E6roQ5kNQMyx7/1wihwhBZzN4chKN7vsGTbiozVraDMxudBCaSsj7pHA4t2@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwdCuEAyFrB1IFJwkRHPEE8Ah94jWKpJFiEQVrLpJhlc/049bOg
	pspz7l6pl8htEsPigJvR5rVcgZdWzbX6YQ1uWBIs7ruKvbyadquwxmhufumWiHIVAzo=
X-Gm-Gg: Acq92OGvxT0XexV5xrlTFjrjPFhDiLaV9z4FLKR/3e0ORrr02+k4KGdmSQaUs1KRnzd
	0RRcWyULt/hgNNtZKaHdealzTNK/qTv2/VsfXO+79819w7ls+wVlrr/s4eIhAYrOB6wG/i70eQS
	6VG+x9YvY+mpJb97hnyMAFlNMwdbnYHBIk3HWDy8bJnsITp5WahcXDy8RtrzWF1Ofgl9VmBRiFI
	FT5pmdXxkx5xIA+3or6uld6TGYygHrKpGmhatrPGNBPtCg8XIkZgKX1q2m+9kJfWLVvCNHANeEk
	+x7lxC+hzRzRPh/QmzMgFoilqzi+FUwchmFwXr/axpa9QGZVFT9hBZ4c3QXLns2WRwakVgs7/HF
	Bwu2ZsSjFbQga+MAKVc+Q6Rk4FuluTFDHfuk1l0tTZOesExwqz8q73m4rgBj9jUKqYZZmmVW5Pv
	St2WKWVMtwZsvsbKjwypLq+DcPsVJTwN8=
X-Received: by 2002:a05:600c:4ecc:b0:490:3a07:c467 with SMTP id 5b1f17b1804b1-490426cf642mr75196135e9.22.1779484881521;
        Fri, 22 May 2026 14:21:21 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b82sm73312225e9.9.2026.05.22.14.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 14:21:21 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Fri, 22 May 2026 23:20:33 +0200
Subject: [PATCH v3 05/11] m68k: add DAC modules base addresses
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-wip-stmark2-dac-v3-5-16be0ad35a67@baylibre.com>
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

