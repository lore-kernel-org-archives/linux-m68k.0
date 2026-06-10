Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4819447DF89
	for <linux-m68k@lists.linux-m68k.org>; Wed, 10 Jun 2026 20:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781123725; cv=none; b=DqH2vaCygbjtvB6nyICBr2JLV+pTNqw36rB4QNJuvyPPafnIVZ5KTgd4NPnGsrAU33joHflEgIOEnqkNN+Oor+ZFTBv3LvDbDh8zj9wIlJaDR/F0DvoapuqF8m2EdY3HXU9rnRKSibCbU3B1yfbzGouW02fLwAD8P1KlkvDZu7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781123725; c=relaxed/simple;
	bh=JjQuJ+WAC4HyNOpJNX50DDwFBWBZkz8SWnUBsgssTIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oQgRSCSpI7MrTGR7Ej8OR6TCv1H2N2PIF9xVQND0fPd9KccHSuqj0bqhzDmAEV/dXPZbz8vqHxRyVaHCJ0crPdrd5skSoXqOYUGFrmpRX3A2feBeCYH1lnGSxpoJepECkoHLaKpFp1JL4yHKAHWPwdkW3wHuc3hyESRlRK5vuyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=dd4bospF; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="dd4bospF"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490b613a17bso70916025e9.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 10 Jun 2026 13:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781123723; x=1781728523; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KoOn6a9eFPu3j3lxjvRT84RKODlbnmxk6NgG22+hUT4=;
        b=dd4bospFdt2b+uMU7mUMPiTTzlY1/Vgh47XYYYkMwOq6umnHJ+iVFKZbYGEZX2vOzr
         l75yfponlPpTxleEWfSt2+b1jCmRSSU/tm8xdEuyHk1AIwRHIkg0nT+tTj3fouJupyx7
         2DkLryVgxTT7Z189ZjJk/ZWG7dnG1ehKktjbci6Jme+72M6hmBadT/o0gmtSgmeu7jqq
         Sy2SjXqZ9fCoCzK3HDl1IlbaMj2ycRl+rhod7+PbxDW+NWRZzROJlzwGFVliXgyRb+6X
         G0BUeQs8wqyml+RJcaIeyjMi+xQPfUg+COhcTh2CswMii2o8uM8d2gyhuiuTyP4gZ/mm
         qHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781123723; x=1781728523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KoOn6a9eFPu3j3lxjvRT84RKODlbnmxk6NgG22+hUT4=;
        b=hpzclxN5IS35A6+CoN9WnGdcQ4bZHMmXdwn9zgCvX2I3D1L9tLwRCzmQjkDGcI4NZw
         JOJHj1h+7b2PMsvSTdy1qR2wFNgKRHM+BfWiWmkrAwm1I9p94aaMvwMzM1WMJA241Ns+
         37BCtVRcIlRKqn+OYZfbX+S+M5+1jP9U1XeyxRPnLfG360NNqbGzDyEplktfGRs5wH5o
         qcXhOMg7VzuN0N0bkPks2Wyk6G96Wuv7xCUY/nDUKh3N3FEg8C5RqFRBPIhQSHEUkE+z
         IIPfzwnVLfZKTcFjfClsOVW3y5Cf6JHYzyFWDc2A0ZXuUcfRpSZDRK+DDFWkxtBK66UZ
         qs1Q==
X-Forwarded-Encrypted: i=1; AFNElJ9V9I0clns6oUm8kHb/rf+yrDxPnOAgMcmSSWkmJZxw1brwnHCyccvTfZJxYYRfwsC/ISJYEvC7zZ/e@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yw6p7QFz22bfPO3YFWqVST/AF616mW42ljptUClXqEzJW1Cqmmn
	N+kZ/mz/1bfZhTXhcRsKUR8ZP7TiZWiahroiO5d94vp8CSOwBGMeqV6Nhk0kRTaIKmw=
X-Gm-Gg: Acq92OFUN9mqRS1PDs46j7WParcv5a+KvxedrzCb92DtHt6FRPMGoMGI/urOCMHyU3N
	PFmXxykAUOaa8YSI41O/ynIigs4m1JOpafSg0zhNd5AprnQq6gmfQu0ApkpugXHWTCQNYWetQ1n
	TF3oYwxYZ9FFFTHn1GhlFdFn+gB8eobU6GT0LUP/1jPOYqe2UvDiC17qthAy5nYiSkMwGcpGDma
	9rZGZvoCA95LipNYFF7bVDKvUnWN8crYHfaZuZx14TCRVcbdv4qvckDKXT51NfgVVO0Q9Z3UQ8D
	Qj4uZ9uci3w48u66jfYUp9iakRkM0fAGju5xGJ8eaad4rTzAvW4LRGjQD6KlkqXzHZ2Od1XUUvq
	GoHN9Iztz7chtcZHjAxIDEZC5QZxkyCzhfWDxdhDBTqUBaJMiq1jyEUcI2V5Qb0+xIl/7wvL6YE
	AvLV7cWgUq5hmHH94pvY34rTWSg+D/9NclfYdOAKSzlQ==
X-Received: by 2002:a05:600c:4fd1:b0:490:b025:f324 with SMTP id 5b1f17b1804b1-490d723a47bmr117954105e9.32.1781123722748;
        Wed, 10 Jun 2026 13:35:22 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490dc4715e4sm62390975e9.0.2026.06.10.13.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 13:35:22 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 10 Jun 2026 22:35:15 +0200
Subject: [PATCH v5 10/10] m68k: defconfig: update stmark2 defconfig
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-wip-stmark2-dac-v5-10-b76b83366d5c@baylibre.com>
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

