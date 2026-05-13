Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7F13E6DC9
	for <linux-m68k@lists.linux-m68k.org>; Wed, 13 May 2026 09:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778663689; cv=none; b=Nyp/W+P9eV+ywCObLwVJvF1J+5BivaJT3J2kq8TUcjtY3r//2RMJ0xu3Nf41LtNznQMsEm4Or6m0peB2zPXrB0bkGroJouI6hTZzf6rTL/EEpcEFgXv0xChIlk6WMgRw1atIXX2pQL88GyddFOTx5z2HRLxvTpbsjdtzYlrt3hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778663689; c=relaxed/simple;
	bh=BTzMq5e9Ct1iS05RorpLyh1aN78tCIlpP86CvhH3+is=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dmwj8yJ+GwU3Cudhf4qO9+p94j2PgOahex8gzrxFeJVnON/cIjHFg+mkphf3LuYZZfRMFUKhnu3W112zQAcevPUgc67kARuK6UHB1jA6nz4Oe99bkwO5fs0oPzrgRPiyMQGeKTrIS+PUC3HO++kLPqKkkgSxWKGDfAqmd4DXxLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=LF2rgLUX; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="LF2rgLUX"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-459bf19e87bso1787113f8f.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 May 2026 02:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778663686; x=1779268486; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=66sbIWl/UECZcngzqfN9gySpU5b7WSWy5FgqX8acPdE=;
        b=LF2rgLUXI1HqWUOZLLu/ajXwd4RjiIjPxTV+e3ifN4UODr78sAZYHbhrScqY/vaiCz
         BduB0k5sa9vh1nzeDJ9YQzivN36XFjAoei8reSgSPGx5szjYvQJnwgXG0O5cTOrKXbxD
         9Zb5Iw6U6PB6wqLh/ingRxaAew3vlnp9deDxK1AD8MjCgROpJeoRdUN8VLwYWNDYa1uM
         cUaBHrQyJnjHJl+5fU+JA8mU4vqIyAxlJP2T8LH0e/Kog5bhGhkCiGW3hqaPPo4W/7kV
         O2ciakajJyT3qq1SiXHiHLscew9fkiC4XUH5IpJxK1hqRqVSdVHB46xT305A7MCzN7Bk
         XZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778663686; x=1779268486;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=66sbIWl/UECZcngzqfN9gySpU5b7WSWy5FgqX8acPdE=;
        b=XvRjxNCBQ2OxUje5GAZPOOeyLkI7zO/j2DQg+8sbGXhFQo4+78MgDsUtJ0FFeXxcYh
         z1c8Yxtoq25eccTDtNQax7Z2Q7+Cg9kuKTf3wq01O7XwkHARniOsaf6XazE1w6hSdhff
         0OdQDlnMOeAgGldlgOgUsAKUaohGjjWnN2E0rPSdMso3h8K0IZxa8FweyQA0rp/6P5GL
         Yj4BT3zSCR08LjEe6nBwTk7OaSx0Pq6apKsCHihAwXxCgI/nL5vPAFvwjmohl4mf0UC0
         mqlqF/NNzK5AHeS8m1gd9STdhlEZLH1i87nuhKN2yKnQ3ogph8dUiSt4wF2CfNvW9ZEf
         Xubg==
X-Forwarded-Encrypted: i=1; AFNElJ9MTpaj2pzXBJMUK4C+fWuDZlj5rkxpVQ1GLG57Rwpa1SO7gOHwHnUAp/Zy5HMBT1TYG7gq6arKHRUY@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yzhj9JSLwdYiOpH/8Lqghdv6jfDi2gtHYZDl7iPSxfBIcw/PK0k
	XoV4m5nBdkx3RUL+iaMRE8EpR+TCY3Z55ba06gjnBYombgP72YtSgNf6qpGclHoIqOU=
X-Gm-Gg: Acq92OG3FsRFiv5RDYTVHZ+/Spd9bDHOOYDXc8fMnU35VYwzwUic472LO7cQpPRiG6M
	1t1FxA6E9/rED4yMvoMzh3wxZ2INCWbmlbQWBJuO/KbD1MvUJnR25ciTN8RfVdEz+ICjiFVNjpb
	DP/gyZouiAc4RC+spba9XLD779nzhFkc5fxdvWJQc9XHxtPmpQHgZ/wkayYLq8Cs1DiD0wXHalA
	eYDHK+Krb5t8bPIATK5vVeq4Zcl54HMV8ZR3lsUtZCI884sa5jBCI4AxayNVBIip+UxDknZZhIj
	5HKiuOH9XSz2c0wvUW3Xi5nX/SB3QOeK/vCSYcwNBpdQb2+Pw3jlPaktFwhfdCy8KkHNK7cCbtX
	h7wjkPhh3bVeVxVHa+JYVmJG0RvLqwFZxCIEFEtRb9ctohe1I58wry1J4La5zd1jhsaLncG4EGh
	26nWJ15Gxc4uVHN6Jy8u64WtYrtOMX9iE=
X-Received: by 2002:a05:6000:26c2:b0:43c:fdd:ea96 with SMTP id ffacd0b85a97d-45c59cd1579mr3756642f8f.26.1778663685719;
        Wed, 13 May 2026 02:14:45 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a66bfsm34590821f8f.4.2026.05.13.02.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 02:14:45 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 13 May 2026 11:14:29 +0200
Subject: [PATCH v2 05/11] m68k: add DAC modules base addresses
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-wip-stmark2-dac-v2-5-fcdae50cf51a@baylibre.com>
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

