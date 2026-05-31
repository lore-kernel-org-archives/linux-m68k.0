Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B9D390C8B
	for <linux-m68k@lists.linux-m68k.org>; Sun, 31 May 2026 15:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780241173; cv=none; b=quC6+f1o9JpsQKcwlzxDWccPCOMt6PT7UgG9BDmSVWhOPs07ZWi1Lf4Eh/TTLnOwOo+/qkfoFPsAoDCmlL/nU4ViqeTPqD+is9PyxppBERm4rjEgKiCMXRwrS3Z7Bmogu7eELRIPty7YpdWqpy0J+zQTxKUbf6vYFG5Du4ealWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780241173; c=relaxed/simple;
	bh=iFBnWNy9SV4SAcwunY1yH81YlisibbWmCe18BpxZkj4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QbMonWlPgB2jAIG2U9LbJcF0Jrrw4ZBfHri7/l2uNz6N3u2jrdyYmndCmepkHqHRTF4olgYOnBzk176Ti8wBD+v8sfY6f2EeN/MtYJgNoEkIbRBfuR7mBIU9nakEEC9N5VHIBQ9UiOfs3hfbiN/g2mkD13L3N6liVEvBgGZDpgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=cEXqGssU; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="cEXqGssU"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45eec22fab7so1660993f8f.3
        for <linux-m68k@lists.linux-m68k.org>; Sun, 31 May 2026 08:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780241167; x=1780845967; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VkH/fl0oDwirECp71YLEqMq9AkaqaSB6/Kul4n+Czac=;
        b=cEXqGssU1KDJ8vfgqS5p8iQKcYnlMVy6UPiJ1Z3XAbHmKlgQzKbq7QtNGTtPscJVyh
         9X144wWiaU7tXEsXmC6Zt7L84iqJLGNPFgnZ0q1N2HnNqayXultfI4aUBVhRFk0Nmoik
         RXbgo0+mQwcoMHK6Gsf1bwSNSeVko3M/oHudFaJGxZ6GbwKAKf+y9AM70sq07il9ATv4
         X4grJcX58t7hc6onTyvTtSEUSei18dn+mdvjknf4/9UXWB1eswANVwahiuWW7t+05k0O
         YXu6hhR8BF6eSUPxFWQwgGeV3xAWsJJqpF2xmk1KSmXBGgNUNQC/z1dUqI0tqI2bRCzA
         uOyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780241167; x=1780845967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VkH/fl0oDwirECp71YLEqMq9AkaqaSB6/Kul4n+Czac=;
        b=JMLJJ+AE6zpyppSMXUrMy0fLh0ou+RoltdbnFd7HLYkBmaM9xCvs6m6plMS1EB4NMF
         UMUopVzUtuD3BEnl+UDnc6xDa2jyUIdSoilnhnd4MPnJoowvPJ4Rjva1d7QaCvhxTZei
         n98FiK9FYLMFZCNavxcTl3KBrQptI4Sk65+6ickKjJQssG8oJBfrANMj//xWX1TvD3f1
         DnTS1Za7nk66PN6humLR1VCpIdtZ7VwLaZwr3q1s9Frt1HvpNLy4An18T1ytJ0hj1fek
         pvKlPA9gzvFmy0Xqs5W7GrvNq2wir3rq/tKONFMTT0Hd73FMpcoDErbUX1neEB7VJXqb
         m5eg==
X-Forwarded-Encrypted: i=1; AFNElJ+fv7bZXmFbD2bJ8maLYb6dTJrU2SQ1x98aYJo9U6Za6uWBHrpk1sOa0j6PRP6FCTLYpf8QnT4DVD+E@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwA66hcBUgzvW8Ur5qspqHQTLBS1KAy6r236NAlEcWvH6eai/Fv
	joabW3Symqak8iqaO1bBu/eweKv84p5R699aUq0nMaai9ogkIEfUFmQaEv+PaSGx97Ed3iZtgAw
	UYsUSapA=
X-Gm-Gg: Acq92OHjq6rTcsku+NJu2IqssovWrGeUsBwXdSHXBbjCluRPjpAoiPaX/S816JskV0X
	LZy2FeAB2wmhFUAA2PRGyy/gIN28tjTMTQoJGb4hs8+zJYxL0gqk0JkYq88Xtqwc4cua4tES/ZS
	ihvvsdBvdAq7JpTy4M2iFCizL+flN9fjRxIKf7Hr3AnZkVCVFqpilSypmN8U0FKbydGmJ0kEykY
	CuZDJvvz8CIMwu5j38hd48lOuFyu+PZrc3XVtt7PMEjrLwVyfcDXBGm+9l7ElLsatLY+MqOhp1A
	FJBesSGvMM/+DfW/WJpc3YnIyBey9kFrajL9um+ocb0LoBjWh3JzX7OYSUp4tck9my2LQvSMvwx
	slc9k107OmN27sK+uHa8KkAxdY7wP82eHqFOobHHEH+M8YMzz5aN+RmjKTfLNIEj6yzG7IuW8ho
	j+tsz22FZ73l/HARaMmu+ve+9LvJZlmruKHQ4tEwmtqQ==
X-Received: by 2002:a05:6000:4284:b0:45f:f142:d56c with SMTP id ffacd0b85a97d-45ff142d715mr7307074f8f.16.1780241166806;
        Sun, 31 May 2026 08:26:06 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354cf0dsm18526622f8f.17.2026.05.31.08.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 08:26:06 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Sun, 31 May 2026 17:26:01 +0200
Subject: [PATCH v4 08/11] m68k: stmark2: use ioport.h macros for resources
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-wip-stmark2-dac-v4-8-7e65ab4215dd@baylibre.com>
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

Change resource declaration using DEFINE_RES_*() macros.
DEFINE_DMA_RES() is for a single dma channel, not a range, so used twice.

Also, some drivers assume IRQ resources are from index 1, so just to stay
uniform, moved IRQ resource at index 1.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Changes in v2:
- none
Changes in v3:
- moved this patch (cleanup) before adding new resources
- moved IRQ resource to index pos 1
---
 arch/m68k/coldfire/stmark2.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/arch/m68k/coldfire/stmark2.c b/arch/m68k/coldfire/stmark2.c
index 9263b77bd09a..536252ccb87e 100644
--- a/arch/m68k/coldfire/stmark2.c
+++ b/arch/m68k/coldfire/stmark2.c
@@ -62,21 +62,10 @@ static struct fsl_dspi_platform_data dspi_spi0_info = {
 };
 
 static struct resource dspi_spi0_resource[] = {
-	[0] = {
-		.start = MCFDSPI_BASE0,
-		.end   = MCFDSPI_BASE0 + 0xFF,
-		.flags = IORESOURCE_MEM,
-		},
-	[1] = {
-		.start = 12,
-		.end   = 13,
-		.flags = IORESOURCE_DMA,
-	},
-	[2] = {
-		.start = MCF_IRQ_DSPI0,
-		.end   = MCF_IRQ_DSPI0,
-		.flags = IORESOURCE_IRQ,
-	},
+	DEFINE_RES_MEM(MCFDSPI_BASE0, 0x100),
+	DEFINE_RES_IRQ(MCF_IRQ_DSPI0),
+	DEFINE_RES_DMA(12),
+	DEFINE_RES_DMA(13),
 };
 
 static u64 stmark2_dspi_mask = DMA_BIT_MASK(32);

-- 
2.54.0

