Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA39C433F5
	for <linux-m68k@archiver.kernel.org>; Wed,  9 Mar 2022 12:53:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232877AbiCIMyc (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 9 Mar 2022 07:54:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232827AbiCIMyb (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 9 Mar 2022 07:54:31 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A4D00CD33F
        for <linux-m68k@vger.kernel.org>; Wed,  9 Mar 2022 04:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646830411;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bHT0karyGRRNCWlLhVHNQSuvHWxMwLXpGfkux8ifP78=;
        b=R2VUHs2NCk94AHnPYs7LPS6DP7hfg+Eo/SwlLkxtCkB776QPvmj3F6DLNFnN6QSUPSC0Mu
        5GkRLx5WY9KJkWtwkriZVbt0vWmkV9EuGoaU2GB8ZFUqx+Y9POXktNPmhiO0zNIh0Gj10W
        u2tpn8hzGf/ZFJ4KSXmthCA6hTpXHEc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-5Yvujg7iPDmBEDQqYRx9JQ-1; Wed, 09 Mar 2022 07:53:29 -0500
X-MC-Unique: 5Yvujg7iPDmBEDQqYRx9JQ-1
Received: by mail-wm1-f72.google.com with SMTP id 187-20020a1c19c4000000b0037cc0d56524so2561549wmz.2
        for <linux-m68k@vger.kernel.org>; Wed, 09 Mar 2022 04:53:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=bHT0karyGRRNCWlLhVHNQSuvHWxMwLXpGfkux8ifP78=;
        b=NK6da4o6NskU7KZFIqg8ytYcU7DrXlIfs0cNlaFBlztTRhKtNAnKJb32WgMyoXU14b
         Sjco0eyU/ku8ULsKdHdnxnJwMSBrAcJQCjzt6QY8/lu5mLe4OBvU35XkoLpI18O3C0EN
         O8bDtUoBWc6h8Xe7b9JGAXA18eNnMYIYoCvLa96h7UGwqOTnbxa8Abh5MD3sV6gdCkTB
         Xdv0YYwe6EETrXi1kzD4bdd2z0YT+WLBZ/I4qGDPo5Ycz6+zqrbhEAKDxkPvCFSSi5l+
         fa8UE/L3LxpXDI9Xm2ZpNz64+5bZcQHVlOyXMahRhXLYWxATQVVpYgELfTqjdJ8q36wP
         GWEw==
X-Gm-Message-State: AOAM531+9ozL8aGiPTCdExxwlirGpOgM6Nl4w5YWx0Fy+HnDQ5WHgOOU
        PyOVpQVdk+zQdx5uku/wE+kI5RH/0T/j4sSQbbzOATWQbbr5kuh5oqZsZ/zXgWFqpfPuo8Lo8vD
        T8FF/jSDAFgfObDCSa+Y2Kw==
X-Received: by 2002:a05:600c:4f8f:b0:383:d0b:3706 with SMTP id n15-20020a05600c4f8f00b003830d0b3706mr3328424wmq.117.1646830407593;
        Wed, 09 Mar 2022 04:53:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwhA94T4hLNZGfPp9ZlHTC1cFNUMD4hfeN8kfLp3ziXcsrKaa2MDMubqSWEOGZcY5C6vhou4g==
X-Received: by 2002:a05:600c:4f8f:b0:383:d0b:3706 with SMTP id n15-20020a05600c4f8f00b003830d0b3706mr3328411wmq.117.1646830407398;
        Wed, 09 Mar 2022 04:53:27 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id l25-20020a1c7919000000b0038999b380e9sm1663075wme.38.2022.03.09.04.53.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Mar 2022 04:53:27 -0800 (PST)
Message-ID: <7d9b2035-13d6-5d58-e21c-52bbb9282796@redhat.com>
Date:   Wed, 9 Mar 2022 13:53:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 04/10] drm/framebuffer: Use actual bpp for
 DRM_IOCTL_MODE_GETFB
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
 <d87068fd1e2cc6f772a64ba9306350a31baeae58.1646683502.git.geert@linux-m68k.org>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <d87068fd1e2cc6f772a64ba9306350a31baeae58.1646683502.git.geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 3/7/22 21:52, Geert Uytterhoeven wrote:
> When userspace queries the properties of a frame buffer, the number of
> bits per pixel is derived from the deprecated drm_format_info.cpp[]
> field, which does not take into account block sizes.
> 
> Fix this by using the actual number of bits per pixel instead.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

