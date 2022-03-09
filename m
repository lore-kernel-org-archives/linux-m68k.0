Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98AD4C433EF
	for <linux-m68k@archiver.kernel.org>; Wed,  9 Mar 2022 12:47:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232083AbiCIMr7 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 9 Mar 2022 07:47:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232839AbiCIMr5 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 9 Mar 2022 07:47:57 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 21C1017129F
        for <linux-m68k@vger.kernel.org>; Wed,  9 Mar 2022 04:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646830018;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oIOQIxDPG94ZGWbVYq8GHTXPCYDThRtLt2a1oXRhNkM=;
        b=PwYdTD/D8sN6aXeGDhvVIOpUuZERH3GkrXJY7gool/TY0ySOJP7R5LhbVxadn6kMimkXAl
        glfZtXAH0OWuOX4r2qbCHu+tybEtCRp+LAEz89mi+aufUjb4wb4EPqjIjdcqem9NGJ9zwg
        a178CORN9BFi5l7lPiIo5UiRjaj7kzo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-300-ijCwApB_NcCD5FcDVKMzTg-1; Wed, 09 Mar 2022 07:46:55 -0500
X-MC-Unique: ijCwApB_NcCD5FcDVKMzTg-1
Received: by mail-wm1-f72.google.com with SMTP id d8-20020a05600c34c800b0037e3cd6225eso751250wmq.6
        for <linux-m68k@vger.kernel.org>; Wed, 09 Mar 2022 04:46:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=oIOQIxDPG94ZGWbVYq8GHTXPCYDThRtLt2a1oXRhNkM=;
        b=YJGVAcx5ORV3GdOjT+8JIXTs3hEhiuqYTX7Eln7Ht1bzN0cxdw0QhImptToCQFd4Y4
         hZgeJDmy66Le/CMf6dsEkuEO4rVh3+8p8b2dGUU2hyHKDpr2sP4PYJ94RW7egMzCAiXw
         UxUpk9lOAbPMm49tXJUDFBnVu7GGc+VGrCx0I2Y8OFaePnopZKz4U6tZlXilxjGbFDIM
         SQB8T3qTVV+GTXqah5Nh2bQSZl9F3Z7LeMmxNnQiuZTxUuHyPhMW19qpRU9T1OmiZ3Dd
         5KN44qCy4xZDks/ZViGd0Trd2+RIpRuI7fpT0OZKcf7KvyBo0oyBwwUbz7jK1mmDSQD4
         C3/A==
X-Gm-Message-State: AOAM533BNv/Du8Ns+VFvIjPll3MCvUPfHWTevZuZnPxCa63/pX6XrWs/
        m7DIMWujgNTgrIVC96zCdO2jdYtGfOUmOEVNggv1XI7udKBGPvmcWL/ssHt68zbO86Vr4o/IF/p
        efysrG8pBq+vHGAPwzQhu6w==
X-Received: by 2002:a5d:5986:0:b0:1f1:f971:f02 with SMTP id n6-20020a5d5986000000b001f1f9710f02mr10080746wri.578.1646830013677;
        Wed, 09 Mar 2022 04:46:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzYK8FPaxzfg7PUDh96l/6CFuHhsdjJQ1VHODD7GNxUOFUkDD6tWylERnxyi/EG6sZs8v7gEQ==
X-Received: by 2002:a5d:5986:0:b0:1f1:f971:f02 with SMTP id n6-20020a5d5986000000b001f1f9710f02mr10080724wri.578.1646830013470;
        Wed, 09 Mar 2022 04:46:53 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id j7-20020a5d5647000000b0020372c969d9sm1673557wrw.29.2022.03.09.04.46.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Mar 2022 04:46:53 -0800 (PST)
Message-ID: <f6186885-5bcf-01a8-56f5-b87ad0b53e3e@redhat.com>
Date:   Wed, 9 Mar 2022 13:46:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 01/10] drm/fourcc: Add drm_format_info_bpp() helper
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
 <eab1fe866c0ffd4ac097e66ff48725dd39893105.1646683502.git.geert@linux-m68k.org>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <eab1fe866c0ffd4ac097e66ff48725dd39893105.1646683502.git.geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hello Geert,

On 3/7/22 21:52, Geert Uytterhoeven wrote:
> Add a helper to retrieve the actual number of bits per pixel for a
> plane, taking into account the number of characters and pixels per
> block for tiled formats.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---

Patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

