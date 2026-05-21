Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35883CB907
	for <linux-m68k@lists.linux-m68k.org>; Thu, 21 May 2026 12:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779365656; cv=pass; b=KfCvv3NkRcimzW3h5uKeeQaZuXx9KA1sc8EKnKzHznF8gHfjd1soKOKKsxP00A7eIUcq/hYJqtoMEa2kZlpyPddaj0PSH5vCbMmHvVZGzBEI8ejVmHZziIVD5oNJiLc6KckJyv1jjhQ/l4Dx/fPfchTCMcB3gqFo3Peal96UAHU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779365656; c=relaxed/simple;
	bh=XcwwmNFeGKOz5wm9C4M8dp6d2E7Hb2byMKXE7ZZMrtw=;
	h=From:References:MIME-Version:In-Reply-To:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TSQPWBO6ZL0AOd0J1hav8672qPE0EvtWSZQAoz+/VX46/WjO104OFr3WQPYA0lKQY7ujMpYM64Xr+VEK8iKuzpBUDVW/1DPDZ/1RQbRQcxAExj8yGp2+q09s5MHBt+GqFfWhXjcCFbhsKqhsDaCnuFRjfef3mDNB5X3P8EIxJMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=KNvMwqW5; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="KNvMwqW5"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-bd8f9725b30so550907166b.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 21 May 2026 05:14:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779365650; cv=none;
        d=google.com; s=arc-20240605;
        b=DxNX5JcCToZmudgJDNyxOSxCgEaEHVGBesNpp2DXxOsjenY3vVO9c61P+BdpgoQ/Yq
         /019NGI2kaeAh8yHdR6RQxiN2eTqFu0N6uxgJQkLluXx0E1hutlCPzReYsYaFHJc3req
         paAAoR+aBL/L1/0V1etm8VN0OzRDc+57AcvRHetQMKe6DQ44tD2rV1w2eeMwK8NKAmYe
         lKrnqL2DavJkMCmVnVQV0HWGn2g/7CNaz/Xn4I6/G5IAEkQjTUgmfnPpKJpX8vVsvenO
         G/luhgTnOTVW6oXdXAGQ1QwZVGzqBC6J4yHoLKsysC22MJY7UMLvNxGcYWx6pDkrFgQV
         RJsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :mail-followup-to:from:dkim-signature;
        bh=kCAT/FSMB8tJhmNGpR3NQBa4aJk54FUzKfLnS0Vjt6c=;
        fh=dTnndKGKanHQLVnecC8HJOYa988C/RC9L8ML1r46Dqs=;
        b=dAPWk3lLL+u25lVgKX6EQuw50cqFvkscucZ2XhKpIzfkl0odvklPjoCL/EM7Ifgtt6
         LSknoX/eUahJS1iOtZPJBXoVjO07sBEnjh/4iQ0XH3j/wFX8KYAvkIOaAOglRkUt1Pof
         oDFeu++U0TVyk7RJnkbIYvjFx+SjyHpGLJ744gJmOriHFmdwsgCuX8qjj1TJ+qRLR3ru
         Bn6lccK096cNk11ltT/LfPx3qLD6Q1RYmJUK0mPhGbfLOSbWfDCYNNNIytLpaqIPYiPX
         +BBwOyc6dJmjEusPJw7lHBdPrY+KL9WxCDeAFHiosPr8PGq0DOkxEdLb7sBYLMJdaOH0
         udxg==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779365650; x=1779970450; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :mail-followup-to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kCAT/FSMB8tJhmNGpR3NQBa4aJk54FUzKfLnS0Vjt6c=;
        b=KNvMwqW57gR28ivVmMI03qMHlYh16O6V1itCzgYjBmAQdywjNd+icry37Pwqybhqim
         u+LyUu0YOB8HM+nHdlXg0g3T1wFU3iMqFZwZCzqub893wMH1k3aRS3cBXcn1iXP5HVTc
         Cqe75N7xK1IUNqo59uo5e6XdR/yHBqsHbPSitD+mTzu+iUAHEqR91/pYW//7p32rP0fq
         I6q0r9tfEUGJ/rqZx+aBH6a/efxkq1Szii/HCY/h9tm70KhYTxw1O+dItmTfXi6aUDem
         JkeJYXXsnZY5pP8SisOXdvdrwDver0+v+s64XV2R91WPDk+iPnr2erugUiTa+pJvv3jt
         wkkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779365650; x=1779970450;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :mail-followup-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kCAT/FSMB8tJhmNGpR3NQBa4aJk54FUzKfLnS0Vjt6c=;
        b=mZ6UWDeeiMWqczLByFb1dsIAbSR3IsSf1NC1R+MYV0YSNsa5Xxavw7AXw3dwHR0+F1
         m2NVfz+mZ6OHQdXwuPC3SbrMS6jQwKpwipUWgoy7AZaEufz9Nius29DkzRoSupbyNoWO
         rraZa5N14elIi07s/UBLPGAaUuLCv0g8ct1W84xKKJSAV43c5C6fI5ehoY0ETLrGXapq
         +iALlRjjwY14x/iOJtVKkop82OpUHqKA4Ujklhpy75OQUP67/KdpflFjbQafAa9wspff
         0OgX5RLdAeF6KeeXBb1WZ0GJ7W4Z2FYWIR4G9L3DCNXUAeHdqJyvD+EbMo5UbqTDUR41
         07yA==
X-Forwarded-Encrypted: i=1; AFNElJ8M8dgN7FzW/WsUL+Kz8RPDeucJNXpSx/TMzcKA44sJHPQeqOj6NbM4M5KlKG8317YpjxhCP/qCATS2@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwQFyxR84pknwiwtflG99m0wj8GyWPYKCwcN7eR1PU7dGR8C6+2
	ZYB6s1WSvW44U8R/zukwuGoT/R6TyyA1TYpobd9yF/1PsCnfsN27GpVBAqYcTuB3UfKMZManycN
	RG7B+MmqQGFwpQxKgJ/lRP0ct9ZrD5O6Qvpe+1+V7aw==
X-Gm-Gg: Acq92OHdPFv4hKp4ez9sRWunRVd7mV5pZO8m+Tc4mND+FNL+w5PwCVrm1hdflgGYOEP
	yOjZ5LyG3ejewzfXzNm3xjktHF3eQUTCg/y6ch9kXerZQwNr7g/li9TNwBsUXhlS0I+benlfiUS
	r57/xw6kGs7+Z3xS9vN49dVoBcAFqOjM7lMPs2fLXfXFaUZ7m1ciggggwnoccCxdVVS/O2hX4MX
	L9LfXzPLnhfcPMSaam1F7wOmsTWWvgd3V35adBFrZ6p+TJoj56ukjha3uvKpry76wVw5mTG1efJ
	vPr1pgXQtL90KRBp2p4XHfdJQBy2Hfu6YDAT
X-Received: by 2002:a17:907:6d27:b0:bd2:e940:db38 with SMTP id
 a640c23a62f3a-bdc17d23987mr141007766b.28.1779365650245; Thu, 21 May 2026
 05:14:10 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 05:14:07 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 05:14:07 -0700
From: Angelo Dureghello <adureghello@baylibre.com>
Mail-Followup-To: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Angelo Dureghello <adureghello@baylibre.com>, Greg Ungerer <gerg@linux-m68k.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
References: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
 <20260513-wip-stmark2-dac-v2-11-fcdae50cf51a@baylibre.com> <agTe7vZ94DnmD4Ed@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <agTe7vZ94DnmD4Ed@ashevche-desk.local>
Date: Thu, 21 May 2026 05:14:07 -0700
X-Gm-Features: AVHnY4KQ9snIXNmFVw7beAhQpkjp4lsWxF_SmKnG6LJVzoen_-CkRZHjCww1Cio
Message-ID: <CALSJ-wBbjwrhTEpfKm-JHox7-E1YRQ=kTj1JN+KyiucTTu7c3A@mail.gmail.com>
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

Hi Andy,

just few points below, the rest has been fixed:

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

checking size in ColdFire arch with last kernel.org gcc had no benefit,
anyway put regmap before

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

i decided to stay inside 80 in all the file, is it ok ?

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

same as above

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
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
Regards,
angelo
