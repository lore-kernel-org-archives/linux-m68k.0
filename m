Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF9D3E5A35
	for <linux-m68k@lists.linux-m68k.org>; Wed, 13 May 2026 09:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778663687; cv=none; b=CqIQNoAGaqMWCWsiYRVDwHjdbDvds9ofpJxUwe9MV4jxxBqvYoRVRVLfgoY1ftn4ilUrbg13VsCxOFv0fJmJAKnvStogQqBcRSwCqDpMD/jPVfhW9XSB5SOyil4yXrM9RyHS5Vu/scAOn5CSgkKlhBRsuZ+Q6dtD7lXSwoZ0iS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778663687; c=relaxed/simple;
	bh=0FPRuvNNSFiFkawKVCalHb3yLDUTC8vh4qdYQm7Z9t4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o2R5dUDkCYjS3XSZ0q8BJOin9tU+ea1/H6nUUcxGT4n5VD9l9atoRp8tRCjjg1HuFED5gBBmYGYKudJi+WMGKuFFtvmqvpwUQDzEhyRS7fYmHHpyqqEtwBAXpVW/ls6eBDp/mA2jD1twJrU+a7ZG92WN8+Ly9l8WHgRC7v97sjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=EiKPWs42; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="EiKPWs42"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-44c350a5b87so4070695f8f.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 May 2026 02:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778663685; x=1779268485; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=00ruy8kpQH+b21j+wCBZYocT5CVhNgJL2HRPgVpHHfE=;
        b=EiKPWs42jwYMzeYpbirioxbjJrgqfPTXwZbvxDXTnBq0Flc8sYCS/tK0luWqSYuQpy
         +xwDBnsR4vzVjTKIXGR7Xu1E/dD5zSFeBVv0pyvGXTIlm5T6QW5XczQlKVX6SRI75yqF
         h2CbbrIRQMRZis1/jfuqeVxw78XBtH0fBQehAuiIsXlV+aeawAK3Emk3SxGbQljSKSAf
         qL981+IJZGmF1aMpBcImx4e9IU7VPXT72zrD9ergM2LKyOkWvHDsQ4Iv9Dv7A8KT72KJ
         t5u+gvr7h0hYXmmBruecK4dIKcgXoxVA82m8gKkuBSDtq6P90FFRCVVhWQDNYoL66oBA
         K4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778663685; x=1779268485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=00ruy8kpQH+b21j+wCBZYocT5CVhNgJL2HRPgVpHHfE=;
        b=MdP4U6sF35sSD+MAtP0qJK6tEVV1/WzTw/kgdDDT4mSTKtSczApCZ6Ug5zK8rIKsmS
         OwAS8r6I2Fk1Fz7oomAA4MWdsTZguVCAuHeKxOQTbG3jx2dbocca/xXzIG+4C9pRu+8e
         /cUkFbXrbPVOitXILmBYKczK5FAuO+4x7o282vUHIv+nVAQvreFb0sWUJSVuKr1NdQ3V
         D6+WxH5y56hQuQI01XjgNLPoZn8DjJXFwswWHfNK0D8FTtjpCj9FMyEDnkRVy2N/HgXZ
         sAAnNOogPIfUFBxpKahu81TXUltlPRkbYaxm9thA8dYNmmZUugkP9PZ7hv/GIzfGlP/G
         VbxA==
X-Forwarded-Encrypted: i=1; AFNElJ8XlQUnJhjaVNGnPLaIJ9DWCTFHfNmHa4nvDLqvMq3XpInCEn2eb/i2ksQr3lDtGIOMruI+fu3K1I3x@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzLSfoeYYiAtJ0zB2edo1rVYCJsbCxV4DpZIYHm18URY1rwAu3B
	SKmUj4tCH8h0RYFqW3pgKGkIUhCbixfmlWUsFMu8fhPdpsAnrL6Z8rk9PlR2dveulUs=
X-Gm-Gg: Acq92OEPmrJtpWAG3Za+2kLrG22mQj8K7Sj01YTx7VF0pAWOwIhcPbWdD5dnVjg0qpl
	kWvcP92bYjVZcsUp2ug0mupU8jlOL9xxbut8sN0vcdh3CSCBKED5DhnND50NJzQfwYpUIAjAYCq
	T8NIUQEBHS0oJLVk1gjr8Hluo2UMZdp89XJzeQsbWxUaEdRJ4uqkQfoPsgf0tKirFtMFQ0BDWDG
	y90IZRG9bn2nBvrn6pl9cJxs0FKpiKXBgnDEwyxZlNeQW5DlngRkqpFcYHsPbnDMEgEjiVAIP5r
	KpaRZiVqeC55raq4l/sSwTQTXI7cwObuEPWjMJ+q/4CPly95nchQPoOUAGFcqHdp+2URVy5BXYs
	4Bfsa6sx1ePa0Gr8PXWV8cS6AMN+HJisUMrGDj+DynNAocgJYOonVDMpuEmN4kCXBNp2EAx20oX
	V28MlibT1lF/L4KYbQG/IUF7hlDjfAWNM=
X-Received: by 2002:a05:6000:605:b0:45c:3f0b:be08 with SMTP id ffacd0b85a97d-45c599ebe6fmr3537011f8f.23.1778663684744;
        Wed, 13 May 2026 02:14:44 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a66bfsm34590821f8f.4.2026.05.13.02.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 02:14:44 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 13 May 2026 11:14:28 +0200
Subject: [PATCH v2 04/11] m68k: defconfig: update stmark2 defconfig
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-wip-stmark2-dac-v2-4-fcdae50cf51a@baylibre.com>
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

Update stmark2 defconfig enabling MCF5441X DACs.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 arch/m68k/configs/stmark2_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/m68k/configs/stmark2_defconfig b/arch/m68k/configs/stmark2_defconfig
index b3fb95f73a95..3941113bc60b 100644
--- a/arch/m68k/configs/stmark2_defconfig
+++ b/arch/m68k/configs/stmark2_defconfig
@@ -76,6 +76,8 @@ CONFIG_DMADEVICES=y
 CONFIG_MCF_EDMA=y
 # CONFIG_VIRTIO_MENU is not set
 # CONFIG_VHOST_MENU is not set
+CONFIG_IIO=y
+CONFIG_MCF54415_DAC=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT2_FS_XATTR=y
 CONFIG_EXT2_FS_POSIX_ACL=y

-- 
2.54.0

