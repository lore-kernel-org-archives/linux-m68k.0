Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4D24266B1
	for <linux-m68k@lists.linux-m68k.org>; Wed,  6 May 2026 15:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778080821; cv=none; b=W92CKesw4qmE5o5O3M+QpAGFbY7u+Pp/y0NNSiKR6XW9LCN/94qWRzZ1cx/abTdK/GoYrHt8S4CrNQ6pm/DI7IwTTDF3kbVamGfxBsWtrA45w+Y4hSl1zdq/+IffW0ZZtDdpWsj8ecoh0IueOfYgcgTiFLU89OiTj01rp+4F9sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778080821; c=relaxed/simple;
	bh=Z6fQ0YAqtLbGIy9ba3h1aZ5bW6uBRB8+wtS8/48DFo4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wo/dovLYGa55BCDwmLke9RtDWlD7SXuRD09KuwMCzw/ONpPRst7I9m2cuzYyqRvUK8LaaynOGN407vFuADmF8sEM6RbgMHbl0vnUznbpo8TJoy52SLBoKSKNIiHmNm3aQAvFWe79JZuzdO12ycyODK/tiiO82xR7x0xiNUZaf9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CFnwSGKN; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CFnwSGKN"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8818D440D3;
	Wed,  6 May 2026 15:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1932C2BCB0;
	Wed,  6 May 2026 15:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778080816;
	bh=Z6fQ0YAqtLbGIy9ba3h1aZ5bW6uBRB8+wtS8/48DFo4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CFnwSGKNuFLNRZcK4eZ7wIM2U4JnaLUW7a54+wwIkyrq7/rkSteWfKxwdeLo1IWk/
	 YrFL/E0KCegfcG5p1cWT76ctk8sjGTIq+gVOA20/AYDThn/izCNEMWgUpVowQui7Pp
	 kE3ve223x6bqkb4queH1HSIkK9nc/7+lyKvAEYX1XnyU5WFMs12VL1ps+0zSWhhf/0
	 m8BuPR5ynvoRua8puN5oMnELw/v18vm6E8JWLL58zCqvF+RvKuYcTXPpFv+Lo5w5wz
	 t3Iz1RJQ/eMs2N6KRIhiEKwgsjjxhJI6LKA3de4DqGbj2WaAvn/gVCHM6VQ/vlecEv
	 DWVG5FA8YC0/A==
Date: Wed, 6 May 2026 16:20:05 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Angelo Dureghello <angelo@kernel-space.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, Arnd Bergmann
 <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>,
 linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, Angelo
 Dureghello <adureghello@baylibre.com>
Subject: Re: [PATCH 10/10] iio: dac: add mcf54415 DAC
Message-ID: <20260506162005.50408fde@jic23-huawei>
In-Reply-To: <20260504-wip-stmark2-dac-v1-10-874c36a4910d@baylibre.com>
References: <20260504-wip-stmark2-dac-v1-0-874c36a4910d@baylibre.com>
	<20260504-wip-stmark2-dac-v1-10-874c36a4910d@baylibre.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 04 May 2026 19:16:48 +0200
Angelo Dureghello <angelo@kernel-space.org> wrote:

> From: Angelo Dureghello <adureghello@baylibre.com>
> 
> Add basic version of mcf54415 DAC driver. DAC is embedded in the cpu and
> DAC configuration registers are mapped in the internal IO address space.
> 
> The DAC accepts a 12-bit digital signal and creates a monotonic 12-bit
> analog output varying from ~DAC_VREFL to ~DAC_VREFH. The DAC module
> consists of a conversion unit, an output amplifier, and the associated
> digital control blocks. DAC_VREFL and DAC_VREFH defaults respectivley to
Spell check.

> 0 and 0xfff.

is DAC_VFEFL == 0? If not should have an _offset based on what it is. If
it's common floating line then we can think about whether we need to describe
it or it's just implicit as should be tied to whatever passes for 0V locally.

> 
> This initial version of the driver is minimalistic, "output raw" only, to
> be extended in the future. DMA and external sync are disabled, default mode
> is high speed, default format is right-justified 12bit on 16bit word.
> 
> Basic tests done on stmark2 mcf54415-based board, voltage check on DAC0:
> 
> /sys/bus/iio/devices/iio:device0 # ls
> name                 out_voltage_raw      subsystem
> out_conversion_mode  out_voltage_scale    uevent
https://sashiko.dev/#/patchset/20260504-wip-stmark2-dac-v1-0-874c36a4910d%40baylibre.com

Sashiko noted this.  Doesn't seem to be such a thing as out_conversion_mode
which is good given I'd have moaned about custom ABI without docs.
On the other hand it did hallucinate IIO_CHAN_INFO_CONVERSION_MODE when
there is no such thing.

As noted though too much for a patch description given most of this is entirely standard.

> 
> /sys/bus/iio/devices/iio:device0 # cat name
> mcf54415_dac.0
> 
> /sys/bus/iio/devices/iio:device0 #
> 
> echo 4095 > out_voltage_raw     => voltage abt 3.3V by oscilloscope
> echo 4096 > out_voltage_raw     => roll over to 0V
Why?  Should be bounds checked and return -EINVAL or -ERANGE
(we aren't particularly fixed on which)

> echo 0 > out_voltage_raw        => voltage is 0V
> echo 2048 > out_voltage_raw     => voltage is abt 1.7V, mid scale
> 
> Same behavior for /sys/bus/iio/devices/iio:device1.
> 
> Generated a sine wave by shell script, sine shape is good.
> 
> Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> ---
>  drivers/iio/dac/Kconfig        |  10 +++
>  drivers/iio/dac/Makefile       |   1 +
>  drivers/iio/dac/mcf54415_dac.c | 200 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 211 insertions(+)
> 
> diff --git a/drivers/iio/dac/Kconfig b/drivers/iio/dac/Kconfig
> index cd4870b65415..17550e99cfdd 100644
> --- a/drivers/iio/dac/Kconfig
> +++ b/drivers/iio/dac/Kconfig
> @@ -516,6 +516,16 @@ config MAX5821
>  	  Say yes here to build support for Maxim MAX5821
>  	  10 bits DAC.
>  
> +config MCF54415_DAC
> +	tristate "NXP MCF54415 DAC driver"
> +	depends on M5441x

If we can add a || COMPIlE_TEST that would be much appreciated as
then we'll get some better build coverage.

May need some stubs if there is anything not already stubbed out.

> +	help
> +	  Say yes here to build support for NXP MCF54415
> +	  12bit DAC.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called mcf54415_dac.
> +
>  config MCP4725
>  	tristate "MCP4725/6 DAC driver"
>  	depends on I2C
> diff --git a/drivers/iio/dac/Makefile b/drivers/iio/dac/Makefile
> index 2a80bbf4e80a..1cb93e83d0eb 100644
> --- a/drivers/iio/dac/Makefile
> +++ b/drivers/iio/dac/Makefile
> @@ -51,6 +51,7 @@ obj-$(CONFIG_MAX517) += max517.o
>  obj-$(CONFIG_MAX22007) += max22007.o
>  obj-$(CONFIG_MAX5522) += max5522.o
>  obj-$(CONFIG_MAX5821) += max5821.o
> +obj-$(CONFIG_MCF54415_DAC) += mcf54415_dac.o
>  obj-$(CONFIG_MCP4725) += mcp4725.o
>  obj-$(CONFIG_MCP4728) += mcp4728.o
>  obj-$(CONFIG_MCP47FEB02) += mcp47feb02.o
> diff --git a/drivers/iio/dac/mcf54415_dac.c b/drivers/iio/dac/mcf54415_dac.c
> new file mode 100644
> index 000000000000..4031a5dc1f9d
> --- /dev/null
> +++ b/drivers/iio/dac/mcf54415_dac.c
> @@ -0,0 +1,200 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * NXP mcf54415 DAC driver
> + *
> + * Copyright 2026 BayLibre - adureghello@baylibre.com
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +
> +#include <linux/iio/iio.h>
> +
> +#define MCF54415_DAC_CR			0x00
> +#define MCF54415_DAC_CR_PDN		BIT(0)
> +#define MCF54415_DAC_CR_HSLS		BIT(6)
> +#define MCF54415_DAC_CR_WMLVL		GENMASK(9, 8)
> +#define MCF54415_DAC_CR_FILT		BIT(12)
> +
> +#define MCF54415_DAC_DATA		0x02
> +
> +#define MCF54415_DAC_READY_US		12

I'd put this inline instead of having a define given it's only used in one
place and  the documentation on why it is 12 is there.

> +
> +struct mcf54415_dac {
> +	struct clk *clk;
> +	struct device *dev;

Sashiko noted dev isn't used after assignment so drop it.

> +	void __iomem *regs;
> +};
> +
> +static void mcf54415_dac_init(struct mcf54415_dac *info)
> +{
> +	int val;
> +
> +	/* Keeping defaults and enable DAC (bit 0 set to 0) */
> +	val = MCF54415_DAC_CR_FILT;
> +	val |= FIELD_PREP(MCF54415_DAC_CR_WMLVL, 1);
> +
> +	writew(val, info->regs + MCF54415_DAC_CR);
> +
> +	/* DAC is ready after 12us, from RM table 40-3  */
> +	fsleep(MCF54415_DAC_READY_US);
> +}
> +
> +static void mcf54415_dac_exit(void *data)
> +{
> +	struct mcf54415_dac *info = data;
> +	int val;
> +
> +	val = readw(info->regs + MCF54415_DAC_CR);
> +	val |= MCF54415_DAC_CR_PDN;

Even though simple, might be worth using regmap and
taking advantage of regmaps rich set of RMW operations.

> +	writew(val, info->regs + MCF54415_DAC_CR);
> +}
> +
> +#define MCF54415_DAC_CHAN { \
> +	.type = IIO_VOLTAGE, \
> +	.output = 1, \
> +	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW), \
> +	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE), \
> +}
> +
> +static const struct iio_chan_spec mcf54415_dac_iio_channels[] = {
> +	MCF54415_DAC_CHAN
> +};
> +
> +static int mcf54415_read_raw(struct iio_dev *indio_dev,
> +			struct iio_chan_spec const *chan,
> +			int *val, int *val2,
> +			long mask)
> +{
> +	struct mcf54415_dac *info = iio_priv(indio_dev);
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		*val = readw(info->regs + MCF54415_DAC_DATA);
Any chance there is anything in higher bits?  Maybe mask to be sure
(sashiko moaned about this)

> +		return IIO_VAL_INT;
> +	case IIO_CHAN_INFO_SCALE:
> +		/* Reference voltage as per ColdFire datasheet is 3.3V */
> +		*val = 3300 /* mV */;
> +		*val2 = 12;
> +		return IIO_VAL_FRACTIONAL_LOG2;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mcf54415_write_raw(struct iio_dev *indio_dev,
> +			struct iio_chan_spec const *chan,
> +			int val, int val2,
> +			long mask)
> +{
> +	struct mcf54415_dac *info = iio_priv(indio_dev);
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		writew(val, info->regs + MCF54415_DAC_DATA);

Should return an error if val is too large. Same thing as the overflow
thing in the commit message that I commented on above. 

> +		return 0;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static const struct iio_info mcf54415_dac_iio_info = {
> +	.read_raw = &mcf54415_read_raw,
> +	.write_raw = &mcf54415_write_raw,
> +};
> +
> +static int mcf54415_dac_probe(struct platform_device *pdev)
> +{
> +	struct iio_dev *indio_dev;
> +	struct mcf54415_dac *info;
> +	int ret;
> +
> +	indio_dev = devm_iio_device_alloc(&pdev->dev,

Quite a lot of use of pdev->dev. I'd introduce a local
struct device *dev = &pdev->dev;
and use that.

> +					  sizeof(struct mcf54415_dac));
> +	if (!indio_dev)
> +		return -ENOMEM;
> +
> +	info = iio_priv(indio_dev);
> +	info->dev = &pdev->dev;
As noted above, this doesn't seem to be used.
> +
> +	info->regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(info->regs))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(info->regs),
> +				     "failed to get io regs\n");
> +
> +	info->clk = devm_clk_get_enabled(&pdev->dev, "dac");
> +	if (IS_ERR(info->clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(info->clk),
> +				     "failed getting clock\n");
> +
> +	platform_set_drvdata(pdev, indio_dev);
> +
> +	indio_dev->name = dev_name(&pdev->dev);

This should be the part number.  dev_name has an irritating habit
of being something more complex. What is it here? Just hard coding
it probably simpler even if it happens to be something that works in
this case.

If you need to differentiate between multiple instances, use a label
instead of name.

> +	indio_dev->info = &mcf54415_dac_iio_info;
> +	indio_dev->modes = INDIO_DIRECT_MODE;
> +	indio_dev->channels = mcf54415_dac_iio_channels;
> +	indio_dev->num_channels = ARRAY_SIZE(mcf54415_dac_iio_channels);
> +
> +	mcf54415_dac_init(info);
> +
> +	ret = devm_add_action_or_reset(&pdev->dev, mcf54415_dac_exit, info);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_iio_device_register(&pdev->dev, indio_dev);
> +	if (ret)
> +		dev_err(&pdev->dev, "couldn't register the device\n");

I think this was already pointed out.  It's really easy to see if this
failed (the device isn't there) so we tend not to bother printing
an error on it happening.  Thus
	return devm_iio_device_register()

> +
> +	return ret;
> +}

> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(mcf54415_dac_pm_ops, mcf54415_dac_suspend,
> +				mcf54415_dac_resume);
> +
> +static struct platform_driver mcf54415_dac_driver = {
> +	.probe          = mcf54415_dac_probe,
> +	.driver         = {
> +		.name   = "mcf54415_dac",
> +		.pm     = pm_sleep_ptr(&mcf54415_dac_pm_ops),
> +	},
> +};
To me the alignment of this structure is misleading to the eye as stuff
in the substructure aligns with the main one.  I'd prefer

static struct platform_driver mcf54415_dac_driver = {
	.probe = mcf54415_dac_probe,
	.driver = {
		.name = "mcf54415_dac",
		.pm = pm_sleep_ptr(&mcf54415_dac_pm_ops),
	},
};

Because this sort of alignment forcing is a common source of annoying
churn in follow up patches for very little in readability gains.
When it's arrays of numeric data it is worth doing but not for fields
of a structure.


> +module_platform_driver(mcf54415_dac_driver);
> +
> +MODULE_AUTHOR("Angelo Dureghello <angelo@kernel-space.org>");
> +MODULE_DESCRIPTION("NXP MCF54415 DAC driver");
> +MODULE_LICENSE("GPL");
> 

