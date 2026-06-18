Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9AC34E745
	for <linux-m68k@lists.linux-m68k.org>; Thu, 18 Jun 2026 21:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781816666; cv=none; b=KV7cpBtoVmmOmDNXPrLVkEhW4cdsSU9ytBS+CGhPeKxNBTgI0rfCrt8B2mf2YDiH2AQawT8jpgv76aIreDbrim89eiNaRi3trlIoXZFYyLBfppcCpo0pPoxIsTnVNDpYUSOWZGf9mBF6tC1uuUAyJt2IiHTieizGIclTmiIn5tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781816666; c=relaxed/simple;
	bh=JjQuJ+WAC4HyNOpJNX50DDwFBWBZkz8SWnUBsgssTIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DxTDLSPHh+1pyFsRVU3tbeOMkdcbbuGqn6Wu3k4A9vdg+rOb0sG7xXfNWypTT07ch15EYdn7bteIcXSHcKLhwx1P76XaPu/QLmScZRQS7gX1CByegRmoSdgIe4dYkV86WjU42S6UUOrwwU8zGST9xJdqRmLOa4UZGkBAQRVl52w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=BpvSrCNt; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="BpvSrCNt"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5ad4f1cf3cdso1317782e87.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 18 Jun 2026 14:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781816662; x=1782421462; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KoOn6a9eFPu3j3lxjvRT84RKODlbnmxk6NgG22+hUT4=;
        b=BpvSrCNtqLnjmvlyLV1Pf4/sh7C52NLmp6pHq3S7uEk6Gt16Uu0EmAn9fjb+x4W1fd
         9tx5LLwH1g1lxqFcmK2zATfhuCag6Rz5Rq4BA7ZThYFq9etr7uLVJUynNDLpL1a/xttq
         q6dKZs699oxxWtkIgWIpuagfnS3yYJ5mfLB6SCDJQ+KV4lEyaXJ7Dzmr89xBfu/6IW7r
         L94TEubLLqR4rgksq9qDveglwK7bJUeO+x6fNQQ/NeWi+V5jZZ06tQ4mRW+MGEPg76b1
         XXY2PhjfxJdTy29Ll69D2UbYkQBYZKOmXntbY0IvH/yVibBL+18JZmSasSEQIL3vOYVO
         1cIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781816662; x=1782421462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KoOn6a9eFPu3j3lxjvRT84RKODlbnmxk6NgG22+hUT4=;
        b=Y6tDoPbIsZTcDjaW973pg312WmKrsvYCUKhMhrniaXj5Q1/89EQ00aYZpJ9XGpam+B
         L43CGYTMcoesSxJToBC01gTPQB0fyhPtmBEmrAb/6Ef7aJ/LjyK/O7GdgR55yEjuJy8y
         6a/+vj2coFomltf8AOshkmcIUX2IMBRcbmehNCvrpaGVZjWPl81GfMusgWEJu2JxIlYc
         FI5haDRGgxcuc08hqewNTyVKxG2wZ3hd1QjvDFw6cVqm9ETgnCp8b1RjLOUcHgCIiMiT
         PjLAsgT7ecKiHj6FDfvhD5XHtH2naVk4yQtsC+fISE7cFSdL5AmTd7ELzSttoXfD+ND/
         p9jQ==
X-Forwarded-Encrypted: i=1; AFNElJ+jiLceVzFQ7UOMxRvSkGE4jIGbFckEjqWOrpdz34Ue28KQNPpaVYy9KEuw1l/zj/g9vhBXSnM0co1F@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yy0rnE73a9mISy3LnKwOkRGPPj7Hlepn8kfCZuLjqGJGpQKzwDU
	piLNaIUZAEKkfWQvDwBBo1NDHQztMBmkkjHIbMlW4/VB1KlLRG7xbZcsfUxFo4+iVr9gEFSu7P4
	CzUWi
X-Gm-Gg: AfdE7cnGqXXQSGI0S2TCoYdwVPTuNNpQVim4WzveRME0CgJkTcgYrZ/e6AaVawSnovu
	xMmdSDHGLVTkeVvfWQizKHlPJsrB3qRURCSEMABFSQaS+r1oHD21Ft4YatlmQZzxCXQV/t7cli3
	slRJn5bUBkTZ2ETz37ICLUBXhKUSNK23tGJnAcYnMFLUKUxjxF74yJEjnJGx+s0/BthgYgDG17g
	Suy8MLB+lINTvYsupQSXV7A0G7BmT+tURB5Hx5tQNCV6dzKH7VzXGZaMYudCQEOiSFWWS3ozmLI
	yMwsjyU7L5QU0IDcxnREMi/SC8Nlyf8kF7ACXhFhP3XvxQeLP/gb/yhoG2Xoln04f/NMhQvM7mg
	g3H3nxoXQxWKJ5DpvkE2n5WCIEyhmkllT7WJPtTf6e0PLt3dlo2dpb/nFy5UhdbyydKptMncEel
	yhb+g5btgIzKv38Do8To3y
X-Received: by 2002:a05:6512:2387:b0:5aa:684d:3c7c with SMTP id 2adb3069b0e04-5ad571f3eb6mr148655e87.5.1781816662483;
        Thu, 18 Jun 2026 14:04:22 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad57493145sm108586e87.69.2026.06.18.14.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 14:04:21 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Thu, 18 Jun 2026 23:04:16 +0200
Subject: [PATCH v6 2/2] m68k: defconfig: update stmark2 defconfig
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-wip-stmark2-dac-v6-2-48761dbb96d7@baylibre.com>
References: <20260618-wip-stmark2-dac-v6-0-48761dbb96d7@baylibre.com>
In-Reply-To: <20260618-wip-stmark2-dac-v6-0-48761dbb96d7@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-m68k@lists.linux-m68k.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.15.2

From: Angelo Dureghello <adureghello@baylibre.com>

Update stmark2 defconfig enabling MCF5441X DACs.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Changes for v5:
- move this patch after new Kconfig symbols are added
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

