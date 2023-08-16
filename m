Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25892C001B0
	for <linux-m68k@archiver.kernel.org>; Wed, 16 Aug 2023 08:08:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242723AbjHPIIT convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 16 Aug 2023 04:08:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242810AbjHPIIH (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 16 Aug 2023 04:08:07 -0400
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD34F2D4B
        for <linux-m68k@vger.kernel.org>; Wed, 16 Aug 2023 01:07:56 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-58c656824c1so10375437b3.1
        for <linux-m68k@vger.kernel.org>; Wed, 16 Aug 2023 01:07:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692173276; x=1692778076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cBo0Zg94fX0cGQqObKDDiR3fRyJfLGQoa0oOQU1KTbY=;
        b=dOH9h27LFb6Jjwc1d2k2rFZs0+jqCl1rqKxJxzn2FkoU8OB2jPX/ZxNYAqCWGxXPUd
         F0MW8wOxdSGH0QdLg4NFRXl+SxtyqqXjt8YTHnCSGQUpo6gjZ0c9SdcxulfHHNQGvRHc
         Ff7S+P0VwIfKr6ks/B0dBFKBY/Z1Aso7IazgAo59selNMcTHafst61YSB01OUYWRtBJ9
         q8x2jnCi/bKcqJWWPhFMamyYNz0c4n09dO87PQ2XyH6pfk4yjGjgikecoO8RJdqJQ5AQ
         YsInjl5AJzeu8pKb45VPLYURbZWePDtMceagi0lSHgpZMfsd/ByXYjKdLE++W23YZk7j
         wtgA==
X-Gm-Message-State: AOJu0Yysf73HV1baS0tV/Kw6lHMJTmcc2UED8Lqd0CjC8GNbaZMvKtjN
        bGNU9WqKkef8/DYgPmONOECHFq0AZfry1A==
X-Google-Smtp-Source: AGHT+IGA72GFCydoW3KuDH6sfEJX5Ih3fzqUWErIPxmnN3gdh8LuHWp6yqC/D/NMnEAPAOW9ZhZ7NQ==
X-Received: by 2002:a0d:ca87:0:b0:56f:ff55:2b7d with SMTP id m129-20020a0dca87000000b0056fff552b7dmr1662586ywd.17.1692173275735;
        Wed, 16 Aug 2023 01:07:55 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id j128-20020a819286000000b005773babc3cdsm3890554ywg.83.2023.08.16.01.07.55
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 01:07:55 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-d71f1bc5735so189682276.1
        for <linux-m68k@vger.kernel.org>; Wed, 16 Aug 2023 01:07:55 -0700 (PDT)
X-Received: by 2002:a25:2d1b:0:b0:c24:4536:1723 with SMTP id
 t27-20020a252d1b000000b00c2445361723mr2089346ybt.26.1692173274846; Wed, 16
 Aug 2023 01:07:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230815223212.13620-1-schmitzmic@gmail.com>
In-Reply-To: <20230815223212.13620-1-schmitzmic@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 16 Aug 2023 10:07:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVELQnd9RFvv3jApUpm9jd2vMYqJhZxVNZ4soBnYF_odA@mail.gmail.com>
Message-ID: <CAMuHMdVELQnd9RFvv3jApUpm9jd2vMYqJhZxVNZ4soBnYF_odA@mail.gmail.com>
Subject: Re: [PATCH RFC v3] m68k/q40: fix IO base selection for Q40 in pata_falcon.c
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     will@sowerbutts.com, linux-m68k@vger.kernel.org, rz@linux-m68k.org,
        Finn Thain <fthain@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Wed, Aug 16, 2023 at 12:32 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> With commit 44b1fbc0f5f3 ("m68k/q40: Replace q40ide driver
> with pata_falcon and falconide"), the Q40 IDE driver was
> replaced by pata_falcon.c (and the later obsoleted
> falconide.c).
>
> Both IO and memory resources were defined for the Q40 IDE
> platform device, but definition of the IDE register addresses
> was modeled after the Falcon case, both in use of the memory
> resources and in including register scale and byte vs. word
> offset in the address.
>
> This was correct for the Falcon case, which does not apply
> any address translation to the register addresses. In the
> Q40 case, all of device base address, byte access offset
> and register scaling is included in the platform specific
> ISA access translation (in asm/mm_io.h).
>
> As a consequence, such address translation gets applied
> twice, and register addresses are mangled.
>
> Use the device base address from the platform IO resource,
> and use standard register offsets from that base in order
> to calculate register addresses (the IO address translation
> will then apply the correct ISA window base and scaling).
>
> Encode PIO_OFFSET into IO port addresses for all registers
> except the data transfer register. Encode the MMIO offset
> there (pata_falcon_data_xfer() directly uses raw IO with
> no address translation).
>
> Add module parameter 'data_swap' to allow connecting drives
> with non-native data byte order. Drives selected by the
> data_swap bit mask will have their user data swapped to host
> byte order, i.e. 'pata_falcon.data_swap=2' will swap all user
> data on drive B, leaving data on drive A in native order.
>
> Reported-by: William R Sowerbutts <will@sowerbutts.com>
> Closes: https://lore.kernel.org/r/CAMuHMdUU62jjunJh9cqSqHT87B0H0A4udOOPs=WN7WZKpcagVA@mail.gmail.com
> Link: https://lore.kernel.org/r/CAMuHMdUU62jjunJh9cqSqHT87B0H0A4udOOPs=WN7WZKpcagVA@mail.gmail.com
> Fixes: 44b1fbc0f5f3 ("m68k/q40: Replace q40ide driver with pata_falcon and falconide")
> Cc: Finn Thain <fthain@linux-m68k.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

Thanks for your patch!

> --- a/drivers/ata/pata_falcon.c
> +++ b/drivers/ata/pata_falcon.c

> @@ -165,26 +178,61 @@ static int __init pata_falcon_init_one(struct platform_device *pdev)
>         ap->pio_mask = ATA_PIO4;
>         ap->flags |= ATA_FLAG_SLAVE_POSS | ATA_FLAG_NO_IORDY;
>
> -       base = (void __iomem *)base_mem_res->start;
> -       /* N.B. this assumes data_addr will be used for word-sized I/O only */
> -       ap->ioaddr.data_addr            = base + 0 + 0 * 4;
> -       ap->ioaddr.error_addr           = base + 1 + 1 * 4;
> -       ap->ioaddr.feature_addr         = base + 1 + 1 * 4;
> -       ap->ioaddr.nsect_addr           = base + 1 + 2 * 4;
> -       ap->ioaddr.lbal_addr            = base + 1 + 3 * 4;
> -       ap->ioaddr.lbam_addr            = base + 1 + 4 * 4;
> -       ap->ioaddr.lbah_addr            = base + 1 + 5 * 4;
> -       ap->ioaddr.device_addr          = base + 1 + 6 * 4;
> -       ap->ioaddr.status_addr          = base + 1 + 7 * 4;
> -       ap->ioaddr.command_addr         = base + 1 + 7 * 4;
> -
> -       base = (void __iomem *)ctl_mem_res->start;
> -       ap->ioaddr.altstatus_addr       = base + 1;
> -       ap->ioaddr.ctl_addr             = base + 1;
> -
> -       ata_port_desc(ap, "cmd 0x%lx ctl 0x%lx",
> -                     (unsigned long)base_mem_res->start,
> -                     (unsigned long)ctl_mem_res->start);
> +       priv = devm_kzalloc(&pdev->dev,
> +               sizeof(struct pata_falcon_priv), GFP_KERNEL);
> +

Please drop this blank line.

> +       if (!priv)
> +               return -ENOMEM;
> +
> +       ap->private_data = priv;
> +
> +       priv->swap_mask = pata_falcon_swap_mask;
> +       if (priv->swap_mask)
> +               priv->swap_data = 1;
> +
> +       if (MACH_IS_Q40) {

Please do not use MACH_IS_xx() checks in a modern platform driver.
The proper way is to either pass parameters through platform_data, or
to use a different platform driver name to match against (i.e. populate
platform_driver.id_table with an array containing name/driver_data
pairs).

However, here you can just use the presence or absence
of base_res and ctl_res (which were unused before) to distinguish.

> +               base = (void __iomem *)base_mem_res->start;

Any specific reason this is still using base_mem_res and not
base_res?

> +               ap->ioaddr.data_addr            = base + 0;

This is the same on Q40 and Falcon, so it can be factored out.

> +               base = (void __iomem *)base_res->start;
> +               ap->ioaddr.error_addr           = base + 0x10000 + 1;
> +               ap->ioaddr.feature_addr         = base + 0x10000 + 1;
> +               ap->ioaddr.nsect_addr           = base + 0x10000 + 2;
> +               ap->ioaddr.lbal_addr            = base + 0x10000 + 3;
> +               ap->ioaddr.lbam_addr            = base + 0x10000 + 4;
> +               ap->ioaddr.lbah_addr            = base + 0x10000 + 5;
> +               ap->ioaddr.device_addr          = base + 0x10000 + 6;
> +               ap->ioaddr.status_addr          = base + 0x10000 + 7;
> +               ap->ioaddr.command_addr         = base + 0x10000 + 7;

Compared to Falcon, different base, banksize, and regsize, so e.g.

    ap->ioaddr.error_addr = base + 1 * banksize + 1 * regsize;

> +
> +               base = (void __iomem *)ctl_res->start;
> +               ap->ioaddr.altstatus_addr       = base + 0x10000;
> +               ap->ioaddr.ctl_addr             = base + 0x10000;
> +
> +               ata_port_desc(ap, "cmd 0x%lx ctl 0x%lx",
> +                             (unsigned long)base_res->start,
> +                             (unsigned long)ctl_res->start);

%pa and e.g. &base_res->start to avoid the cast.

> +       } else {
> +               base = (void __iomem *)base_mem_res->start;
> +               /* N.B. this assumes data_addr will be used for word-sized I/O only */
> +               ap->ioaddr.data_addr            = base + 0 + 0 * 4;
> +               ap->ioaddr.error_addr           = base + 1 + 1 * 4;
> +               ap->ioaddr.feature_addr         = base + 1 + 1 * 4;
> +               ap->ioaddr.nsect_addr           = base + 1 + 2 * 4;
> +               ap->ioaddr.lbal_addr            = base + 1 + 3 * 4;
> +               ap->ioaddr.lbam_addr            = base + 1 + 4 * 4;
> +               ap->ioaddr.lbah_addr            = base + 1 + 5 * 4;
> +               ap->ioaddr.device_addr          = base + 1 + 6 * 4;
> +               ap->ioaddr.status_addr          = base + 1 + 7 * 4;
> +               ap->ioaddr.command_addr         = base + 1 + 7 * 4;
> +
> +               base = (void __iomem *)ctl_mem_res->start;
> +               ap->ioaddr.altstatus_addr       = base + 1;
> +               ap->ioaddr.ctl_addr             = base + 1;
> +
> +               ata_port_desc(ap, "cmd 0x%lx ctl 0x%lx",
> +                             (unsigned long)base_mem_res->start,
> +                             (unsigned long)ctl_mem_res->start);
> +       }
>
>         irq_res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
>         if (irq_res && irq_res->start > 0) {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
