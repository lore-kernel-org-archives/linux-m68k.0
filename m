Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5889F492199
	for <linux-m68k@lists.linux-m68k.org>; Wed, 10 Jun 2026 20:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781123721; cv=none; b=BYsWeyEI5oI6+e6JtEq9vIpv9Cw0NADEfIukNoZ52XoLSb7/aIq5vsduPk4EXdqjXpopF84YPC/OytuI+LmVFmzzhHjG+IPU/n0jqaSj51S4eqc1Qn1tT+wLYExjyRuhTFPQeL3NukPxlAXIedGAhl4M7MpswhhQQWxOlrFJ97Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781123721; c=relaxed/simple;
	bh=vZ/qSwgZaeGKIkwuebGoICNFAldlYX5GSoxxjgASp5s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GGMEOCE4VL1X+j2KCzGE1rkbgfuwE1zdGnHMZwnoIT2floMQ1ujOBNuPgIhPYQvzkzxtuVjtUQK03maJqxXLP9w488DOSVIsINwmO8O+aIlgT1tO0/N1EOQ1YwUDYK8Em+MjQcbl9ZULXWU9UUzNuNhNAKNBthb3Kk9q5wfSj1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=esrr/oK6; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="esrr/oK6"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b8a97b11so80395565e9.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 10 Jun 2026 13:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781123719; x=1781728519; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pwc20oinFS38+HtcTxr0JzZGF6h7M1rDzYuEvdtO6Lo=;
        b=esrr/oK6NOwrymsk/4wC/OzzGkkKWEDxHcJrjBUebx9LVlIDpCVPPzBtXQJSs104EE
         hPTo+XxZ2CRqvHAZYniy80agcxHgKLuYTgB0tY80z2/ngzkzN/58D/Eo4/HVwcmbwzz6
         WalAAwVKB08X7tns/RlgFnjgjjArG2RUZHo9khgkVJKymvATd5gbL3Ugel+q3nGARiL8
         67d9btjussJ8PX1yY7ge8laZyJNQv7Fb3LZvoQSSIAU629IAb8TZnaoaAoDW1+ZwA5YX
         6uJ8PNEgFYFG0B5sPDg4DuggDjbHTCKelWsHiC9j/zvD5RQVET/jS03rSYVOzdNqaDBI
         VhzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781123719; x=1781728519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pwc20oinFS38+HtcTxr0JzZGF6h7M1rDzYuEvdtO6Lo=;
        b=s180ypodf5xb64x99MNryy1AYxdJHYz9Q50ipgyQsixHqFQAidx4hGW4zp69+fPlUH
         slJyYbxxgl5rfOQe+mwxgauruNHJVh3HDzbiqyL31FjmLZaoJpPKFr4dPfsgLI/Oip3s
         fgIuUcYF2WADe1LN3TYehv8d3MIMm+FDCJHEuMA0nfcwmpZXJZCWVYEyaaERlWmNoAjs
         wOjiubCw42S9o5v9+BpcutYUwFG25jD0pT6/ShOZn6YPduvqexVNBJBKGtmr9+5ZPq79
         N/xlyNFs6yIjCnPZboZqdkU53Y2pvfRJT9QyW8cHsjuvuUlkYumuvEFP/B6aUkDFay+4
         6W2g==
X-Forwarded-Encrypted: i=1; AFNElJ92k7HPiXChgaLf3KbYmVxjt7YZKUprBghsswVbryY7bA2VeqBycBBE4Gm4owwjR7e3kl/rQoTHb9ZQ@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwOCnshn9oyGGO49eNF2/e+jdn/RDSBIrijRYAa3jJ+zU446sm8
	X54iOzmX+n8MUEhSQSgsH78UvzaFJ5umynscariRMQvxkdb8sWu2IjMJBlcjaH0AeYg=
X-Gm-Gg: Acq92OEK4+OwqNSmr+on8mTDS3u4kG8RglevZTXgWgDYMtPuNZpFegl0szuaw7QWmbX
	zSCd4ZYmCEzvzdWWa9eTk4SiDEqihDL0+qkljvubUMPJahU9SnoVB7M1eaApPi8Tfqo8FAvNfMq
	Sl1WrGZKsbqLna87c7rf3lGdk2I2RFQCAB8hXsCQJm4dTIzjpjuiRDVqMeDdkjfMMh+EPS624cM
	GsB5h2iFzjAwzWlZEYt29e056MXl8vHOUVk10JnBa4kSoUVho6V7nCa+M78HHE1epa+ZS0ZH6wJ
	thfZBpGKPBNdwODt0fXmsssUDLXoGLF04gGuqd2oO9ml9eNOxxeZ/JWLz1QOLt/hsUSo3cV92fn
	/jRTsIdRkU3z8/R8Qn1Gw4bNECVHDTqmnPUvF4/gcnNu6xSQznVr0ekd3YD47zmAEODm5n3DPiT
	A6DZ/+RdsHeEIFtYvJJ62Duphth6D27gvRkNo6rSBQVw==
X-Received: by 2002:a05:600c:6792:b0:48a:f18:ece4 with SMTP id 5b1f17b1804b1-490c25ee920mr437886825e9.24.1781123718858;
        Wed, 10 Jun 2026 13:35:18 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490dc4715e4sm62390975e9.0.2026.06.10.13.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 13:35:18 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 10 Jun 2026 22:35:12 +0200
Subject: [PATCH v5 07/10] m68k: stmark2: add mcf5441x DAC platform devices
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-wip-stmark2-dac-v5-7-b76b83366d5c@baylibre.com>
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

Add mcf5441x DAC platform devices.

Reviewed-by: Jonathan Cameron <jic23@kernel.org>
Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Changes in v2:
- fix copy-paste error on naming
- use DEFINE_RES()
Changes in v3:
- simplified DACs as single resource entries in place of an array
Changes in v5:
- move include <linux/ioport.h> in previous patch
- use predefined "mcfdac" clock/device names
---
 arch/m68k/coldfire/stmark2.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/m68k/coldfire/stmark2.c b/arch/m68k/coldfire/stmark2.c
index 7eed6097f501..a6f9eb3a75d8 100644
--- a/arch/m68k/coldfire/stmark2.c
+++ b/arch/m68k/coldfire/stmark2.c
@@ -84,8 +84,28 @@ static struct platform_device dspi_spi0_device = {
 	},
 };
 
+static struct resource dac0_resource = DEFINE_RES_MEM(MCFDAC_BASE0, 0x100);
+
+static struct platform_device dac0_device = {
+	.name = "mcfdac",
+	.id = 0,
+	.num_resources = 1,
+	.resource = &dac0_resource,
+};
+
+static struct resource dac1_resource = DEFINE_RES_MEM(MCFDAC_BASE1, 0x100);
+
+static struct platform_device dac1_device = {
+	.name = "mcfdac",
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

