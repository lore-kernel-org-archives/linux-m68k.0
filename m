Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94A1390CB0
	for <linux-m68k@lists.linux-m68k.org>; Sun, 31 May 2026 15:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780241172; cv=none; b=pbHggNWUalSJnXTmKLUnXD3reB24Ev58LLXG/dQT45EJi3yh1xhyM7heUvG3KlfSxJDJuJ68cAwEYhOFyhdqNWIgn72/01V9YGPbpNdXjC9WqN8k+slKQ2dNe4hQG9NIJ/VQDuSBQRD0hv/4TJASter2GioN5dmvnsaeuQbKOOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780241172; c=relaxed/simple;
	bh=0FPRuvNNSFiFkawKVCalHb3yLDUTC8vh4qdYQm7Z9t4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UsVhBFo/V6TgdQajNanU83U0tsQqB08aNBjiriUCfZuOkmvWBWa/ojbB0R2gyoE+xzqNAaepYzNeqf3gx+yHs9wmRF4vAVNjmFzuCF61YZreWRq7ChmM2YDNcHPkA4cMWkee3AxUydNH0Mv5XgrsXqZTYEUDry0oxnnxnzkXyn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Fsycmyvv; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Fsycmyvv"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4903d5c67bfso53319845e9.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 31 May 2026 08:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780241162; x=1780845962; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=00ruy8kpQH+b21j+wCBZYocT5CVhNgJL2HRPgVpHHfE=;
        b=FsycmyvvPcZH1e/LWDpH0HPGtynXY87FA0ACStbkzfEqnTxFk7yudlgru6yP3OShEW
         egWxyCRx9vYMzP+rM6zKuAWeLQ8PUrqxQTEcZQKER9E0khXyKEHIWekgA89ZcShqPE+q
         KnKt0rKEj7UTPA10NBFW5Yh0mwgIBEy1M4o96hDJ+frcWsaxJ6DXLlGyErpGRdyeqPSQ
         Uv4Nmkj2aj5l+9I81FxNhGFJLNZbd+vRB4oAxvE5yPrgb+jCUoOXcneLaQrjVVzIF8C1
         MdI+dwyB83YGfqfdlaGv4hyOxWwNexK1MrmdV2zkK11kr+eNr5uPQjVKuFifY0x15EQV
         9S8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780241162; x=1780845962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=00ruy8kpQH+b21j+wCBZYocT5CVhNgJL2HRPgVpHHfE=;
        b=CY240S8KoIL5V8FxK+0fERSIGos9EV6aenxokaoK2k2P6JnHnjp8pZBm4iyNla3jUd
         avhQ5+4u5BQJVgBbQ6enAPYC+qCoJlKjaOmGJPnuIDagIPbxIgHcUQjHhWnLPtBeHRNo
         tHPWhLJIKNqIWijqjwhkOed5PF1wF4JT3gsmjR/30BYwDv9+cMKmfC7qm+iHxl5RKJLh
         +F/mAQpIoRch8ntsCB/Cpol5PJCm9fmi89gpuVrbEHPps6vBhF3Ec7GZy53/7YpqxYID
         MtaR+Xbu1gRN2WXLlJuyWy71Fk+SzIq9cG9dtIvaa83J1pRE9Sqz2TKMwNeP/lvh5t8x
         Uv9A==
X-Forwarded-Encrypted: i=1; AFNElJ9/Q7Z82Ba73rSZsLl3n9BwdstCFOcVaGv92W25E1WqSkiywVYkErbNclAgsMMQtHu9AWupB+PmXCHE@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxlWfaXGfQZRrIvRdm5OFGTrSkwcVXTy+ER/j+/brW/aNpagre0
	5uHSM2hPHNKwCAANf5vZs4vhCUywWxbnM8tmOClNdVatCb+jpbsaPR0pbA0OMaqnHUU=
X-Gm-Gg: Acq92OGHrSlTSvdPOvzTC5fiTL1Nw+D4z716ypq7SOpmdfduanH/Ybo5r7xLBQNrd8U
	l58VLI2NoTWp10XOA1Q9QhkHScTbfuQXoL+uehptvLZa+v/nQA6psh/LlP4ri++JS8yjDjQ951o
	ScMaKwjQlK3bJVvkF+gzgQOZ+rqbGFPLFWux2N3XnlwXN5eJNLvG+P7YVl5tMm/28LF4lISL5IS
	Zso8aRA092MByrFILqu27MpE7babgepR34W+cxFSvb9nbldpgGJrTk2kuFH+Jw5YSpoD7pZZALj
	9M7AyIyX79kbEZTIaWD6dmujV5U5AifHrPu6r87r8CaHvEMWVpNXWE17gEkWIY06eAxoUkwve7j
	owKsAaB4OFwwzSikzw32dMpnM3WHfBVn1hkWlYUgb8jE07m+Sl2VYXRq3Hmn8ZH87h8MEpsQrnL
	AfEjcps0KHhOm2nT8f0AXS0EZQAdvyfEcntTFnSek1cQ==
X-Received: by 2002:a05:600c:5395:b0:490:4b89:535d with SMTP id 5b1f17b1804b1-490a2904b29mr165959705e9.1.1780241162528;
        Sun, 31 May 2026 08:26:02 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354cf0dsm18526622f8f.17.2026.05.31.08.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 08:26:02 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Sun, 31 May 2026 17:25:57 +0200
Subject: [PATCH v4 04/11] m68k: defconfig: update stmark2 defconfig
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-wip-stmark2-dac-v4-4-7e65ab4215dd@baylibre.com>
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

