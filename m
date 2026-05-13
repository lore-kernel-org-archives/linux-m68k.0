Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8943D47A0
	for <linux-m68k@lists.linux-m68k.org>; Wed, 13 May 2026 09:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778663694; cv=none; b=Ntre3TBTrKjUZ36WsnnHoe0b6gT+JZuhnq1HXtsKH3Uu+uPZ8xCPVuCM7QA9lsR27L+ThaTCswlMzJ0qb2v0/i2fKMq+a6q1VnG3pnbUwwU0uGau4+3/N+uFLGWXZO4TPwj0n1RDDSKpnkJeXwUUwEC2zqp+EiSn3BCpVTvhQhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778663694; c=relaxed/simple;
	bh=PhOGHoqIR+95vDa+GqpGQ1+YUZVXpYd7uC8GldUe3mk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i0TficMmjxgpWuDcvGQ92WIC+it62P9ksbAE/qSX59vuVhsQYXG4lUM79yEoFcqudvkFebiYlGYpZtwFOiGFnqRaEEdOEkOVIMThnFwO+1dn2rmEhhvmmZppTdHgY20K7tzvE1o6B5f4LK8cE3mC+bDItgWZP2ZG0OjP97oHJRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=OVAf/uA9; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="OVAf/uA9"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43d75312379so4926358f8f.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 May 2026 02:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778663690; x=1779268490; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J+hb+If9DDOuBqGG4gKbfaGWqC3O5Z3rJt8yF28vSsQ=;
        b=OVAf/uA9O+hvV6fJuukvVF5ZcSpPCnrj1HiY0wI3lmAcGLayQn26gZX+hw0adhRivf
         XsR/aoja+7Wmny16oWzlxiHaVbDTTSCoTR9kKompdqnp/x57fI7ByfkUliNFM07/MVHO
         EvPTjpItxFfPyw9u4I3xFU2JrPf5cEkSi6wdgNn/jalm4FaanGz4uoLwi4IMIUChOt0q
         BAm7hQpmHgEHdUUwIq7LdZlELjDRlkcp/vLyd/rj5r5EFSbeWjxYC+jqW/35g5eH4UdZ
         YxUOk6OGkvg7tTg1epLezllQ5vXIwOdKrUhjvOFywn9NY+ID6Lu5VOp8GO4w5clKtDB9
         Llqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778663690; x=1779268490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J+hb+If9DDOuBqGG4gKbfaGWqC3O5Z3rJt8yF28vSsQ=;
        b=eB29EBcGt69dinN0szGxX2nZFm1zWHlJMyPwxhN73Unka0S0kI8P4CQjyOv2IIysvY
         RbCtRuQXErc5qBXNS3WHoKSZsxzd4bXXZmWPmk3JFcldog7a+n5oPLtGyZ0OLP/+WwUb
         ikCxZp2NpQUhAGpOJUaj5Yck1KCYErsadfP6KsDvxYFbrlLiYl3TfxiUR8P63GgDNgWY
         ttvXTYmMOfgG/UzET92Ew+34MTalkUFWuH8jviDaHhWN6r3oWOxTYRKBJa+/6LDoKdWd
         5KJxb9KOVP88KXQ5I5yth8H/kQPM2JVBpTs6lxpoplv1ouv0ad3ctc8Dy8ikQbTVryjV
         2mSw==
X-Forwarded-Encrypted: i=1; AFNElJ+ikxOAh8FwOuXI9YGnUwTkDLELo2Tzz7tQ6o9HaS7PIV5ycNQjPsP63/duOoXErr6XRY+khmNHH/YF@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyTqxkLbVCoXiBArI316IDD52cvi144tc0W7RnWP/oJlIdnHTth
	9fTw9K4/vcNQIgiCJbg/x/UisPcFNxG3aG6UIX3FdJlaodxfed/coO5X1+ekV/wwumI=
X-Gm-Gg: Acq92OExg1fYfi8NqM2WDhHyPqTX0amcEUtQal/jPHbZQiO+a+gIT6slN0y4jGre9CU
	/ev04/KGJzl0phFirsFVlNRdS3zvZM4fGiqAW/X5yoEoeZAe/yWYMXhgMfi0z3PP/v7ZThpOlqL
	wylOzeljNgeHGmI2jxo7xBocyl9VhXke8LuPCHHqT6uS/tORJTp26XOPfEDSCXdxqRP13sC7fmd
	M8s4bc2McfZCCXmhRJoGEU4urKbWdjvobv5XqVhU6ymWayTAoOQw1qgnWrJrE4TdiGkFSnYv+fA
	Av0zEMcveB6clG0K0vKP71YNL1+Epc3RLEnysJiDF7PZBej3TXqLLfEz2YVs4lI3zzgcuL61hE1
	gOEaTlFG+hhPQfOECI5LM2mwKfCnMpqmtH8LDkWfgv/M8oXBcszqXQvFifOcscCOY+OupfeI2Ad
	NzKXw26FmW90sfyMC150a3woU6tUzjVWo=
X-Received: by 2002:a05:6000:26cf:b0:451:259d:83fc with SMTP id ffacd0b85a97d-45c4683b616mr4191754f8f.17.1778663690514;
        Wed, 13 May 2026 02:14:50 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a66bfsm34590821f8f.4.2026.05.13.02.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 02:14:50 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 13 May 2026 11:14:34 +0200
Subject: [PATCH v2 10/11] m68k: stmark2: enable DACs outputs
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-wip-stmark2-dac-v2-10-fcdae50cf51a@baylibre.com>
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

Enabled DAC0 and DAC1 outpus disabling shared ADC inputs on ADC3 and ADC7.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Changes in v2:
- using mcf_read16/mcf_write16
- remove unuseful comment
---
 arch/m68k/coldfire/stmark2.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/m68k/coldfire/stmark2.c b/arch/m68k/coldfire/stmark2.c
index a5b36af8e70a..a82e1b286770 100644
--- a/arch/m68k/coldfire/stmark2.c
+++ b/arch/m68k/coldfire/stmark2.c
@@ -117,6 +117,8 @@ static struct platform_device *stmark2_devices[] __initdata = {
  */
 static int __init init_stmark2(void)
 {
+	u16 val;
+
 	/* DSPI0, all pins as DSPI, and using CS1 */
 	mcf_write8(0x80, MCFGPIO_PAR_DSPIOWL);
 	mcf_write8(0xfc, MCFGPIO_PAR_DSPIOWH);
@@ -129,6 +131,11 @@ static int __init init_stmark2(void)
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

