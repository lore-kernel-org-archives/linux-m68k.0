Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EA32C433EF
	for <linux-m68k@archiver.kernel.org>; Wed,  6 Jul 2022 09:17:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbiGFJRj (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 6 Jul 2022 05:17:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230008AbiGFJRi (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 6 Jul 2022 05:17:38 -0400
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29DA3B38
        for <linux-m68k@lists.linux-m68k.org>; Wed,  6 Jul 2022 02:17:35 -0700 (PDT)
Received: by mail-qt1-f181.google.com with SMTP id bs20so17373290qtb.11
        for <linux-m68k@lists.linux-m68k.org>; Wed, 06 Jul 2022 02:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N5bac8l9SxzDPCg8iINwZ/ihRJfBHL5uFQtEx4wJI88=;
        b=PJxxAJJNTYoxMNDdnZteYS2e8ji1kbESKNcSUAz8amrjMPm++uL9fGxd0Buby/ekwv
         kfiFBetud6SvPzb6fiI6TiiN57/zwsWqlyg1q1CnpvMbcH1PuUaf/HcYpBenehN3nKr/
         UAfcqYyeJ0NfhUJ9yIYa9RFdi1lGWbiyze+vL/gYc8i9PB4v/3SBZKG70+fD83MPE4br
         dMw2egnHB4Lj2Og1ivpGPu2BPrnF3/YdlRP567H4ztAp3y+neWbPYu+nDKGqgeB9hfgy
         xoM909VHdqQYL/c4U1GWLNCS5Cf6J9Jmxhf8uw6JI8cfPV314wbZ1/GG8FWKLEMl86XR
         xiRg==
X-Gm-Message-State: AJIora9jDPzHx9Dl6npCCVmLL7o51l5BimIJoNXAfA5C7o/97cG1shN9
        KvSQOg6wJ720qWC87SBzzx3wdihpTID2yQ==
X-Google-Smtp-Source: AGRyM1uwJn7oLWJA6BDjC81/AoAoVcUa3AtOe0mNEjwhhpGC5pVTem+RnhI6kXxlPZns4b/9SXJZfw==
X-Received: by 2002:ad4:5ccf:0:b0:470:4594:fcab with SMTP id iu15-20020ad45ccf000000b004704594fcabmr35398896qvb.33.1657099054225;
        Wed, 06 Jul 2022 02:17:34 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id u5-20020a37ab05000000b006b4748535a1sm5558055qke.16.2022.07.06.02.17.33
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 02:17:34 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id j7so19955915ybj.10
        for <linux-m68k@lists.linux-m68k.org>; Wed, 06 Jul 2022 02:17:33 -0700 (PDT)
X-Received: by 2002:a5b:6c1:0:b0:669:a7c3:4c33 with SMTP id
 r1-20020a5b06c1000000b00669a7c34c33mr42274477ybq.543.1657099053737; Wed, 06
 Jul 2022 02:17:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220628084903.3147123-1-yangyingliang@huawei.com>
In-Reply-To: <20220628084903.3147123-1-yangyingliang@huawei.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 6 Jul 2022 11:17:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV=YG_EMFO0jq7s4nH=VN3aWox3=+fWuF46HVHdWCDdMg@mail.gmail.com>
Message-ID: <CAMuHMdV=YG_EMFO0jq7s4nH=VN3aWox3=+fWuF46HVHdWCDdMg@mail.gmail.com>
Subject: Re: [PATCH -next v2] m68k: virt: platform: fix missing
 platform_device_unregister() on error in virt_platform_init()
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Jun 28, 2022 at 10:39 AM Yang Yingliang
<yangyingliang@huawei.com> wrote:
> Add the missing platform_device_unregister() before return
> from virt_platform_init() in the error handling case.
>
> Fixes: 05d51e42df06 ("m68k: Introduce a virtual m68k machine")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
> v2:
>   change for loop to while at lable err_unregister_rtc_virtio.

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v5.20 branch.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
