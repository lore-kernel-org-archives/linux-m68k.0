Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79097C636D3
	for <linux-m68k@archiver.kernel.org>; Mon, 30 Jan 2023 19:10:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236693AbjA3TKy (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 30 Jan 2023 14:10:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229887AbjA3TKw (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 30 Jan 2023 14:10:52 -0500
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DD6A10F
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Jan 2023 11:10:51 -0800 (PST)
Received: by mail-qt1-f170.google.com with SMTP id x17so11110638qto.10
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Jan 2023 11:10:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QYQveIOCc92ew4wuWc56i2o9XfBI3Tbl7/eicT4C3m8=;
        b=5hQm1/rx7xWQiu527XDnhJx18qpMt3fkOnN5XD26bkFAC+1/O87LM6n0PMNCK5VVWl
         bkV3Ln42kXrifs1Id37lYeu3CvwHUUehb5JXoPeH6lbTA62xBq4d+HSWPMjI4koaOVuJ
         Ui5/QLrX2cIl+MoctNBzqi0EYZ3QBCBlfDn20lPq2OBT0TxL66QvTThwbqncUq7h/Ou+
         bEP6CxiHBB4xnlfgSgFcvLQU8Y1XDs3j2336b9aNGQvFg7gKmk4kvgkoUj05uBMh+sBi
         hACacrianSbrj/p+hVfqroCFvt88+FHSuGO65DA1jNBWEhz80Jq5i/SErJFIHLnNuQ10
         1qhw==
X-Gm-Message-State: AFqh2koBvJnV3fTE/FdEzCQRYXaspUQCjcbqYkq2i2VKPuwNykFyIjaW
        9odlI7BgEkttrXVuZD8RCLoCowPdz7aH7A==
X-Google-Smtp-Source: AMrXdXu812+SlHXnKHTbeOj0e8LVbEZ+xSs2X4qDSzNz5Ee7ptjtKTuYcCpqK6TRwqySgvUp5XUEkQ==
X-Received: by 2002:ac8:4914:0:b0:3b1:ad76:eefe with SMTP id e20-20020ac84914000000b003b1ad76eefemr76048255qtq.10.1675105849885;
        Mon, 30 Jan 2023 11:10:49 -0800 (PST)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id bz17-20020a05622a1e9100b003b86b962030sm2173682qtb.72.2023.01.30.11.10.48
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 11:10:49 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-4fda31c3351so173103967b3.11
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Jan 2023 11:10:48 -0800 (PST)
X-Received: by 2002:a81:1216:0:b0:506:6b5d:523c with SMTP id
 22-20020a811216000000b005066b5d523cmr1603608yws.283.1675105848292; Mon, 30
 Jan 2023 11:10:48 -0800 (PST)
MIME-Version: 1.0
References: <Y9PWhU7DVQCLP9EX@bill-the-cat> <CAMuHMdUMvGhpbfsTaaNSpypH_XdKjVzY3yWOOpR=Acj_7K6-uw@mail.gmail.com>
 <CALJHbkBqdvJu8KGKbJ2eayhiP_t607AvuwgYidhLTPY7=Mt4Hg@mail.gmail.com>
 <Y9fs2wH4WHIzae5r@bill-the-cat> <7739d9da9f49f99d156dacf645a311388e9eb628.camel@physik.fu-berlin.de>
 <Y9fxfNDNXXyJQ0Dn@bill-the-cat> <6558aca3-63aa-c89c-93fc-a5afe48cbe78@helsinkinet.fi>
In-Reply-To: <6558aca3-63aa-c89c-93fc-a5afe48cbe78@helsinkinet.fi>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 30 Jan 2023 20:10:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV3xawhr_syeM_5vLrQsF1nMqZhOuyBbUW2mjyPy6Om8Q@mail.gmail.com>
Message-ID: <CAMuHMdV3xawhr_syeM_5vLrQsF1nMqZhOuyBbUW2mjyPy6Om8Q@mail.gmail.com>
Subject: Re: U-Boot support for M68K removal
To:     Eero Tamminen <oak@helsinkinet.fi>
Cc:     Tom Rini <trini@konsulko.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Angelo Dureghello <angelo.dureghello@timesys.com>,
        linux-m68k@lists.linux-m68k.org,
        Joshua Thompson <funaho@jurai.org>,
        Philip Blundell <philb@gnu.org>, u-boot@lists.denx.de,
        Huan Wang <alison.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Eero,

On Mon, Jan 30, 2023 at 8:02 PM Eero Tamminen <oak@helsinkinet.fi> wrote:
> On 30.1.2023 18.34, Tom Rini wrote:
> > That's great to hear. While I started my life on m68k machines, I never
> > did get Linux up on one. Do the coldfire platforms you have run U-Boot
> > today? If so, are they already supported upstream? One of my biggest
> > concerns about the architecture, in U-Boot, is that I've just not heard
> > of anyone using it in quite some time, and we don't have any emulated
> > platforms either (can it be done in QEMU? We have other plaforms in CI
> > via QEMU) so I worry it's not working.
>
> Qemu supports both m68k and ColdFire nowadays:
> https://www.qemu.org/docs/master/system/target-m68k.html
>
>
>         - Eero
>
> PS. For m68k there are also a lot of other emulators that emulate
> specific platforms.
>
> Aranym, 68040 Atari "clone", used a lot by Debian m68k port before Qemu
> got m68k support.
>
> WinAUE, 68000-68040 Amiga emulation.  Unlike Aranym or Qemu, this
> emulates also CPU cache.
>
> Hatari, 68000-68040 Atari emulation (based on WinUAE CPU core).
>
> Previous, 68030 NeXT emulator (based on Hatari).

But none of the platforms listed above boot using U-Boot, which is
what Tom is interested in...

"qemu-system-m68k -machine help" lists a.o.:

    an5206               Arnewsh 5206
    mcf5208evb           MCF5208EVB (default)

U-Boot still contains include/configs/M5208EVBE.h, but there are no
actual users...

Angelo: so support for amcore in qemu would be nice ;-)

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
