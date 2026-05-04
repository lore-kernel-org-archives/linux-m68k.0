Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675CD3FAE1E
	for <linux-m68k@lists.linux-m68k.org>; Mon,  4 May 2026 19:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777921943; cv=none; b=JsuMJIV5ZaOv4KtZbmif5F/azCI1n7ukef7IX2vS5kGWeCXVST7IEez2wK58SDp3yCjZeLuuYNoLJ768pzUTp3nkQKSeRKLo18Ht9zBMbmE3iPg4urW8Zc+1LtXkQtXStOwN+WMPy/psOyn0879hC1oCPcaHCbJlKtjVHWJiRhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777921943; c=relaxed/simple;
	bh=Ihc00evsea1JyHhZnT8LvktURlmSUr9xxn/GvGjdeno=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i3Hj555WmRzqqQiBHAoRKdP8tp12gymNEzuyNLqKAe2tjgTfLQ0Gzjob3Ccx4K7mrw1L6DjdBAUIQmqEqfJsflOSY5zwygQY5DyIc8AcVjc9uItW/sEyoHXunMx6/Bmopmeon3r9kpQZH3ks5CUs9S4dM8It/cM6aiTpE+2CRMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WlzkUtqK; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WlzkUtqK"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso31634945e9.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 04 May 2026 12:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777921940; x=1778526740; darn=lists.linux-m68k.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QQwjBGOlUox0oTO6Nb+xBFeGEpaCgvVAY6DNlLQtXZ0=;
        b=WlzkUtqKSPuDwpLVrZ/8MVIlFIT0dLDUcpbroNFNumwMOLlPkvz2+Sl8S6QdC5Z+Bo
         O+rpN2UaV2Tk+3Ynnq7RPCWMVo0UhBTT6Wve/oTmk5sBPkSY+uDj3m15ggtw0iQXZfmY
         t66xnpxJvxTAKgdUqia69Oy1Tqk/nmOpOxzqcj92NtqKUCRnmhLpLmekqswry6tqRMd1
         Wdj0//nBF4fpaU7VEdiT+nSHJ3oGtzjDcnDg0T1c+qEqI619HGHiBYyuPUMyQS9OEfFc
         +0ky4A/duiG4gbt5tW3fkdrs4KsiD1RerHacw99XpAm3rQwTRXXJ9E5geeunLYd5sO19
         ZBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777921940; x=1778526740;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QQwjBGOlUox0oTO6Nb+xBFeGEpaCgvVAY6DNlLQtXZ0=;
        b=R4yjMNTJ5016BkC9z5fKnc11qj9Ruk2pI8P05s70jd1/tG6rGJOL8oW0X41h0Oc5Mm
         c3V6dhe/3y26eKdjyqytgr7fXaTq/JzqeaXcB7Wha0SEe4wF5EjABFDD9ygUY6WVJyV5
         iZQz+agoaCQZVLhHCQRy8pDVX/Ul9Yasq1lVSH+yCPQ88x3HoDIyISgTCQjmpCyeQjIV
         rAufZS8EwoB1L6bA7t1Oa5xeKpVib3LFZRhUebqkmo2FEnKQZ3axkt4y/wHkx2/orX/a
         slACLeWL5Cj2tnKJIDm/OyWdQ+t+VHp8kGhde5w8zj2yocGoWs9i4t/Qj1SvQsDS3/kt
         ZXiQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Pz+qo5Qm7Hh+nHu7WFkg3pz17DKf8Y8tno/nn1UfyMknY6R8l3N98+25de3wUiLcvqGX+QW+Hnqxq@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yx72t2tKtKIoybN3ehOs2W6IuYtrozvx7Ex8FG3CNWooNlxR/dW
	y3Bfu15UTLLqnEHD2K/hwcScNIngqTThXsCZ3oX9e79rAE7GtwnS8dCd
X-Gm-Gg: AeBDievGeNjiZo3a9+kJBlhH26CdM+qaGQFrnEQ/fNIh/IW0cMz+Epy8VoOWHGCNe6v
	iFAmN9oMGqbisxUUfc30TDCTHFYVYq/V1+SsjgslwS3w2qB8qimvzPnNYQNEsOM1VPXFuXjPNhQ
	gGmMeCzHj6iVrHESyujqycLdq/oCxy00wGYSXm1lgFEU9tLqtJXKTBf/NDd80NqfXzy03jzUzXo
	K97KHTwTX9KNeARbreJlPwvcqvo8Verxq2V7kFC03SrfLQNRjAWdXAn0F7L2lMtXCf5WQVBOeo9
	B1p8SujfcmNaKq4vVm0NoLnpwsxY5z2OgJxZ4xfQuhRgYMFKujTRHsatLsJdRQClKRfyX8XgBjw
	i/rnT6+6fsl7N3xNq3Mk/nUYoTbC+ARbulSUQECOiuENFEdxSexb5Jgvgv9WxAZXsNCW0XCYB1H
	uPZNVg5dGXgrneP2roP8PVcE9pvfJto+KMj63V46kWjjasKeQ/6Sili+z2s4yvTjnqqMriQli3a
	P0AbIC9kDCl7hnjRxD3dgY=
X-Received: by 2002:a05:600c:6215:b0:47e:e2eb:bc22 with SMTP id 5b1f17b1804b1-48a988a9c49mr165080765e9.5.1777921939450;
        Mon, 04 May 2026 12:12:19 -0700 (PDT)
Received: from ?IPv6:2001:818:ea56:d000:56e0:ceba:7da4:6673? ([2001:818:ea56:d000:56e0:ceba:7da4:6673])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eba6f83sm285124095e9.9.2026.05.04.12.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 12:12:19 -0700 (PDT)
Message-ID: <ab58ef97e0e2b20d04210ca0adda6a46a023ac00.camel@gmail.com>
Subject: Re: [PATCH 10/10] iio: dac: add mcf54415 DAC
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Angelo Dureghello <angelo@kernel-space.org>, Greg Ungerer	
 <gerg@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Steven
 King	 <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin	
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,  Jonathan Cameron	 <jic23@kernel.org>,
 David Lechner <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?=	
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, Angelo
 Dureghello <adureghello@baylibre.com>
Date: Mon, 04 May 2026 20:13:19 +0100
In-Reply-To: <20260504-wip-stmark2-dac-v1-10-874c36a4910d@baylibre.com>
References: <20260504-wip-stmark2-dac-v1-0-874c36a4910d@baylibre.com>
	 <20260504-wip-stmark2-dac-v1-10-874c36a4910d@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Angelo,

Minor stuff from me

On Mon, 2026-05-04 at 19:16 +0200, Angelo Dureghello wrote:
> From: Angelo Dureghello <adureghello@baylibre.com>
>=20
> Add basic version of mcf54415 DAC driver. DAC is embedded in the cpu and
> DAC configuration registers are mapped in the internal IO address space.
>=20
> The DAC accepts a 12-bit digital signal and creates a monotonic 12-bit
> analog output varying from ~DAC_VREFL to ~DAC_VREFH. The DAC module
> consists of a conversion unit, an output amplifier, and the associated
> digital control blocks. DAC_VREFL and DAC_VREFH defaults respectivley to
> 0 and 0xfff.
>=20
> This initial version of the driver is minimalistic, "output raw" only, to
> be extended in the future. DMA and external sync are disabled, default mo=
de
> is high speed, default format is right-justified 12bit on 16bit word.
>=20
> Basic tests done on stmark2 mcf54415-based board, voltage check on DAC0:
>=20
> /sys/bus/iio/devices/iio:device0 # ls
> name=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 out_voltage_raw=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s=
ubsystem
> out_conversion_mode=C2=A0 out_voltage_scale=C2=A0=C2=A0=C2=A0 uevent
>=20
> /sys/bus/iio/devices/iio:device0 # cat name
> mcf54415_dac.0
>=20
> /sys/bus/iio/devices/iio:device0 #
>=20
> echo 4095 > out_voltage_raw=C2=A0=C2=A0=C2=A0=C2=A0 =3D> voltage abt 3.3V=
 by oscilloscope
> echo 4096 > out_voltage_raw=C2=A0=C2=A0=C2=A0=C2=A0 =3D> roll over to 0V
> echo 0 > out_voltage_raw=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D> v=
oltage is 0V
> echo 2048 > out_voltage_raw=C2=A0=C2=A0=C2=A0=C2=A0 =3D> voltage is abt 1=
.7V, mid scale
>=20
> Same behavior for /sys/bus/iio/devices/iio:device1.
>=20
> Generated a sine wave by shell script, sine shape is good.
>=20

Not sure if the above example belongs to the commit message. I would just w=
rite a
small doc if you really want to document the above. We're now seeing more d=
ocs for
IIO drivers.

> Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> ---
> =C2=A0drivers/iio/dac/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 10 +++
> =C2=A0drivers/iio/dac/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 1 +
> =C2=A0drivers/iio/dac/mcf54415_dac.c | 200 ++++++++++++++++++++++++++++++=
+++++++++++
> =C2=A03 files changed, 211 insertions(+)
>=20
> diff --git a/drivers/iio/dac/Kconfig b/drivers/iio/dac/Kconfig
> index cd4870b65415..17550e99cfdd 100644
> --- a/drivers/iio/dac/Kconfig
> +++ b/drivers/iio/dac/Kconfig
> @@ -516,6 +516,16 @@ config MAX5821
> =C2=A0	=C2=A0 Say yes here to build support for Maxim MAX5821
> =C2=A0	=C2=A0 10 bits DAC.
> =C2=A0
> +config MCF54415_DAC
> +	tristate "NXP MCF54415 DAC driver"
> +	depends on M5441x
> +	help
> +	=C2=A0 Say yes here to build support for NXP MCF54415
> +	=C2=A0 12bit DAC.
> +
> +	=C2=A0 To compile this driver as a module, choose M here: the module
> +	=C2=A0 will be called mcf54415_dac.
> +
> =C2=A0config MCP4725
> =C2=A0	tristate "MCP4725/6 DAC driver"
> =C2=A0	depends on I2C
> diff --git a/drivers/iio/dac/Makefile b/drivers/iio/dac/Makefile
> index 2a80bbf4e80a..1cb93e83d0eb 100644
> --- a/drivers/iio/dac/Makefile
> +++ b/drivers/iio/dac/Makefile
> @@ -51,6 +51,7 @@ obj-$(CONFIG_MAX517) +=3D max517.o
> =C2=A0obj-$(CONFIG_MAX22007) +=3D max22007.o
> =C2=A0obj-$(CONFIG_MAX5522) +=3D max5522.o
> =C2=A0obj-$(CONFIG_MAX5821) +=3D max5821.o
> +obj-$(CONFIG_MCF54415_DAC) +=3D mcf54415_dac.o
> =C2=A0obj-$(CONFIG_MCP4725) +=3D mcp4725.o
> =C2=A0obj-$(CONFIG_MCP4728) +=3D mcp4728.o
> =C2=A0obj-$(CONFIG_MCP47FEB02) +=3D mcp47feb02.o
> diff --git a/drivers/iio/dac/mcf54415_dac.c b/drivers/iio/dac/mcf54415_da=
c.c
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
> +
> +struct mcf54415_dac {
> +	struct clk *clk;
> +	struct device *dev;
> +	void __iomem *regs;
> +};
> +
> +static void mcf54415_dac_init(struct mcf54415_dac *info)
> +{
> +	int val;
> +
> +	/* Keeping defaults and enable DAC (bit 0 set to 0) */
> +	val =3D MCF54415_DAC_CR_FILT;
> +	val |=3D FIELD_PREP(MCF54415_DAC_CR_WMLVL, 1);
> +
> +	writew(val, info->regs + MCF54415_DAC_CR);
> +
> +	/* DAC is ready after 12us, from RM table 40-3=C2=A0 */
> +	fsleep(MCF54415_DAC_READY_US);
> +}
> +
> +static void mcf54415_dac_exit(void *data)
> +{
> +	struct mcf54415_dac *info =3D data;
> +	int val;
> +
> +	val =3D readw(info->regs + MCF54415_DAC_CR);
> +	val |=3D MCF54415_DAC_CR_PDN;
> +	writew(val, info->regs + MCF54415_DAC_CR);
> +}
> +
> +#define MCF54415_DAC_CHAN { \
> +	.type =3D IIO_VOLTAGE, \
> +	.output =3D 1, \
> +	.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW), \
> +	.info_mask_shared_by_type =3D BIT(IIO_CHAN_INFO_SCALE), \
> +}
> +
> +static const struct iio_chan_spec mcf54415_dac_iio_channels[] =3D {
> +	MCF54415_DAC_CHAN
> +};
> +
> +static int mcf54415_read_raw(struct iio_dev *indio_dev,
> +			struct iio_chan_spec const *chan,
> +			int *val, int *val2,
> +			long mask)
> +{
> +	struct mcf54415_dac *info =3D iio_priv(indio_dev);
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		*val =3D readw(info->regs + MCF54415_DAC_DATA);
> +		return IIO_VAL_INT;
> +	case IIO_CHAN_INFO_SCALE:
> +		/* Reference voltage as per ColdFire datasheet is 3.3V */
> +		*val =3D 3300 /* mV */;
> +		*val2 =3D 12;
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
> +	struct mcf54415_dac *info =3D iio_priv(indio_dev);
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		writew(val, info->regs + MCF54415_DAC_DATA);
> +		return 0;
> +

No need for the new line.

> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static const struct iio_info mcf54415_dac_iio_info =3D {
> +	.read_raw =3D &mcf54415_read_raw,
> +	.write_raw =3D &mcf54415_write_raw,
> +};
> +
> +static int mcf54415_dac_probe(struct platform_device *pdev)
> +{
> +	struct iio_dev *indio_dev;
> +	struct mcf54415_dac *info;
> +	int ret;
> +
> +	indio_dev =3D devm_iio_device_alloc(&pdev->dev,
> +					=C2=A0 sizeof(struct mcf54415_dac));

Slight preference for sizeof(*info)

> +	if (!indio_dev)
> +		return -ENOMEM;
> +
> +	info =3D iio_priv(indio_dev);
> +	info->dev =3D &pdev->dev;
> +
> +	info->regs =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(info->regs))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(info->regs),
> +				=C2=A0=C2=A0=C2=A0=C2=A0 "failed to get io regs\n");
> +
> +	info->clk =3D devm_clk_get_enabled(&pdev->dev, "dac");
> +	if (IS_ERR(info->clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(info->clk),
> +				=C2=A0=C2=A0=C2=A0=C2=A0 "failed getting clock\n");
> +
> +	platform_set_drvdata(pdev, indio_dev);
> +
>=20
> +	indio_dev->name =3D dev_name(&pdev->dev);

Just use "mcf54415".=20

> +	indio_dev->info =3D &mcf54415_dac_iio_info;
> +	indio_dev->modes =3D INDIO_DIRECT_MODE;
> +	indio_dev->channels =3D mcf54415_dac_iio_channels;
> +	indio_dev->num_channels =3D ARRAY_SIZE(mcf54415_dac_iio_channels);
> +
> +	mcf54415_dac_init(info);
> +
> +	ret =3D devm_add_action_or_reset(&pdev->dev, mcf54415_dac_exit, info);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D devm_iio_device_register(&pdev->dev, indio_dev);
> +	if (ret)
> +		dev_err(&pdev->dev, "couldn't register the device\n");
> +

I would just return devm_iio_device_register();

- Nuno S=C3=A1

