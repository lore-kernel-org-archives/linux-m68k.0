Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0AAFC433EF
	for <linux-m68k@archiver.kernel.org>; Wed,  9 Mar 2022 13:16:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233043AbiCINRZ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 9 Mar 2022 08:17:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233035AbiCINRZ (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 9 Mar 2022 08:17:25 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 82BAE17224B
        for <linux-m68k@vger.kernel.org>; Wed,  9 Mar 2022 05:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646831785;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9L4wXSzrzpGMIVEQW9rtUhalBtem2aX0icrd1WDGeA0=;
        b=TkP7KNWluANN8eo7El/ggpBqaotJA48FRSHZmko3g6GOdHCgSMV736ezgKTyOnocJ5UOCs
        5JjCpqvfvPfx57wQ3zYo2w1hgYXNxKXbCKdNcIrsq397ppfHI3fH38/CQv/dQdnnIfx8Qz
        fPdwgZjwK2+1j0o3/sOeA9SpUEx3tFw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-487-04cgFAxoM1GxvdNXd6nujg-1; Wed, 09 Mar 2022 08:16:24 -0500
X-MC-Unique: 04cgFAxoM1GxvdNXd6nujg-1
Received: by mail-wr1-f70.google.com with SMTP id f9-20020a5d58e9000000b001f0247e5e96so750833wrd.15
        for <linux-m68k@vger.kernel.org>; Wed, 09 Mar 2022 05:16:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9L4wXSzrzpGMIVEQW9rtUhalBtem2aX0icrd1WDGeA0=;
        b=k+tDKEGTw/6FU5tylhY4k0mFOoDyndJfCJ0as52nKSeQe5mwbLrZ83hRzVNv5WEP5H
         HDLRuP51eqzITqxWiyivZCwuuYX7wH6Ct6u9P/pPfy9OM30aAuyDW1TApRTEsAMMBQtV
         5YpT7QOXcIG3CBKmtW2RQg1UymhIU6tjsSQuiu4+iEajmDInGAtwH7yo1m8JbKvL/ZNO
         HQHAkrap6IxIulssFDUy30sb38EHIVc0yO2p/a/tA7IfLjpDa5rNG5rHEzfH9qsYFzdT
         C136f2yF4ebdbRtLaaZyb3rPpqmcQZPmVkBLlc0fo2OSOtpTY3kjWAg/MP2LVb4davIu
         iL6g==
X-Gm-Message-State: AOAM530k3MxHvr4AoyLkmyZe1SUzy5LymsnXLMnzk5lBFCAzvR1zo0qG
        fnvhlSLYZ7TPJ/2Yw1i0l0wqOQAm67qFQ7sFZ+u3BE75MPVAsL//XzxQCaTm65eKd1RXMmsdAkf
        Hx0eMaP1I11WHCd6h6rEMfQ==
X-Received: by 2002:a1c:a4c6:0:b0:389:7269:5044 with SMTP id n189-20020a1ca4c6000000b0038972695044mr3162293wme.129.1646831782862;
        Wed, 09 Mar 2022 05:16:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLVGtK4mTCwqDFDUxuBL3MHtSqW+jHIdMFxcBe9+YpVz8cxRLKpK8ygkT8GVaau+FzvEgBlw==
X-Received: by 2002:a1c:a4c6:0:b0:389:7269:5044 with SMTP id n189-20020a1ca4c6000000b0038972695044mr3162281wme.129.1646831782620;
        Wed, 09 Mar 2022 05:16:22 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id t184-20020a1c46c1000000b003814de297fcsm4964440wma.16.2022.03.09.05.16.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Mar 2022 05:16:19 -0800 (PST)
Message-ID: <d9d8b17a-26a2-3c34-7308-539d5b08454f@redhat.com>
Date:   Wed, 9 Mar 2022 14:16:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 RFC 07/10] drm/gem-fb-helper: Use actual bpp for size
 calculations
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
 <842ab0a286ff743b625277e655d9bef505b630c1.1646683502.git.geert@linux-m68k.org>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <842ab0a286ff743b625277e655d9bef505b630c1.1646683502.git.geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 3/7/22 21:52, Geert Uytterhoeven wrote:
> The AFBC helpers derive the number of bits per pixel from the deprecated
> drm_format_info.cpp[] field, which does not take into account block
> sizes.
> 
> Fix this by using the actual number of bits per pixel instead.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> RFC, as this code path was untested.
>

Looks good to me but haven't tested either.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

