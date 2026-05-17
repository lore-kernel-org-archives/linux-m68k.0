Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A6822F01
	for <linux-m68k@lists.linux-m68k.org>; Sun, 17 May 2026 21:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779051892; cv=pass; b=E8CqH0MPQtU18afw1G2D6mErUv0BILnJUTDgis9iAl+4sV+riBwhO85u+NWLQPcIIBkjd7TCiqeA77t+sScNw2/lXDqgVfw76t/0x8Ps3VNVvjhh5qK0e5sXgEROVANSpA2lnqQGzcRw5GIgf19AReeuM3cqc5gfmOIK7IMwPAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779051892; c=relaxed/simple;
	bh=8Y7tVyTdZBcAIIySBt03TMMlzrrlO8mFfiBOXkd/HWc=;
	h=References:MIME-Version:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IegXSpZjmeASbSHcI8fGhMI5lsATUJ80jY+Ag4alNSYXoabk5tmHcDvr98t+sdlrgbz3mSQkb9w4WJM6rTg/dpdwAKm8kwy0GBXOizgA2H2fnFYDk0I8hkohTDQKax2NJRmG5SX7s9TBnT5VXmEZI8D4Fb5TcD19xABYlfpFwCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=IcPPKTUr; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="IcPPKTUr"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-bd22b2abaa4so286171266b.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 17 May 2026 14:04:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779051888; cv=none;
        d=google.com; s=arc-20240605;
        b=Ntm2VfemRAjw4mZ+XsPY84rTmrVa4uSNd6u7pF3t4oXxeklQZneDrUC5WnMur72aRJ
         T7VS5jMFhn7ZGXw3XHfX+2fk2yNKrvKippW0Polz1puCEUtKpnwC60c4dTjA6mQy5oye
         BTPfVMvlORLOTnWWfnNfzrMs3G7z5mpQi8JKj3MXQxe2SNYUOtoPZ2nLYWspuZK3kCWO
         UDRunbdH0x5Jk8hnGax78xmlRtR/sm9H5OercQe4QWOAGRaxBPH618ZNxmoLsnG7za+W
         1Xi+U13G+g4cOPOSJZVfRSWPZerAOPTxo35+NYJsyuAHriPi4dSO7z5vdAiibgjEg2I/
         Z6XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:mime-version
         :references:esfrom:mail-followup-to:dkim-signature;
        bh=hDbYh8nveG6AJ4qGTnJ5WMHjZoY6FKTJ3XlYsYDU5zY=;
        fh=WhlMlNKJJLytYyuQFofDGzPC8pdU4qQCvV77UWeR0m4=;
        b=exrGFT2foTkrweDPGzlQCvbvZvori/QTlVGjG0JO3Hgisl2gnNpMjH6g3lBK6JBAvN
         GOpNwEJwujCbi1og7NHT3eOmodA0RlLIqEUrFG5dn8jWCba/Q79GZ2Ngs6mTxEN5McbG
         ZiMjayUcfq75H/qCwvWmXzwXqi+tfeh9LQ+Xq7heFOZ9WUCefmERHA7HEFX1fNMRB+fi
         foxccLYQduTjIHHACFpavyaK6v+/izK9mGskrbmcvc7/LFDUHv8wa/ET+7J+Be8P6Xj7
         Qe6C/7vBb80emZpPflLSbFqOqP95+VuyTzeG/D/oRGPTvdV+fPvYUvz9wvTKr1Z4U1ZH
         tYWQ==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779051888; x=1779656688; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:mime-version
         :references:esfrom:mail-followup-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDbYh8nveG6AJ4qGTnJ5WMHjZoY6FKTJ3XlYsYDU5zY=;
        b=IcPPKTUr6dxEwZeAtLWR/Ef4BJ7cq240/Fb79q9Bm59Pniumy2yRrq214fmP2MLXiz
         sUMyAhMyy1/+99XmLgw6mRSg+E1mz4PKKEzmt/okJkFQ9EAKWgjfAVJnfcyWYUL1UBz1
         yx3gJbDywtecjpmLQfGYHDq65ynnxNwbOxGz8j6/WtIc+7jiIyzq5msEdZLaQ+mIJcXX
         MoIdeeyICBAXJFEK6sZfgVfd8IG7Y/16uLkaJnMH6K6bml5Y8zMEAcWZ+gGBbD51QmLO
         b99w49bgFXW90ZyOdNXkAr9QYti8BBPbaULtiCZXecYPXi/5Gz62yGnoW1lBqZxYtcb9
         zTLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779051888; x=1779656688;
        h=cc:to:subject:message-id:date:from:in-reply-to:mime-version
         :references:esfrom:mail-followup-to:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hDbYh8nveG6AJ4qGTnJ5WMHjZoY6FKTJ3XlYsYDU5zY=;
        b=kVCfvjzrocwuCsTw6tEzv1XVMTMaOso6Nwc4i/ejouhT39erqqw0ROLgThACeJwuHX
         ZZN/D70mZMhmboGyaGou71ck9k8jN9he2QHK1yySumsn4JrzDaff1qPa7dgLCactYVrO
         wlO2tROPgEcLJQEpCrGFca5MVsfW0aNZadOl2Q5wAoL0JXax0GbqWq6KeCBJn2+jhh/H
         jxJQnVISmRalMoyownuuX9nezdq0l9yC99fQVBK6OxDSN5lmlWz6hOE23sWVBQyVDJnA
         XPmBrU3hGRaCrjuho6649HVRmDXGkcHDa1e8KqX2tlkKCLmT+l0cvQYnaZlhfLtPnTys
         rfmQ==
X-Forwarded-Encrypted: i=1; AFNElJ+XxgEHnlIn/yQjs6D+L6zomXXXvfiu3izRyT3Xbo+lAkJnUpMRk5O+F4vLwI/yQNorYRCUCzxEO9HW@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yw1wGL2PbdjHqWLu/kNXZPM9igf2DIwKCalSLJIywPtePWxU8Co
	RIQ0gavz8MA6lqT30f1wM9DhKs0tgi0GBvU3fpvEStDGPj8MQK8qFk5nnCiwt1bBYwDEgQqCb6H
	IYiq1Jo/kyXLQvemdaXAosrLR+PzZsXgyIva03y/NFA==
X-Gm-Gg: Acq92OGPFvy7k5f2OVwNq6tBQ0KV0lJ7bki49YhdnnWoRLHZMAtCP6vnX29iSeoB1eE
	NGXVbd5393iL3DwI0UCWdr/XByu2xgU4vAiFhmHytu4HN+ZXEAunAnCYL1pIZ8nDx2rVggNIt5W
	5W489Ixj3FctkfB4Hen8/I2BEidMpIQ5bTbwvdloUBWppHE0owuapbC8c6xY05Yt0Ebl1yiHIlM
	11+SW2qkbFQb4IZ9d0+9sxHv1P5XJcsOWu25atCeenJIGbscVDxYi+xyxvEqoZZFL48pwgwo8md
	DAwN+g4GzT9rNmoSiaOU1w1m5JlHQRGNDawU
X-Received: by 2002:a17:907:e143:b0:bbf:74d7:1c4a with SMTP id
 a640c23a62f3a-bd51797a62amr374507666b.40.1779051888479; Sun, 17 May 2026
 14:04:48 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 17 May 2026 14:04:46 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 17 May 2026 14:04:46 -0700
Mail-Followup-To: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Angelo Dureghello <adureghello@baylibre.com>, Greg Ungerer <gerg@linux-m68k.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
esFrom: angelo@archlinux
References: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
 <20260513-wip-stmark2-dac-v2-11-fcdae50cf51a@baylibre.com> <agTe7vZ94DnmD4Ed@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <agTe7vZ94DnmD4Ed@ashevche-desk.local>
From: Angelo Dureghello <adureghello@baylibre.com>
Date: Sun, 17 May 2026 14:04:46 -0700
X-Gm-Features: AVHnY4LhOGXoyOJyplIGodv_eunK_4nruqdQdyOYVyqkdOdxsDpZTI4SCFL0VTw
Message-ID: <CALSJ-wB4=fTTTExQf2pdoQVz7v5NjaaYQgwGwE+qoZNb6uzAqA@mail.gmail.com>
Subject: Re: [PATCH v2 11/11] iio: dac: add mcf54415 DAC
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Angelo Dureghello <adureghello@baylibre.com>, Greg Ungerer <gerg@linux-m68k.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

H Andy,

On Wed, May 13, 2026 at 11:28:30PM +0300, Andy Shevchenko wrote:
> On Wed, May 13, 2026 at 11:14:35AM +0200, Angelo Dureghello wrote:
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
>
> ...
>
> > +#include <linux/array_size.h>
> > +#include <linux/bitfield.h>
> > +#include <linux/bits.h>
> > +#include <linux/clk.h>
> > +#include <linux/compiler_types.h>
> > +#include <linux/delay.h>
>
> + err.h
>
> > +#include <linux/io.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
>
> ...
>
> > +struct mcf54415_dac {
> > +	struct clk *clk;
> > +	struct regmap *map;
>
> I believe that regmap pointer is used more often, can you check with
> bloat-o-meter that swapping these two (by the order) gives any benefit in
> object size?
>
> > +};
>
> ...
>
> > +	.max_register = 0x1F,
>
> No definition? What datasheet says about this? Perhaps define the MAX as per
> last defined register in the datasheet?
>
> > +};
>
> ...
>
> > +static void mcf54415_dac_init(struct mcf54415_dac *info)
> > +{
> > +	/* Keeping defaults and enable DAC (bit 0 set to 0) */
> > +	regmap_write(info->map, MCF54415_DAC_CR, MCF54415_DAC_CR_FILT |
> > +		     FIELD_PREP(MCF54415_DAC_CR_WMLVL, 1));
>
> Seems the whole driver ignores IO errors, why?
>
> > +	/* DAC is ready after 12us, from RM table 40-3  */
> > +	fsleep(12);
> > +}
>
> ...
>
> > +static void mcf54415_dac_exit(void *data)
> > +{
> > +	struct mcf54415_dac *info = data;
> > +
> > +	regmap_update_bits(info->map, MCF54415_DAC_CR, MCF54415_DAC_CR_PDN,
> > +			   MCF54415_DAC_CR_PDN);
>
> regmap_set_bits()
>
> > +}
>
> ...
>
> > +static int mcf54415_write_raw(struct iio_dev *indio_dev,
> > +			      struct iio_chan_spec const *chan,
> > +			      int val, int val2, long mask)
> > +{
> > +	struct mcf54415_dac *info = iio_priv(indio_dev);
> > +
> > +	switch (mask) {
> > +	case IIO_CHAN_INFO_RAW:
> > +		if (val < 0 || val > 4095)
>
> Do we have a definition for the resolution? I'm fine with the plain numbers,
> but it's better to add a short comment to say that this is "based on the
> resolution of XXX register per datasheet".
>
> > +			return -EINVAL;
> > +		regmap_write(info->map, MCF54415_DAC_DATA, val);
> > +		return 0;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
>
> ...
>
> > +static int mcf54415_dac_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct iio_dev *indio_dev;
> > +	struct mcf54415_dac *info;
> > +	void __iomem *regs;
> > +	int ret;
> > +
> > +	indio_dev = devm_iio_device_alloc(dev, sizeof(*info));
> > +	if (!indio_dev)
> > +		return -ENOMEM;
> > +
> > +	info = iio_priv(indio_dev);
> > +
> > +	regs = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(regs))
> > +		return dev_err_probe(dev, PTR_ERR(regs),
> > +				     "failed to get io regs\n");
>
> One line.
>
> > +
> > +	info->map = devm_regmap_init_mmio(dev, regs,
> > +					  &mcf54415_dac_regmap_config);
> > +	if (IS_ERR(info->map))
> > +		return PTR_ERR(info->map);
> > +
> > +	info->clk = devm_clk_get_enabled(dev, "dac");
> > +	if (IS_ERR(info->clk))
> > +		return dev_err_probe(dev, PTR_ERR(info->clk),
> > +				     "failed getting clock\n");
>
> Also can be a single line, but this one a bit longer than above, gives
> 88 characters.
>
> > +	platform_set_drvdata(pdev, indio_dev);
> > +
> > +	indio_dev->name = "mcf54415";
> > +	indio_dev->info = &mcf54415_dac_iio_info;
> > +	indio_dev->modes = INDIO_DIRECT_MODE;
> > +	indio_dev->channels = mcf54415_dac_iio_channels;
> > +	indio_dev->num_channels = ARRAY_SIZE(mcf54415_dac_iio_channels);
> > +
> > +	mcf54415_dac_init(info);
> > +
> > +	ret = devm_add_action_or_reset(dev, mcf54415_dac_exit, info);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return devm_iio_device_register(dev, indio_dev);
> > +}

Thanks, will look into all the above, together with sashiko, and issue
a v3 in short.

>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Regards,
angelo
