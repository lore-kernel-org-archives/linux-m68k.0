Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B834EB64DD
	for <linux-m68k@archiver.kernel.org>; Thu, 17 Aug 2023 11:49:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239908AbjHQLtA convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 17 Aug 2023 07:49:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350517AbjHQLs5 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 17 Aug 2023 07:48:57 -0400
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBF39270C
        for <linux-m68k@vger.kernel.org>; Thu, 17 Aug 2023 04:48:09 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-58c5642701fso30272917b3.0
        for <linux-m68k@vger.kernel.org>; Thu, 17 Aug 2023 04:48:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692272889; x=1692877689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=puIyQL++QvIRbNJw4nwgjt+iVhlYp32qjok3YJX2vQ8=;
        b=cNdvIn1xrXDUuveWUtr+rDbxPqPdGeCwZ/6rq/9esKzfSP7FoRVVTQSP2SHXXTh+pB
         Z3YbAUZI/VeFU1rsMfpDENd7KKQrLOPgMFU0MMdrScxkuAMtUdLoVr1Xb/HIdjLmS8Ik
         JH7xvMDDbug5bhaJeFURSGDRhTJ1pblSNJfT9KrRPq+sfuiPSDdVz3ibr8B3JlhgCvQO
         ar/c3tgsf7EMkbSA2xZboeyDOwK6EsJVEOZj3EbNpOwctJuLv7BWJ8h3lPKtVCKRceGA
         PN4DQGbmNQ//8BO1W0aDi0efJIEhCh0VtQkvxsYDhZKMNMFPIAp+8SAnZjw9X+diYGGz
         L7cQ==
X-Gm-Message-State: AOJu0YzCqw5QTAJiRYKu+zzCNaQBJ4/xOPEjrqk2YHdqcYO9rYbu2yXP
        jUVkMjEk0ORbkIrEaXCkdbD3jZHpesjXwA==
X-Google-Smtp-Source: AGHT+IGjZhkLDULCkb2M0lpnwY/6q+Fx+W6XXqjLWh99S1YXR5oNh1PWjMzQMViSIOOrssQqPM9img==
X-Received: by 2002:a81:a542:0:b0:573:8567:3bdd with SMTP id v2-20020a81a542000000b0057385673bddmr4867524ywg.23.1692272888830;
        Thu, 17 Aug 2023 04:48:08 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id d6-20020a0ddb06000000b00583cf4ed41esm4546378ywe.2.2023.08.17.04.48.08
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Aug 2023 04:48:08 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-d665467e134so6533802276.2
        for <linux-m68k@vger.kernel.org>; Thu, 17 Aug 2023 04:48:08 -0700 (PDT)
X-Received: by 2002:a25:748e:0:b0:d06:f0ab:e17b with SMTP id
 p136-20020a25748e000000b00d06f0abe17bmr4841428ybc.55.1692272888100; Thu, 17
 Aug 2023 04:48:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230817035001.8400-1-schmitzmic@gmail.com> <20230817035001.8400-3-schmitzmic@gmail.com>
 <f604a8f6-6203-84c5-82b9-570348d416ec@linux-m68k.org>
In-Reply-To: <f604a8f6-6203-84c5-82b9-570348d416ec@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Aug 2023 13:47:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV6NWRKL8DAD2e4HPz=fbcAUqi6ww-8_9Mjg0t8eiZCGQ@mail.gmail.com>
Message-ID: <CAMuHMdV6NWRKL8DAD2e4HPz=fbcAUqi6ww-8_9Mjg0t8eiZCGQ@mail.gmail.com>
Subject: Re: [PATCH RFC v3 2/2] m68k/q40: add data_swab option for pata_falcon
 to byte-swap disk data
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     Michael Schmitz <schmitzmic@gmail.com>, will@sowerbutts.com,
        linux-m68k@vger.kernel.org, rz@linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Aug 17, 2023 at 12:15 PM Finn Thain <fthain@linux-m68k.org> wrote:
> On Thu, 17 Aug 2023, Michael Schmitz wrote:
> > Some users of pata_falcon on Q40 have IDE disks in classic
> > little endian byte order, whereas legacy disks use native
> > big-endian byte order as on the Atari Falcon.
> >
> > Add module parameter 'data_swab' to allow connecting drives
> > with non-native data byte order.  Drives selected by the
> > data_swap bit mask will have their user data byte-swapped to
> > host byte order, i.e. 'pata_falcon.data_swab=2' will byte-swap
> > all user data on drive B, leaving data on drive A in native
> > byte order. On Q40, drives on a second IDE interface may be
> > added to the bit mask as bits 3 and 4.
>
> Many would say that's off by one, as it's popular to number the LSB as bit
> zero.
>
> >
> > Default setting is no byte swapping, i.e. compatibility with
> > the native Falcon or Q40 operating system disk format.
> >
> > Cc: William R Sowerbutts <will@sowerbutts.com>
> > Cc: Finn Thain <fthain@linux-m68k.org>
> > Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> > Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

> > --- a/drivers/ata/pata_falcon.c
> > +++ b/drivers/ata/pata_falcon.c

> > @@ -165,10 +178,20 @@ static int __init pata_falcon_init_one(struct platform_device *pdev)
> >       ap->pio_mask = ATA_PIO4;
> >       ap->flags |= ATA_FLAG_SLAVE_POSS | ATA_FLAG_NO_IORDY;
> >
> > +     priv = devm_kzalloc(&pdev->dev,
> > +             sizeof(struct pata_falcon_priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     ap->private_data = priv;
> > +
> >       /* N.B. this assumes data_addr will be used for word-sized I/O only */
> >       ap->ioaddr.data_addr = (void __iomem *)base_mem_res->start;
> >
> >       if (base_res) {         /* only Q40 has IO resources */
> > +             if (pdev->id)
> > +                     pata_falcon_swap_mask >>= 2;

Although this driver uses module_platform_driver_probe(), and thus
does not support unbind/rebind, shifting a global variable is still
fragile, and depends on probe order (what if the second interface is
probed first?).

> > +             priv->swap_mask = pata_falcon_swap_mask;

priv->swap_mask = pata_falcon_swap_mask >> (2 * pdev->id);

> --- a/drivers/ata/pata_falcon.c
> +++ b/drivers/ata/pata_falcon.c
> @@ -33,6 +33,11 @@
>  #define DRV_NAME "pata_falcon"
>  #define DRV_VERSION "0.1.0"
>
> +static int pata_falcon_data_swab;
> +
> +module_param_named(data_swab, pata_falcon_data_swab, int, 0444);
> +MODULE_PARM_DESC(data_swab, "Data byte swap enable/disable bitmap (0x1==drive1, 0x2==drive2, 0x4==drive3, 0x8==drive4, default: 0)");
> +
>  static const struct scsi_host_template pata_falcon_sht = {
>         ATA_PIO_SHT(DRV_NAME),
>  };
> @@ -50,7 +55,7 @@ static unsigned int pata_falcon_data_xfer(struct ata_queued_cmd *qc,
>
>         if (dev->class == ATA_DEV_ATA && cmd &&
>             !blk_rq_is_passthrough(scsi_cmd_to_rq(cmd)))
> -               swap = 0;
> +               swap = (int)ap->private_data & BIT(dev->devno);

"(uintptr_t)", to make it 64-bit clean.

Yeah, we don't support COMPILE_TEST=y yet for PATA_FALCON.
BTW, looks like we don't need any of the following anymore:

    #include <asm/setup.h>
    #include <asm/atarihw.h>
    #include <asm/atariints.h>
    #include <asm/atari_stdma.h>

That leaves us with <asm/ide.h>, (which does not exist on most
architectures, and seems to be mostly obsolete), for the (indirectly
included) definitions of raw_{in,out}sw_{,swapw}()....

>
>         /* Transfer multiple of 2 bytes */
>         if (rw == READ) {
> @@ -199,6 +204,8 @@ static int __init pata_falcon_init_one(struct platform_device *pdev)
>         ap->ioaddr.altstatus_addr       = ctl_base + io_offset;
>         ap->ioaddr.ctl_addr             = ctl_base + io_offset;
>
> +       ap->private_data = (void *)((pata_falcon_data_swab >> (2 * pdev->id)) & 3);

"(void *)(uintptr_t)", to make it 64-bit clean.

> +
>         irq_res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
>         if (irq_res && irq_res->start > 0) {
>                 irq = irq_res->start;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
