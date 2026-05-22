Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57C43905E3
	for <linux-m68k@lists.linux-m68k.org>; Fri, 22 May 2026 21:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779484891; cv=none; b=gmT+bzovmkAIGW4A9/1DE5Cxw8rqbHTfkaKShMDirfQznDIPDF7hGf9ZVF3WwysfW947Wst9iRRBYDQMHHbHY6+1fmC97JHwBAe6Deu4vRJU9F+YSpjumFVcdevEJtBcOF7vAfDyVpgzHi3Nxx95RJXIquZxLTeZeO5wscYXN3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779484891; c=relaxed/simple;
	bh=WLSNcwjS85XUTVIVnfk6PHeDHlJ9JPI0RfKM5i7WEGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bw0fzm19PBNSyaFgpQE2hpYNRNeQMqRwK7CRw/T2afLXtP6M+jMbLowX76d1AVftWlBHaZDliNUC9+9gi6xZCcBEe/Q/DghAGrBflz+lJr2aUiLpu5zYrTGcUA9m9ulRLxTgvyexWYPp297xlm/dQ5WtPEvu60C9p+oPZju2HOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=etKsqLmM; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="etKsqLmM"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49040362e4aso18616545e9.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 22 May 2026 14:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779484888; x=1780089688; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hmpHbHCnLqaBqS7YTnlpPWtx373ftCx1XDJFmci1v5I=;
        b=etKsqLmMN1ROnR4HKKUuWemwnbKAwNKFby7b0LSyswkb6Hk8mgkK5xQb665c1hLBYv
         sUXgPHSAGrVkQebUoS60qmYqkCp7O20MG6nA2fAQpMELJyZJ6xUnoKUdrHsfRQVuyimz
         dvlSf0N7MLWvfroRywG7pZwQEfeD9vpPz5Vm+mJ2iZLnD7Nyl/D9LO/0oAd08em9S3j3
         tGU1hiqpWJNNYIcmmX8vnF7/MIc0plqzoutmhbat5vAmOBNEG9y79IVOd5kbdYbA5Nk7
         M8eKTBg/0O2NE0vr7VXo26OL20MWaltZBoGdxjbBc8koBaVTD2ch2s1+uKVzCnL19emK
         zckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779484888; x=1780089688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hmpHbHCnLqaBqS7YTnlpPWtx373ftCx1XDJFmci1v5I=;
        b=XIj+2gCIxpKRwj0turkZqo0dt1efirTYF75SwUqyrVSFxv8VE8MrSoFVkpd5a1/qfr
         W9DgSJGasWYGrJ6wLF0adz+1X3V93pUz5z2GByhUAb/JwkHtTbD7r+nE/bsgnOLW5e5z
         XKD66eYkMY3ufitWndRd5ZLUnLQRYVf/IYZrj8TST+x6EQRpi9/agPT44nXwac/BKBN+
         rE6ozv/MxUFSmUA31oltYAEv4QJRK157m9pzoj/mg8cf2nItBYsXZWT4v/OKAhAtuyGr
         L0cY7FaPJeKUKqldoRd568fvhEe2tqBXZjp7yIfAB0N8nbkCZkwow6EFjwi5dNp9xOHC
         1m6A==
X-Forwarded-Encrypted: i=1; AFNElJ88tjDVjjlX5S8QgJbaTMnnDyShdWeGD6UhOZX/gb13XLFTu8BC41HkiF9wqPxUp2eBbd5HBygoUooP@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yxcc91rOjSDN0yO1lKcK8t1Bgt/dE8TdJmTUfX6kwDNU5HgdENY
	tiD7ygcRGklt1ExOMvGUAiQ2F6UwhO0bDyjR3YzgftrJhlS3EY3qLT+qsSmlxgzBkC0=
X-Gm-Gg: Acq92OFAWSgxCtzxOdXFnt9mBuPpjxcKOkNZHSPwFJRHPj8fqrDvy1GAzIjx6JA+0MW
	eDP0e18KDSslKJVKxcW2gu4qqY67kuX1W1au5vVDJnRfM6va2W1D/aAtuFaOsVVDRwB2QQjUXOC
	IVZEeSVMLU3bOi1ce63mj9LvTSoVh+NBlSOEiZcs7Rh+hNNHckbHcGmsR2zCmKkhZJeuxMOwKQ/
	njxpiFQdg5ovSqLgxYRxcnILOIpgJI9wbVboasQwnkHy5ZkSi9gie15t6FhPEuBP24uu5IYBD/h
	mVDTVY7+xN+UZr0kuqjI/jE2t5XksS+1I06uYChktdC9yyYGDaUOJlNlLp4puaRH6xaj/t72G9H
	VQBLH/CApQqt5AvTxVl5isWFopZab1FPZp0/zZizLCj3Dcecgr/9NBjPX4uE6GaSa9XDsYcigGt
	1kiZZ1yCE7vruSrfOqP1VvRrL0L/zYpt0=
X-Received: by 2002:a05:600c:c0d2:10b0:490:33b3:4be0 with SMTP id 5b1f17b1804b1-490426c1759mr61888985e9.20.1779484888199;
        Fri, 22 May 2026 14:21:28 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b82sm73312225e9.9.2026.05.22.14.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 14:21:27 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Fri, 22 May 2026 23:20:39 +0200
Subject: [PATCH v3 11/11] iio: dac: add mcf54415 DAC
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-wip-stmark2-dac-v3-11-16be0ad35a67@baylibre.com>
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

Add basic version of mcf54415 DAC driver. DAC is embedded in the cpu and
DAC configuration registers are mapped in the internal IO address space.

The DAC accepts a 12-bit digital signal and creates a monotonic 12-bit
analog output varying from DAC_VREFL to DAC_VREFH. The DAC module
consists of a conversion unit, an output amplifier, and the associated
digital control blocks. Default register values for DAC_VREFL and DAC_VREFH
are respectively 0 and 0xfff, left untouched in this initial version.

This initial version of the driver is minimalistic, "output raw" only, to
be extended in the future. DMA and external sync are disabled, default mode
is high speed, default format is right-justified 12bit on 16bit word.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Changes in v2:
- remove tests from commit message, moved to patch 0
- remove additional blank lines
- remove dead code and unused definitions
- use regmap
- add limit check on raw write
- non functional style fixes
- add COMPILE_TEST to Kconfig
Changes in v3:
- add comments where needed
- code style changes
- remove unneeded variables
- use regmap_set_bits where possible
- remove macro not needed to define a single channel
- set up regmap to big_endian accesses for next patches that will come,
  that will adjust ColdFire readx/writex as standard LE (links in 0/x).
- add return value check on regmap calls
- sashiko: remove unneeded .io_port from regmap init.
- sashiko: add select REGMAP_MMIO in Kconfig
---
 drivers/iio/dac/Kconfig        |  11 +++
 drivers/iio/dac/Makefile       |   1 +
 drivers/iio/dac/mcf54415_dac.c | 207 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 219 insertions(+)

diff --git a/drivers/iio/dac/Kconfig b/drivers/iio/dac/Kconfig
index cd4870b65415..b1a578076188 100644
--- a/drivers/iio/dac/Kconfig
+++ b/drivers/iio/dac/Kconfig
@@ -516,6 +516,17 @@ config MAX5821
 	  Say yes here to build support for Maxim MAX5821
 	  10 bits DAC.
 
+config MCF54415_DAC
+	tristate "NXP MCF54415 DAC driver"
+	depends on M5441x || COMPILE_TEST
+	select REGMAP_MMIO
+	help
+	  Say yes here to build support for NXP MCF54415
+	  12bit DAC.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called mcf54415_dac.
+
 config MCP4725
 	tristate "MCP4725/6 DAC driver"
 	depends on I2C
diff --git a/drivers/iio/dac/Makefile b/drivers/iio/dac/Makefile
index 2a80bbf4e80a..1cb93e83d0eb 100644
--- a/drivers/iio/dac/Makefile
+++ b/drivers/iio/dac/Makefile
@@ -51,6 +51,7 @@ obj-$(CONFIG_MAX517) += max517.o
 obj-$(CONFIG_MAX22007) += max22007.o
 obj-$(CONFIG_MAX5522) += max5522.o
 obj-$(CONFIG_MAX5821) += max5821.o
+obj-$(CONFIG_MCF54415_DAC) += mcf54415_dac.o
 obj-$(CONFIG_MCP4725) += mcp4725.o
 obj-$(CONFIG_MCP4728) += mcp4728.o
 obj-$(CONFIG_MCP47FEB02) += mcp47feb02.o
diff --git a/drivers/iio/dac/mcf54415_dac.c b/drivers/iio/dac/mcf54415_dac.c
new file mode 100644
index 000000000000..c8c87572d43d
--- /dev/null
+++ b/drivers/iio/dac/mcf54415_dac.c
@@ -0,0 +1,207 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * NXP mcf54415 DAC driver
+ *
+ * Copyright 2026 BayLibre - adureghello@baylibre.com
+ */
+
+#include <linux/array_size.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/compiler_types.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <linux/iio/iio.h>
+
+#define MCF54415_DAC_CR			0x00
+#define MCF54415_DAC_CR_PDN		BIT(0)
+#define MCF54415_DAC_CR_HSLS		BIT(6)
+#define MCF54415_DAC_CR_WMLVL		GENMASK(9, 8)
+#define MCF54415_DAC_CR_FILT		BIT(12)
+
+#define MCF54415_DAC_DATA		0x02
+
+struct mcf54415_dac {
+	struct regmap *map;
+	struct clk *clk;
+};
+
+static const struct regmap_config mcf54415_dac_regmap_config = {
+	.reg_bits = 16,
+	.reg_stride = 2,
+	.val_bits = 16,
+	.max_register = 0x0c, /* DACX_FILTCNT,  R.M. Table 30-2 */
+	.val_format_endian = REGMAP_ENDIAN_BIG,
+	.reg_format_endian = REGMAP_ENDIAN_BIG,
+};
+
+static int mcf54415_dac_init(struct mcf54415_dac *info)
+{
+	int ret;
+
+	/* Keeping defaults and enable DAC (bit 0 set to 0) */
+	ret = regmap_write(info->map, MCF54415_DAC_CR, MCF54415_DAC_CR_FILT |
+			   FIELD_PREP(MCF54415_DAC_CR_WMLVL, 1));
+	if (ret)
+		return ret;
+
+	/* DAC is ready after 12us, from RM table 40-3  */
+	fsleep(12);
+
+	return 0;
+}
+
+static void mcf54415_dac_exit(void *data)
+{
+	struct mcf54415_dac *info = data;
+
+	regmap_set_bits(info->map, MCF54415_DAC_CR, MCF54415_DAC_CR_PDN);
+}
+
+static const struct iio_chan_spec mcf54415_dac_iio_channel = {
+	.type = IIO_VOLTAGE,
+	.output = 1,
+	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),
+	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),
+};
+
+static int mcf54415_read_raw(struct iio_dev *indio_dev,
+			     struct iio_chan_spec const *chan,
+			     int *val, int *val2, long mask)
+{
+	struct mcf54415_dac *info = iio_priv(indio_dev);
+	int ret;
+
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW:
+		ret = regmap_read(info->map, MCF54415_DAC_DATA, val);
+		if (ret)
+			return -EIO;
+		*val &= 0xfff;
+		return IIO_VAL_INT;
+	case IIO_CHAN_INFO_SCALE:
+		/* Reference voltage as per ColdFire datasheet is 3.3V */
+		*val = 3300 /* mV */;
+		*val2 = 12;
+		return IIO_VAL_FRACTIONAL_LOG2;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int mcf54415_write_raw(struct iio_dev *indio_dev,
+			      struct iio_chan_spec const *chan,
+			      int val, int val2, long mask)
+{
+	struct mcf54415_dac *info = iio_priv(indio_dev);
+
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW:
+		/* Check based on RM 30.3.2 (DACn_DATA) reg. resolution */
+		if (val < 0 || val > 4095)
+			return -EINVAL;
+		return regmap_write(info->map, MCF54415_DAC_DATA, val);
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct iio_info mcf54415_dac_iio_info = {
+	.read_raw = &mcf54415_read_raw,
+	.write_raw = &mcf54415_write_raw,
+};
+
+static int mcf54415_dac_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct iio_dev *indio_dev;
+	struct mcf54415_dac *info;
+	void __iomem *regs;
+	int ret;
+
+	indio_dev = devm_iio_device_alloc(dev, sizeof(*info));
+	if (!indio_dev)
+		return -ENOMEM;
+
+	info = iio_priv(indio_dev);
+
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return dev_err_probe(dev, PTR_ERR(regs),
+				     "failed to get io regs\n");
+
+	info->map = devm_regmap_init_mmio(dev, regs,
+					  &mcf54415_dac_regmap_config);
+	if (IS_ERR(info->map))
+		return PTR_ERR(info->map);
+
+	info->clk = devm_clk_get_enabled(dev, "dac");
+	if (IS_ERR(info->clk))
+		return dev_err_probe(dev, PTR_ERR(info->clk),
+				     "failed getting clock\n");
+
+	platform_set_drvdata(pdev, indio_dev);
+
+	indio_dev->name = "mcf54415";
+	indio_dev->info = &mcf54415_dac_iio_info;
+	indio_dev->modes = INDIO_DIRECT_MODE;
+	indio_dev->channels = &mcf54415_dac_iio_channel;
+	indio_dev->num_channels = 1;
+
+	ret = mcf54415_dac_init(info);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, mcf54415_dac_exit, info);
+	if (ret)
+		return ret;
+
+	return devm_iio_device_register(dev, indio_dev);
+}
+
+static int mcf54415_dac_suspend(struct device *dev)
+{
+	struct mcf54415_dac *info = iio_priv(dev_get_drvdata(dev));
+
+	mcf54415_dac_exit(info);
+	clk_disable_unprepare(info->clk);
+
+	return 0;
+}
+
+static int mcf54415_dac_resume(struct device *dev)
+{
+	struct mcf54415_dac *info = iio_priv(dev_get_drvdata(dev));
+	int ret;
+
+	ret = clk_prepare_enable(info->clk);
+	if (ret)
+		return ret;
+
+	mcf54415_dac_init(info);
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(mcf54415_dac_pm_ops,
+				mcf54415_dac_suspend, mcf54415_dac_resume);
+
+static struct platform_driver mcf54415_dac_driver = {
+	.probe = mcf54415_dac_probe,
+	.driver = {
+		.name = "mcf54415_dac",
+		.pm = pm_sleep_ptr(&mcf54415_dac_pm_ops),
+	},
+};
+module_platform_driver(mcf54415_dac_driver);
+
+MODULE_AUTHOR("Angelo Dureghello <angelo@kernel-space.org>");
+MODULE_DESCRIPTION("NXP MCF54415 DAC driver");
+MODULE_LICENSE("GPL");

-- 
2.54.0

