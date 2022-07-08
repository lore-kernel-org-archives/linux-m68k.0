Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D7FC433EF
	for <linux-m68k@archiver.kernel.org>; Fri,  8 Jul 2022 19:36:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239777AbiGHTg1 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 8 Jul 2022 15:36:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239771AbiGHTg1 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 8 Jul 2022 15:36:27 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 51D4665D50
        for <linux-m68k@vger.kernel.org>; Fri,  8 Jul 2022 12:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657308985;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Bp4/uJx0q3CBRP6uPPQZJlkmcVebKMMiiHAd6ojauiM=;
        b=Nbby7OpVAtxuOSJM1DoD6m/6XEHExGTp3PMI1Ah3Sy/vAnVDe+IlVXjU1CepI+QkRU9b/D
        EIZOvJI4j0AHaG5ReKOUKs9pSUOBuOwbFdz/an74VS6K7Vvob9E9cyi7BBGLESYSyOkrzJ
        ItV6oQvg0vPbLvbVaKXuqUTFvOYaSk4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-220-C0uB0tGwMpiVN4gBjrupTQ-1; Fri, 08 Jul 2022 15:36:24 -0400
X-MC-Unique: C0uB0tGwMpiVN4gBjrupTQ-1
Received: by mail-ed1-f70.google.com with SMTP id n8-20020a05640205c800b00434fb0c150cso16538881edx.19
        for <linux-m68k@vger.kernel.org>; Fri, 08 Jul 2022 12:36:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Bp4/uJx0q3CBRP6uPPQZJlkmcVebKMMiiHAd6ojauiM=;
        b=alU3BsYhmXmDMUIuEZPCMGO5k2cFIuR3lcbLXHW2b3L2UFcnk6U82dfMg/QkrR9ge6
         cJETLvwkLnvl9v/8DOfJowS+WsZKrUTVF/u3cRRl0ui951lHCPfH/xa11Yac4IlbX/0L
         SjlWgwpUmyIHzSCE892R9c2AqvQtzIDescoHYIEOzfEnfBm3GFc1hX4n34xAOLCeL6l+
         YA+eTsMmbz7vjMAtvn/+EKBJRVBQNkMLUgfKyMU/5ZF8Wc0gRTZAprBJH9WM3DGCQ5PX
         Y2F1UPFi/Y3jwk+wmOtM5CpyYiYtP37PI6CPFKboxsJroTKQUPoQNQ3/jC1qa56aYUXE
         XjUA==
X-Gm-Message-State: AJIora85pE87RelTD5UZ7HPGbmQquKqoPvP8QdnJ7TXiPf0/9kKgo/3y
        OGuC53F/uk3d4OLVdf1msfGq7/yMxptUdl0gfgTq2GFF23avgz+HCiEwPoUTXF0EVV2JzNK6sJx
        w1Xr25YLivBWKrEuqoZUWow==
X-Received: by 2002:a17:906:84fa:b0:72b:3257:527b with SMTP id zp26-20020a17090684fa00b0072b3257527bmr894468ejb.477.1657308982250;
        Fri, 08 Jul 2022 12:36:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sHAlOPlSVNJxOUyi7dexo+dGkJEXRhxhmOBsygKoLu/bOnqki5Dcyoqj9A1H/3E27ZRhYkHA==
X-Received: by 2002:a17:906:84fa:b0:72b:3257:527b with SMTP id zp26-20020a17090684fa00b0072b3257527bmr894456ejb.477.1657308982085;
        Fri, 08 Jul 2022 12:36:22 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id p16-20020a05640210d000b0043a1bc2ebbcsm13332097edu.3.2022.07.08.12.36.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Jul 2022 12:36:21 -0700 (PDT)
Message-ID: <da9636ac-9455-75a6-7284-8c601d23a37e@redhat.com>
Date:   Fri, 8 Jul 2022 21:36:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 0/5] drm/modes: Command line mode selection fixes and
 improvements
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1657301107.git.geert@linux-m68k.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <cover.1657301107.git.geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

On 7/8/22 20:21, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> This patch series contains fixes and improvements for specifying video
> modes on the kernel command line.
> 
> This has been tested on ARAnyM using a work-in-progress Atari DRM driver
> (more info and related patches can be found in [1]).
> 
> Thanks for your comments!
> 
> [1] "[PATCH v3 00/10] drm: Add support for low-color frame buffer formats"
>     https://lore.kernel.org/r/cover.1657294931.git.geert@linux-m68k.org
> 
> Geert Uytterhoeven (5):
>   drm/modes: parse_cmdline: Handle empty mode name part
>   drm/modes: Extract drm_mode_parse_cmdline_named_mode()
>   drm/modes: parse_cmdline: Make mode->*specified handling more uniform
>   drm/modes: Add support for driver-specific named modes
>   drm/modes: parse_cmdline: Add support for named modes containing
>     dashes

Thanks, I have some remarks on patches 1/5 and 2/5 the rest looks
good to me. 

For 1/5 and 2/5 with my remarks addressed:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

For 3/5, 4/5 and 5/5:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

> 
>  drivers/gpu/drm/drm_modes.c | 57 ++++++++++++++++++++++++++-----------
>  include/drm/drm_connector.h | 10 +++++++
>  2 files changed, 50 insertions(+), 17 deletions(-)
> 

