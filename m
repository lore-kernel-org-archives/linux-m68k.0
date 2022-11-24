Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1CFFC4332F
	for <linux-m68k@archiver.kernel.org>; Thu, 24 Nov 2022 08:56:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230119AbiKXI4M (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 24 Nov 2022 03:56:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230124AbiKXIzz (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 24 Nov 2022 03:55:55 -0500
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78F2310EA3E
        for <linux-m68k@lists.linux-m68k.org>; Thu, 24 Nov 2022 00:55:33 -0800 (PST)
Received: by mail-qv1-f51.google.com with SMTP id r15so126023qvm.6
        for <linux-m68k@lists.linux-m68k.org>; Thu, 24 Nov 2022 00:55:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ltDWhcn3gZTnH4uku4/njf53RbMuOe2j1J0ZvvamyfA=;
        b=OStwmbdIcIExj7T53QkyNtrS4deF9sKW+w/oRTfbJXrlFMsIk3vxbMRAptAUFk9lLD
         i3JPqE+hMXIQI1t4MkYSF+bXlYZURjbPtWMt93wV1eocdk2TGYgqILUtRoQeDSzR8C5t
         RsEvUDAo21CGiaV9QCy093uQTe0IGVwWDUcWjul0yhsHnyQJIm/Ff9dOPRO9+xyamldC
         pqu4XsRb3aX7Cmw2nvOKhM2KkS2VNujSM7+aXbOgBOpAnHVelgnNFHmmIQ9XdtcJf0i/
         xPW8FZ6AtN05rEY4Z6zZcJa2ECA8mS1Cf6B1XslxpcSEKW/AqLJozXYFKzMQzdbSK8qc
         i5/A==
X-Gm-Message-State: ANoB5pklavtPyj/vKbhzG3KaXXYC8KZhnr8T+z3ebmImJfZuTTjlP8M2
        sYnbLvih+AyAUDJ1Vn8/4szXCVGpHm124w==
X-Google-Smtp-Source: AA0mqf7QiA2d1nluTRnHr0/PsHWToSj18MDxzkaaBXKQbe0je004T3Q3pe9W02U6w28ftsruR0HxVA==
X-Received: by 2002:ad4:44a5:0:b0:4c6:b5b7:5715 with SMTP id n5-20020ad444a5000000b004c6b5b75715mr12554087qvt.91.1669280132223;
        Thu, 24 Nov 2022 00:55:32 -0800 (PST)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id f20-20020a05620a409400b006e16dcf99c8sm521279qko.71.2022.11.24.00.55.30
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Nov 2022 00:55:31 -0800 (PST)
Received: by mail-yb1-f181.google.com with SMTP id y83so1090667yby.12
        for <linux-m68k@lists.linux-m68k.org>; Thu, 24 Nov 2022 00:55:30 -0800 (PST)
X-Received: by 2002:a25:9e84:0:b0:6de:6183:c5c3 with SMTP id
 p4-20020a259e84000000b006de6183c5c3mr12337016ybq.89.1669280130150; Thu, 24
 Nov 2022 00:55:30 -0800 (PST)
MIME-Version: 1.0
References: <3ee1f8144feb96c28742b22384189f1f83bcfc1a.1669221671.git.geert@linux-m68k.org>
 <e2ef753e-8527-1fc6-f2f0-bc10aa744463@suse.de>
In-Reply-To: <e2ef753e-8527-1fc6-f2f0-bc10aa744463@suse.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 24 Nov 2022 09:55:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXHOGz6Q9jsp9+Y6Op5qw3E-qUnHzYv3rxkVO5Bd2bKjw@mail.gmail.com>
Message-ID: <CAMuHMdXHOGz6Q9jsp9+Y6Op5qw3E-qUnHzYv3rxkVO5Bd2bKjw@mail.gmail.com>
Subject: Re: [PATCH resend v2] drm/fourcc: Add missing big-endian XRGB1555 and
 RGB565 formats
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Gerd Hoffmann <kraxel@redhat.com>, linux-fbdev@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Thomas,

On Thu, Nov 24, 2022 at 9:47 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Am 23.11.22 um 17:43 schrieb Geert Uytterhoeven:
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
> >    - Use "DRM_FORMAT_foo | DRM_FORMAT_BIG_ENDIAN" instead of
> >      "DRM_FORMAT_HOST_foo",
> >    - Turn into a lone patch, as all other patches from series
> >      https://lore.kernel.org/r/cover.1657300532.git.geert@linux-m68k.org
> >      were applied to drm-misc/for-linux-next.
> > ---
> >   drivers/gpu/drm/drm_fourcc.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> > index e09331bb3bc73f21..265671a7f9134c1f 100644
> > --- a/drivers/gpu/drm/drm_fourcc.c
> > +++ b/drivers/gpu/drm/drm_fourcc.c
> > @@ -190,6 +190,10 @@ const struct drm_format_info *__drm_format_info(u32 format)
> >               { .format = DRM_FORMAT_BGRA5551,        .depth = 15, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
> >               { .format = DRM_FORMAT_RGB565,          .depth = 16, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
> >               { .format = DRM_FORMAT_BGR565,          .depth = 16, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
> > +#ifdef __BIG_ENDIAN
> > +             { .format = DRM_FORMAT_XRGB1555 | DRM_FORMAT_BIG_ENDIAN, .depth = 15, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
> > +             { .format = DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN, .depth = 16, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
>
> Getting back to the discussion on endianess, I don't understand why the
> BIG_ENDIAN flag is set here.  AFAIK these formats are always little
> endian.  And the BE flag is set by drivers/userspace if a framebuffer
> has a BE ordering.
>
> It would be better to filter the BE flag in __drm_format_info() before
> the function does the lookup.

I mentioned that alternative in [2], but rejected it because of the
disadvantages:
  - {,__}drm_format_info() returns a pointer to a const object,
    whose .format field won't have the DRM_FORMAT_BIG_ENDIAN flag set,
    complicating callers,
  - All callers need to be updated,
  - It is difficult to know which big-endian formats are really
    supported, especially as only a few are needed.

[2] [PATCH 1/3] drm/fourcc: Add missing big-endian XRGB1555 and RGB565 formats
https://lore.kernel.org/all/0744671ac096a12f0d538906bd324efa71b11400.1657300532.git.geert@linux-m68k.org

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
