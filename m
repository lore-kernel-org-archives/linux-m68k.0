Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 064A6C48BDF
	for <linux-m68k@archiver.kernel.org>; Sun, 20 Jun 2021 19:27:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D44546008E
	for <linux-m68k@archiver.kernel.org>; Sun, 20 Jun 2021 19:27:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229872AbhFTT3h (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 20 Jun 2021 15:29:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229708AbhFTT3h (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 20 Jun 2021 15:29:37 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36192C061574
        for <linux-m68k@vger.kernel.org>; Sun, 20 Jun 2021 12:27:24 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id t8so1729628pfe.3
        for <linux-m68k@vger.kernel.org>; Sun, 20 Jun 2021 12:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=K1gezZuzsPIMoRYss94+kL0BlWmfjLIzGb0Zmmjc45o=;
        b=BVNytNkrlnl05tNtEGDRp5/hsLsuqfHeijbZ4rxXgvxldpfbDxz1SxwK1vgkZKFcqY
         07d/8Gc/8uH8EEcWL1JbvO0Z/k048r43nv32Cc+x0yYwlMCXocqoJ3hoh4ZpsUAAqa0v
         RMN9+Nq/E1f1Q5tu9LMoXKua7jQUQ+yOhdCssxytDM1mZ96/iQ++0lDOsUSD3EF6VN3M
         pEyrotnWu9kmy3qmnH07K6notpTaIunytcirClb2ILCOZVB0GFywknz9Jk8+29xBX5M7
         tNALNYPkw39lQbcTFRhZM68A9wDCg0W7Juv/4zBAIRXSEpvI3GE2e4Rw91aEJhU+pbWX
         Lctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=K1gezZuzsPIMoRYss94+kL0BlWmfjLIzGb0Zmmjc45o=;
        b=fPhCvOIjElG7Y67EKxCbX/7RnKaNTi2bQJwhzi5tHoq3DAaes32fegLclAA1S1PLwX
         3mRwWWePWGz/cgfrItfvV3CPJvdgtPEOdOYgO22wta+/wXDNQh+VhjLlbLKtb9aK7Yiu
         xJp0FvZSeQpiFVmH6Uyimend7opjWgGtkDWTdgbUWfqXV9jPvia/nAQBDpjjEAPEDX/Z
         gF7TGpJmjgZvxw4/rDpfjHwdzOlQvf8eIpaPYskClZQofmKjequeUSGkXyB46oOjZOnA
         BBPA0FVASZOMDdOhRO9cZayClQh7KNNnxme78b5OK2m9drnk7XHZ5m9aa+3IX3cWINj1
         O/8w==
X-Gm-Message-State: AOAM531b6v306d/cL5WVDe0KpFg23gm2sb+GNGNH40zJhFLg+gWt+wjf
        tjYkZj68TfuBMzBi8my7XFC60aEH56A=
X-Google-Smtp-Source: ABdhPJxrm0CXo0lG5Is0kUugTJRYe+l8cOUzvnYLPxpCRUm5ElDW6e3aFX7Y4am0Q+96tM/3EobdMA==
X-Received: by 2002:aa7:9729:0:b029:2ff:1e52:e284 with SMTP id k9-20020aa797290000b02902ff1e52e284mr15541207pfg.71.1624217243640;
        Sun, 20 Jun 2021 12:27:23 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:e4cb:9037:8dab:1327? ([2001:df0:0:200c:e4cb:9037:8dab:1327])
        by smtp.gmail.com with ESMTPSA id y190sm13333190pfc.85.2021.06.20.12.27.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Jun 2021 12:27:23 -0700 (PDT)
Subject: Re: [PATCH v6 0/3] Add APNE PCMCIA 100 Mbit support
To:     ALeX Kazik <alex@kazik.de>
Cc:     Linux/m68k <linux-m68k@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
References: <1624145073-12674-1-git-send-email-schmitzmic@gmail.com>
 <CAFFuhJry5tuJmzu1H_3-9NfGsiOYGHQpdY7aPBOockXeA7NAhw@mail.gmail.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <77d654d2-000e-4bc5-c5c8-f0967c26ccc3@gmail.com>
Date:   Mon, 21 Jun 2021 07:27:12 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFFuhJry5tuJmzu1H_3-9NfGsiOYGHQpdY7aPBOockXeA7NAhw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Alex,

thanks for testing again - so autoprobe (no boot option) did_not_ work?

Cheers,

     Michael

On 20/06/21 8:30 pm, ALeX Kazik wrote:
> Hi,
>
> I've tested the v6 patch on my A1200 and it works great.
> It's activated via the kernel boot option "apne.100_mbit=1".
>
> Alex.
