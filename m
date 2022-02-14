Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9BA9C433EF
	for <linux-m68k@archiver.kernel.org>; Mon, 14 Feb 2022 07:42:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237131AbiBNHmP (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 14 Feb 2022 02:42:15 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:58188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbiBNHmP (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 14 Feb 2022 02:42:15 -0500
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CB1759A6B
        for <linux-m68k@lists.linux-m68k.org>; Sun, 13 Feb 2022 23:42:07 -0800 (PST)
Received: by mail-vk1-f170.google.com with SMTP id j9so315646vkj.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 13 Feb 2022 23:42:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zKUmaVocxDOzwANYwpaVz63VZRyJS0CtXnyVBARgqLs=;
        b=sgItLCHnxB0IGKSql8jAKJos3Wl/S/d3TtpMyVC0pdD3EMREpPeXbA1rj5060mkZz6
         XNBkFM9y+rXcbreb3IMTqImMHrn6UfXZKuVW+Qwiw6zIMp0AXUgB05bApIRMQSjmf8wL
         GpMnLDKAB7hPP7JRP5RYwINYUcS8SXACyBEeXAUu8O1ftW50IUu87CfjzQEFzQZnQlre
         cCLH+EDc2/uxQ0QoKIjQQZHke5xCLDpvhdrDz1MxYVs60BNOZujWZ69BpzhkyE37W3Ma
         HxGir9YfYFTSmrZNyNiDAwR8b6k5r2FRNYCl6bkkxSwqAvzPHh+nuSI5LXVS1U5cLOyK
         YoPQ==
X-Gm-Message-State: AOAM533d0FYnvPiyLaiU5wsP46BNHtRyyvBHJM+iftU3vLlSUfLdbHwV
        PngIXoCFZGNNjNjacRj8rBBXTz0WZ+4MvQ==
X-Google-Smtp-Source: ABdhPJyH4pD9J/PEEs9UnmHN+PFa0jpEZbohPNGGClaK0NnW19F/wy47OFz1fLxvgqFgXb32jLdDSA==
X-Received: by 2002:a1f:aa4d:: with SMTP id t74mr1417262vke.27.1644824525999;
        Sun, 13 Feb 2022 23:42:05 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id n10sm5196965vso.34.2022.02.13.23.42.05
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Feb 2022 23:42:05 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id g10so17783446vss.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 13 Feb 2022 23:42:05 -0800 (PST)
X-Received: by 2002:a67:b00e:: with SMTP id z14mr3596777vse.57.1644824525461;
 Sun, 13 Feb 2022 23:42:05 -0800 (PST)
MIME-Version: 1.0
References: <CAMuHMdU3ievhXxKR_xi_v3aumnYW7UNUO6qMdhgfyWTyVSsCkQ@mail.gmail.com>
 <b03160b6-7f3b-7765-49ee-c49b7dd2c4e0@gmail.com>
In-Reply-To: <b03160b6-7f3b-7765-49ee-c49b7dd2c4e0@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Feb 2022 08:41:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVUX0zJtRAtjCBAa7iEk7MwCjcmSsJdCrSrPcY=6ti=cQ@mail.gmail.com>
Message-ID: <CAMuHMdVUX0zJtRAtjCBAa7iEk7MwCjcmSsJdCrSrPcY=6ti=cQ@mail.gmail.com>
Subject: Re: Wrong colors on ARAnyM
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Petr Stehlik <pstehlik@sophics.cz>, aranym@googlegroups.com,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

(replying in plain text mode ;-)

On Sun, Feb 13, 2022 at 9:29 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
> On 13/02/22 03:59, Geert Uytterhoeven wrote:
> While working on an Atari DRM driver for Linux, I discovered a problem
> with video modes using 2 bitplanes: the display only shows tints of
> blue. 1, 4, and 8 bitplanes work fine.
>
> With debug code added to ARAnyM, it turns out the bad behavior
> happens when ARAnyM uses the STe palette registers instead of the
> Falcon palette registers. And apparently the issue can also be
> reproduced with atafb, and with other color depths:
>
>  1. Boot Linux (I'm using video=atafb:tthigh)
>
>     Everything looks good:
>
>       refreshPalette:319: st_shift = 0
>       refreshPalette:354: Fal color 0 = 0x00000000 => 00/00/00
>       refreshPalette:354: Fal color 1 = 0x000000a8 => 00/00/aa
>       refreshPalette:354: Fal color 2 = 0x00a80000 => 00/aa/00
>       refreshPalette:354: Fal color 3 = 0x00a800a8 => 00/aa/aa
>
>  2. Change the color depth a few times:
>
>     $ fbset -depth 1
>     $ fbset -depth 2
>
> Depth 2 forces STe palette mode (in decode_var; activated in the Videl in the vbl switcher).
>
>     $ fbset -depth 4
>       ...
>
>     If good: console is white(grey) on black
>
>       refreshPalette:319: st_shift = 0
>       refreshPalette:354: Fal color 0 = 0x00000000 => 00/00/00
>       refreshPalette:354: Fal color 1 = 0xa8a800a8 => aa/aa/aa
>       refreshPalette:354: Fal color 2 = 0x54540054 => 55/55/55
>       refreshPalette:354: Fal color 3 = 0xfcfc00fc => ff/ff/ff
>
>     If bad: console is blue on black
>
>       refreshPalette:319: st_shift = 256
>
> That's still depth 2.
>
>       refreshPalette:335: STe color 0 = 0x0000 => 00/00/00
>       refreshPalette:335: STe color 1 = 0x0117 => 22/22/ee
>       refreshPalette:335: STe color 2 = 0x0000 => 00/00/00
>       refreshPalette:335: STe color 3 = 0x0000 => 00/00/00
>
> As a workaround, I fixed ARAnyM to force numColors to 256, so
> it will always use the Falcon palette.
> https://github.com/aranym/aranym/blob/master/src/videl.cpp#L319
>
> Is this a bug in ARAnyM, or a bug in atafb?
>
> It _looks_ as though changes to f_shift and st_shift are not pushed to hardware in the VBL interrupt. Does ARAnyM run the VBL interrupt regularly?

Yes it does.

> But maybe the kernel and ARAnyM disagree because useStPalette() has this:
>
> int hreg = handleReadW(HW + 0x82); // Too lame!
> // Better way how to make out ST LOW mode wanted
> if (hreg == 0x10 || hreg == 0x17 || hreg == 0x3e) {
> useStPal = true;
>
> }
>
> for st_shift == 0

Linux' falcon_setcolreg() writes to both the Falcon palette registers
and shifter_tt.color_reg[], so shouldn't the STE color palette contain
the correct colors, too?

> As the problem is not 100% reproducible, it looks like a race condition
> in ARAnyM, or a wrong initialization order in atafb.
>
> I'd have to test this on hardware but haven't got fbset on the Falcon. I'll try to locate a binary.

Sorry, you do not need fbset to reproduce this:

    echo N > /sys/class/graphics/fb0/bits_per_pixel

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
