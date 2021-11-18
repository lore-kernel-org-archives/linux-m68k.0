Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F142EC433EF
	for <linux-m68k@archiver.kernel.org>; Thu, 18 Nov 2021 08:09:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D25B361B30
	for <linux-m68k@archiver.kernel.org>; Thu, 18 Nov 2021 08:09:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235724AbhKRIMz (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 18 Nov 2021 03:12:55 -0500
Received: from mail-ua1-f49.google.com ([209.85.222.49]:46827 "EHLO
        mail-ua1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244255AbhKRIMi (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 18 Nov 2021 03:12:38 -0500
Received: by mail-ua1-f49.google.com with SMTP id az37so11768286uab.13
        for <linux-m68k@vger.kernel.org>; Thu, 18 Nov 2021 00:09:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fsQjZ0Y3hb8WX8MUjSJnaBrtChgZ2EzF3DQPSjODBiE=;
        b=F9xQpMlwMh/+jE1lBZ1WrcvDC3gFAnuhlW/ah2NacCCCFCy+Ag0zLmunEwbzAfnnTY
         r6+I0SQAs9TBRv1fK73Ap9h5iojfMN0vAJS4i3uAEuoly+bGFf2FwF8+6MBHg9fC2jw5
         +x43ZWbYs24Eliv/PD43rrxoo2T+YJwnuinpRIHid3oK1PiiyqhLguQN1MzPTq+dhEKq
         r7lL+LJuagizHYe88v9AphnuaIEtiAANzD0gaiO0bHhhD2Cj7yzZTwSmtG4G393kO0ka
         bo93B1ia1HNXeF2rYCptpK1AquSpIwrgoEiiQs+PHlqOO+8qUWstcp1V8cJLTffQ5jx2
         OKKQ==
X-Gm-Message-State: AOAM531H5UGlDlMJuRx/LOheNh8ucKaz5QSzPk7LOP1IeuKtaUHYUrUx
        bfRrHAoNMpVlCWLNPHBixe0FAZXljnmNqQ==
X-Google-Smtp-Source: ABdhPJzaEVyuZO+3kLzeXsUTIZwXwd4KklrD8qt5scGDeMFtzOuyj4jTylVJU/0WTN+fxtQh8SSPJg==
X-Received: by 2002:a05:6102:c8a:: with SMTP id f10mr23067028vst.22.1637222978378;
        Thu, 18 Nov 2021 00:09:38 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id j126sm1240863vsc.17.2021.11.18.00.09.37
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 00:09:38 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id j14so2046627uan.10
        for <linux-m68k@vger.kernel.org>; Thu, 18 Nov 2021 00:09:37 -0800 (PST)
X-Received: by 2002:a9f:3e01:: with SMTP id o1mr33752468uai.89.1637222977769;
 Thu, 18 Nov 2021 00:09:37 -0800 (PST)
MIME-Version: 1.0
References: <20211114234005.335-1-schmitzmic@gmail.com> <20211114234005.335-2-schmitzmic@gmail.com>
 <CAMuHMdWP-15RzVZiE1zR3sdSf06bqj9LZwh3BkgpoUHmvqxLsg@mail.gmail.com>
 <cbc4b37e-0ab7-b719-c7c5-a4315da220e6@gmail.com> <CAMuHMdVZHHAKb8y0YKbKJ5Qw-_pJvwczaNqkrsJhFEWQd6h4uw@mail.gmail.com>
 <a5a71ab2-2e71-ca0f-59b1-d85c4e86bfe8@gmail.com>
In-Reply-To: <a5a71ab2-2e71-ca0f-59b1-d85c4e86bfe8@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Nov 2021 09:09:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXpqDWLdFeEaEpS06fK_jKLOU8LMv5v7d=ey1oR=7jo9A@mail.gmail.com>
Message-ID: <CAMuHMdXpqDWLdFeEaEpS06fK_jKLOU8LMv5v7d=ey1oR=7jo9A@mail.gmail.com>
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

On Thu, Nov 18, 2021 at 5:58 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> On 18/11/21 03:35, Geert Uytterhoeven wrote:
> > On Wed, Nov 17, 2021 at 8:15 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> >> On 15/11/21 22:59, Geert Uytterhoeven wrote:
> >>> On Mon, Nov 15, 2021 at 12:40 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> >>>> Add the interface definition for 16 bit card autoprobing (using
> >>>> the generic PCMCIA cftable entry parser) to amipcmcia.h for use
> >>>> by apne.c. Include necessary cftable definitions from cistpl.h,
> >>>> remove locally duplicate definitions from amipcmcia.h.
> >>>>
> >>>> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
> >>>
> >>> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> >>
> >> I may have to give this another spin, in order to address a review
> >> comment by Denis about making the apne.c 16 bit IO autoprobe module
> >> parameter ('100mbit') a sysfs parameter.
> >>
> >> I suggest to move that parameter to arch/m68k/amiga/pcmcia.c to ensure
> >> it's always visible, and rename it to better reflect its actual function
> >> (pcmcia_16bit comes to mind). apne.c would then use that parameter to
> >> autoprobe 16 bit IO support, or set isa_type according to the parameter.
> >>
> >> Would that satisfy your concerns, Denis?
> >
> > What's the point of the sysfs parameter, given the driver cannot be
> > unbound and rebound, as it does not use the driver model yet?
>
> Pre-setting the desired IO type before loading the module - though
> actual setting of isa_type still has to wait until module load (or
> driver probe). I'd have to write a callback that validates user input if
> we want to set isa_type directly in pcmcia.c ...

IMHO the sysfs parameter would only make sense if all of the 8/16-bit
handling (and the special reset) is done in arch/m68k/amiga/pcmcia.c,
so it can be shared for multiple cards.

> > The only thing you can (try to) do is unload and reload the module,
> > at which point you can pass the module parameter again?
>
> I take that as 'don't do that', then ... ?

I meant you can do the above without the sysfs parameter.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
