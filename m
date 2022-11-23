Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA5A9C433FE
	for <linux-m68k@archiver.kernel.org>; Wed, 23 Nov 2022 17:05:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236642AbiKWRFa (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 23 Nov 2022 12:05:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236452AbiKWRF3 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 23 Nov 2022 12:05:29 -0500
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35C8CB9622
        for <linux-m68k@lists.linux-m68k.org>; Wed, 23 Nov 2022 09:05:28 -0800 (PST)
Received: by mail-qv1-f53.google.com with SMTP id cz18so6213769qvb.13
        for <linux-m68k@lists.linux-m68k.org>; Wed, 23 Nov 2022 09:05:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZaUOlJ3sjB7IWYce0/bjUUBOp0Vg9o09HXSbd2ZFOCw=;
        b=7qrW3q0m+HZLYaRRI/w3IiOSdhFvSRrD8qyKuKFEwZdfN0CiUb0MENGgTPlpqq8eP6
         xzyex1RlTwfYfgfOH7ygWCDepxjsFEIpWomsRwctFeCU8jm99m4WscwdPO/2LS8Dbq2m
         kp+cqu2i/BeEnfLmjGlhW/kgIvk5Mc/WsgIAzOs9H7i5rLH0lByriLEtv+DjUVx0W/n6
         48rMaJBYrfWnYMPAm1Fa+ougcvM2duq/QMWtnuYtYkxeifcLvDCyFPZNyRSDnHGrL225
         2zlFWGfXbyKrycidSy/xnFALbsctRBlPG/29Of4m4f5LJlzDYsVeeUJl9luvupAcoD+6
         rsvQ==
X-Gm-Message-State: ANoB5pnXynLiTdVdIxIR5TTEX33E6Bq2ZbaoQeT5Wj4AaW/RW4fEr17T
        jTYC7vV+SS8F3i7HRRbGCvvUWNpMlMFFEg==
X-Google-Smtp-Source: AA0mqf5QRz1LPpfBqc5a7RJ3sj3nyMs/pmt+OwvYXWvXx7j+oH4VUzhTsA8/pjr+NwnvSk4Y8DFKxA==
X-Received: by 2002:a0c:8142:0:b0:4c6:1029:a36e with SMTP id 60-20020a0c8142000000b004c61029a36emr11684564qvc.90.1669223126714;
        Wed, 23 Nov 2022 09:05:26 -0800 (PST)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id n30-20020ac81e1e000000b003a50b9f099esm10193613qtl.12.2022.11.23.09.05.24
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 09:05:25 -0800 (PST)
Received: by mail-yb1-f181.google.com with SMTP id l67so2086692ybl.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 23 Nov 2022 09:05:24 -0800 (PST)
X-Received: by 2002:a25:9e84:0:b0:6de:6183:c5c3 with SMTP id
 p4-20020a259e84000000b006de6183c5c3mr9395618ybq.89.1669223124469; Wed, 23 Nov
 2022 09:05:24 -0800 (PST)
MIME-Version: 1.0
References: <3ee1f8144feb96c28742b22384189f1f83bcfc1a.1669221671.git.geert@linux-m68k.org>
 <Y35RCaEP0icg6San@phenom.ffwll.local>
In-Reply-To: <Y35RCaEP0icg6San@phenom.ffwll.local>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 23 Nov 2022 18:05:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVgqwHjm8Hxms04rg6YXiQacEwKiaRV80nNA_OM9mvZpA@mail.gmail.com>
Message-ID: <CAMuHMdVgqwHjm8Hxms04rg6YXiQacEwKiaRV80nNA_OM9mvZpA@mail.gmail.com>
Subject: Re: [PATCH resend v2] drm/fourcc: Add missing big-endian XRGB1555 and
 RGB565 formats
To:     Daniel Vetter <daniel@ffwll.ch>
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

Hi Daniel,

On Wed, Nov 23, 2022 at 5:57 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> On Wed, Nov 23, 2022 at 05:43:10PM +0100, Geert Uytterhoeven wrote:
> > As of commit eae06120f1974e1a ("drm: refuse ADDFB2 ioctl for broken
> > bigendian drivers"), drivers must set the
> > quirk_addfb_prefer_host_byte_order quirk to make the drm_mode_addfb()
> > compat code work correctly on big-endian machines.
> >
> > While that works fine for big-endian XRGB8888 and ARGB8888, which are
> > mapped to the existing little-endian BGRX8888 and BGRA8888 formats, it
> > does not work for big-endian XRGB1555 and RGB565, as the latter are not
> > listed in the format database.
> >
> > Fix this by adding the missing formats.  Limit this to big-endian
> > platforms, as there is currently no need to support these formats on
> > little-endian platforms.
> >
> > Fixes: 6960e6da9cec3f66 ("drm: fix drm_mode_addfb() on big endian machines.")
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > ---
> > v2:
> >   - Use "DRM_FORMAT_foo | DRM_FORMAT_BIG_ENDIAN" instead of
> >     "DRM_FORMAT_HOST_foo",
> >   - Turn into a lone patch, as all other patches from series
> >     https://lore.kernel.org/r/cover.1657300532.git.geert@linux-m68k.org
> >     were applied to drm-misc/for-linux-next.

> > --- a/drivers/gpu/drm/drm_fourcc.c
> > +++ b/drivers/gpu/drm/drm_fourcc.c
> > @@ -190,6 +190,10 @@ const struct drm_format_info *__drm_format_info(u32 format)
> >               { .format = DRM_FORMAT_BGRA5551,        .depth = 15, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
> >               { .format = DRM_FORMAT_RGB565,          .depth = 16, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
> >               { .format = DRM_FORMAT_BGR565,          .depth = 16, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
> > +#ifdef __BIG_ENDIAN
>
> Why do we need the #ifdef here? Iirc some hw has big endian flags in the
> scanout registers, so could supprt this unconditionally if there's no
> #ifdef around the format defines. Some drivers might then also want a
> DRM_FORMAT_FOO_BE define to simplify tables and stuff, but that's more a
> bikeshed.

 "Limit this to big-endian platforms, as there is currently no need
 to support these formats on little-endian platforms."

Will anyone make use of this? In theory, all of the 16-bpp formats
can have a big-endian counterpart.

I seem to be the first one running into this ;-)

> > +             { .format = DRM_FORMAT_XRGB1555 | DRM_FORMAT_BIG_ENDIAN, .depth = 15, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
> > +             { .format = DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN, .depth = 16, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
> > +#endif
> >               { .format = DRM_FORMAT_RGB888,          .depth = 24, .num_planes = 1, .cpp = { 3, 0, 0 }, .hsub = 1, .vsub = 1 },
> >               { .format = DRM_FORMAT_BGR888,          .depth = 24, .num_planes = 1, .cpp = { 3, 0, 0 }, .hsub = 1, .vsub = 1 },
> >               { .format = DRM_FORMAT_XRGB8888,        .depth = 24, .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1 },

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
