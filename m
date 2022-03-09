Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAB7AC433F5
	for <linux-m68k@archiver.kernel.org>; Wed,  9 Mar 2022 12:58:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232925AbiCIM7E (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 9 Mar 2022 07:59:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232915AbiCIM7D (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 9 Mar 2022 07:59:03 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0A4F14A932
        for <linux-m68k@vger.kernel.org>; Wed,  9 Mar 2022 04:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646830683;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dkHeos7H6tsu7tvMZnCFYXnCg8oFI8g7rvfuV0EJ3JA=;
        b=X8/Jri6eTuZ4p8PhUQmgsNFuj5slbm+Z8sKzHEAarUi2ZAdv7s2wGIoIOKwX5CJeWZDm0v
        CfVkBqySMndJ/8o8iAPJorQEHIQLQ5yX7M21Ux9WuKxAPXguuIkZSzWBzszejH9Dd3+0aY
        aXWgL4qGozxCjU0//j5pVM5hfmjuE3o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-189-W8Fu60ibOKycWU-3MXBqwQ-1; Wed, 09 Mar 2022 07:58:02 -0500
X-MC-Unique: W8Fu60ibOKycWU-3MXBqwQ-1
Received: by mail-wm1-f69.google.com with SMTP id c62-20020a1c3541000000b003815245c642so2552291wma.6
        for <linux-m68k@vger.kernel.org>; Wed, 09 Mar 2022 04:58:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dkHeos7H6tsu7tvMZnCFYXnCg8oFI8g7rvfuV0EJ3JA=;
        b=UxRAETOJcspMOyeo6+nH+yup7XdguEB4KjWhgg76iICo2Wh1V/TfMNFY6F9qPAQ6KT
         aSL0ikH/JQsP4C0bFW+iJwEgyzW706cDAiI4nlBtwNj+FsELxbyT7TD+GBZWcNmbtXbS
         BzFzwTrTZH+EtFWPmpuJ8guXrQjhXjIOLd00LxBZGlO1yVlWsFFVZuQX9CxI/uDGHb9Y
         Vc3o4l/sLWeVpUO2ZMW20g5R1eqoIgqnutHSIYclPNUgEuJbPGv44jJsp1cw9dpZKYv+
         dG5EVi7PKTjGfr7od6A/Vszi2X+i8tNxpua7tMQhXmp4MBxzcGACuvJKzox8sMPCtHTc
         uyLg==
X-Gm-Message-State: AOAM531yViKtVsZpl8WVrCcXcEBX7kVFpzz8NL4tm8I1bGG3hNHRTEjS
        PX6fO8NhNHIXagf/lx8FbX9/KEeIU0u2nFt0VK7e8I+BkKem6egtrGhZGvf7SrEpc9xn1xSXc32
        qkt+NcDu0NOF09Q6RBdGBKw==
X-Received: by 2002:a05:6000:186c:b0:1fa:a8d:28f4 with SMTP id d12-20020a056000186c00b001fa0a8d28f4mr9173037wri.518.1646830680807;
        Wed, 09 Mar 2022 04:58:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQnlg34BxAEh7TU1fkV4DgVunPqC5uWpf/4h/80ydvuzxxGu4LUiZbBIWm+zCntOJ+szdncg==
X-Received: by 2002:a05:6000:186c:b0:1fa:a8d:28f4 with SMTP id d12-20020a056000186c00b001fa0a8d28f4mr9173018wri.518.1646830680553;
        Wed, 09 Mar 2022 04:58:00 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id u10-20020adfa18a000000b001f04c24afe7sm1641218wru.41.2022.03.09.04.57.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Mar 2022 04:58:00 -0800 (PST)
Message-ID: <1de701d9-4de6-4652-d33d-95d82860bed9@redhat.com>
Date:   Wed, 9 Mar 2022 13:57:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 05/10] drm/fourcc: Add DRM_FORMAT_C[124]
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
 <8d3c0cc370b0214244b01a64c588e5e506531716.1646683502.git.geert@linux-m68k.org>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <8d3c0cc370b0214244b01a64c588e5e506531716.1646683502.git.geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 3/7/22 21:52, Geert Uytterhoeven wrote:
> Introduce fourcc codes for color-indexed frame buffer formats with two,
> four, and sixteen colors, and provide a mapping from bit per pixel and
> depth to fourcc codes.
> 
> As the number of bits per pixel is less than eight, these rely on proper
> block handling for the calculation of bits per pixel and pitch.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

