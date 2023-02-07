Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BEBDC636CC
	for <linux-m68k@archiver.kernel.org>; Tue,  7 Feb 2023 20:53:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbjBGUxU (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 7 Feb 2023 15:53:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbjBGUxQ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 7 Feb 2023 15:53:16 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CC5C3B661
        for <linux-m68k@lists.linux-m68k.org>; Tue,  7 Feb 2023 12:53:15 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id gr7so45908286ejb.5
        for <linux-m68k@lists.linux-m68k.org>; Tue, 07 Feb 2023 12:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YfKELKMAnQFkkEbZHEYEZttNxlmjlMVEh0XNdBoEsjw=;
        b=e1mwDgXaY5E6n859Lh8E/kA9NZHYyP0k8s2hCe1rVhBqfHpVx2nL0YTe0MZ/wz2muP
         sYRVk2PWCxOlDfKJiEYlUoBZl1Ac9dgZlGQUxRRsfo+TJ4hBpI5bJ6GGFt/iv7yZpRuV
         QJwv/W3L55N3/gC0OcYRYriT9MeJNabif8VtIjcuEG+Uk72Ib/UpIy3A4Wl21UycyGeV
         khphF77pzIvpuuNw3it4HAM5Bhbv+J+/cXG7jY1bIIVSkuk0pymjT4CR2+CXdZ7aILGi
         +dV8eymgVbI7VDVjM4FRnhr/cX1PTT27Ux51VwSTwf6Ea8dAeAkQ/9jIrMwF1hoVs8mR
         tT/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YfKELKMAnQFkkEbZHEYEZttNxlmjlMVEh0XNdBoEsjw=;
        b=TmQUESrN/GDr7RxS5/Wv0oxdMNiJI8sEnQNXfUKF9k5Hu52niKJw5fNf2RYWgFGfv/
         LoUZY6mZHh/4xtXC1nrIdf6Us3fZtdh1YJygg5o04CmPpTuzP+8H3S0kcf4ua9r6y1zW
         2Y8vWPGO3gvKconxPVTH3I09DCw+Mx4MKIwHcjZMIF2GgY+ANjcJnVtOebmcMiYCv+c4
         Zg8OWU0fHXmIZTm/H5tXfcjTJmhcflUDgXQlT3J/8GDf12Kpok5S8EgmXo3sq2DPjbbG
         CowRubqOGfu+V+/fc2MQmQenBOQMqt/FYiVEPhl5dyNPFq3mNSCql4OcQKWOlFzR+QWD
         umtg==
X-Gm-Message-State: AO0yUKVabHy7sZ2Ks5DivTZuVT8+dLz/aYzBgVCOVuQ8oTU/wuTtP3Lk
        fzalYA6aCFKwNWi8D75K/gY=
X-Google-Smtp-Source: AK7set8gSzfFyLFzaRMOX6lLIPCjFSzze6dgA1JenhwCC1vYAs7beQOSSrNlWqOlog2SIUGPkEcD0g==
X-Received: by 2002:a17:906:bc54:b0:8aa:d923:faf0 with SMTP id s20-20020a170906bc5400b008aad923faf0mr104030ejv.10.1675803193728;
        Tue, 07 Feb 2023 12:53:13 -0800 (PST)
Received: from localhost ([2001:b07:5d37:537d:cd23:cd6e:ae14:44fe])
        by smtp.gmail.com with ESMTPSA id g4-20020a170906348400b007add62dafbasm7323912ejb.157.2023.02.07.12.53.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 12:53:13 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Tue, 07 Feb 2023 20:53:09 +0000
Message-Id: <CQCMNHG923N3.3991UZTUP9WFA@vincent-arch>
From:   "Vincenzo Palazzo" <vincenzopalazzodev@gmail.com>
To:     "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "Arnd Bergmann" <arnd@arndb.de>,
        "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>,
        "Tony Lindgren" <tony@atomide.com>,
        "Thomas Gleixner" <tglx@linutronix.de>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
        "Geert Uytterhoeven" <geert@linux-m68k.org>,
        "Christophe Leroy" <christophe.leroy@csgroup.eu>,
        "Michael Ellerman" <mpe@ellerman.id.au>,
        "Devarsh Thakkar" <devarsht@ti.com>,
        "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
        "Stefan Schmidt" <stefan@datenfreihafen.org>,
        "Miquel Raynal" <miquel.raynal@bootlin.com>,
        <linux-gpio@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-doc-tw-discuss@lists.sourceforge.net>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
        <linux-m68k@lists.linux-m68k.org>, <linuxppc-dev@lists.ozlabs.org>,
        <linux-sh@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-wpan@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-wireless@vger.kernel.org>,
        <brcm80211-dev-list.pdl@broadcom.com>,
        <SHA-cyfmac-dev-list@infineon.com>, <linux-arch@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Cc:     "Bartosz Golaszewski" <brgl@bgdev.pl>,
        "Jonathan Corbet" <corbet@lwn.net>, "Alex Shi" <alexs@kernel.org>,
        "Yanteng Si" <siyanteng@loongson.cn>,
        "Hu Haowen" <src.res@email.cn>,
        "Russell King" <linux@armlinux.org.uk>,
        "Aaro Koskinen" <aaro.koskinen@iki.fi>,
        "Janusz Krzysztofik" <jmkrzyszt@gmail.com>,
        "Andrew Lunn" <andrew@lunn.ch>,
        "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
        "Gregory Clement" <gregory.clement@bootlin.com>,
        "Alim Akhtar" <alim.akhtar@samsung.com>,
        "Nicholas Piggin" <npiggin@gmail.com>,
        "Yoshinori Sato" <ysato@users.sourceforge.jp>,
        "Rich Felker" <dalias@libc.org>,
        "Mun Yew Tham" <mun.yew.tham@intel.com>,
        "Keerthy" <j-keerthy@ti.com>,
        "Mika Westerberg" <mika.westerberg@linux.intel.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        "Alexander Aring" <alex.aring@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        "Eric Dumazet" <edumazet@google.com>,
        "Jakub Kicinski" <kuba@kernel.org>,
        "Paolo Abeni" <pabeni@redhat.com>,
        "Arend van Spriel" <aspriel@gmail.com>,
        "Franky Lin" <franky.lin@broadcom.com>,
        "Hante Meuleman" <hante.meuleman@broadcom.com>,
        "Kalle Valo" <kvalo@kernel.org>, "Qiang Zhao" <qiang.zhao@nxp.com>,
        "Li Yang" <leoyang.li@nxp.com>, "Lee Jones" <lee@kernel.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Frank Rowand" <frowand.list@gmail.com>,
        "Geert Uytterhoeven" <geert+renesas@glider.be>
Subject: Re: [PATCH v3 01/12] gpiolib: remove empty asm/gpio.h files
References: <20230207142952.51844-1-andriy.shevchenko@linux.intel.com>
 <20230207142952.51844-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230207142952.51844-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

> From: Arnd Bergmann <arnd@arndb.de>
>
> The arm and sh versions of this file are identical to the generic
> versions and can just be removed.
>
> The drivers that actually use the sh3 specific version also include
> cpu/gpio.h directly, with the exception of magicpanelr2, which is
> easily fixed. This leaves coldfire as the only gpio driver
> that needs something custom for gpiolib.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
