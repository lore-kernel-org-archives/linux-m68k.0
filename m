Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6792701CF
	for <linux-m68k@lists.linux-m68k.org>; Mon,  4 May 2026 19:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777924670; cv=none; b=h1JKM3/FHLW+BcbY5GtWeXKx+2X91glK41DKoOOacglyu01F1QiDnYe+PsDvfbchU9E7A9D7xRzDLG1UKhynxn+d3ABt0ZDNtu8rS5ZYYdkXCEAgncYEPTvuIsKwpZMoV5G+CXmBUlV95p6Dumk9UEEr9ZB/BnkFe38WM+7iArA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777924670; c=relaxed/simple;
	bh=sdAq1dg0+bPnSOklPmil9jaBFE9PIPl1bBIJtwpHO8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DYnEywd0TvJzx02zbvJCdizmrJd8MxNiTjyviqOuvLEPGSOdCj7JJk3e4hvPSIIH3mGcchpRBRhdzjH+0q2USA9f7irNizeIbr1tarwRuj7Z1dcRgkT6uxI3+X99CSBdimLt4gkAUY5m41blGmooUVK9YWPR/kpe9AEggfkevMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=qjLJxHIg; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="qjLJxHIg"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-445795cf6f1so2658920f8f.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 04 May 2026 12:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1777924667; x=1778529467; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pfzVxf9MxCl5JbzWkX8z2mAnOzxMNsJA4qw2p63tW68=;
        b=qjLJxHIgoiiO1Z//EBUEsrbvLMcbhN+l3w5K+CHJ+CV6scLEiskciR8RYCtJUoyyLa
         JAXmymaQGE/wwmi+LaR3BC4sCFdbCi5BLlyOKk8lCTsnWG5u656qecJk8+PfXIKNji38
         sANcf+HqCy9pEDm2rRxov86hQyTZstbeoICNWptdzX2KQkiDhqkGZkoYf1d+qjBmUhJD
         UE8Rhe18+96Qag+32mqvTny9NIeHVnNaUSqFXB81n4243dDmU7/f6Q+9wVYF7Bvp+CHt
         tpAP0xLQjgw8Zr2a/e/1ivs5Sv9YJ1B0rbyrA7xu0vIKSZJNjmUnPSzs9A+i2kcEyGaJ
         4f1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777924667; x=1778529467;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pfzVxf9MxCl5JbzWkX8z2mAnOzxMNsJA4qw2p63tW68=;
        b=szNI6eeGxM1onUHeO0uhzNR02t8mck5V4M7SfDPgKJVhtBTCtujO7K2hLbg5E3FgL1
         GxmVnsRwA20B4/HQe9dz7fXfx4uXPxXiQQ+f21YE/NR0HeanDDoQbQM/LQJfZ6ofXv5D
         fXnaRzjB86ZRyu14DV1w5of8T+4/lHJlt5mNuP8FW9ewQ0x2TqL3IgrHPy8+IuFhfU4S
         T8jAWJoaPjH3qMzuR7BM1u5aoLs+LdyhnHcJh0Yrbkj8LEXv7KfsbEUOTZivMFpPre7Y
         sJwBKn1NZE/ZqY2u25kX7EFvX5pryGBxKcjkFMX+5sXcb1t55zdumWQ5GEOsXLEBUCkZ
         dC3Q==
X-Forwarded-Encrypted: i=1; AFNElJ+mKXRdkiWgrCtFeOPse1vzOiwGMAuv9Z+XvCKFXZ3js1oXbd8j4yLbN0nToiwq7Uo/GtLAs0g1xv/I@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzKgl851Pfu4OBuMsS4R702jqMgVDCI3C08ob/+70ugMqNZ0RHR
	Vxt1QcgurmR6BwBB3sqLXUbSPdQ5Shof/VySh0e3LaxuDTD9N75Ofxa/Zt99tZYl5mM=
X-Gm-Gg: AeBDieu4NH5hvZRb37BOEhAT8RDR5ktYcaePrcDe8lp67MM9rUQ05bfE6TNPO8nuzCI
	WTPXUx71PUGKijpTCqiLqjJXPHIyD/3g3JFEVnY5mBYIGoBlIYZIYXadsI+yiZZP9YLWLB9OGMI
	5k/2+AjfRYvitP2FJk01iWg9XPwQwEuDEGTdz7qXMYqpKGP6Fcze1J2Ljy0FpjP31AuuL01s2yM
	t0xYpOCWRLNu3u1l7gZGCWCIhqPbcI1P23bP0R/M3dPP050wQVUmvQbBqZYGoSDmpgOl5V6RSdj
	96Pr9gLPh+1pbkMW43z99+r0Rzsx0jVPPpYkovwsBJtDEUldZ/DsJ2Pj6mj5KMVZjQf2KIBUm8m
	FQhRjZNS5CecouYwaEJ8hAM37ky8d8WuJEL74Cq2gf3oUcrjVDvHXiN6s8S3XqW/eGRzLTjfXjz
	uuRKWMsOhzF2VBAtHQOpbrhADP3aNnc2vpDP0FqcHqni34P60=
X-Received: by 2002:a05:6000:2f82:b0:43c:fa96:d939 with SMTP id ffacd0b85a97d-45005c81608mr489564f8f.22.1777924666722;
        Mon, 04 May 2026 12:57:46 -0700 (PDT)
Received: from archlinux ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4500d734654sm373291f8f.12.2026.05.04.12.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 12:57:46 -0700 (PDT)
Date: Mon, 4 May 2026 21:57:45 +0200
From: Angelo Dureghello <adureghello@baylibre.com>
To: Angelo Dureghello <angelo@kernel-space.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH 00/10] add mcf54415 DAC driver
Message-ID: <p2pkvbvj2ksdws3rsrt4d3gqjvkmgwt4gvc2jwjkc7dhybqibd@lhfsyf33ba46>
Mail-Followup-To: Angelo Dureghello <angelo@kernel-space.org>, 
	Greg Ungerer <gerg@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
References: <20260504-wip-stmark2-dac-v1-0-874c36a4910d@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504-wip-stmark2-dac-v1-0-874c36a4910d@baylibre.com>

Hi,

just seen i sent with git send-email configured with my private email.
Will fix the sender email to BayLibre in v2.

Regards,
angelo

On 04.05.2026 19:16, Angelo Dureghello wrote:
> This patchset adds a minimalistic DAC driver for the NXP mcf54415/6/7/8
> builtin DACs.
> 
> Currently the driver enables the raw write only. Feature as dma, sync, or
> format are not supoprted for this version.
> 
> Additional options suppoerted by the DAC module will be added to the driver
> later on, as needed.
> 
> The same patchset prepares the m68k/coldfire architecture to support
> the driver.
> 
> ---
> Angelo Dureghello (10):
>       m68k: mcf5441x: fix clocks numbering
>       m68k: mcf5441x: add clock for DAC channel 1
>       m68k: mcf5441x: setup DAC clock name as per driver name
>       m68k: defconfig: update stmark2 defconfig
>       m68k: add DAC modules base addresses
>       m68k: mcf5441x: add CCM registers
>       m68k: mcf5441x: add CCR MISCCR2 bitfields
>       m68k: stmark2: add mcf5441x DAC platform devices
>       m68k: stmark2: enable DACs outputs
>       iio: dac: add mcf54415 DAC
> 
>  arch/m68k/coldfire/m5441x.c         |  21 ++--
>  arch/m68k/coldfire/stmark2.c        |  42 ++++++++
>  arch/m68k/configs/stmark2_defconfig |   2 +
>  arch/m68k/include/asm/m5441xsim.h   |  40 ++++++++
>  drivers/iio/dac/Kconfig             |  10 ++
>  drivers/iio/dac/Makefile            |   1 +
>  drivers/iio/dac/mcf54415_dac.c      | 200 ++++++++++++++++++++++++++++++++++++
>  7 files changed, 307 insertions(+), 9 deletions(-)
> ---
> base-commit: 8b4b975922f607411217c81942e82f1d206ebc61
> change-id: 20260430-wip-stmark2-dac-7060f49dd94f
> 
> Best regards,
> --  
> Angelo Dureghello <adureghello@baylibre.com>
> 
