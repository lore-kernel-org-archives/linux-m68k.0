Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FCE2C433EF
	for <linux-m68k@archiver.kernel.org>; Tue, 28 Jun 2022 07:24:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242368AbiF1HYC (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 28 Jun 2022 03:24:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242305AbiF1HYA (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 28 Jun 2022 03:24:00 -0400
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0AEF2CDCB
        for <linux-m68k@lists.linux-m68k.org>; Tue, 28 Jun 2022 00:23:59 -0700 (PDT)
Received: by mail-qk1-f181.google.com with SMTP id r138so8926305qke.13
        for <linux-m68k@lists.linux-m68k.org>; Tue, 28 Jun 2022 00:23:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k2rxzJ0m2+KTfhV/auXcP+l+48yjXUELQK7ZtTv6xyU=;
        b=eA6oc2g3hVebEnwVi5PPYYBNMKZACGAgtMGgcaYDm3y37ATYs0LxC58s7iR0PqjRU6
         ji7vKT/xt9cR+JfqDMRHgMuJ02UjQXyf6Fqd7PL5CgKVIjyQMxPojkwopAp6n5V5Sdmo
         +8Ihb5FLnAZ/6H/UojWG8XTSjnDVwMMb3q97FUwKsUyA9UQ4fG26+6GEd9dZvZYGNQrX
         j2v6XlJxeD2BT11dBQFSkwoKGO/UxW5Ufjgw4WW5jC0ArWA+bgAVa2exImVZ0hceQhQt
         67qvLdv3iWVAGM0ID2Kzl/Nq47an2UJUUKWs4811xdheqY/xabA0pCEzCyH8mJ5FO/Qa
         afqQ==
X-Gm-Message-State: AJIora/Vwo+w71IISDSw0x+JGuc/e9cXhjLTkhwd++y/Y1habsOEi64O
        KAHDsmYbiOgWBrm78/tB0Mcc6D/s2spjiA==
X-Google-Smtp-Source: AGRyM1uE7PfjvtUTr2Jw1B317xMspVTYeDt1nkfMl55HpdzOFA0sECA1RwoRsjF7G5ZBrOsA8afKIA==
X-Received: by 2002:a05:620a:112a:b0:6af:1bb9:fb91 with SMTP id p10-20020a05620a112a00b006af1bb9fb91mr7818861qkk.229.1656401038837;
        Tue, 28 Jun 2022 00:23:58 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id m187-20020a37a3c4000000b006a75a8fd54asm10162528qke.84.2022.06.28.00.23.58
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jun 2022 00:23:58 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-2ef5380669cso107387237b3.9
        for <linux-m68k@lists.linux-m68k.org>; Tue, 28 Jun 2022 00:23:58 -0700 (PDT)
X-Received: by 2002:a81:a092:0:b0:318:5c89:a935 with SMTP id
 x140-20020a81a092000000b003185c89a935mr20749995ywg.383.1656401038063; Tue, 28
 Jun 2022 00:23:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220628021802.4102976-1-yangyingliang@huawei.com>
In-Reply-To: <20220628021802.4102976-1-yangyingliang@huawei.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 28 Jun 2022 09:23:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVjtSk9DX9_OpZfma4RuU7yfz==1C6NOPy7ZmecsyYiuQ@mail.gmail.com>
Message-ID: <CAMuHMdVjtSk9DX9_OpZfma4RuU7yfz==1C6NOPy7ZmecsyYiuQ@mail.gmail.com>
Subject: Re: [PATCH -next] m68k: virt: platform: fix missing
 platform_device_unregister() on error in virt_platform_init()
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Yang,

On Tue, Jun 28, 2022 at 4:08 AM Yang Yingliang <yangyingliang@huawei.com> wrote:
> Add the missing platform_device_unregister() before return
> from virt_platform_init() in the error handling case.
>
> Fixes: 05d51e42df06 ("m68k: Introduce a virtual m68k machine")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Thanks for your patch!

> --- a/arch/m68k/virt/platform.c
> +++ b/arch/m68k/virt/platform.c
> @@ -35,8 +30,10 @@ static int __init virt_platform_init(void)
>                 DEFINE_RES_MEM(virt_bi_data.rtc.mmio + 0x1000, 0x1000),
>                 DEFINE_RES_IRQ(virt_bi_data.rtc.irq + 1),
>         };
> -       struct platform_device *pdev;
> +       struct platform_device *pdev1, *pdev2;
> +       struct platform_device *pdevs[VIRTIO_BUS_NB];
>         unsigned int i;
> +       int ret = 0;
>
>         if (!MACH_IS_VIRT)
>                 return -ENODEV;
> @@ -44,29 +41,40 @@ static int __init virt_platform_init(void)
>         /* We need this to have DMA'able memory provided to goldfish-tty */
>         min_low_pfn = 0;
>
> -       pdev = platform_device_register_simple("goldfish_tty",
> -                                              PLATFORM_DEVID_NONE,
> -                                              goldfish_tty_res,
> -                                              ARRAY_SIZE(goldfish_tty_res));
> -       if (IS_ERR(pdev))
> -               return PTR_ERR(pdev);
> +       pdev1 = platform_device_register_simple("goldfish_tty",
> +                                               PLATFORM_DEVID_NONE,
> +                                               goldfish_tty_res,
> +                                               ARRAY_SIZE(goldfish_tty_res));
> +       if (IS_ERR(pdev1))
> +               return PTR_ERR(pdev1);
>
> -       pdev = platform_device_register_simple("goldfish_rtc",
> -                                              PLATFORM_DEVID_NONE,
> -                                              goldfish_rtc_res,
> -                                              ARRAY_SIZE(goldfish_rtc_res));
> -       if (IS_ERR(pdev))
> -               return PTR_ERR(pdev);
> +       pdev2 = platform_device_register_simple("goldfish_rtc",
> +                                               PLATFORM_DEVID_NONE,
> +                                               goldfish_rtc_res,
> +                                               ARRAY_SIZE(goldfish_rtc_res));
> +       if (IS_ERR(pdev2)) {
> +               ret = PTR_ERR(pdev2);
> +               goto err_unregister_tty;
> +       }
>
>         for (i = 0; i < VIRTIO_BUS_NB; i++) {
> -               int err;
> -
> -               err = virt_virtio_init(i);
> -               if (err)
> -                       return err;
> +               pdevs[i] = virt_virtio_init(i);
> +               if (IS_ERR(pdevs[i])) {
> +                       ret = PTR_ERR(pdevs[i]);
> +                       goto err_unregister_rtc_virtio;
> +               }
>         }
>
>         return 0;
> +
> +err_unregister_rtc_virtio:
> +       for (--i; (int)i >= 0; i--)
> +               platform_device_unregister(pdevs[i]);

I think you can easily avoid the cast ("casts are evil"):

    while (i > 0)
            platform_device_unregister(pdevs[--i]);

> +       platform_device_unregister(pdev2);
> +err_unregister_tty:
> +       platform_device_unregister(pdev1);
> +
> +       return ret;
>  }
>
>  arch_initcall(virt_platform_init);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
