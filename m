Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0E43093B8
	for <linux-m68k@lists.linux-m68k.org>; Wed, 13 May 2026 14:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778681284; cv=none; b=UmHgefE82cEXsVX5JuYwvYWewb+UNQXuomwbNpX3P2kA5bsEkM9L5XCsaaCFhx0+lYI/e+RO4XsyKr821+huUxxRuimpDVdQ8axRDGjmUw04fABec/jfCkcGF5FKANRXydt73RiL6uvImvUmDMMwiyGUHsKFDiYed0VMLwsgri4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778681284; c=relaxed/simple;
	bh=UcCnX+hZhQbVEDIyzBzB508ARtnF3/FoxfXkEhQY/d8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dgrE+Qk7aUrtONZkYgl1CG88rF8LFsfDW/Zt1TmqLp3gX9Z9Z/WERvn6W18YnqyqNLjawIN1izb8MUqIMZCvlhWBdkxlY4SWHIEF2VV2d5Aeua7awNsgIT1YZBtjb4IqWUbmZotI5/E5x1NQE9Ju414hQo76178P2P5uRU81KI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=URinv1wd; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="URinv1wd"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8AC7340BEA;
	Wed, 13 May 2026 14:08:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8871C19425;
	Wed, 13 May 2026 14:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778681282;
	bh=UcCnX+hZhQbVEDIyzBzB508ARtnF3/FoxfXkEhQY/d8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=URinv1wdoSFbocNtRMotJr7U4dQDvjLcrLhC92vrR29B7glDq9U0AXgeDBf/jNcEg
	 dMNTgpdtKzh9fTDh5Wxr+Zz5ATDDsSQ49j+r154KpG3x/AhvPawlGDho/VNnk2cRBJ
	 00UK+kMQzsvQI9Xn4J30J/D9k0xpixlejDbJcpWzsDD5PDHEkTsY+EJLR5klKs3yxA
	 8Na3x+Yx9RfA9cKjs62qeZqe60AM9Rv0Pz7pZpXPcV1sVWtxOzU1wzx3ujV+w27B87
	 URNGuBZvuh9r77jAhuwtcyMGujSZWfPIakebqVcxq4YFeM5elVV2Fd9vTFKtUHPpXy
	 ffufUSuRYYSag==
Date: Wed, 13 May 2026 15:07:51 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Angelo Dureghello <adureghello@baylibre.com>
Cc: Greg Ungerer <gerg@linux-m68k.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, Arnd Bergmann
 <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>,
 linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH v2 11/11] iio: dac: add mcf54415 DAC
Message-ID: <20260513150751.3305bf99@jic23-huawei>
In-Reply-To: <20260513-wip-stmark2-dac-v2-11-fcdae50cf51a@baylibre.com>
References: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
	<20260513-wip-stmark2-dac-v2-11-fcdae50cf51a@baylibre.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 13 May 2026 11:14:35 +0200
Angelo Dureghello <adureghello@baylibre.com> wrote:

> From: Angelo Dureghello <adureghello@baylibre.com>
> 
> Add basic version of mcf54415 DAC driver. DAC is embedded in the cpu and
> DAC configuration registers are mapped in the internal IO address space.
> 
> The DAC accepts a 12-bit digital signal and creates a monotonic 12-bit
> analog output varying from DAC_VREFL to DAC_VREFH. The DAC module
> consists of a conversion unit, an output amplifier, and the associated
> digital control blocks. Default register values for DAC_VREFL and DAC_VREFH
> are respectively 0 and 0xfff, left untouched in this initial version.
> 
> This initial version of the driver is minimalistic, "output raw" only, to
> be extended in the future. DMA and external sync are disabled, default mode
> is high speed, default format is right-justified 12bit on 16bit word.
> 
> Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>

As for all new IIO code, Sashiko will eventually take a look at it - I think
it's running about a day behind at the moment.  Once it catches up please
take a look (so far it's not even listing the series as pending!)

Looks good to me. Some trivial stuff inline. Only one I'm that fussed about
is not having a macro for the definition of a single channel. 
Superficially looks like no compile time dependencies between this and
the rest of the series I think so once people are happy with the whole thing
I'll pick this up through the IIO tree.

Jonathan

> diff --git a/drivers/iio/dac/mcf54415_dac.c b/drivers/iio/dac/mcf54415_dac.c
> new file mode 100644
> index 000000000000..e95ab6b89b17
> --- /dev/null
> +++ b/drivers/iio/dac/mcf54415_dac.c
...


> +static void mcf54415_dac_exit(void *data)
> +{
> +	struct mcf54415_dac *info = data;
> +
> +	regmap_update_bits(info->map, MCF54415_DAC_CR, MCF54415_DAC_CR_PDN,
> +			   MCF54415_DAC_CR_PDN);

regmap_set_bits() just to be a tiny bit more compact.

> +}
> +
> +#define MCF54415_DAC_CHAN \
> +{ \
> +	.type = IIO_VOLTAGE, \
> +	.output = 1, \
> +	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW), \
> +	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE), \
> +}
> +
> +static const struct iio_chan_spec mcf54415_dac_iio_channels[] = {
> +	MCF54415_DAC_CHAN,

For a single channel case like this I'd skip the macro - it's just
making things a little harder to read. i.e.
	.type = IIO_VOLTAGE,
etc here

> +};
> +

> +static int mcf54415_dac_suspend(struct device *dev)
> +{
> +	struct iio_dev *indio_dev = dev_get_drvdata(dev);
Given the type passed to iio_priv() is very well known this
isn't really bringing any type safety - so you could just do

	struct mcf54415_dac *info = iio_priv(dev_get_drvdata(dev));
here and in resume.
I don't really care either way!


> +	struct mcf54415_dac *info = iio_priv(indio_dev);
> +
> +	mcf54415_dac_exit(info);
> +	clk_disable_unprepare(info->clk);
> +
> +	return 0;
> +}
> +
> +static int mcf54415_dac_resume(struct device *dev)
> +{
> +	struct iio_dev *indio_dev = dev_get_drvdata(dev);
> +	struct mcf54415_dac *info = iio_priv(indio_dev);
> +	int ret;
> +
> +	ret = clk_prepare_enable(info->clk);
> +	if (ret)
> +		return ret;
> +
> +	mcf54415_dac_init(info);
> +
> +	return 0;
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(mcf54415_dac_pm_ops,
> +				mcf54415_dac_suspend,
> +				mcf54415_dac_resume);
> +

Trivial but might as well wrap as:
static DEFINE_SIMPLE_DEV_PM_OPS(mcf54415_dac_pm_ops,
				mcf54415_dac_suspend, mcf54415_dac_resume);

And save us scrolling one line extra.


