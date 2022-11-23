Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48BB9C46467
	for <linux-m68k@archiver.kernel.org>; Wed, 23 Nov 2022 17:09:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239227AbiKWRJy (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 23 Nov 2022 12:09:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239043AbiKWRJb (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 23 Nov 2022 12:09:31 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F00132D8
        for <linux-m68k@lists.linux-m68k.org>; Wed, 23 Nov 2022 09:09:29 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id fy37so4303549ejc.11
        for <linux-m68k@lists.linux-m68k.org>; Wed, 23 Nov 2022 09:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ao3E5mmZY2BE7Mq2QSnVGZzueBJmpG2ELG9Gjslte28=;
        b=kZshbUkmC1/2mIzv9SvCF2T8ZZGOYUBqkEiM4sX+iZt1o46GZhcQM9OYq6XElW0g5z
         kEyDrdr3Dz+DyrJayxX0Vmj3ks7rydZNR/b7QwoOwcPfgFutFPxhjtB+AkYMEVWFKa+y
         elcIJ46P2bUfy3ZmXouwAkiExxrp9P/DEkYT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ao3E5mmZY2BE7Mq2QSnVGZzueBJmpG2ELG9Gjslte28=;
        b=LcP8KjQmJkl0ZSKJuHC7CxbUQBEYqB5bo5kyhl+s9h30jFPqc7+J6ce3XdqHoUunRz
         EnLveOVIY8BoCGLVYoCc2sXv/Bb9vNWyOpRT3mO7ZBwensyZ9JpTDXLbgE3YTnwzrpa+
         HcXbROcCH6iLPfCkU7L0chAmHfnY5sz/buux8ACyWeKrCgfvHlXPVFQts1GiScM6VQAU
         ycuVB2XNBwLUscl67y5PI5ohjRUYi/uCovoculOSYwkGwdcPH6EvEBJ0K2incseUWzat
         aJ3Gv8kT39TQs1zqYROcS09CxrfC/4y0EE2FtrA7ckRf+81i8kRZF8xJJLu/eDmYuYHX
         kdfA==
X-Gm-Message-State: ANoB5pmewcmlIkP6R+4vH7hyJ0VL0wk4PdXSrn7Kd3fu7DVYlB+UB3Q1
        yicbY3mT20D10PVZQ3aK2nDgb3N0D0b4WUkESoKvTg==
X-Google-Smtp-Source: AA0mqf7BZptAmixt7PQIn7QpQ0HVh79KVXfZ3IbNEAtrwcfiJAbvQjnrikvew711NoBri5MqY3HfpWhY7RYoiqRxtlo=
X-Received: by 2002:a17:906:d7b8:b0:79f:9ff6:6576 with SMTP id
 pk24-20020a170906d7b800b0079f9ff66576mr23542543ejb.414.1669223368277; Wed, 23
 Nov 2022 09:09:28 -0800 (PST)
MIME-Version: 1.0
References: <3ee1f8144feb96c28742b22384189f1f83bcfc1a.1669221671.git.geert@linux-m68k.org>
 <Y35RCaEP0icg6San@phenom.ffwll.local> <CAMuHMdVgqwHjm8Hxms04rg6YXiQacEwKiaRV80nNA_OM9mvZpA@mail.gmail.com>
In-Reply-To: <CAMuHMdVgqwHjm8Hxms04rg6YXiQacEwKiaRV80nNA_OM9mvZpA@mail.gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Wed, 23 Nov 2022 18:09:16 +0100
Message-ID: <CAKMK7uHuwytyoxh145D1oT6-G-a0m8fDtP=da9hrfRVy3MzcXg@mail.gmail.com>
Subject: Re: [PATCH resend v2] drm/fourcc: Add missing big-endian XRGB1555 and
 RGB565 formats
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, 23 Nov 2022 at 18:05, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Daniel,
>
> On Wed, Nov 23, 2022 at 5:57 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Wed, Nov 23, 2022 at 05:43:10PM +0100, Geert Uytterhoeven wrote:
> > > As of commit eae06120f1974e1a ("drm: refuse ADDFB2 ioctl for broken
> > > bigendian drivers"), drivers must set the
> > > quirk_addfb_prefer_host_byte_order quirk to make the drm_mode_addfb()
> > > compat code work correctly on big-endian machines.
> > >
> > > While that works fine for big-endian XRGB8888 and ARGB8888, which are
> > > mapped to the existing little-endian BGRX8888 and BGRA8888 formats, it
> > > does not work for big-endian XRGB1555 and RGB565, as the latter are not
> > > listed in the format database.
> > >
> > > Fix this by adding the missing formats.  Limit this to big-endian
> > > platforms, as there is currently no need to support these formats on
> > > little-endian platforms.
> > >
> > > Fixes: 6960e6da9cec3f66 ("drm: fix drm_mode_addfb() on big endian machines.")
> > > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > > ---
> > > v2:
> > >   - Use "DRM_FORMAT_foo | DRM_FORMAT_BIG_ENDIAN" instead of
> > >     "DRM_FORMAT_HOST_foo",
> > >   - Turn into a lone patch, as all other patches from series
> > >     https://lore.kernel.org/r/cover.1657300532.git.geert@linux-m68k.org
> > >     were applied to drm-misc/for-linux-next.
>
> > > --- a/drivers/gpu/drm/drm_fourcc.c
> > > +++ b/drivers/gpu/drm/drm_fourcc.c
> > > @@ -190,6 +190,10 @@ const struct drm_format_info *__drm_format_info(u32 format)
> > >               { .format = DRM_FORMAT_BGRA5551,        .depth = 15, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
> > >               { .format = DRM_FORMAT_RGB565,          .depth = 16, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
> > >               { .format = DRM_FORMAT_BGR565,          .depth = 16, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
> > > +#ifdef __BIG_ENDIAN
> >
> > Why do we need the #ifdef here? Iirc some hw has big endian flags in the
> > scanout registers, so could supprt this unconditionally if there's no
> > #ifdef around the format defines. Some drivers might then also want a
> > DRM_FORMAT_FOO_BE define to simplify tables and stuff, but that's more a
> > bikeshed.
>
>  "Limit this to big-endian platforms, as there is currently no need
>  to support these formats on little-endian platforms."
>
> Will anyone make use of this? In theory, all of the 16-bpp formats
> can have a big-endian counterpart.
>
> I seem to be the first one running into this ;-)

It should make testing easier, at least for drivers that can be used
on both be and le platforms. But also, we can fix that whenever
someone actually asks for it, same that we can add the #define since
the full flag version is a bit long.

I'll apply the patch to drm-misc-next.
-Daniel

>
> > > +             { .format = DRM_FORMAT_XRGB1555 | DRM_FORMAT_BIG_ENDIAN, .depth = 15, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
> > > +             { .format = DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN, .depth = 16, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
> > > +#endif
> > >               { .format = DRM_FORMAT_RGB888,          .depth = 24, .num_planes = 1, .cpp = { 3, 0, 0 }, .hsub = 1, .vsub = 1 },
> > >               { .format = DRM_FORMAT_BGR888,          .depth = 24, .num_planes = 1, .cpp = { 3, 0, 0 }, .hsub = 1, .vsub = 1 },
> > >               { .format = DRM_FORMAT_XRGB8888,        .depth = 24, .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1 },
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
