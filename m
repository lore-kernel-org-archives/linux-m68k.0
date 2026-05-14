Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8766E3D7D83
	for <linux-m68k@lists.linux-m68k.org>; Thu, 14 May 2026 07:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778743243; cv=none; b=YLp/tZDzaPlx/W8GrnwxeCEN34gNJrqAsoHvqMsjDIX+HQhqrBG+HjoQoNsa/IhgZ2ppsVmY5C68l5Jbtb406Y6zeZaaaGcUcyazgXV63l+isSHPWIRrEsTFu2bzpjieSoMmH0QbqfwKLve4/pCcN8yRDAlt8wJwLYHOELyQ8TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778743243; c=relaxed/simple;
	bh=ZulYaDZ2N9XXIWtdGiKHOKqvRY9okY1TNX4dzGcSjZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PnK2GbC7T9Hn/at0zMLRrh2sJrVOzYeXPcZ8/wYQ6g48SK8EMjSUCRQVpxzqkdzANnKvkJp2NUu7g2PTVkqXAkBnJeYBSGEUhRGCXuybZTC8XRr/DkMc0IS1q6HKWtq/gcaFaCpK97aQXEqUAYNvZ2rSSfUoljvEIdQ6i7hWDvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=wd0cFLmK; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="wd0cFLmK"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-44985f4ab0fso4439583f8f.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 14 May 2026 00:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778743240; x=1779348040; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ojBKerXcsom5YLOUywnRgFuJgAkEyWjWD8C2JpwtbUw=;
        b=wd0cFLmKRZWtIiJ/hfYNo1rFQWnQGwTORK0roNyojSgVWu/gdSGamcgNI82oml72aD
         ddPDg85tX0ofFh7ztwgyX6Yi1+rgkS05n6M44TMxkNldgND7uflTISKsTF36UA7qvuYm
         XnGHLeoSxL8JGPLUBj4MtEF/aU4poh28+6iNT8W6WAH1xosR07Juaj6IGn6TMLjyOjh0
         s3+TNXelDt2wyouX1woKoQ2tBWsMQelQatHYn8hyWuIr/wJh8eDYaIDAkisnW11XP7GE
         EiG92iCkWnRyXAL7Dyq11aVL3btBwLpxboxbYN8Z32TnEtA1S92tivIfqJ3iPL/ddRke
         sFPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778743240; x=1779348040;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ojBKerXcsom5YLOUywnRgFuJgAkEyWjWD8C2JpwtbUw=;
        b=Ip4EyR/Ysg5Ll8k7ik2aN2RiBCTqN2kWlaBUlH/ggTEleFd7miu+p9pKJWVwbc5rLn
         fI4dixjof3JvfkfbccX4G6vMJ6PpfXHXVTtxd3Rf5O1ugEiIVAAQ53v28/md6FSykp1P
         hjyfSAH1dn+HhOw9pynMg38MqHoO0YeSer1YB3+cjVj7CsiJS2JeL/o+bli8YdcT/lU0
         /sV8WQm/S+sB1FGXU5R9OPq34p3oCnSbP+UiEBqlAhJM4Hi8AiTMSQruceQEPFDIbdFN
         5UN3xw8tx90LwivksmsDHdJpVQWpI8a/n05RknlYT+aGxYqwjRC1y6wM1Q3Wj0k9zb7E
         A1wA==
X-Forwarded-Encrypted: i=1; AFNElJ8vHLNxKvL629V//kjvBk0d8DA63bBsLQ4Ddj8hzu31M50M99xiNODYS3K8BZZUt+mCM772iOPGImij@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yw4pf0/RiQ+neLABBT/XIqu55HbvNEnAWa2OSmVUUjubli1KAET
	Ap2IO72fR6Mt3f494uKMZx6xotgvFHgOdGazvMBllj7V4xfhmGW5Qh46WttLbTQYQrc=
X-Gm-Gg: Acq92OFJ28lu4GKni6y6nXhrV5bwu0N7DpxZvQKbjCgE+LysJ4QIWxeB4FT/z0ljPhH
	MsjthLS55QRyJu1x8DcQ2schndtX9opEcyMdbER7S+X2i17TfM7AIaVvEOnT/ue5sb063hbzrY8
	9zZgUf7oIcCQDfmPrtPrEFV1bD7v/39sgVR0qH6oNQgPYlwq/+GckZTyVNARf89vYrQlorTYZZm
	fwyfcKAZaW1d7eVEoW408hdGfGt2GxV+KnqCs+sAgifwBSSIIXCiZjN3fTfSW8duqKde3Z3St99
	TSdYPV6oNgEiZDHEB5d9Rr3RL/t3sUq3j7Jl3WV/lLkOOoNu8XMHhTEO2Kc73qF6SpT5dLLgaHf
	w2FxvCTRtebN96jMIbh6DbRcF7cg+87mRyqgZisGj3uQFRwHnR4kxtEUkmMzmRkdiddABv68991
	6hGQbyyV6h4ox1iHUU/cZ4tvxalc0k1lcA2hU6
X-Received: by 2002:a05:600c:1547:b0:485:ae14:8191 with SMTP id 5b1f17b1804b1-48fc9a02785mr93973495e9.5.1778743239978;
        Thu, 14 May 2026 00:20:39 -0700 (PDT)
Received: from archlinux ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fdc6f0ab7sm22461275e9.15.2026.05.14.00.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 00:20:39 -0700 (PDT)
Date: Thu, 14 May 2026 09:20:38 +0200
From: Angelo Dureghello <adureghello@baylibre.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Greg Ungerer <gerg@linux-m68k.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH v2 09/11] m68k: stmark2: use ioport.h macros for resources
Message-ID: <cabngw2wuxh7cfx4cw4ik46dmxs72u47jyo6hcwgdd7a5whny2@dsp4cysetarw>
Mail-Followup-To: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Greg Ungerer <gerg@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
References: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
 <20260513-wip-stmark2-dac-v2-9-fcdae50cf51a@baylibre.com>
 <agTcoVbImqMgfQy5@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agTcoVbImqMgfQy5@ashevche-desk.local>

Hi Andy,

On 13.05.2026 23:18, Andy Shevchenko wrote:
> On Wed, May 13, 2026 at 11:14:33AM +0200, Angelo Dureghello wrote:
> 
> > Align also other resource declaration using DEFINE_RES_.
> 
> DEFINE_RES_*()
> 
> ...
> 
> >  static struct resource dspi_spi0_resource[] = {
> > -	[0] = {
> > -		.start = MCFDSPI_BASE0,
> > -		.end   = MCFDSPI_BASE0 + 0xFF,
> > -		.flags = IORESOURCE_MEM,
> > -		},
> > -	[1] = {
> > -		.start = 12,
> > -		.end   = 13,
> > -		.flags = IORESOURCE_DMA,
> > -	},
> > -	[2] = {
> > -		.start = MCF_IRQ_DSPI0,
> > -		.end   = MCF_IRQ_DSPI0,
> > -		.flags = IORESOURCE_IRQ,
> > -	},
> > +	DEFINE_RES_MEM(MCFDSPI_BASE0, 0x100),
> > +	DEFINE_RES_DMA(12),
> > +	DEFINE_RES_DMA(13),
> > +	DEFINE_RES_IRQ(MCF_IRQ_DSPI0),
> >  };
> 
> This conversion drops hard indices, would it be a problem (for example,
> some code modifies the fields based on the [hard coded] index...)?
> 
> If not, perhaps good to mention in the commit message and move IRQ to be the
> second one?
>

i can't see any directly-related code accessing these resources by index,
so would not change this if there isn't any risk. 
Also i see DEFINE_RES_() stuff widely used in other arch, so thios make me
think accessing by index is something wrong.

> -- 
> With Best Regards,
> Andy Shevchenko

Regards,
angelo

> 
> 
