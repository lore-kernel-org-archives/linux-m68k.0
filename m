Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB65BC433FE
	for <linux-m68k@archiver.kernel.org>; Wed, 23 Nov 2022 16:57:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238190AbiKWQ5z (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 23 Nov 2022 11:57:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239181AbiKWQ5x (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 23 Nov 2022 11:57:53 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D638511468
        for <linux-m68k@lists.linux-m68k.org>; Wed, 23 Nov 2022 08:57:49 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id n20so44278689ejh.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 23 Nov 2022 08:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hFKqZTl4RtIl30rJqqAYvqPwyem5G682ko73DknjdgY=;
        b=k2PnazPpTvSnPABOo6lfH5X1HbGLc9wzfq5h/pclEDS5l8Iy1NYfKPgVW0YQd9kxw+
         6f5qQ8ogIhHCNYvR3lfoz2OiwI4Lf531V8lo7+kvUBvlP0lyQy4gkEeIzbEvbqhIV33w
         OCwHJWJ1x1L63rXrMBpLy+Ciwref/elZRr7rU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hFKqZTl4RtIl30rJqqAYvqPwyem5G682ko73DknjdgY=;
        b=dJf5NPtR5B30ymzXNi5RG3sCEXLmhQezFlITEkstUUt+jpZlzDqO0fW8JXrdJhjPDv
         9IB8nYGRr37TO2RQ2EnUwXH6pQR6xeDSnnCMNoRApcqHlX9s6cV3sb/SyWPVVDFA9SkG
         TWq0CeMOefGJzZ2CL83L7hYjH616tzYrAqd44pzUN8CrPiF48yt7xVl0EYKjRDMSROqH
         NsBW1+eenSx+7xIOKsAjq98XxIcB8uu6b0Fj37MydQDEaIEKaoesvN2G2Rtp2dl2McJf
         0ZDC4Ose/vAjtLNpJfxLMkjPQIOMIXKp4oNZ8hKDc92ieHjXNA3a+aVta9RCRHZ3gXhP
         vTKQ==
X-Gm-Message-State: ANoB5pkdk3uUeT+FE5VHA8vl3Z6vI0FKQG+eOUWUYGxCIOTaftX+llXk
        RI6yjCSzk+050h5AdCFiH5gvtw==
X-Google-Smtp-Source: AA0mqf6WrDr1QvInvmVvDmNDf44j62kVoSTB0WZqdK0yPllHZ4HC2FqE+Uu7Ty4iExehi06Y9RLrEw==
X-Received: by 2002:a17:906:9e20:b0:7af:206:9327 with SMTP id fp32-20020a1709069e2000b007af02069327mr24764978ejc.154.1669222668021;
        Wed, 23 Nov 2022 08:57:48 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net. [212.51.149.33])
        by smtp.gmail.com with ESMTPSA id k5-20020a17090627c500b00773f3ccd989sm7434902ejc.68.2022.11.23.08.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 08:57:47 -0800 (PST)
Date:   Wed, 23 Nov 2022 17:57:45 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Gerd Hoffmann <kraxel@redhat.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH resend v2] drm/fourcc: Add missing big-endian XRGB1555
 and RGB565 formats
Message-ID: <Y35RCaEP0icg6San@phenom.ffwll.local>
Mail-Followup-To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
References: <3ee1f8144feb96c28742b22384189f1f83bcfc1a.1669221671.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ee1f8144feb96c28742b22384189f1f83bcfc1a.1669221671.git.geert@linux-m68k.org>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Nov 23, 2022 at 05:43:10PM +0100, Geert Uytterhoeven wrote:
> As of commit eae06120f1974e1a ("drm: refuse ADDFB2 ioctl for broken
> bigendian drivers"), drivers must set the
> quirk_addfb_prefer_host_byte_order quirk to make the drm_mode_addfb()
> compat code work correctly on big-endian machines.
> 
> While that works fine for big-endian XRGB8888 and ARGB8888, which are
> mapped to the existing little-endian BGRX8888 and BGRA8888 formats, it
> does not work for big-endian XRGB1555 and RGB565, as the latter are not
> listed in the format database.
> 
> Fix this by adding the missing formats.  Limit this to big-endian
> platforms, as there is currently no need to support these formats on
> little-endian platforms.
> 
> Fixes: 6960e6da9cec3f66 ("drm: fix drm_mode_addfb() on big endian machines.")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> v2:
>   - Use "DRM_FORMAT_foo | DRM_FORMAT_BIG_ENDIAN" instead of
>     "DRM_FORMAT_HOST_foo",
>   - Turn into a lone patch, as all other patches from series
>     https://lore.kernel.org/r/cover.1657300532.git.geert@linux-m68k.org
>     were applied to drm-misc/for-linux-next.
> ---
>  drivers/gpu/drm/drm_fourcc.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index e09331bb3bc73f21..265671a7f9134c1f 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -190,6 +190,10 @@ const struct drm_format_info *__drm_format_info(u32 format)
>  		{ .format = DRM_FORMAT_BGRA5551,	.depth = 15, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
>  		{ .format = DRM_FORMAT_RGB565,		.depth = 16, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
>  		{ .format = DRM_FORMAT_BGR565,		.depth = 16, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
> +#ifdef __BIG_ENDIAN

Why do we need the #ifdef here? Iirc some hw has big endian flags in the
scanout registers, so could supprt this unconditionally if there's no
#ifdef around the format defines. Some drivers might then also want a
DRM_FORMAT_FOO_BE define to simplify tables and stuff, but that's more a
bikeshed.

Otherwise this makes sense to me.
-Daniel

> +		{ .format = DRM_FORMAT_XRGB1555 | DRM_FORMAT_BIG_ENDIAN, .depth = 15, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
> +		{ .format = DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN, .depth = 16, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
> +#endif
>  		{ .format = DRM_FORMAT_RGB888,		.depth = 24, .num_planes = 1, .cpp = { 3, 0, 0 }, .hsub = 1, .vsub = 1 },
>  		{ .format = DRM_FORMAT_BGR888,		.depth = 24, .num_planes = 1, .cpp = { 3, 0, 0 }, .hsub = 1, .vsub = 1 },
>  		{ .format = DRM_FORMAT_XRGB8888,	.depth = 24, .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1 },
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
