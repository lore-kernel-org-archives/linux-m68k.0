Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EA21C433EF
	for <linux-m68k@archiver.kernel.org>; Wed,  6 Apr 2022 03:47:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243463AbiDFDsP (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 5 Apr 2022 23:48:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1581723AbiDEXkl (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 5 Apr 2022 19:40:41 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA52B1D1916
        for <linux-m68k@lists.linux-m68k.org>; Tue,  5 Apr 2022 15:01:23 -0700 (PDT)
Received: from mail-wm1-f44.google.com ([209.85.128.44]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MQvH5-1nOQz82myV-00NxJP for <linux-m68k@lists.linux-m68k.org>; Wed, 06 Apr
 2022 00:01:21 +0200
Received: by mail-wm1-f44.google.com with SMTP id l7-20020a05600c1d0700b0038c99618859so2490582wms.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 05 Apr 2022 15:01:21 -0700 (PDT)
X-Gm-Message-State: AOAM530osoDT2jKs0LzHQYlulGTJbrrkwGCyZop2fuye30VRFDF1ELbL
        pqPK/J297bN3wqbdAm7TUdhBThggx5iS3l15qss=
X-Google-Smtp-Source: ABdhPJwpFnYfoC7W3fhpROG/ZwOFBskHRE+B4cQmOeYyUSah/jNs/fMR9Xj0LBcXz7SwKs3p7LpOSW2RcQmAA/Xxjtc=
X-Received: by 2002:a05:600c:1e0b:b0:38c:9ac5:b486 with SMTP id
 ay11-20020a05600c1e0b00b0038c9ac5b486mr4749875wmb.71.1649196081307; Tue, 05
 Apr 2022 15:01:21 -0700 (PDT)
MIME-Version: 1.0
References: <Yib9F5SqKda/nH9c@infradead.org> <CAK8P3a1dUVsZzhAe81usLSkvH29zHgiV9fhEkWdq7_W+nQBWbg@mail.gmail.com>
 <YkmWh2tss8nXKqc5@infradead.org> <CAK8P3a0QdFOJbM72geYTWOKumeKPSCVD8Nje5pBpZWazX0GEnQ@mail.gmail.com>
 <20220405212653.GA2482665@roeck-us.net>
In-Reply-To: <20220405212653.GA2482665@roeck-us.net>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 6 Apr 2022 00:01:05 +0200
X-Gmail-Original-Message-ID: <CAK8P3a396EkfQtmkwo80eB9i7F37S=mvrHtCLXhGDhHBczYK3g@mail.gmail.com>
Message-ID: <CAK8P3a396EkfQtmkwo80eB9i7F37S=mvrHtCLXhGDhHBczYK3g@mail.gmail.com>
Subject: Re: [RFC PULL] remove arch/h8300
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Christoph Hellwig <hch@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        "moderated list:H8/300 ARCHITECTURE" 
        <uclinux-h8-devel@lists.sourceforge.jp>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>, Max Filippov <jcmvbkbc@gmail.com>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Z+ADowgRzVP16gyxB59FIT0iSM03L9IbDOorArawXCSyLsxA51n
 FjjtdG6gEKvk5aEnXBQvMRhsUZy2I/dtRmnbHJy5dsJFJeUW5M9khrHNF8h4XP3C6KZcPmo
 wmXgRGPKWqtApN3WrcHBG8TSAkH+GK1a3e74nUobhLOxXqtBL/xBzVVoX6C8n9VossdkJzr
 +A/sT2oTgdiegJ+0y2KKA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:en4j41+SCbg=:0ahHgK8ReNgdcH619bUSfZ
 sc6P8mGLBw9QPvztenCBrdd0itdvCotuIGz5ta2KmrvHrYCSP0e15KvwgyHa9qFQ9fM8JeUcc
 4YZ0tbZdp0Fgdy79LWdC9ociXrm7RAEBiExlGXIKpwtou250ZUni4Ozlp5GareaYfPU+ncP7Q
 UELHZmuF8Y02V0N1PBlcX8pWiKYOv6MJf58ALaVEQPhZCUpf3L8N9X+7fsaXEJHWl08Kr+RL4
 g/8LtsAO5OL7nB+U8d2eyyDP0B5ME9nCLexc+Y8Sdr9/f7iPFNZlfEkc4H98H3oV3geOY9mH9
 Znvf358BuRT3YAUQoVxHk8S2CpL7NWC1ZUxe950cYCvn/yvwG0q3F/2QrqtXI5cx9S93pFM7Z
 /B6KaPIqb2avb+5jPfavV7M/+K6xNxtYjrlaPatSOECmef53ZPOpld6ye1I5F511YOW2okB8x
 L0SZZjnD0AUq7O6QQ24Ub5xVH35OZjpbr4zYnjRQ3FYQVS04//SIsVA1z1T04nmzGzxwr2c6s
 mk3Eoz6u28XkkPqme4PlxjcuyaShDwhVaeUL2R+lEK8TajxOIoFMwMa6Uup2GJJByZWYI3MrK
 vHaILeHRo+oGYmpURjLphorP6Wd+Vq9JSPB7f8ne98T1mx2twknVefczO+vNMaDkdq4tYTIKX
 YVLE9E5m842knKrb++EPR6oWS8waRlIUextSzfgSu6L/kA8aDqASk6aGJ0VWYETyKwKY=
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Apr 5, 2022 at 11:26 PM Guenter Roeck <linux@roeck-us.net> wrote:
> On Mon, Apr 04, 2022 at 03:07:06PM +0200, Arnd Bergmann wrote:
> >
> > Should we garbage-collect some of the other nommu platforms where
> > we're here? Some of them are just as stale:
> >
> > 1. xtensa nommu has does not compile in mainline and as far as I can
> > tell never did
> >    (there was https://github.com/jcmvbkbc/linux-xtensa/tree/xtensa-5.6-esp32,
> > which
> >    worked at some point, but I don't think there was enough interest
> > to get in merged)
>
> Hmm, I build and test nommu_kc705_defconfig in my test system.

What toolchain do you use for this? Max already pointed out my mistake
regarding xtensa, which I thought does not build at all, but just needs
a toolchain specific to the cpu.

> > 2. arch/sh Hitachi/Renesas sh2 (non-j2) support appears to be in a similar state
> >     to h8300, I don't think anyone would miss it
> >
> > 8<----- This may we where we want to draw the line ----
> >
> > 3. arch/sh j2 support was added in 2016 and doesn't see a lot of
> > changes, but I think
> >     Rich still cares about it and wants to add J32 support (with MMU)
> > in the future
> >
> > 4. m68k Dragonball, Coldfire v2 and Coldfire v3 are just as obsolete as SH2 as
> >    hardware is concerned, but Greg Ungerer keeps maintaining it, along with the
> >    newer Coldfire v4 (with MMU)
> >
> > 5. K210 was added in 2020. I assume you still want to keep it.
> >
> > 7. Arm32 has several Cortex-M based platforms that are mainly kept for
> >     legacy users (in particular stm32) or educational value.
> >
> I do build and test mps2_defconfig with qemu's mps2-an385 emulation.
>
> I am not saying that those are actively used, and I don't mind dropping
> them, but they do still work.

To clarify, the list was sorted based on what I expected to be the least to
most actively maintained ones, with the stm32 clearly being in use,
and above it in the the list somewhat less.

         Arnd
