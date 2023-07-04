Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 103C9EB64D9
	for <linux-m68k@archiver.kernel.org>; Tue,  4 Jul 2023 08:10:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbjGDIKK convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 4 Jul 2023 04:10:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230389AbjGDIKH (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 4 Jul 2023 04:10:07 -0400
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81B4EE5F
        for <linux-m68k@lists.linux-m68k.org>; Tue,  4 Jul 2023 01:10:02 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5701e8f2b79so62417527b3.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 04 Jul 2023 01:10:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688458201; x=1691050201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EZaghZGIezMc1/PkmeAtxZOh9fnJXXLlPyB7qIylXMg=;
        b=H7ih+elz/dSVRlBmzFLagsKOEhh1xt8a2jCCOZYbBGN0FRjZFdgxeFLpMDpFHSanZm
         1+GAFuvsvV91/5ElnwJ6zJzgd54bux9E22oKMG15QHA90cwkR2Qbr1iXW98tmXOgthM/
         wEXki0D68RSLHkcvJGaNe9OvVXZPAH8C4np5Cc24oW5+IwxiFVZPbDpTywb1UnBwcmXH
         xcJESEVZanO/VvB0493WCi3XxlQnzbfgMqzcEyIMTyAlVbW0u6cre++a7X31A9EAopOd
         zEQbZbhveE8G3mkcQTfnRHPnZVVamKuMLs+mkpwYI71I6DQOq7Takp988bvsRqV4EnCy
         RrTg==
X-Gm-Message-State: ABy/qLY8ZmoSKrnMQbZFbyrf6A4wR1L3qi4pA3zwsubUbr+emCyjmz3X
        Iz8yJMRKSdkgNtGR+f2mTObGl9iYvoxNww==
X-Google-Smtp-Source: APBJJlGTaDhw7UcWKqfxbz9z227WIBpE6Z3x5pXTfK1cJEUhBnBCIBAKdOMEeRlvT0A9HWdgdRsO7w==
X-Received: by 2002:a0d:e84d:0:b0:570:8856:5dbc with SMTP id r74-20020a0de84d000000b0057088565dbcmr13475564ywe.41.1688458201322;
        Tue, 04 Jul 2023 01:10:01 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id d19-20020a0ddb13000000b005732b228a83sm5434749ywe.140.2023.07.04.01.10.01
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 01:10:01 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-c15a5ed884dso6000260276.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 04 Jul 2023 01:10:01 -0700 (PDT)
X-Received: by 2002:a25:ad18:0:b0:c12:179f:b78e with SMTP id
 y24-20020a25ad18000000b00c12179fb78emr11890369ybi.28.1688458200854; Tue, 04
 Jul 2023 01:10:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230522105049.1467313-1-schnelle@linux.ibm.com> <20230522105049.1467313-4-schnelle@linux.ibm.com>
In-Reply-To: <20230522105049.1467313-4-schnelle@linux.ibm.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 4 Jul 2023 10:09:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXBgh8NTBmZkqoR+ZZM=C=bREVM1KCk4xNC-4BWjSAHOw@mail.gmail.com>
Message-ID: <CAMuHMdXBgh8NTBmZkqoR+ZZM=C=bREVM1KCk4xNC-4BWjSAHOw@mail.gmail.com>
Subject: Re: [PATCH v5 03/44] char: add HAS_IOPORT dependencies
To:     Niklas Schnelle <schnelle@linux.ibm.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-pci@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Niklas,

On Mon, May 22, 2023 at 12:51 PM Niklas Schnelle <schnelle@linux.ibm.com> wrote:
> In a future patch HAS_IOPORT=n will result in inb()/outb() and friends
> not being declared. We thus need to add HAS_IOPORT as dependency for
> those drivers using them.
>
> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>

Thanks for your patch, which is now commit 1fbb0b203574bb16 ("char:
add HAS_IOPORT dependencies") upstream.

> --- a/drivers/char/Kconfig
> +++ b/drivers/char/Kconfig

> @@ -340,7 +341,7 @@ config NVRAM
>
>  config DEVPORT
>         bool "/dev/port character device"
> -       depends on ISA || PCI
> +       depends on HAS_IOPORT
>         default y
>         help
>           Say Y here if you want to support the /dev/port device. The /dev/port

FTR, this change makes DEVPORT show up on Atari with ATARI_ROM_ISA=y.
I guess it doesn't matter much, though.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
