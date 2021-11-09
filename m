Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73215C433F5
	for <linux-m68k@archiver.kernel.org>; Tue,  9 Nov 2021 07:55:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5170D610F8
	for <linux-m68k@archiver.kernel.org>; Tue,  9 Nov 2021 07:55:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243796AbhKIH6e (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 9 Nov 2021 02:58:34 -0500
Received: from mail-ua1-f43.google.com ([209.85.222.43]:44761 "EHLO
        mail-ua1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236392AbhKIH6b (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 9 Nov 2021 02:58:31 -0500
Received: by mail-ua1-f43.google.com with SMTP id s13so21313645uaj.11
        for <linux-m68k@vger.kernel.org>; Mon, 08 Nov 2021 23:55:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v27g96gWc/T41/P1Xw29szFjYTV5iQWqN+swknaykxA=;
        b=ahuE9vnXUM4XMcEdEl09GYeyMFidDiY//72NSAr126FCq+/5qWBm28I+X3LZJ3m4LB
         U5j2z7v/oe+/JpyB+g0Ofm3cYCdn3f8uF17EuQ2nP2IHYf2ppgyOqtVilWql36cyYCPg
         T6NlkOZDYSuFhvv00WjJXm8vQFYr91XjtxHUIQSgWlBDprxHh5h4xZKUstpS67qHPnj/
         Jv51h9wEgM8yByUFfwx/kl2HWPTFR0sxCsUUHq8M7Bw7CIqR0lPVNv/M5zjbqDGifO7Y
         pw+iAcdvomfs5Ncy6ClFGX3u0BqCOedWPFOaH4QHu8WJwhuTY20USz431M2xEtdBgdj8
         LVDA==
X-Gm-Message-State: AOAM532aagL0db4LvvhS0fK6EWmRKbKgfrMtVniGWw/sVvwcUFuyacYq
        U4eywTxvct8BgZiNKS9vRLapZhyEvs9D7mge
X-Google-Smtp-Source: ABdhPJxLZ2JMLN1YU/cQy/QqogtuHbifaSyiG1OAzt8hP8XFg1tAha9fHAHzz8lfjadNHnszcYnO4w==
X-Received: by 2002:ab0:6808:: with SMTP id z8mr7348886uar.130.1636444545248;
        Mon, 08 Nov 2021 23:55:45 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id q9sm1423355vkn.44.2021.11.08.23.55.44
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 23:55:45 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id e10so36903790uab.3
        for <linux-m68k@vger.kernel.org>; Mon, 08 Nov 2021 23:55:44 -0800 (PST)
X-Received: by 2002:ab0:15a1:: with SMTP id i30mr7547350uae.122.1636444544749;
 Mon, 08 Nov 2021 23:55:44 -0800 (PST)
MIME-Version: 1.0
References: <20211104061102.30899-1-schmitzmic@gmail.com> <20211104061102.30899-2-schmitzmic@gmail.com>
 <CAMuHMdVDAZpG=H210R_qeWmMPFm_62jGgsXv_ymYjDBC5-CcZQ@mail.gmail.com> <c14ea1ed-c3f1-c5f4-c7d6-1b73387bc278@gmail.com>
In-Reply-To: <c14ea1ed-c3f1-c5f4-c7d6-1b73387bc278@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 Nov 2021 08:55:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVU4DJ+ahHVW47swRfyFC97-uGUz4nZBo4OZipBTvut-Q@mail.gmail.com>
Message-ID: <CAMuHMdVU4DJ+ahHVW47swRfyFC97-uGUz4nZBo4OZipBTvut-Q@mail.gmail.com>
Subject: Re: [PATCH v8 1/3] m68k: amiga/pcmcia - add 16 bit detection
 interface to amipcmcia.h
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     "Linux/m68k" <linux-m68k@vger.kernel.org>,
        ALeX Kazik <alex@kazik.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Mon, Nov 8, 2021 at 10:48 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
> On 08/11/21 21:35, Geert Uytterhoeven wrote:
> > On Thu, Nov 4, 2021 at 7:11 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> >> Add the interface definitions for 16 bit card autoprobing (using
> >> the generic PCMCIA cftable entry parser) to amipcmcia.h for use
> >> by apne.c.
> >>
> >> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
> >
> > Thanks for your patch!
> >
> >> --- a/arch/m68k/include/asm/amipcmcia.h
> >> +++ b/arch/m68k/include/asm/amipcmcia.h
> >> @@ -64,6 +64,7 @@ static inline void pcmcia_disable_irq(void)
> >>  #define PCMCIA_SPEED_250NS     250
> >>  #define PCMCIA_SPEED_720NS     720
> >>
> >> +#ifndef _LINUX_CISTPL_H
> >
> > This #ifndef is here to prevent conflicts with <pcmcia/cistpl.h>?
> > Why can't the definitions below be removed, and <pcmcia/cistpl.h>
> > always included instead?
>
> We'd have to include it everywhere amipcmcia.h is included (because of
> the pcmcia_parse_tuple() external declaration below). Didn't want to do
> that unless absolutely necessary, but if you don't mind that, I'll
> change this part.

That include can be avoided by providing forward declarations for
struct tuple_t and struct cisparse_t, and using the struct types
instead of the typedefs for the pcmcia_parse_tuple() parameters, right?

>
> >
> >>  /* PCMCIA Tuple codes */
> >>
> >>  #define CISTPL_NULL            0x00
> >> @@ -106,5 +107,8 @@ static inline void pcmcia_disable_irq(void)
> >>  #define CISTPL_FUNCID_NETWORK  0x06
> >>  #define CISTPL_FUNCID_AIMS     0x07
> >>  #define CISTPL_FUNCID_SCSI     0x08
> >> +#else  /* defined _LINUX_CISTPL_H */
> >> +extern int pcmcia_parse_tuple(tuple_t *cftuple, cisparse_t *cfparse);
> >
> > This can be unconditional?
>
> Brain fade on my part - this of course needs to be conditional on
> CONFIG_PCMCIA. not on _LINUX_CISTPL_H.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
