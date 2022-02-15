Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2EFEC433F5
	for <linux-m68k@archiver.kernel.org>; Tue, 15 Feb 2022 08:12:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbiBOIMJ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 15 Feb 2022 03:12:09 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbiBOIMI (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 15 Feb 2022 03:12:08 -0500
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DA44A0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Feb 2022 00:11:58 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id w4so3185702vsq.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Feb 2022 00:11:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JGh7SZZiZgyy+Ve1VUawmPJHj6ONIGSChe7lpb0CdUg=;
        b=JEdbCKeYtO71jqiRGuChTW10sRlJ7xmYCQ1zmwgQnQdmc6d+WghSkFNqXdare95wPx
         6xha1Ya0e1DXniM2VcL3g1mfLPF89399vjH2fcb0CfDYZQHrMACX+XJIcYpcpgHJCTt3
         bK3FpVI+lgzfDE1WBu1k4nz3ubUXVdGnqdjBKQZKbmpm+RqNSowGoeolCR27QDoNvTwu
         9kNIw2tq26QoOusfqlAnhZd/JNrbYQqMcxdofHAmAPNLaxzg1htQOXzB3arXzyQYTsOx
         FdJAds0x1VnSbSfMeMRQaKbxVTvl0aI2i6Okp8rw6ITqiXPXnKVS/ocZdoZW5bD1Zn2e
         E9/w==
X-Gm-Message-State: AOAM530etaQTypMGLlF83zbgKbZYY3ojR6VQj6ZBkuumAC664a2mDImV
        FaqOuIxmT54/3XAT90wfPgRjznR9mXycnA==
X-Google-Smtp-Source: ABdhPJyB2UYMDGKAnyeTIGrzmiCtfxHdKKIDj5Aq7jUQmBIRz3kAWEb0a3G3ItuIHgFf102GSX8KdA==
X-Received: by 2002:a67:d116:: with SMTP id u22mr998524vsi.42.1644912717465;
        Tue, 15 Feb 2022 00:11:57 -0800 (PST)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id i36sm777705vkd.42.2022.02.15.00.11.57
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Feb 2022 00:11:57 -0800 (PST)
Received: by mail-vk1-f173.google.com with SMTP id j9so2242640vkj.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Feb 2022 00:11:57 -0800 (PST)
X-Received: by 2002:a1f:5e45:: with SMTP id s66mr1019474vkb.7.1644912716794;
 Tue, 15 Feb 2022 00:11:56 -0800 (PST)
MIME-Version: 1.0
References: <CAMuHMdU3ievhXxKR_xi_v3aumnYW7UNUO6qMdhgfyWTyVSsCkQ@mail.gmail.com>
 <b03160b6-7f3b-7765-49ee-c49b7dd2c4e0@gmail.com> <CAMuHMdVUX0zJtRAtjCBAa7iEk7MwCjcmSsJdCrSrPcY=6ti=cQ@mail.gmail.com>
 <4b3a0bc8-24a1-2a33-19bb-fbae954c614c@gmail.com>
In-Reply-To: <4b3a0bc8-24a1-2a33-19bb-fbae954c614c@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 15 Feb 2022 09:11:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWkxDMbS4D8wkEPAVgrFnoJzejUkxKCnvA+MA38vS6g9Q@mail.gmail.com>
Message-ID: <CAMuHMdWkxDMbS4D8wkEPAVgrFnoJzejUkxKCnvA+MA38vS6g9Q@mail.gmail.com>
Subject: Re: Wrong colors on ARAnyM
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Petr Stehlik <pstehlik@sophics.cz>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Mon, Feb 14, 2022 at 9:50 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
> On 14/02/22 20:41, Geert Uytterhoeven wrote:
> > On Sun, Feb 13, 2022 at 9:29 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
> >>
> >>   2. Change the color depth a few times:
> >>
> >>      $ fbset -depth 1
> >>      $ fbset -depth 2
> >>
> >> Depth 2 forces STe palette mode (in decode_var; activated in the Videl in the vbl switcher).
> >>
> >> [...]
> >> It _looks_ as though changes to f_shift and st_shift are not pushed to hardware in the VBL interrupt. Does ARAnyM run the VBL interrupt regularly?
> > Yes it does.
> >
> >> But maybe the kernel and ARAnyM disagree because useStPalette() has this:
> >>
> >> int hreg = handleReadW(HW + 0x82); // Too lame!
> >> // Better way how to make out ST LOW mode wanted
> >> if (hreg == 0x10 || hreg == 0x17 || hreg == 0x3e) {
> >> useStPal = true;
> >>
> >> }
> >>
> >> for st_shift == 0
> > Linux' falcon_setcolreg() writes to both the Falcon palette registers
> > and shifter_tt.color_reg[], so shouldn't the STE color palette contain
> > the correct colors, too?
>
> I don't think it will:
>
> The STe palette is set like this:
>
>                  shifter_tt.color_reg[regno] =
>                          (((red & 0xe) >> 1) | ((red & 1) << 3) << 8) |
>                          (((green & 0xe) >> 1) | ((green & 1) << 3) << 4) |
>                          ((blue & 0xe) >> 1) | ((blue & 1) << 3);
>
> with all colours downshifted by 12 bits already. Rewriting that in the
> same form as is used in falcon_setcolreg(), i.e. without the downshift:
>
>                  shifter_tt.color_reg[regno] =
>                          (((red & 0xe000) >> 13) | ((red & 1000) >> 9)
> << 8) |
>                          (((green & 0xe000) >> 13) | ((green & 1000) >>
> 9) << 4) |
>                          ((blue & 0xe000) >> 13) | ((blue & 1000) >> 9);
>
>
> Now look at falcon_setcolreg:
>
>                  shifter_tt.color_reg[regno] =
>                          (((red & 0xe000) >> 13) | ((red & 0x1000) >>
> 12) << 8) |
>                          (((green & 0xe000) >> 13) | ((green & 0x1000)
>  >> 12) << 4) |
>                          ((blue & 0xe000) >> 13) | ((blue & 0x1000) >> 12);
>
>
> My guess would be the two ought to be identical, assuming the STe
> palette registers provide backwards hardware compatibility.
>
> Either way, I think we've got operator precedence wrong here. Shift
> takes precedence over bitwise and / or? With that precedence, what we
> have in summary is
>
>                  shifter_tt.color_reg[regno] =
>                          (((red & 0xe000) >> 13) | ((red & 0x1000) >> 4)) |
>                          (((green & 0xe000) >> 13) | ((green & 0x1000)
>  >> 8)) |
>                          ((blue & 0xe000) >> 13) | ((blue & 0x1000) >> 12);
>
> Only the blue bits ever entirely seem to end up where they ought to.
> Testing this hypothesis on ARAnyM (without getting it to boot all the
> way, for some odd reason likely to do with my current .config) shows
> that the current code results in the shifter_tt.color_reg entries either
> 5 or 0x17, 0x113 or 0x117. Adding the missing parentheses results in
> what I'd expect to see.

Oops.

> This bug has been present since at least 2.4.30. I do recall seeing this
> odd blue console before on the Falcon, so it's been a real bug for ages.

I recall seeing an odd blue console before, too.
I always dismissed it as some artefact of redrawing the screen in
a different color mode, like we used to have when switching from a
16-color to a monochrome text console (remember the underlined text?).

Did/do you see it on the real Falcon, too?
Initially, I suspected the real Falcon always using the Falcon palette,
so the bug was never seen on real hardware. But the following comment
makes me think the colors have always been wrong if bpp == 2:

        /* 2 planes must use STE compatibility mode */
        par->hw.falcon.ste_mode = bpp == 2;

> Did the operator precedence change sometime since?

;-)

> >> As the problem is not 100% reproducible, it looks like a race condition
> >> in ARAnyM, or a wrong initialization order in atafb.
> >>
> >> I'd have to test this on hardware but haven't got fbset on the Falcon. I'll try to locate a binary.
> > Sorry, you do not need fbset to reproduce this:
> >
> >      echo N > /sys/class/graphics/fb0/bits_per_pixel
>
> Thanks, that's easy enough to try.
>
> Playing around with that command a bit, it does appear that the second
> switch after selecting depth 2 turns the console blue (regardless of
> what depth is set in that step). And the second switch after that (even
> if setting depth 2) restores normal colours. No race that I can see
> there, it's quite reproducible.

Yes, it is quite reproducible, but it doesn't always happen every
second switch. As my Atari DRM driver cannot switch mode on the fly,
I have to initialize the driver with the mode I want to use. Booting
with a mode with 2 bitplanes gives me the wrong colors in ca. 20%
of the cases. So it is random.

> Now what would cause us to miss every other palette update or depth change?

That's a good question! Why does ARAnyM sometimes decide to use the
Falcon palette, and sometimes the STe palette, and not only with
bpp == 2, but also with other color depths?

> I'll verify that the bug is gone once I've rebuilt with a sane .config.
> But I think we've got enough to fix at least the annoying STe palette
> bug. Unless you want to keep that alive until we've found out what
> causes us to miss odd updates...

And:

> I can confirm that the bug is gone with additional parentheses to apply
> the shifts (<<8 for red, <<4 for green) to the result of the bit-wise
> or, not just the right-hand portion of it.
>
> Do you want me to prepare a patch, or would you prefer to do it yourself?

Feel free to send a patch.
If you don't get to it, I'll make one, eventually.
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
