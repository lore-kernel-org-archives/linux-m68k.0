Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFCF5C433EF
	for <linux-m68k@archiver.kernel.org>; Wed,  9 Mar 2022 13:10:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233002AbiCINLU (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 9 Mar 2022 08:11:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233000AbiCINLU (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 9 Mar 2022 08:11:20 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E786B1066D4
        for <linux-m68k@vger.kernel.org>; Wed,  9 Mar 2022 05:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646831420;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iAU44weXti04FLi2etjzVw+K+va7nBLkmB5FdNWAcI0=;
        b=Qts6y6mkBJ+4bYJpS7p4wGXZa76Kc2AnayiOhiAdZt0dECyWnS7Cxqc8PdOy6T1T5ASoX9
        mMoR5ZISsjgObAMqHUugHERgoxYN54+unx5XhxRxUoe6ACSJnva1v4ZH/ByvpLkfpBXXwT
        3wpqjRgCJS4fMgbOkcC+d6cBGfpJ/Sk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-53-VOqOVM8ZP0KnMqRVLinnzQ-1; Wed, 09 Mar 2022 08:10:18 -0500
X-MC-Unique: VOqOVM8ZP0KnMqRVLinnzQ-1
Received: by mail-wm1-f72.google.com with SMTP id o21-20020a05600c511500b003818c4b98b5so798693wms.0
        for <linux-m68k@vger.kernel.org>; Wed, 09 Mar 2022 05:10:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=iAU44weXti04FLi2etjzVw+K+va7nBLkmB5FdNWAcI0=;
        b=tAQbw4c5nyhCLTo713RWqnKi4tJEN3G8MN+bqQGS6+bsCGm0pSEehp+SRnXd/ukiWp
         yLgqHOBgnHdlHwQB49Kg1fqoFQoh/rubeTc51JW09uR2pvLhqMrhVFMdmJvyl0MuosQH
         I5ZKqN6DQGtWL4T704t11lnnaUgqbxThFwks0eBu/kNcLk8dCLH7vOl2vEXGkFShI0ZK
         y2MQQN+3NlaQPwPe6mlifeaEXy//Oz7+xB1n4Nu5Ea4Gs0m4MJI7Ef8cl9CcCATFkUqQ
         3XOO1iMTL+WVaHOCYzZvRkUVoA6WGil0nqbnOB0m7iMfebN0cOX3VW5cePGqi9qBoeNK
         1ogw==
X-Gm-Message-State: AOAM532HiZDA7o+vi/2nI2inMGl5v73o1pPtBcL1PwZ/Uw9m6sTe6VPS
        C1tf6yWP71wqkGh4yYsWxLmfNFCXPPgmiTIVziaegPpYhyUntGCuBSGuOIAB+lQn4bXDGOEnG88
        NsaMRCrHAIY4JMOWRi/lIoA==
X-Received: by 2002:a5d:4dc5:0:b0:1f0:73e4:2cd9 with SMTP id f5-20020a5d4dc5000000b001f073e42cd9mr15765177wru.212.1646831417443;
        Wed, 09 Mar 2022 05:10:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxvX2Au00DweT17gWXJkTfHnd/3tQIRGysI0fVMgShhCARC1khCEjjWT3sGgGyIigEkQZnnNQ==
X-Received: by 2002:a5d:4dc5:0:b0:1f0:73e4:2cd9 with SMTP id f5-20020a5d4dc5000000b001f073e42cd9mr15765152wru.212.1646831417244;
        Wed, 09 Mar 2022 05:10:17 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id 4-20020a056000154400b00203812ca383sm422698wry.78.2022.03.09.05.10.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Mar 2022 05:10:16 -0800 (PST)
Message-ID: <355f94c7-fc8a-7d92-5979-5b1b49c1d738@redhat.com>
Date:   Wed, 9 Mar 2022 14:10:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 06/10] drm/fb-helper: Add support for DRM_FORMAT_C[124]
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>, Helge Deller <deller@gmx.de>
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1646683502.git.geert@linux-m68k.org>
 <c665d6ba072f3debb3fa0a139454fefef6a55011.1646683502.git.geert@linux-m68k.org>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <c665d6ba072f3debb3fa0a139454fefef6a55011.1646683502.git.geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 3/7/22 21:52, Geert Uytterhoeven wrote:
> Add support for color-indexed frame buffer formats with two, four, and
> sixteen colors to the DRM framebuffer helper functions:
>   1. Add support for 1, 2, and 4 bits per pixel to the damage helper,
>   2. For color-indexed modes, the length of the color bitfields must be
>      set to the color depth, else the logo code may pick a logo with too
>      many colors.  Drop the incorrect DAC width comment, which
>      originates from the i915 driver.
>   3. Accept C[124] modes when validating or filling in struct
>      fb_var_screeninfo, and use the correct number of bits per pixel.
>   4. Set the visual to FB_VISUAL_PSEUDOCOLOR for all color-indexed
>      modes.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

[snip]

>  static void drm_fb_helper_fill_fix(struct fb_info *info, uint32_t pitch,
> -				   uint32_t depth)
> +				   bool is_color_indexed)
>  {
>  	info->fix.type = FB_TYPE_PACKED_PIXELS;
> -	info->fix.visual = depth == 8 ? FB_VISUAL_PSEUDOCOLOR :
> -		FB_VISUAL_TRUECOLOR;
> +	info->fix.visual = is_color_indexed ? FB_VISUAL_PSEUDOCOLOR
> +					    : info->fix.visual;

Shouldn't this be the following instead ?

  +	info->fix.visual = is_color_indexed ? FB_VISUAL_PSEUDOCOLOR
  +					    : FB_VISUAL_TRUECOLOR;

Other than that the patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

