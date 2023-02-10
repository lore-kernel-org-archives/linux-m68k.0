Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9E7BC05027
	for <linux-m68k@archiver.kernel.org>; Fri, 10 Feb 2023 00:30:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbjBJAak (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 9 Feb 2023 19:30:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229768AbjBJAaj (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 9 Feb 2023 19:30:39 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B442EA5D5
        for <linux-m68k@lists.linux-m68k.org>; Thu,  9 Feb 2023 16:30:37 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id v3so2484124pfn.6
        for <linux-m68k@lists.linux-m68k.org>; Thu, 09 Feb 2023 16:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j/k0erUD/kDhxh7/K7OwX/bqJpwb0bJwB0iaNCFMZK4=;
        b=m45PZQvJM/hD/Xj9vlTDu7tBQyIzoAKV+Ug121N7xEPFN7JnwalygRfN9Deee662VD
         1QVbr7FN2GjKS80HHKfM2VRvvS5Vumhqz4Q+X5SC3+HRHqlG8a7QYMW60YZ5vMmXuVWT
         Whj682Dxwd3DP/j9rmnilydYjFYDO78yDRgj3f2c7t5Yh9pLdW/rRTvgu6ytHpVWH4Bp
         WyfwWCyWVkyOkZzxzrnyvN21unxPk7gjxu9VkavwgK4rgme7Roz1XT+g6ILjuGTvn1Ca
         djNyiDLTeCH+LIzJyxsFu0Lca5uXhw3bVHkTtzSaYa2Z8GkE/XD13cpHeodi0b9EwBno
         w3Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j/k0erUD/kDhxh7/K7OwX/bqJpwb0bJwB0iaNCFMZK4=;
        b=1ORMbEuM693MBUSzJfseJjYnp0uvJMe1pjVSozejonaI7/x45OutApkSVb3rSoP/BK
         ros1ZHJpDOgDpnS9iKV08Yal7BbnyA9V3ouwp0TsmSvUKffplwcs9NQ/9biPeZhQ5Htx
         3Y8rjISoQGRqdw3iZoubcesSrlh/sNPDOK7qMcqUb+vgPn2YQ3EjKSgDVHOR5TfBEM5v
         2jqNPJDP0LoEdRWdIjE/UnScoYH2s9JI69/LTOV7Xa6DEOXzeZ4+3mPq3vK1XnJSt9MC
         Tjs0PEatRUQOVpmOTOAIzBGDDqjTBDOWm5al/6CjySOX1Ye5UOcRVuGjtdvL3pF9UaG0
         NqOQ==
X-Gm-Message-State: AO0yUKXNDxdxm8QcwQF2cqLh8630jVqoiU7LM7RC8nTenIjBIhEUdstE
        +0dznjhotdoJAteWf9XyOxc=
X-Google-Smtp-Source: AK7set8J843VCb5Swh1of6p2yfW1raUVGGmO4Q3S+xAJAvwl45nss0avFGNhPNql2c/P0j9nxUjhIg==
X-Received: by 2002:aa7:9e42:0:b0:5a8:5424:d13a with SMTP id z2-20020aa79e42000000b005a85424d13amr3990100pfq.11.1675989036714;
        Thu, 09 Feb 2023 16:30:36 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:4b3d:5db5:694e:89d0])
        by smtp.gmail.com with ESMTPSA id e24-20020aa78c58000000b005815217e665sm392161pfd.65.2023.02.09.16.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 16:30:35 -0800 (PST)
Date:   Thu, 9 Feb 2023 16:30:29 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Vincenzo Palazzo <vincenzopalazzodev@gmail.com>,
        Devarsh Thakkar <devarsht@ti.com>,
        Michael Walle <michael@walle.cc>,
        Dipen Patel <dipenp@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Stefan Schmidt <stefan@datenfreihafen.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Lee Jones <lee@kernel.org>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc-tw-discuss@lists.sourceforge.net,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-input@vger.kernel.org, linux-media@vger.kernel.org,
        linux-wpan@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org,
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
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
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
        Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v4 08/18] gpiolib: remove gpio_set_debounce()
Message-ID: <Y+WQJTsdeZeAEs/S@google.com>
References: <20230208173343.37582-1-andriy.shevchenko@linux.intel.com>
 <20230208173343.37582-9-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208173343.37582-9-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Feb 08, 2023 at 07:33:33PM +0200, Andy Shevchenko wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> gpio_set_debounce() only has a single user, which is trivially
> converted to gpiod_set_debounce().
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry
