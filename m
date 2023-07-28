Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2660CC001E0
	for <linux-m68k@archiver.kernel.org>; Fri, 28 Jul 2023 08:04:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233663AbjG1IEw convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 28 Jul 2023 04:04:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234697AbjG1IEP (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 28 Jul 2023 04:04:15 -0400
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4157C4200
        for <linux-m68k@lists.linux-m68k.org>; Fri, 28 Jul 2023 01:03:24 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-583b0637c04so25434707b3.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 28 Jul 2023 01:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690531403; x=1691136203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cFC62FgZIF3JWlHG1f85S/gFGY2oAxjH59Trv/UJKPw=;
        b=Pt11gJZgAAyYwQM9aBH3ZE42Q2Rpowfigw16M1zBBrwjW21f3tW5rztMaOESQq3Y3f
         N0h9DFli9+ZTQSZnYGjhPH5VIQd2mgsYsffNL99cK+P+DEtGOL5E/54kp5BXMTiVO+KC
         vGNS2ilI9neFAVzH1bmqbPlsF4wUKwjS7HgdiVVPSwFxrtSZBTQsb+7kNKiOmYFbpIxZ
         7Xl/5pSK23o1qNARepMZFwNXMG26WO3KPUNslctLPvxqjXdFCN3naV4xn5RX0nOH8Ij2
         Jld8+y6ZJB3yr5rkva9eGbLM0x6L/9h31Oj91VvqR2Kc3KZ1In3paCU4inarfbLuX4T1
         k4bg==
X-Gm-Message-State: ABy/qLYdZr3gPJS9K1OJRQJ/+y38VpQUfqN/pK7IsCLTIZtXMAI2Y+9f
        jBZT6Lyoj5migqhtvtsD602Uxvglhxe3aw==
X-Google-Smtp-Source: APBJJlERRNmEyOhJBj7ejc2weK7DTL7NgE8iuwyCbWjbJOnMm+TVGFnd4CadQbf+LZUlIzongsSH8Q==
X-Received: by 2002:a81:8457:0:b0:577:3adb:d8c7 with SMTP id u84-20020a818457000000b005773adbd8c7mr1013694ywf.26.1690531403297;
        Fri, 28 Jul 2023 01:03:23 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id t14-20020a81830e000000b0058461c9524fsm936913ywf.12.2023.07.28.01.03.22
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 01:03:23 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-577ddda6ab1so25762807b3.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 28 Jul 2023 01:03:22 -0700 (PDT)
X-Received: by 2002:a81:4886:0:b0:577:3f8c:fc60 with SMTP id
 v128-20020a814886000000b005773f8cfc60mr1352628ywa.1.1690531402794; Fri, 28
 Jul 2023 01:03:22 -0700 (PDT)
MIME-Version: 1.0
References: <ZLvZmVfzJNHlPTlJ@sowerbutts.com> <CAMuHMdUU62jjunJh9cqSqHT87B0H0A4udOOPs=WN7WZKpcagVA@mail.gmail.com>
 <1dabd80c-d91e-7869-e95e-199fc58b9f84@linux-m68k.org> <c47f07a9-d302-b8ce-c630-988e08cc8254@gmail.com>
 <ZL5jwoXAU5t8S+E6@sowerbutts.com> <d01db1e6-a0ae-559c-ab64-b3a2f5b60324@gmail.com>
 <997f0ff1-865d-29fb-ef65-2bb693549da8@linux-m68k.org> <288847c5-46bd-fcd4-11a7-829685a02c79@gmail.com>
 <521776cc-a11e-0a3a-b44d-fc051f6ee2ea@linux-m68k.org> <624c5629-e337-46ba-c8ac-411fe19f2f46@gmail.com>
 <81706cdc-2a7a-f383-881a-7313fefbb938@linux-m68k.org> <1e6e6dce-7b97-e206-b4f9-228520d44a45@gmail.com>
In-Reply-To: <1e6e6dce-7b97-e206-b4f9-228520d44a45@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 28 Jul 2023 10:03:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX8Mv9=6zimfMW-=r9XH+np3V5eyGyQeRVYKV14vJ-q9w@mail.gmail.com>
Message-ID: <CAMuHMdX8Mv9=6zimfMW-=r9XH+np3V5eyGyQeRVYKV14vJ-q9w@mail.gmail.com>
Subject: Re: Linux 6.4.4 on m68k - Q40 - pata_falcon causes oops at boot time
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Finn Thain <fthain@linux-m68k.org>,
        William R Sowerbutts <will@sowerbutts.com>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Richard Zidlicky <rz@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Fri, Jul 28, 2023 at 9:52 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> Am 28.07.2023 um 11:47 schrieb Finn Thain:
> > What I had in mind is probably unacceptable because drivers end up having
> > to do byteswapping as happens in pata_falcon (or falconide and q40ide).
>
> Yes, but Q40 and Falcon are impossible to support any other way, and
> byte swapping the IDE interface in hardware was never repeated anywhere
> else, fortunately. We will have to keep pata_falcon around for that
> cause in any event.

Anyone remember TiVo? PPC with byte-swapped IDE interface.

> > It might be helpful to look for some precedent for this kind of thing
> > among the other big-endian platforms with ISA. MIPS Magnum is dual-endian
> > but Linux only runs in little-endian mode and the problem doesn't arise.
> > But there must be other examples. Maybe CHRP?
>
> Not all of CHRP, hearing Geert tell it. But there must be some boards
> that have an ISA bus?

It did have an ISA bus, but no ISA slots.
But the only external device on that bus was cs4232 audio.
All other ISA devices were internal to the south bridge.
http://g33rt.be/migrated/Linux/PPC/pci/isaAT1/.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
