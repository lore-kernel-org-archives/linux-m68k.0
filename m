Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E98519CCFD
	for <linux-m68k@lists.linux-m68k.org>; Mon, 10 Nov 2025 08:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762762529; cv=none; b=r6dnPu8IXhPNaDQItC/BA/hovo8jzr2Wj6A120Vn8bG47YKH0ntrLajuIZvhbB91PUyN3a1Qnj91suCSoQdgWqqdupv9+NgSFnEnLjSj5ePUJzey1aB1Inhw8USH5H6/GMD+IGzUfkF6w+jy4fuwfnnurY8OKrPrt4llIcCBsD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762762529; c=relaxed/simple;
	bh=0IoT4ilGrJkMrpqNcFCGUzEh7/+yoZb8/QXVGlKBPVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h9gV3WUCunG2WQ/rurqEVThlhB8xvsrlzJ6zf/bCoNhjRf1hdMf3cmfFz5eqD9JTPFKukAyL0MeJJMQ91+WY111OHOZNcpHihoYk8YLarbeZwh9jYI2u3Oeqc6Zs3dbG80eV/+DBjGuq2NL68ch/P7bxb9yn0qATleARRV87YOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-93725308c15so1018816241.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 10 Nov 2025 00:15:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762762525; x=1763367325;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oLRDHES8x7hy2Cq6bFhMakeR+ZtfEVkHELo4BsFny2w=;
        b=uZbXCaa79sXmALjR+hnU5h9wZX8EFrzvvrgq5cc6IDM99LbIYxErAC+UT7MyY57UOM
         e6DV8IWwknrKm7ueVkKQ/Z9nvErzcpffXNRfCqoCX9hTtlR5zG9MyYkJUUJKZqCKHJtE
         obEp4J1VOw4JwAZVW34yJRqjPAk77U2p4tzLspw1MYUDVuINRRuMXtiKMOUUYdJt1WLY
         eZOsJEHmxVWfcqolxLZTcifxci9UWTnkJegRxDebz1UUgkDmU3oBrpj3HMSyiRCyKFdj
         SpzZt0hOhH4Si/BEkK1g8oT31Eg9cLwZPTnvPT3YPAU72DI8F/se5rxO7Cp4fFXBpJUg
         2Zbg==
X-Forwarded-Encrypted: i=1; AJvYcCXAPZXIo8bG+DUAgSsjLEUbtcuiZAe1yHjTQrA+KP3XC8XHX0PyPNIDmc5Q4X7Wi13D3CYKCVU/dne5@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YycW07w81V4HO2HaCix4BhFViJGgcGnb1vQuJdbFHixn86KnY/m
	1K33/k5xYuKh7sRgio+M6xYJ6GehRv8bZmsBR7N/X1n/PXuJv8WsG5HpTaW5+Vfp
X-Gm-Gg: ASbGncsPTtnZG/ILuXu6gIOj/p+38w8wGSscok3lXy9TrovDnoCnshZfP/eMesYp/vJ
	ACjlYqoh6yOi9dlerSjZ7Ta9HWkAmmC91AfOwauAPq9F7Upffcv++gkaB9qPl9aLOiG8xnbY5N8
	DFQT/3LQ0wWzLoa2iM/V7a60YP40UrSYMYwYkIt9kzb+IxOYJbuYL1M5L1Oi3wZLApAHt5CHsVk
	N5teAxu09kjzdDTXJlqEFo4LN6Cx10qotzQanNJNBfX+EUoPSF52ssfY8B7cYDJGBi8w7xkJaLR
	m6t9O6txHvFGw7HkUo82HwasFnaxjk8/K1o1Z+CvuzG4BqbZvxPIVjuzBUjddAfxs7up+ghMVuF
	qTnYDs57fU3/4bvSem3ixqe7HtkS89drrAxUqsf6krej1hVYl8qUKK0occelCSRAVoajj5d5qSe
	0D+zdANpMW0JG8OAsnsCgEBSGXYPr7MCoRYA3Wz9uUQ39TWgIu+QTB
X-Google-Smtp-Source: AGHT+IEP2t9OKGsXQjxFBKfZZBGNSJ1PP7HgP7ojCFkC/Em3iQnvc49gFCtNR4VEqCLztHm/XoiHlA==
X-Received: by 2002:a05:6102:3046:b0:5d5:f6ae:3903 with SMTP id ada2fe7eead31-5ddb9e0838dmr3810050137.20.1762762524951;
        Mon, 10 Nov 2025 00:15:24 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-937257b239bsm2606974241.16.2025.11.10.00.15.22
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 00:15:23 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-93725308c15so1018800241.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 10 Nov 2025 00:15:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW9awFtl7o81f5119R1GMkgCsuemhUsmNYdp0H83eD8QZB03U6w4i4rWBJ1kRpY8X4+y8g3kiKkBqKe@lists.linux-m68k.org
X-Received: by 2002:a05:6102:c8e:b0:5db:e179:1c2f with SMTP id
 ada2fe7eead31-5ddb9e00ddbmr3016566137.18.1762762522544; Mon, 10 Nov 2025
 00:15:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107-b4-m5441x-add-rng-support-v2-0-f91d685832b9@yoseli.org> <20251107-b4-m5441x-add-rng-support-v2-2-f91d685832b9@yoseli.org>
In-Reply-To: <20251107-b4-m5441x-add-rng-support-v2-2-f91d685832b9@yoseli.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Nov 2025 09:15:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWL76hY-Pv30ooSM1J6XkVWbRXSLTDCjfpPOvhFN4tKyA@mail.gmail.com>
X-Gm-Features: AWmQ_bkP3DEy9lbUQUJXmebZYXL_ADR8ol219vUzw9saT-bIiR6N27eoovxyIr8
Message-ID: <CAMuHMdWL76hY-Pv30ooSM1J6XkVWbRXSLTDCjfpPOvhFN4tKyA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] m68k: coldfire: Add RNG support for MCF54418
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>, Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Jean-Michel,

On Fri, 7 Nov 2025 at 11:29, Jean-Michel Hautbois
<jeanmichel.hautbois@yoseli.org> wrote:
> Add platform device support for the MCF54418 RNGB hardware with clock
> enabled at platform initialization.
>
> The imx-rngc driver now uses devm_clk_get_optional() to support both
> Coldfire (always-on clock) and i.MX platforms (managed clock).
>
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>

Thanks for your patch!

> --- a/drivers/char/hw_random/Kconfig
> +++ b/drivers/char/hw_random/Kconfig
> @@ -270,12 +270,13 @@ config HW_RANDOM_MXC_RNGA
>  config HW_RANDOM_IMX_RNGC
>         tristate "Freescale i.MX RNGC Random Number Generator"
>         depends on HAS_IOMEM
> -       depends on SOC_IMX25 || SOC_IMX6SL || SOC_IMX6SLL || SOC_IMX6UL || COMPILE_TEST
> +       depends on SOC_IMX25 || SOC_IMX6SL || SOC_IMX6SLL || SOC_IMX6UL || M5441x || COMPILE_TEST

Is the same RNG present in other Coldfire SoCs?

>         default HW_RANDOM
>         help
>           This driver provides kernel-side support for the Random Number
>           Generator Version C hardware found on some Freescale i.MX
>           processors. Version B is also supported by this driver.
> +         Also supports RNGB on Freescale MCF54418 (Coldfire V4e).
>
>           To compile this driver as a module, choose M here: the
>           module will be called imx-rngc.
> diff --git a/drivers/char/hw_random/imx-rngc.c b/drivers/char/hw_random/imx-rngc.c
> index 241664a9b5d9ac7244f15cbe5d5302ca3787ebea..44f20a05de0a425cb6ff7b2a347b111750ac3702 100644
> --- a/drivers/char/hw_random/imx-rngc.c
> +++ b/drivers/char/hw_random/imx-rngc.c
> @@ -353,12 +353,19 @@ static const struct of_device_id imx_rngc_dt_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(of, imx_rngc_dt_ids);
>
> +static const struct platform_device_id imx_rngc_devtype[] = {
> +       { .name = "imx-rngc" },

I believe this is identical to KBUILD_MODNAME, so the .name below
should be sufficient for binding?

> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(platform, imx_rngc_devtype);

Or do you need this mainly for the addition of MODULE_DEVICE_TABLE(),
i.e. the module is not auto-loaded based on just KBUILD_MODNAME?

> +
>  static struct platform_driver imx_rngc_driver = {
>         .driver = {
>                 .name = KBUILD_MODNAME,
                  ^^^^^^^^^^^^^^^^^^^^^^^

>                 .pm = pm_ptr(&imx_rngc_pm_ops),
>                 .of_match_table = imx_rngc_dt_ids,
>         },
> +       .id_table = imx_rngc_devtype,
>  };
>
>  module_platform_driver_probe(imx_rngc_driver, imx_rngc_probe);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
