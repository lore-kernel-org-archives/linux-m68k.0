Return-Path: <SRS0=WAuH=7H=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5A9EC433E0
	for <linux-m68k@archiver.kernel.org>; Mon, 25 May 2020 08:46:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 90829206DD
	for <linux-m68k@archiver.kernel.org>; Mon, 25 May 2020 08:46:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20150623.gappssmtp.com header.i=@timesys-com.20150623.gappssmtp.com header.b="A4sFV2hc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389193AbgEYIqG (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 25 May 2020 04:46:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388786AbgEYIqE (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 25 May 2020 04:46:04 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F55DC061A0E
        for <linux-m68k@vger.kernel.org>; Mon, 25 May 2020 01:46:04 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id o26so9508234vsr.10
        for <linux-m68k@vger.kernel.org>; Mon, 25 May 2020 01:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gdvbHZ/U0eSo/nSE6jZG36yYG5hVVzqJpLZgsZ5Atlk=;
        b=A4sFV2hcMddZibVAH4cxdEwT2ipYq4DbCca452hKDfjeokN9RzgtZhnSPmFQQ0slQU
         K/IuDehNmqbJ841UKfIzBdfkbh0umMQ5ElYDOmNj16ZYFEQ3xjqS9hCL7X2HQpy5S9Js
         ryTVWdqQDs0EKGVvobQ4BM+8qCpud+e2B8YHV5qIXDsMb0Deaw89YE2NIm6YgT8PGRlZ
         QiGWK7qll06Io0tcTz65dtPAP5ZJoJa4e2BzFujUNP7ETo5SrDHWHkS7zFeH17mGVbdr
         KsEyg+6FyeFN7mvPZEt1LgpE55gDHcMtLuz6nQGTXePBbaJqTbdWfJcFxV6rSoqngz9W
         Tx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gdvbHZ/U0eSo/nSE6jZG36yYG5hVVzqJpLZgsZ5Atlk=;
        b=Nj4moP2ORTKXarwLjv+DSQGdTyBF0WPDBWqooibRHPg/G3UG0AlyPEDo3Eohbwe76r
         xAzjrmTdb2EEiUgyABDXaStOiXuCErT6ZKBV1ScCJE37Rvhzw8NjjOmGrEai0bpLBmL1
         NqO3nwzUslTl2h6NjI212lDVoEGJN8U6fzdc2jHqVxBNxkGMCjP8UuoED0yAs/G6rRqa
         jRW4qV6xMJ4nrsJnZYj3VrAchgwkoA2AqkgufCvBJBNZoUtVfPsIgh3A2RTSUn0tFzFt
         m3momXJLmMRMxqUgFZXxMry4f7maxtapsqBuqfa97RfxXZojsBOtltOt5SfzViSt00iX
         nrjQ==
X-Gm-Message-State: AOAM531+6s/HyV/1Na51f2RxuV5ABmSaSI8xJlMkRcKIoNqjy3qGQ0GB
        8rK4/sNBuOTSB5n3qHQFOvreMghYjQlorvzrFQkwdfKP
X-Google-Smtp-Source: ABdhPJyserwYHX0S0X7xx4bNhPaJ66+YF2aJlyKso6boQW6YJWewEmZJ+ybPGjhTFf7v9yMbyIl9gIQNPEc4KhFZ15g=
X-Received: by 2002:a67:310e:: with SMTP id x14mr17151480vsx.237.1590396363418;
 Mon, 25 May 2020 01:46:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200518191742.1251440-1-angelo.dureghello@timesys.com> <fdfe557a-49fe-410a-cb05-5bff5e04fdd0@linux-m68k.org>
In-Reply-To: <fdfe557a-49fe-410a-cb05-5bff5e04fdd0@linux-m68k.org>
From:   Angelo Dureghello <angelo.dureghello@timesys.com>
Date:   Mon, 25 May 2020 10:51:15 +0200
Message-ID: <CALJHbkAsiFGUD3hWzgd1WqnoMekcC60i6Sn66SZS4nde4ksSdg@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] m68k: mcf5441x: add support for esdhc mmc controller
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-m68k@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Greg,

On Mon, May 25, 2020 at 8:02 AM Greg Ungerer <gerg@linux-m68k.org> wrote:
>
> Hi Angelo,
>
> Have you seen this breakage being reported in linux-next?
>
>      arch/m68k/coldfire/clk.c:78:60: error: 'MCFSDHC_CLK' undeclared (first
>      use in this function); did you mean 'MCF_CLK'?
>      arch/m68k/coldfire/clk.c:83:61: error: 'MCFSDHC_CLK' undeclared (first
>      use in this function); did you mean 'MCF_CLK'?
>      make[2]: *** [scripts/Makefile.build:272: arch/m68k/coldfire/clk.o]
>      Error 1
>      make[1]: *** [Makefile:1736: arch/m68k/coldfire] Error 2
>      make: *** [Makefile:185: __sub-make] Error 2
>
> This is when compiling for pretty much anything other than an mcf5441x
> target.


>
>
> MCFSDHC_CLK will not be defiend for anything other than mcf5441x targets.
>
> This mechanism looks a little out of place here, given how specific
> it is to the sdhc hardware module of the 5441x. Can you move this
> to the m5441x specific code resolving this?
>

i apologize. Couldn't catch that since building for this target.
Fixing, re-testing and sending patch in short.


>
> Regards
> Greg
>
>

Regards,
Angelo
