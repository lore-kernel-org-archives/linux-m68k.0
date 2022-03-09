Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1286AC433EF
	for <linux-m68k@archiver.kernel.org>; Wed,  9 Mar 2022 13:33:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232896AbiCINex (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 9 Mar 2022 08:34:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230323AbiCINew (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 9 Mar 2022 08:34:52 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1B60513CA0B
        for <linux-m68k@vger.kernel.org>; Wed,  9 Mar 2022 05:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646832833;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IOaaETwHyO6EXDP09qs4E16KNNpKkz6jydXWMB+nH2Q=;
        b=HM8d45OWCLZMG0sY2Crud5FiGlM7f5d0X2lGyPAtQt6LBSoWbk4PemWJj5cupKtaOhLhEe
        uMGEhVgdi5O1IU8rMuBknwE49OMiHWMOeW7VmFQw7nxEa8EbRgcysxy2KDzFj+BQ06L9ji
        neKPdQBi3slbOY+mnwKl0xChK/uK/Mg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-323-kWerDcVuMsSP1v7VcOou4g-1; Wed, 09 Mar 2022 08:33:52 -0500
X-MC-Unique: kWerDcVuMsSP1v7VcOou4g-1
Received: by mail-wr1-f71.google.com with SMTP id p18-20020adfba92000000b001e8f7697cc7so763831wrg.20
        for <linux-m68k@vger.kernel.org>; Wed, 09 Mar 2022 05:33:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IOaaETwHyO6EXDP09qs4E16KNNpKkz6jydXWMB+nH2Q=;
        b=DsXYjZpKpcbasNbJu4Hf9b0aBAHE1ZfXRYBYljgStiE8gVIVLJqlS3RynvzUCd3tzo
         i5tg7qdpOiN3hh/9wYkyOoxznOAf9yI+qjVeQui5LgyDeokS+X4GaCzSIzkC0Raw06Ts
         3KyYtYgyCiwYNx4G9f3QsGQa3NtEo+vOsnFLzbnp0rIdLnwm6qzZrBDMHDzzTBUxQoeB
         gWZkcv2trpOjpbpg4eYAu/lWHfPAJWvk1vtP02JXsUtV/UEF1aCZkjwYltvEG2mcW7aD
         74j2wcTB9RZd+BWX/LlG9hrEhWndk0dmiWEcvQEWAiAqRTOpCNhcNuSaZyXOECv/BA8H
         /OiQ==
X-Gm-Message-State: AOAM531UkTNX41++Tc/mNgfto3k5VC9iifQP/aPOBnryEKZYk+oJznPJ
        nNodzHwt9S5MWv1rtoy0dNaPgVWEMhcZ2CUaNOHgroP6D9+8ZMVNcV3H+Ze8T9QqQeK1Q+icc+F
        OFeoXvGvkql1oQagOQAQr8A==
X-Received: by 2002:a05:6000:18a4:b0:203:63e9:3e52 with SMTP id b4-20020a05600018a400b0020363e93e52mr7208808wri.192.1646832830935;
        Wed, 09 Mar 2022 05:33:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw39VeeJL2sLF2yNLhIAAzipl//IMHBr51izsAjQZj6VqCMsVOEfSQoR8CT5v/PXd09VKNfrg==
X-Received: by 2002:a05:6000:18a4:b0:203:63e9:3e52 with SMTP id b4-20020a05600018a400b0020363e93e52mr7208790wri.192.1646832830663;
        Wed, 09 Mar 2022 05:33:50 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id k14-20020a5d518e000000b002019c7402aasm1732693wrv.25.2022.03.09.05.33.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Mar 2022 05:33:42 -0800 (PST)
Message-ID: <88ae42f3-8e56-75e9-b1c0-abefe3496a8d@redhat.com>
Date:   Wed, 9 Mar 2022 14:33:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 RFC 08/10] drm/fourcc: Document that single-channel
 "red" can be any color
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
 <585dc03acb4016bba910e7d15fec3ef4f0aec5b0.1646683502.git.geert@linux-m68k.org>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <585dc03acb4016bba910e7d15fec3ef4f0aec5b0.1646683502.git.geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 3/7/22 21:52, Geert Uytterhoeven wrote:
> Traditionally, the first channel has been called the "red" channel, but
> the fourcc values for single-channel "red" formats can also be used for
> other light-on-dark displays, like grayscale.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---

Yes, I learned that "Red" actually meant just a color channel
that may not be red in one of the thread about fourcc formats.

So I agree that would be good to have a comment about this.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

