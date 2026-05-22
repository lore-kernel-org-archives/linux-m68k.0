Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96AB38F250
	for <linux-m68k@lists.linux-m68k.org>; Fri, 22 May 2026 21:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779484890; cv=none; b=IqIBLQgk6plo6tuQaEfj6hl1si8B8bYR0sqL2ZYkl++9lG9pDwbqgkfg/kIjQ22SZJ9IfYNwSrvxDo6uWNt9LC3360b7uNN+d4+bwpC0RqmkSZOILTw2HEQFWpQBiOvC+26YsyK/srprfA8CAVjDVThC0mwMC79+3aYmOrrNJkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779484890; c=relaxed/simple;
	bh=fG9dTQd6OKY4ybUsIIQRbILKv3sfqdu7vBpdDFZ8pvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fFOEfBjy6fHWYgFbyaD4y02waXFG5LSNjHn2ItRY6N4zsqwcPAhBbPki7yNv4PBIs6rm3mWFCtbVB09O2fxpOq6RIycXc2FVzOq/JiflsE1y8P8FYqXON/utyTUbEiTmmiZZmU4mh1ZUL5dB2fiEaAPQEWa3AgAjvqp7WfG13lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=APEOePJu; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="APEOePJu"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48d146705b4so82890025e9.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 22 May 2026 14:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779484887; x=1780089687; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vo148tLRdvHB4Hf8KQfkCKci/SYla3jkLQmLRXKSwIw=;
        b=APEOePJuIL8RUzBvMwxf7+qMB0V4j8tCzv9kBeZPYfRN/Y/aLaZPtGBJU6twhSD9DD
         XvvVvC4v70+H3p+TQDNnm9JoQWGF9ZmFVi5FeUOyrR3D3MdMaB20t3hBAjtTGfbdUwiv
         wHFhV4Lmr/W0cKOoKIvNXLkDoGKTFPwLITCcUNPGNvRNh61+kmwjGUC7w4kQ4Kbzn493
         DvT8wexG64G6beTNN386QKAb1iJ0aUXa8TyVFMhTpHTjsukrpe3RJNJ7h2n4aj1azjvM
         zbVn4JgPnDkDUppc7Z4wyhW/RA7alYdWk2ZkQ5J9J6rHh6A+tkvEPPEYfSVUAQXzicmo
         zwAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779484887; x=1780089687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vo148tLRdvHB4Hf8KQfkCKci/SYla3jkLQmLRXKSwIw=;
        b=oqkPHMsr5NAq2ZXtnGUDp78LkWNF55xdBeBYcRQk7sDPXlOdPMw/rkTD5/m/R7/Hdh
         mWCet2Kt2r29j8vEF9epJoMvQ7KBSByL7szEklESwZ0PbRJuphmPsQJ9AIvphnr46Zsj
         3yAHJPbwKDyQoeqQvUrF/coUNNmL2pj5r01rQ5oU/tW31IlAg0znBIOKvp/Q19MSz8Zu
         lwSh9iV100bs/VWPIf7M2aK3xDd4ljN1NwCKDulROFNha55ufV7yqRzPElCzrytb0nzF
         rVZmO8QQvUsg3Fljwr9ddpjVFu/Sf+UpsKY1ClPrp34/byRA5mupbnNcYBTS4D7APyP3
         JBbA==
X-Forwarded-Encrypted: i=1; AFNElJ+Nw8iKTUe0cPVLEDurlterzm8mujsL3stKsFL8Sq02j2ZVrePn88OMOEuq8hhW7BtcTCVRRR8ed7AB@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yx026XZuLk2rKQ7ynr81bDlBIcFokWAw9ghOSC1t2SFxNCRpuwm
	QTPSiosXetPXI3ik0KUT5y3/ss1qr7ELxDlkPuj+MwiNIFENUdaQK2sHLNQonSQcBVXFKqSf+z6
	ZsXGXI64=
X-Gm-Gg: Acq92OGCj5UcY9xBLG8PwjYFySGpg2eVaRjSWuv7bXYbF3mFkRvfgaocmpLTSLoebiD
	0rjNppACHfYfSr//xU5HV85RSxdLzzLRK1/+EUrZ7QruuNK6MPP8K3M6s1CoOP6WjjqGPj8Qlcx
	ggyktjt8gcKbFfJoti5ujG7XI6QmV7DrS5VJQCdFGLzULkz5fIx2ptGHl+er2A37xGk/Mx+m3KE
	1pQ78u7CJIPgHEm/jwOUyu9/i3yvhFIBw6ZYb8ykIXlk8ol/9wxl7N2uEGjt+Gm24kJQVqJY9fH
	5zQgCXBV5HRwJ1+k6oGvdKLDQBKgg+DvV1TKErOVbmpCkK00R0UQykxOD2cr4+VWhHvHvW+qskE
	uesEgx6LVoCAdy4z2ug40rh88PV+MktMNI5DMc5DGYHUJoKmatKtzidGphdpXfnmok66M5dQWCl
	T+Y7NIV+tf6UzJKHh7/U9VeioyrZfS+8ROThBjllB2pA==
X-Received: by 2002:a05:600c:3e88:b0:490:4ee0:82ff with SMTP id 5b1f17b1804b1-4904ee086a2mr18391895e9.27.1779484887170;
        Fri, 22 May 2026 14:21:27 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b82sm73312225e9.9.2026.05.22.14.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 14:21:26 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Fri, 22 May 2026 23:20:38 +0200
Subject: [PATCH v3 10/11] m68k: stmark2: enable DACs outputs
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-wip-stmark2-dac-v3-10-16be0ad35a67@baylibre.com>
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

Enabled DAC0 and DAC1 outpus disabling shared ADC inputs on ADC3 and ADC7.

Reviewed-by: Jonathan Cameron <jic23@kernel.org>
Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Changes in v2:
- using mcf_read16/mcf_write16
- remove unuseful comment
---
 arch/m68k/coldfire/stmark2.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/m68k/coldfire/stmark2.c b/arch/m68k/coldfire/stmark2.c
index d3be4b2953fd..8aa9286e85d2 100644
--- a/arch/m68k/coldfire/stmark2.c
+++ b/arch/m68k/coldfire/stmark2.c
@@ -113,6 +113,8 @@ static struct platform_device *stmark2_devices[] __initdata = {
  */
 static int __init init_stmark2(void)
 {
+	u16 val;
+
 	/* DSPI0, all pins as DSPI, and using CS1 */
 	mcf_write8(0x80, MCFGPIO_PAR_DSPIOWL);
 	mcf_write8(0xfc, MCFGPIO_PAR_DSPIOWH);
@@ -125,6 +127,11 @@ static int __init init_stmark2(void)
 	/* CAN pads */
 	mcf_write8(0x50, MCFGPIO_PAR_CANI2C);
 
+	val = mcf_read16(MCF_CCM_MISCCR2);
+	val &= ~(MCF_CCM_MISCCR2_ADC3_EN | MCF_CCM_MISCCR2_ADC7_EN);
+	val |= MCF_CCM_MISCCR2_DAC0_SEL | MCF_CCM_MISCCR2_DAC1_SEL;
+	mcf_write16(val, MCF_CCM_MISCCR2);
+
 	platform_add_devices(stmark2_devices, ARRAY_SIZE(stmark2_devices));
 
 	spi_register_board_info(stmark2_board_info,

-- 
2.54.0

