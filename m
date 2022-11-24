Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A396DC433FE
	for <linux-m68k@archiver.kernel.org>; Thu, 24 Nov 2022 08:03:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbiKXIDN (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 24 Nov 2022 03:03:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbiKXIDN (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 24 Nov 2022 03:03:13 -0500
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB2C0B9615
        for <linux-m68k@lists.linux-m68k.org>; Thu, 24 Nov 2022 00:03:07 -0800 (PST)
Received: by mail-qk1-f177.google.com with SMTP id x18so573915qki.4
        for <linux-m68k@lists.linux-m68k.org>; Thu, 24 Nov 2022 00:03:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NxhodYFDmdQqVB4ltzcytu+P4hXGUv/V9/mCUnkpmmg=;
        b=I/tTvtzNk3craAK7IKP3SfkRkWOYjz9RsfMOCNOW6kvrdmfH+fOM8co3A2ub6+AeTc
         5FwdO3I6x04k5GWatMz6OpdVTdnkqe3U/DdVT6KlH1PurdpT4i6t5HXWCTBVntWr5BZM
         flpgrfQj5bl31ibCjqren9hhJzxAjL4B9biGgDwO/i48DU29KGitYVa3O4iYWMWTPfR2
         7t3jk8Oev1iLfm7zAs8bvnIEqNJX0gxi/mqTW/TWgCwXvGKLPd/YeHroKelupakm31s4
         yYbXt3jyKEbZrVE811MjhlOMHCuDjEW8ch736Waj5LRH9CUJJfVfIgZyG8f64NS3HzP6
         MAtA==
X-Gm-Message-State: ANoB5pmCUhmJLq1AmVL+o7ZUJsYNOh7LsDndPpCXlAN7aen0txPRwZsT
        zxkCtX8g/WA6E6ow9Bq3ufsMjZhuGI7uyg==
X-Google-Smtp-Source: AA0mqf7olOhtMrMsOfoNE6DRnxQxQ2dYRnLqGW6pSpJL/ZkT/K7Gd88reuhlUUZxI1yBfTyZw30n6w==
X-Received: by 2002:a05:620a:1e9:b0:6f9:fe9e:8920 with SMTP id x9-20020a05620a01e900b006f9fe9e8920mr15412749qkn.154.1669276986445;
        Thu, 24 Nov 2022 00:03:06 -0800 (PST)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id g9-20020ac842c9000000b003a62dcf09f0sm275129qtm.6.2022.11.24.00.03.05
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Nov 2022 00:03:05 -0800 (PST)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-3b1ef5dac4fso8580897b3.5
        for <linux-m68k@lists.linux-m68k.org>; Thu, 24 Nov 2022 00:03:05 -0800 (PST)
X-Received: by 2002:a81:f80f:0:b0:38e:e541:d8ca with SMTP id
 z15-20020a81f80f000000b0038ee541d8camr29389264ywm.283.1669276985156; Thu, 24
 Nov 2022 00:03:05 -0800 (PST)
MIME-Version: 1.0
References: <3ee1f8144feb96c28742b22384189f1f83bcfc1a.1669221671.git.geert@linux-m68k.org>
 <Y35RCaEP0icg6San@phenom.ffwll.local> <CAMuHMdVgqwHjm8Hxms04rg6YXiQacEwKiaRV80nNA_OM9mvZpA@mail.gmail.com>
 <20221124065148.7v4m3qli2k74mic6@sirius.home.kraxel.org>
In-Reply-To: <20221124065148.7v4m3qli2k74mic6@sirius.home.kraxel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 24 Nov 2022 09:02:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUJUUPPxS6VCHV1X9XMqzfACvu8qivUVO2pMbvD7rcQKg@mail.gmail.com>
Message-ID: <CAMuHMdUJUUPPxS6VCHV1X9XMqzfACvu8qivUVO2pMbvD7rcQKg@mail.gmail.com>
Subject: Re: [PATCH resend v2] drm/fourcc: Add missing big-endian XRGB1555 and
 RGB565 formats
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Gerd,

On Thu, Nov 24, 2022 at 8:29 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > > > +#ifdef __BIG_ENDIAN
> > >
> > > Why do we need the #ifdef here? Iirc some hw has big endian flags in the
> > > scanout registers, so could supprt this unconditionally if there's no
> > > #ifdef around the format defines. Some drivers might then also want a
> > > DRM_FORMAT_FOO_BE define to simplify tables and stuff, but that's more a
> > > bikeshed.
> >
> >  "Limit this to big-endian platforms, as there is currently no need
> >  to support these formats on little-endian platforms."
> >
> > Will anyone make use of this? In theory, all of the 16-bpp formats
> > can have a big-endian counterpart.
>
> Highly unlikely.  Dealing with 16-bpp formats in non-native byte order
> is a PITA because it isn't enough to simply adjust the masks and shifts
> to pick the correct bits and be done with it.
>
> The qemu stdvga happens to have a register to switch framebuffer
> byteorder (so both x64 and ppc are happy), and the bochs drm driver
> actually supports that no matter what the cpu byte order is, but it
> supports only DRM_FORMAT_XRGB8888 + DRM_FORMAT_BGRX8888.
>
> Supporting 16 bpp in the driver wouldn't be that much of a problem, but
> processing the framebuffer on the host side when emulating a big endian
> guest on a little endian host is painful.  I think I can't ask pixman to
> do a conversation from DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN to
> DRM_FORMAT_XRGB8888 on a little endian machine.

Indeed. But you can do a quick 16-bit byteswap, and convert from
DRM_FORMAT_RGB565 to DRM_FORMAT_XRGB8888?

There's a similar issue with Cairo, cfr. '[PATCH libdrm v2 08/10]
util: Fix pwetty on big-endian"[1].

BTW, does pixman support converting DRM_FORMAT_RGB565 to
DRM_FORMAT_XRGB8888 on a big-endian machine?

[1] https://lore.kernel.org/all/e8597038478f12e9eda5e86b309b52988f69f2eb.1657302103.git.geert@linux-m68k.org

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
