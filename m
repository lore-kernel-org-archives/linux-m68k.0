Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBF93C277C
	for <linux-m68k@lists.linux-m68k.org>; Tue, 26 May 2026 21:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779830756; cv=pass; b=kubAReTqFfwdl9TQLfwfFdmneR+KmjQdUBAkDzpj3tdnB4oYi+bzQ0SBTDUEyBBjaoEe4gujh7n9mzdlyWua7aTKnxRkalPW4ksZjITRRa7FQTfqeSI+YdkHMgwNXsQ6nOzClLPWHiE1K9Z2dWaC7+Yqn0FCMgc6CbOpPuSHHQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779830756; c=relaxed/simple;
	bh=Cd7zWI0lsrOqHdRBbulkjvyPOD3GT6JDE8z7Rpv3/Cw=;
	h=From:References:MIME-Version:In-Reply-To:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XILYnaWF6q4eNhF3LMkkx3OUaM6erdIWOtO3NjZBgY6inhGKgeHP+ZVH8y8e7q/7cuKhvN3wRcSe8MfGi94riG8975Xc/FRzmzkybMkB3yxyFWhY7ZU1Qe7cvIBnYC5/4sD9Ol7nDwqkmzWbHN0GyYKX5cccgbWFpuKSleBXlfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=GBPXHh+H; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="GBPXHh+H"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-bd8f6ef4ba6so1660796966b.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 May 2026 14:25:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779830751; cv=none;
        d=google.com; s=arc-20240605;
        b=Z7TWQSh4UIZW2G4/XTb8PRle6pzSOnoioAdakM40wHZCovL+hqry4mtPLZPQ+va+f9
         eAGWjbdRk7kBjRy8xCeXf5YNjDgiVBJxBDbmi3LOEoJmjtoX9NsM/uljmuThJW808rnM
         HYzDfsDWRL1+U9h4LwdZJ1d2JvUnItrigT21vugOv7I1qA7XnRJGYUbbHXdmMTdJYTwL
         lPgOC/xNDWfqBLVty4VjJR6nnlSqGWjY4ghs9IEOLCLgqPAUFxl35mLXE3YstuZ+JKAp
         V4ExFtkgOsbZBq9LkfewjN5ny5TzUTCcHbh90cQI9dlOffkd9MjIxcH6hWo+nANkEUW0
         j36A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :mail-followup-to:from:dkim-signature;
        bh=dn3CDjIt2vIiMqs+R+BPuA4q7fB48nnalDkVYsI1XXk=;
        fh=BQxhV9WQQXrEhmvl+uYuNI806dbV/ZpB+JJmlGM+/QI=;
        b=GjVwZRiYsGu+UaEpaYAPReAro6OPvHyyXlZqdVZIIihwqtGHThCtSgd94sOst4p29c
         urJiirDUIzi44FM/OC05vPjA7RNe7qKOBbRq7hcKN6kElAbbQ/1qeSlPbUNx4NfLVxJQ
         +98l0rvY/UZ/DHsLT44/4VXzAknctUHAe5U5UVfCJx4dHPGAYA3XJztREVg4kb0qTJOL
         6hUWvuJ++/UaYm6G/f2aOUiT7aSdUJCmuVAVT/g/UkXD5p3cvIX+iNZOEk3A3JUzgp8U
         EYWPEq3zr1SHisadTEMbm715svA0YcMCzuv+5b4bNRTFz7z0cs6aYRot81is2Rj1pgPG
         se4A==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779830751; x=1780435551; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :mail-followup-to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dn3CDjIt2vIiMqs+R+BPuA4q7fB48nnalDkVYsI1XXk=;
        b=GBPXHh+Hj83PK409DI8wq+DVdr3kneGijt7xuwiFc/Uxsc4SfigM0YZZ92qKlxpStW
         cZOZjqkS+TiSOO4lAEZr1DIpxnUwX2CzDaOTthgTjgL0jl7lkWLLYwjreIobO5BWZE1k
         UhWPC9yHDabzvbZsLwyx7jwsN/YVAI2h0bD2bnDGfIW5PYmPgQOjixNN4Hth/W2uUMHl
         Pjz+zb0dTpAoGm1QhImG8fubCTL3+1GFe6Jk2Cz1p+VLBva4EdL0ITz/FtAgp3ftl1JD
         6YshMDDuxGZH5kbnLFYDOShJ/g0GtYWTG2qMyItQ7ibpHAQhFabjePol2c0cA5b2sNdi
         spdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779830751; x=1780435551;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :mail-followup-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dn3CDjIt2vIiMqs+R+BPuA4q7fB48nnalDkVYsI1XXk=;
        b=HshWzpQ+fpnlceXy/kkSBRCA1Og4DxEhbcnf5Qaj0H0IPJYnKvSIsbB3+8lek7G8TZ
         BZ6bnxMmvZAxmKsba02M/UG5koTRThfaP7UUmP50mCKBMOYGXtovHno6w8tw9zsl8uAs
         15Oc+rbmDlKZsPbMRwIfgAfsclPz4LkWE5jgwgzYk+mT9OPQQQHsW+ZgmOpZX6lSCAU/
         Pgc4ByVHN/FXmIzY5KRH9rEsgUt15JuPXT9Y4Uoe+59uBFrsEuK4YdVl4CgAAx2Fs/56
         QyqnEJam7/yMcfQKLLgYsPcrBG/GKAV3qfv93x1r56X6aMlhr16DCWV/do82USEAe0sd
         /mGQ==
X-Forwarded-Encrypted: i=1; AFNElJ/omQVEQ0TyMjOu9MXyseC6+aPtlMJUeQN7qE6AttYYGjB6s1r4KtjrP9nF//vAV14U7QpHcqj/wmVU@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxdURy/Btt9DSnHstVZLX/ei5jZ5eh25P/ZPSGHIyNQ676+7WxZ
	FlXOqkYP+cYWIHhBV9/z52odBiLWprY3fv4Tv6nyoyiC4OsIo/FcyAKiyFHxBqnEd8PTkLsQJ5Y
	79rLsLB6x96VINeakwzvzOg20L2aAWleZZmR8YCbfHg==
X-Gm-Gg: Acq92OFogrCFshCIzZatEirhAAjbMnxpXn/MkHszQkfrRZvZggd7Hj3k2SPKqbS9f/g
	HQTvCQNpsVY+khftkTepOlkrg+HQXYiUWSsvOEuv6qqzG8tGiUxWNIYeV6JFdaFRwNs7C8qH11/
	tCx/vpqVLlEvPw6Mo6cCJbWYNMv9dR5rPZCO6LPK/L7/+OnbCskuPdx9Pq1DjpESwWTr7bVfIcf
	Fz+iR6ZgoToxDxf+Yd1lJxmtZlE3Y3CpK2XW634nMgJnDTZ/4Vmdij2JJQEfiR2LeGx8JBdqJrF
	2JZBo+Ipjnql9YjcHpYK8RrMal2ZwRupLEZd
X-Received: by 2002:a17:907:fd8a:b0:bd5:18ee:a54a with SMTP id
 a640c23a62f3a-bdd2293ec75mr1247285466b.8.1779830751354; Tue, 26 May 2026
 14:25:51 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 26 May 2026 23:25:50 +0200
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 26 May 2026 23:25:50 +0200
From: Angelo Dureghello <adureghello@baylibre.com>
Mail-Followup-To: Jonathan Cameron <jic23@kernel.org>, 
	Angelo Dureghello <adureghello@baylibre.com>, Greg Ungerer <gerg@linux-m68k.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
References: <20260522-wip-stmark2-dac-v3-0-16be0ad35a67@baylibre.com>
 <20260522-wip-stmark2-dac-v3-11-16be0ad35a67@baylibre.com> <20260526143050.5fca6514@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260526143050.5fca6514@jic23-huawei>
Date: Tue, 26 May 2026 23:25:50 +0200
X-Gm-Features: AVHnY4K4EVRlMYVfttR7ggQcjq5xwYPhtPTl_I0B1Kvzgy2_6s0yq2t2OwfFyUw
Message-ID: <CALSJ-wAqOkQ0j-rKb7Oju9BVqWuE1_Y-D5WQSHeaiV6JPQngRQ@mail.gmail.com>
Subject: Re: [PATCH v3 11/11] iio: dac: add mcf54415 DAC
To: Jonathan Cameron <jic23@kernel.org>
Cc: Angelo Dureghello <adureghello@baylibre.com>, Greg Ungerer <gerg@linux-m68k.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jonathan,

On Tue, May 26, 2026 at 02:30:50PM +0100, Jonathan Cameron wrote:
> On Fri, 22 May 2026 23:20:39 +0200
> Angelo Dureghello <adureghello@baylibre.com> wrote:
>
> > From: Angelo Dureghello <adureghello@baylibre.com>
> >
> > Add basic version of mcf54415 DAC driver. DAC is embedded in the cpu and
> > DAC configuration registers are mapped in the internal IO address space.
> >
> > The DAC accepts a 12-bit digital signal and creates a monotonic 12-bit
> > analog output varying from DAC_VREFL to DAC_VREFH. The DAC module
> > consists of a conversion unit, an output amplifier, and the associated
> > digital control blocks. Default register values for DAC_VREFL and DAC_VREFH
> > are respectively 0 and 0xfff, left untouched in this initial version.
> >
> > This initial version of the driver is minimalistic, "output raw" only, to
> > be extended in the future. DMA and external sync are disabled, default mode
> > is high speed, default format is right-justified 12bit on 16bit word.
> >
> > Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> https://sashiko.dev/#/patchset/20260522-wip-stmark2-dac-v3-0-16be0ad35a67%40baylibre.com
>
> Given there were only a couple of comments I've included them below alongside
> my review.  All minor stuff.
>
> Thanks,
>
> Jonathan
>
> > ---
> > Changes in v2:
> > - remove tests from commit message, moved to patch 0
> > - remove additional blank lines
> > - remove dead code and unused definitions
> > - use regmap
> > - add limit check on raw write
> > - non functional style fixes
> > - add COMPILE_TEST to Kconfig
> > Changes in v3:
> > - add comments where needed
> > - code style changes
> > - remove unneeded variables
> > - use regmap_set_bits where possible
> > - remove macro not needed to define a single channel
> > - set up regmap to big_endian accesses for next patches that will come,
> >   that will adjust ColdFire readx/writex as standard LE (links in 0/x).
> > - add return value check on regmap calls
> > - sashiko: remove unneeded .io_port from regmap init.
> > - sashiko: add select REGMAP_MMIO in Kconfig
>
> Looks like you missed or disagreed with the previous sashiko comment on v2 about
> type passed to regmap_read()
>

Sahiko asks if regmap_read produces a compiler watning.
I don't see any,

> > ---
> >  drivers/iio/dac/Kconfig        |  11 +++
> >  drivers/iio/dac/Makefile       |   1 +
> >  drivers/iio/dac/mcf54415_dac.c | 207 +++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 219 insertions(+)
> >
> > diff --git a/drivers/iio/dac/Kconfig b/drivers/iio/dac/Kconfig
> > index cd4870b65415..b1a578076188 100644
> > --- a/drivers/iio/dac/Kconfig
> > +++ b/drivers/iio/dac/Kconfig
> > @@ -516,6 +516,17 @@ config MAX5821
> >  	  Say yes here to build support for Maxim MAX5821
> >  	  10 bits DAC.
> >
> > +config MCF54415_DAC
> > +	tristate "NXP MCF54415 DAC driver"
> > +	depends on M5441x || COMPILE_TEST
> > +	select REGMAP_MMIO
> > +	help
> > +	  Say yes here to build support for NXP MCF54415
> > +	  12bit DAC.
> > +
> > +	  To compile this driver as a module, choose M here: the module
> > +	  will be called mcf54415_dac.
> > +
>
> > diff --git a/drivers/iio/dac/mcf54415_dac.c b/drivers/iio/dac/mcf54415_dac.c
> > new file mode 100644
> > index 000000000000..c8c87572d43d
> > --- /dev/null
> > +++ b/drivers/iio/dac/mcf54415_dac.c
> > @@ -0,0 +1,207 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * NXP mcf54415 DAC driver
> > + *
> > + * Copyright 2026 BayLibre - adureghello@baylibre.com
> > + */
> > +
> > +#include <linux/array_size.h>
> > +#include <linux/bitfield.h>
> > +#include <linux/bits.h>
> > +#include <linux/clk.h>
> > +#include <linux/compiler_types.h>
> > +#include <linux/delay.h>
> > +#include <linux/err.h>
> > +#include <linux/io.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
>
> not seeing any use of this. I guess it 'evolved' away.
> Anyhow, please sanity check these all one more time for v4.
>

thanks,
removed it and also linux/array_size.h that's unused now.

> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +
> > +#include <linux/iio/iio.h>
> > +
> > +#define MCF54415_DAC_CR			0x00
> > +#define MCF54415_DAC_CR_PDN		BIT(0)
> > +#define MCF54415_DAC_CR_HSLS		BIT(6)
> > +#define MCF54415_DAC_CR_WMLVL		GENMASK(9, 8)
> > +#define MCF54415_DAC_CR_FILT		BIT(12)
> > +
> > +#define MCF54415_DAC_DATA		0x02
> > +
> > +struct mcf54415_dac {
> > +	struct regmap *map;
> > +	struct clk *clk;
> > +};
> > +
> > +static const struct regmap_config mcf54415_dac_regmap_config = {
> > +	.reg_bits = 16,
> > +	.reg_stride = 2,
> > +	.val_bits = 16,
> > +	.max_register = 0x0c, /* DACX_FILTCNT,  R.M. Table 30-2 */
> > +	.val_format_endian = REGMAP_ENDIAN_BIG,
> > +	.reg_format_endian = REGMAP_ENDIAN_BIG,
> > +};
> > +
> > +static int mcf54415_dac_init(struct mcf54415_dac *info)
> > +{
> > +	int ret;
> > +
> > +	/* Keeping defaults and enable DAC (bit 0 set to 0) */
> > +	ret = regmap_write(info->map, MCF54415_DAC_CR, MCF54415_DAC_CR_FILT |
> > +			   FIELD_PREP(MCF54415_DAC_CR_WMLVL, 1));
>
> Perhaps use a local variable. It is a tiny bit too easy to miss that
> parameter being split over two lines.
>
> 	u16 val = MCF54415_DAC_CR_FILT | FIELD_PREP(MCF54415_DAC_CR_WMLVL, 1);
>
> would avoid that.

ack, done.

>
> Alternatively perhaps just reflowing as:
> 	ret = regmap_write(info->map, MCF54415_DAC_CR,
> 			   MCF54415_DAC_CR_FILT |
> 			   FIELD_PREP(MCF54415_DAC_CR_WMLVL, 1));
>
> avoids that reading issue (I read it wrong ;)
>
>
>
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* DAC is ready after 12us, from RM table 40-3  */
> > +	fsleep(12);
> > +
> > +	return 0;
> > +}
>
> > +
> > +static int mcf54415_read_raw(struct iio_dev *indio_dev,
> > +			     struct iio_chan_spec const *chan,
> > +			     int *val, int *val2, long mask)
> > +{
> > +	struct mcf54415_dac *info = iio_priv(indio_dev);
> > +	int ret;
> > +
> > +	switch (mask) {
> > +	case IIO_CHAN_INFO_RAW:
> > +		ret = regmap_read(info->map, MCF54415_DAC_DATA, val);
>
> Sashiko pointed out that regmap_read() expects a u32* so this should use
> a local variable for the read.
>

Sashiko asked if this is causing a warning. I don't see any.
Register read is a 16bit reg, and the valid 12bits are masked just after
to ensure returned value is always correct.

So can stay as is, or to make sashiko happy i can do something as:

	struct mcf54415_dac *info = iio_priv(indio_dev);
	int ret;
	u32 reg;

	switch (mask) {
	case IIO_CHAN_INFO_RAW:
		ret = regmap_read(info->map, MCF54415_DAC_DATA, &reg);
		if (ret)
			return -EIO;
		*val = reg & 0xfff;
		return IIO_VAL_INT;

> > +		if (ret)
> > +			return -EIO;
>
> Another one sashiko got. Why is this eating the possibly more useful error
> code from regmap_read()?
>

fixed with return ret

> > +		*val &= 0xfff;
> > +		return IIO_VAL_INT;
> > +	case IIO_CHAN_INFO_SCALE:
> > +		/* Reference voltage as per ColdFire datasheet is 3.3V */
> > +		*val = 3300 /* mV */;
> > +		*val2 = 12;
> > +		return IIO_VAL_FRACTIONAL_LOG2;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
>
> > +static int mcf54415_dac_resume(struct device *dev)
> > +{
> > +	struct mcf54415_dac *info = iio_priv(dev_get_drvdata(dev));
> > +	int ret;
> > +
> > +	ret = clk_prepare_enable(info->clk);
> > +	if (ret)
> > +		return ret;
> > +
> > +	mcf54415_dac_init(info);
> If this fails should we report it?  I think you'd at least want
> some print to help with debug. (Sashiko got this)
>

Ok, so doing


	ret = mcf54415_dac_init(info);

	if (ret) {
		dev_err(dev, "could not resume device\n");
		return ret;
	}



> > +
> > +	return 0;
> > +}
>
>

Regards,
angelo
