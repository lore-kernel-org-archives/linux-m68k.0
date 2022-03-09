Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18CB0C433FE
	for <linux-m68k@archiver.kernel.org>; Wed,  9 Mar 2022 13:39:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233235AbiCINkd (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 9 Mar 2022 08:40:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233226AbiCINkc (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 9 Mar 2022 08:40:32 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EE6934C7B2
        for <linux-m68k@vger.kernel.org>; Wed,  9 Mar 2022 05:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646833173;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hxJPMn5J6L7pDstxJt5mOgE1pVrNFlShCuIhtS3CI8s=;
        b=Lx5ZjCUVAqynsB5TbUtsiYYRieWoceUnLBUd39Y1Ssoz9tuX9Yv0Cw4ABP7WBJfPqpMspx
        kU3i8+fiQ/Cngoby/DSe1Tf8WNsabEV6H5gLAuJVAkpyUv3Al6z90lRH5J1Sopx4dHcNfV
        fYMq2iinFvv6RSTykpGmi5H0slzDHEM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-n2SDijtdPGGYjDlZE1T1UQ-1; Wed, 09 Mar 2022 08:39:30 -0500
X-MC-Unique: n2SDijtdPGGYjDlZE1T1UQ-1
Received: by mail-wm1-f70.google.com with SMTP id h206-20020a1c21d7000000b003552c13626cso2606075wmh.3
        for <linux-m68k@vger.kernel.org>; Wed, 09 Mar 2022 05:39:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hxJPMn5J6L7pDstxJt5mOgE1pVrNFlShCuIhtS3CI8s=;
        b=f5OTAvVPkDxPCar3/TvNmsEEaUGDgVCLEcyExD+7oNg7Nv1eswKV3J6zSM+8jk3cJD
         SQsyD++HlU/eHVyqlqrg/lKq6POinrq44sU9AJAQEaQ1f0xgkknF0b123ESOrEBp3OrB
         bwp+lnIoT5HeYKnq0tle2AJaJxZo4axHLgP3LqP0ib2uJLi6OrPregRXAWN1zsSavEky
         Yn6OLLv/zgZyFYNY2xESzy3sLE3fCMnW8jmsb5g7ib1P8fAhvt3wKlaxnsmTRRtVuaSL
         D0X0lUMK4WMhHBaBoqhtXAZyH7BPRSJIPUWJCjv4hJ0QAh60O+9BTYhRHHCsReIguJLm
         Q+fg==
X-Gm-Message-State: AOAM531TRoh8xyTVaXnBs0tTbyixN2ZrYK4DiqVhAgYWt9kwYc/NjpbF
        pG79wDLQ3GoBho5mMGrOTt6NEf6PLoWntiaD70DKrI4lHRvniXhT4uI7M7Tc6x1DdyKrawLunWa
        Y1MKMHFAh2VForuewkWKUPw==
X-Received: by 2002:a1c:6a01:0:b0:37f:1b18:6b17 with SMTP id f1-20020a1c6a01000000b0037f1b186b17mr7467018wmc.146.1646833169797;
        Wed, 09 Mar 2022 05:39:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyUiXVqoM47oNz6ncRVRIq/E3m1+h7KnHuneTo0rnDdEN8qOnGhuo4BXntkJRz7KSBVfpVw1Q==
X-Received: by 2002:a1c:6a01:0:b0:37f:1b18:6b17 with SMTP id f1-20020a1c6a01000000b0037f1b186b17mr7466991wmc.146.1646833169595;
        Wed, 09 Mar 2022 05:39:29 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id y10-20020adfee0a000000b001f0639001ffsm2618429wrn.9.2022.03.09.05.39.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Mar 2022 05:39:29 -0800 (PST)
Message-ID: <d1003594-dc26-23d4-a402-2951b3ed395d@redhat.com>
Date:   Wed, 9 Mar 2022 14:39:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 RFC 09/10] drm/fourcc: Add DRM_FORMAT_R[124]
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
 <98c062f1b5c71427d5ba6c7bca706d04b1892162.1646683502.git.geert@linux-m68k.org>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <98c062f1b5c71427d5ba6c7bca706d04b1892162.1646683502.git.geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 3/7/22 21:52, Geert Uytterhoeven wrote:
> Introduce fourcc codes for single-channel light-on-dark frame buffer
> formats with two, four, and sixteen intensity levels.
> 
> As the number of bits per pixel is less than eight, these rely on proper
> block handling for the calculation of bits per pixel and pitch.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---

IIRC the agreement was that it was worth to have both Cx and Rx fourcc
formats separately, so this patch makes sense to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

