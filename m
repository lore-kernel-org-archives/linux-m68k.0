Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6E62C43334
	for <linux-m68k@archiver.kernel.org>; Tue,  7 Jun 2022 08:07:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238032AbiFGIH1 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 7 Jun 2022 04:07:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238038AbiFGIH0 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 7 Jun 2022 04:07:26 -0400
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B259DBC84
        for <linux-m68k@lists.linux-m68k.org>; Tue,  7 Jun 2022 01:07:21 -0700 (PDT)
Received: by mail-qk1-f178.google.com with SMTP id n197so5602368qke.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 07 Jun 2022 01:07:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8nGjrTIeofqRJeA4GWWs8vd7hIjiLENiB/8ryQPveu0=;
        b=7HYcHoLAayoHtOSGKVZ35t0cOgchITUpNxRfy3ZQa0XRtZoDDXUXJr9J1bKxHCat52
         kxahY51T6dPMoFdoGnlo4i77Nw+ItIYYfhjSbI6ha9Z6JgsYmFu0BkRdINepqlEBqgMK
         YfxKlvIZvyIBqPCXxxuxO08ti2mdNlcj5AyKdtdMdpm42J59qHJogFnpxZFfNoZ9+TYj
         DAMWc1hST17XhdRhqzDauzEaze7jbghGNixrjF45svod4LXj6KG77VaDnilxen8m/NbQ
         +//7FrwhSL0YQmC2NHoQD5RLSgg3EojbDfxRjY3EZd6Dbf1orfdihgW/sfBrAtJxyU93
         Pqng==
X-Gm-Message-State: AOAM531+54ZqDWSMcKfKxw8LsUhMKQk+SBjDPX6D1GG+0f6pGG1ZEutG
        CFie1acS9Vjb4/loRw3+MbpZtkwXhQh2fQ==
X-Google-Smtp-Source: ABdhPJwx5YlzKessZ/uApLbCeSJiWlVe4+NlcLLShzHHuP/u24YB2+ZeZ/Fng9oStbgkRucuLcJhDA==
X-Received: by 2002:a05:620a:1792:b0:6a6:c734:d983 with SMTP id ay18-20020a05620a179200b006a6c734d983mr4426568qkb.682.1654589240553;
        Tue, 07 Jun 2022 01:07:20 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id r21-20020a05620a299500b006a6bbc2725esm4785095qkp.118.2022.06.07.01.07.19
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 01:07:20 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-30c143c41e5so166902827b3.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 07 Jun 2022 01:07:19 -0700 (PDT)
X-Received: by 2002:a81:4811:0:b0:30c:8021:4690 with SMTP id
 v17-20020a814811000000b0030c80214690mr30121193ywa.47.1654589239317; Tue, 07
 Jun 2022 01:07:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1654529011.git.mchehab@kernel.org> <39b24f99f5b71eb5ac025b438b7eb2a0df2258a1.1654529011.git.mchehab@kernel.org>
In-Reply-To: <39b24f99f5b71eb5ac025b438b7eb2a0df2258a1.1654529011.git.mchehab@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 Jun 2022 10:07:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUPfOjVWkDgthbhxrgyfb8oEjRh61xWxL7=HX0PfCxpHA@mail.gmail.com>
Message-ID: <CAMuHMdUPfOjVWkDgthbhxrgyfb8oEjRh61xWxL7=HX0PfCxpHA@mail.gmail.com>
Subject: Re: [PATCH 23/23] arch: m68k: q40: README: drop references to IDE driver
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jens Axboe <axboe@kernel.dk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Mauro,

Thanks for your patch!

On Mon, Jun 6, 2022 at 5:25 PM Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
> Since IDE support was deleted by Christoph Hellwig <hch@lst.de>,
> Jun 16 2021, drop the left-over from README file.

This is only half of the story, cfr. commit 44b1fbc0f5f30e66 ("m68k/q40:
Replace q40ide driver with pata_falcon and falconide").

> Fixes: b7fb14d3ac63 ("ide: remove the legacy ide driver")

Hence this Fixes tag should be dropped...

> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH 00/23] at: https://lore.kernel.org/all/cover.1654529011.git.mchehab@kernel.org/
>
>  arch/m68k/q40/README | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/arch/m68k/q40/README b/arch/m68k/q40/README
> index a4991d2d8af6..4db6db54d57a 100644
> --- a/arch/m68k/q40/README
> +++ b/arch/m68k/q40/README
> @@ -30,9 +30,7 @@ drivers used by the Q40, apart from the very obvious (console etc.):
>                      genrtc.c           # RTC
>                 char/joystick/*         # most of this should work, not
>                                         # in default config.in
> -               block/q40ide.c          # startup for ide
> -                     ide*              # see Documentation/ide/ide.rst

... and the above should be replaced by ata/pata_falcon.c.
There doesn't seem to be an ATA replacement for Documentation/ide/ide.rst?

> -                     floppy.c          # normal PC driver, DMA emu in asm/floppy.h
> +               block/floppy.c          # normal PC driver, DMA emu in asm/floppy.h
>                                         # and arch/m68k/kernel/entry.S
>                                         # see drivers/block/README.fd
>                 net/ne.c

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
