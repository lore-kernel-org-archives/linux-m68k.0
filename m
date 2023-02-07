Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BB5DC636D3
	for <linux-m68k@archiver.kernel.org>; Tue,  7 Feb 2023 21:32:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbjBGVcK (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 7 Feb 2023 16:32:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjBGVcJ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 7 Feb 2023 16:32:09 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 856C41BAE0
        for <linux-m68k@lists.linux-m68k.org>; Tue,  7 Feb 2023 13:32:08 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id on9-20020a17090b1d0900b002300a96b358so122210pjb.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 07 Feb 2023 13:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cTC6wNmhItyMEElEpGFXa8WJ3XfORro4b70rdsps6o0=;
        b=GuPF+8GjCJo3Bv/FSUkP7V624DONZsgKRAdIrvRl2YyIiW7XhBxcLRwW8Dbo0WHo4/
         gWeBXiyd23u0JU/wn+dRPdA5GR3Arl6vuCtBwP4eLMHcMJntKln0jv/gQTivZoVGNy+L
         x1nk4o6lG7MxEj41ozS4hZTUa5kSmxJlczPFlhIY0Bev07KN3nsbYPWxgw04YqgRHXgM
         H1SJ9hnQNC6ymPwNiVfY2mJd0IFIMBAoGPlSP60M4+yIi6PNbW/2sgS38IoIq7PcwoUg
         h8Z1h5rI9akxItHMnNGQXqodMNTJCgkbn2Kl7ltL4NcRryTi+Ef6iT52cHPCW2iMqAVh
         7OFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTC6wNmhItyMEElEpGFXa8WJ3XfORro4b70rdsps6o0=;
        b=AK4UpPMdcnEdGjCKEiOSeAFj0s71Ttdw/uEnxaEWxOo7ye2P7sJZ+Ipxq6how11KPK
         d8fXX3cbOfOhPRHYlg3fq+VsUZr50ADoPscuj78QJvXHDFDuCp7XgPo0+2+/C7ToHMdA
         T6tbFLjCYo4mn1jCsaeQnuwd09rULBmZH8vnKnN1BIlwtD+YNjia8VSe75VrY8ySJXLN
         1jCiDGVJxaV/lI+gZLFZfZSGA2bepKMPNEsXVO9zEAqYqijEVWd3qPvH5MsV64zW4KPo
         ofiLIQfwMEtyQ73KoeTwGIDqd4mDQqquh8bqaw+8L2AECcUoXSLKPYx0Dejx1PG67SCF
         Ro+Q==
X-Gm-Message-State: AO0yUKUd1vI0craKYbRG3Fb9YmrI/5bVcoRlmlqe05L9TfapilrQfWwD
        /fd/Gi4iGmBmZ4g5yWzsPIE=
X-Google-Smtp-Source: AK7set8S733/lSzocO4PhiGH97JuaxlIu1uyBJfIu/+7WmPOF35HnmMyyKLJccnN1cXH8ZQnKFrByA==
X-Received: by 2002:a17:903:244f:b0:199:30a6:3756 with SMTP id l15-20020a170903244f00b0019930a63756mr3394795pls.18.1675805527758;
        Tue, 07 Feb 2023 13:32:07 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:c930:81ab:3aec:b9cb])
        by smtp.gmail.com with ESMTPSA id k5-20020a170902760500b00192d3e7eb8fsm9333284pll.252.2023.02.07.13.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 13:32:06 -0800 (PST)
Date:   Tue, 7 Feb 2023 13:32:01 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Devarsh Thakkar <devarsht@ti.com>,
        Stefan Schmidt <stefan@datenfreihafen.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-doc-tw-discuss@lists.sourceforge.net,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-input@vger.kernel.org,
        linux-media@vger.kernel.org, linux-wpan@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        brcm80211-dev-list.pdl@broadcom.com,
        SHA-cyfmac-dev-list@infineon.com, linux-arch@vger.kernel.org,
        devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Hu Haowen <src.res@email.cn>,
        Russell King <linux@armlinux.org.uk>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Mun Yew Tham <mun.yew.tham@intel.com>,
        Keerthy <j-keerthy@ti.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alexander Aring <alex.aring@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Arend van Spriel <aspriel@gmail.com>,
        Franky Lin <franky.lin@broadcom.com>,
        Hante Meuleman <hante.meuleman@broadcom.com>,
        Kalle Valo <kvalo@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
        Li Yang <leoyang.li@nxp.com>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v3 04/12] gpiolib: remove gpio_set_debounce
Message-ID: <Y+LDUTfKgHEJHNXB@google.com>
References: <20230207142952.51844-1-andriy.shevchenko@linux.intel.com>
 <20230207142952.51844-5-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230207142952.51844-5-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Feb 07, 2023 at 04:29:44PM +0200, Andy Shevchenko wrote:
> @@ -1010,14 +1009,21 @@ static int ads7846_setup_pendown(struct spi_device *spi,
>  		}
>  
>  		ts->gpio_pendown = pdata->gpio_pendown;
> -
> -		if (pdata->gpio_pendown_debounce)
> -			gpio_set_debounce(pdata->gpio_pendown,
> -					  pdata->gpio_pendown_debounce);

Can we please change only this to:

			gpiod_set_debounce(gpio_to_desc(pdata->gpio_pendown),
					   pdata->gpio_pendown_debounce);

and not change anything else (i.e. drop the changes below)?

>  	} else {
> -		dev_err(&spi->dev, "no get_pendown_state nor gpio_pendown?\n");
> -		return -EINVAL;
> +		struct gpio_desc *desc;
> +
> +		desc = devm_gpiod_get(&spi->dev, "pendown", GPIOD_IN);
> +		if (IS_ERR(desc)) {
> +			dev_err(&spi->dev, "no get_pendown_state nor gpio_pendown?\n");
> +			return PTR_ERR(desc);
> +		}
> +		gpiod_set_consumer_name(desc, "ads7846_pendown");
> +
> +		ts->gpio_pendown = desc_to_gpio(desc);
>  	}
> +	if (pdata->gpio_pendown_debounce)
> +		gpiod_set_debounce(gpio_to_desc(ts->gpio_pendown),
> +				   pdata->gpio_pendown_debounce);
>  
>  	return 0;

Thanks.

-- 
Dmitry
