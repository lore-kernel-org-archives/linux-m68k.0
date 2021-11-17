Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78E8FC433EF
	for <linux-m68k@archiver.kernel.org>; Wed, 17 Nov 2021 14:36:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E7B5613AD
	for <linux-m68k@archiver.kernel.org>; Wed, 17 Nov 2021 14:36:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231747AbhKQOjD (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 17 Nov 2021 09:39:03 -0500
Received: from mail-vk1-f177.google.com ([209.85.221.177]:38477 "EHLO
        mail-vk1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238626AbhKQOjA (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 17 Nov 2021 09:39:00 -0500
Received: by mail-vk1-f177.google.com with SMTP id s17so1764420vka.5
        for <linux-m68k@vger.kernel.org>; Wed, 17 Nov 2021 06:36:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cWhv9h0u8SgZ6TpSsc5yAW1FHaGCytGORaLx+ISjwvg=;
        b=eu+gLDv0qW+PXp2lk+eRkCfIP3mHWF8LCe19n/bQl1f6Rie3DWBO16IwKXDSkQ8i6S
         sHVVrUJ9b/W+JkWnjVwhNrTf7RXLcsghOb6c7j7zWZKm0okzMPLpOJCdcVDnm8XhVJjC
         7xD2BzdfiVmps1vAp+lDnW7/PSiTbvRiuU6BA+oSIJQkRMqJXfzVQvBqpkUQGmzAn8Oe
         Qy15kDoTHsHpDgt2ZChyWp5a9pipeGzU+056wAc77uQygO6+GW5RFvl2ryW6Ugqr8x5K
         53lbsTfxfWwqDiXl51CxhCo0dOr1XPpe15DiGcqbFkYntMuvh+6erYS5DHooe7Fhaho/
         bmRg==
X-Gm-Message-State: AOAM533jek79nJYFjRtYQEx/HBdQ5AXegj2+GrnfF8EXEckylJiIxxTU
        GAaM4HOFP1clrguxHV5j6FS9y8y06FNe+Q==
X-Google-Smtp-Source: ABdhPJx4sOf1/rTT2S0Z8qOhZX9I0EzIWM8C8iRBdS88SpKQ0Lb78JHEaNLVeU1uSvCJx16Jm5V6TA==
X-Received: by 2002:a1f:288:: with SMTP id 130mr90377990vkc.1.1637159761291;
        Wed, 17 Nov 2021 06:36:01 -0800 (PST)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id a4sm12038070vkm.46.2021.11.17.06.36.00
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Nov 2021 06:36:01 -0800 (PST)
Received: by mail-vk1-f176.google.com with SMTP id k83so1758070vke.7
        for <linux-m68k@vger.kernel.org>; Wed, 17 Nov 2021 06:36:00 -0800 (PST)
X-Received: by 2002:a05:6122:20ab:: with SMTP id i43mr89172118vkd.19.1637159760687;
 Wed, 17 Nov 2021 06:36:00 -0800 (PST)
MIME-Version: 1.0
References: <20211114234005.335-1-schmitzmic@gmail.com> <20211114234005.335-2-schmitzmic@gmail.com>
 <CAMuHMdWP-15RzVZiE1zR3sdSf06bqj9LZwh3BkgpoUHmvqxLsg@mail.gmail.com> <cbc4b37e-0ab7-b719-c7c5-a4315da220e6@gmail.com>
In-Reply-To: <cbc4b37e-0ab7-b719-c7c5-a4315da220e6@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 17 Nov 2021 15:35:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVZHHAKb8y0YKbKJ5Qw-_pJvwczaNqkrsJhFEWQd6h4uw@mail.gmail.com>
Message-ID: <CAMuHMdVZHHAKb8y0YKbKJ5Qw-_pJvwczaNqkrsJhFEWQd6h4uw@mail.gmail.com>
Subject: Re: [PATCH v11 1/3] m68k: amiga/pcmcia - add 16 bit detection
 interface to amipcmcia.h
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     "Linux/m68k" <linux-m68k@vger.kernel.org>,
        ALeX Kazik <alex@kazik.de>, Denis Kirjanov <dkirjanov@suse.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Wed, Nov 17, 2021 at 8:15 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> On 15/11/21 22:59, Geert Uytterhoeven wrote:
> > On Mon, Nov 15, 2021 at 12:40 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> >> Add the interface definition for 16 bit card autoprobing (using
> >> the generic PCMCIA cftable entry parser) to amipcmcia.h for use
> >> by apne.c. Include necessary cftable definitions from cistpl.h,
> >> remove locally duplicate definitions from amipcmcia.h.
> >>
> >> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
> >
> > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> I may have to give this another spin, in order to address a review
> comment by Denis about making the apne.c 16 bit IO autoprobe module
> parameter ('100mbit') a sysfs parameter.
>
> I suggest to move that parameter to arch/m68k/amiga/pcmcia.c to ensure
> it's always visible, and rename it to better reflect its actual function
> (pcmcia_16bit comes to mind). apne.c would then use that parameter to
> autoprobe 16 bit IO support, or set isa_type according to the parameter.
>
> Would that satisfy your concerns, Denis?

What's the point of the sysfs parameter, given the driver cannot be
unbound and rebound, as it does not use the driver model yet?
The only thing you can (try to) do is unload and reload the module,
at which point you can pass the module parameter again?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
