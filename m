Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CED8BC433EF
	for <linux-m68k@archiver.kernel.org>; Tue, 14 Sep 2021 15:54:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B45C061163
	for <linux-m68k@archiver.kernel.org>; Tue, 14 Sep 2021 15:54:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234180AbhINP4E (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 14 Sep 2021 11:56:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231928AbhINP4E (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 14 Sep 2021 11:56:04 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A3B2C061574
        for <linux-m68k@lists.linux-m68k.org>; Tue, 14 Sep 2021 08:54:46 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id i25so25877166lfg.6
        for <linux-m68k@lists.linux-m68k.org>; Tue, 14 Sep 2021 08:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rvm9Pl/uwYmfK3p6gTgeS5F88Q3cYCPS+zfIKbiomOI=;
        b=MxSYaWguCwV+qbmKyhzuCgKQ335RNtWBKP51TZCf0ZebIwOKI2bLJ/zq8omTVrMC8m
         us0N5oqNtVGvybG08hfHpJXBhCz40nTqeeSLakW4B/SSqqow68XyhyAQQkXb/YmziE+n
         wZqnKuMxO6+qrpz1z2NdXV/r9r/OZMkV4OClE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rvm9Pl/uwYmfK3p6gTgeS5F88Q3cYCPS+zfIKbiomOI=;
        b=itpnsIu3EA2nEOm3dIVjSZtqh/8WVC2SWk5CpQRWt11kgGzqATT2d/zHZsosXqZMTY
         vyzl2sAMEeTBRF1ToRIp1n6vaOq9vaK3VhNkq1VGWc5bT0o3HNHezSj7XLJ35XsMyfwV
         uIsH0F5f8eGHSkuTxtrIPV5HlsERFSeGZQsihXYD4LupX1RIa8cITKGeej/p8wlu7YGJ
         7ML9N1D3rEfXtvNUY5A9QHaVCr/O1fDHUM+gNw4BWizOj72ME51NioMNVATqDfRWuNOn
         ipgnQp3g5lEqZEZud5ABaYQNRULaMZcFHuad8ltFbhP0/2YEiXJa2Owz14pVgmbeeIdI
         gynQ==
X-Gm-Message-State: AOAM533cpxc3qnUCDOwX6fw5IoRIQ4Pf8XJE6I2edDj0r7SN1lJ2hgPj
        ZemxduOIMDFOcdKG2neuDeKZ/z9cSF1afLfTnp0=
X-Google-Smtp-Source: ABdhPJzXYwDl19U3yqLXC+6IkbMpGevs0mzg5+AARUrTeOrROzH8WPAH4N5PuHIAa+cxfEI58cHg8g==
X-Received: by 2002:a05:6512:ace:: with SMTP id n14mr4812437lfu.109.1631634884231;
        Tue, 14 Sep 2021 08:54:44 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id c26sm587873lfm.57.2021.09.14.08.54.42
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Sep 2021 08:54:43 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id h16so29832400lfk.10
        for <linux-m68k@lists.linux-m68k.org>; Tue, 14 Sep 2021 08:54:42 -0700 (PDT)
X-Received: by 2002:a19:ae15:: with SMTP id f21mr4085743lfc.402.1631634882744;
 Tue, 14 Sep 2021 08:54:42 -0700 (PDT)
MIME-Version: 1.0
References: <65a95ae0-4734-68ce-ef71-7491b5534718@gmail.com>
 <8f470389-fe8a-90b0-19a5-68f85526b30e@gmail.com> <20210721170529.GA14550@lst.de>
 <a70d80f4-6034-e20b-26c5-76609c52c92a@gmail.com> <20210723051126.GA31274@lst.de>
 <e9fb28d4-405a-5cc6-b071-707a2edbce92@gmail.com> <8884e940-22e8-72a5-e9ec-f9b2628b6ef4@gmail.com>
 <251aa093-047a-b37c-4e88-d543c6fa8bc6@gmail.com> <20210815074236.GA23777@lst.de>
 <63c35a20-3eec-1825-fa18-5df28f5b6eaa@gmail.com> <20210816065851.GA26665@lst.de>
 <e705cfe1-4386-d205-89c6-73e13335c792@gmail.com> <7517d306-21ad-daa1-a2fb-b273211cb588@gmail.com>
 <CAHk-=wgEFfm61UP3tfkVthVoivsyo0m4c-HrKo7SP8fwZTn4tA@mail.gmail.com> <d08e51a8-c5c4-c8be-e8d4-2bfc13b4a48b@gmail.com>
In-Reply-To: <d08e51a8-c5c4-c8be-e8d4-2bfc13b4a48b@gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 14 Sep 2021 08:54:26 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj86gMUzK4XPO+ibZqS77fAgU5eZXRPejn61OZk+rQiRA@mail.gmail.com>
Message-ID: <CAHk-=wj86gMUzK4XPO+ibZqS77fAgU5eZXRPejn61OZk+rQiRA@mail.gmail.com>
Subject: Re: RFC: remove set_fs for m68k
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Al Viro <viro@zeniv.linux.org.uk>, Christoph Hellwig <hch@lst.de>,
        Andreas Schwab <schwab@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Sep 13, 2021 at 7:43 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>
> having run stress tests on a kernel with Al Viro's signal handling fixes
> applied for the past two days with no further errors, I am now quite
> confident that the format error I saw in resume_userspace() and a bus
> error in setup_frame() were caused by multiple pending signals, and the
> resulting stack mangling that Al's patches fix.

Sounds good. Except you say "Al Viro's signal handling fixes" without
giving any context, so I have no idea which patches you are referring
to.

Regardless, if there's some fixes queue that also removes set_fs()
from m68k, I'm willing to take it for 5.15 just to have another
architecture down and done with.

And even if the set_fs() patches might still be under discussion, the
format errors have been going on for some time, so the signal fixes -
wherever they are - seem to be no-brainers if they fix those.

          Linus
