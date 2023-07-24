Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9E92C001E0
	for <linux-m68k@archiver.kernel.org>; Mon, 24 Jul 2023 09:12:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232154AbjGXJMm convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 24 Jul 2023 05:12:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232142AbjGXJMl (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 24 Jul 2023 05:12:41 -0400
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 503EB11F
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Jul 2023 02:12:40 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-57a6df91b1eso50718367b3.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Jul 2023 02:12:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690189959; x=1690794759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3j0v2+mohYZTqHHH0/BpIIhzkfCW49v4SBL4Epd6EJQ=;
        b=Cz+UKqVGd0E0IQ+n6Ml3PkLmFlkC1ctJ+pYoQemO6riAiHPKxYslZ5D9robyTuXJBk
         OwS5ZIHPbIXUFcpUhyQk39axtJM0bVoebUuhdY0/n73zmFUO63IcSnINZw5l78fNQTfy
         5Ljg4vpyQJajqK0LB/AxV6D3M+hpX/c7pC2l/nHKr9x4i28boUq4iQNM71+wFI7V5Wm9
         HKXcBsCZdEOABu4WvXRou0PSl/5HjrQLrZUrXYPAFiwHRxf1NhZUlCpcIztDMzdykJDu
         OKFUGvWOQzfDuVwfKKWnrQOdGDNlkARWAQEHjTCg0Oh+vUQEMyRHo5L01ceHbd+8fKKK
         0VQQ==
X-Gm-Message-State: ABy/qLZgkFPKr+uVvMa/a7ozBIxX0eidJFsq+I12H3ykef6IQpHqod6X
        HTQH4LOEfNie/iUTCuMqT0+X2S/3vAoxQw==
X-Google-Smtp-Source: APBJJlF1Xii+KsTZvSYLiFvMTsRbsoSKycEKHhqTz9U8LOJmwn5j2SXJyUcLdiOs69bzNkrdfeTH9Q==
X-Received: by 2002:a81:6884:0:b0:583:7e80:177b with SMTP id d126-20020a816884000000b005837e80177bmr9415296ywc.39.1690189959344;
        Mon, 24 Jul 2023 02:12:39 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id x19-20020a81a013000000b00579df9098e3sm2668403ywg.38.2023.07.24.02.12.38
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 02:12:38 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-583fe10bb3cso5070137b3.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Jul 2023 02:12:38 -0700 (PDT)
X-Received: by 2002:a81:838e:0:b0:577:2f3f:dd20 with SMTP id
 t136-20020a81838e000000b005772f3fdd20mr8269635ywf.34.1690189958745; Mon, 24
 Jul 2023 02:12:38 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_2AC782146D133A82E7D99024161D14AD4209@qq.com> <b29994cca39551c7c3827a733e7c1246@208suo.com>
In-Reply-To: <b29994cca39551c7c3827a733e7c1246@208suo.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 24 Jul 2023 11:12:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVPQ-C-td4VKsm11Dsmt0G+sO-T2u0RazLBu15L46+ywQ@mail.gmail.com>
Message-ID: <CAMuHMdVPQ-C-td4VKsm11Dsmt0G+sO-T2u0RazLBu15L46+ywQ@mail.gmail.com>
Subject: Re: [PATCH] m68k: q40: Add space around '='
To:     hanyu001@208suo.com
Cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Hanyu,

On Thu, Jul 13, 2023 at 8:40 AM <hanyu001@208suo.com> wrote:
> This patch fixes the checkpatch.pl error:
>
> ./arch/m68k/q40/q40ints.c:135: ERROR: spaces required around that '='
> (ctx:VxV)
> ./arch/m68k/q40/q40ints.c:137: ERROR: spaces required around that '='
> (ctx:VxV)
> ./arch/m68k/q40/q40ints.c:138: ERROR: spaces required around that '='
> (ctx:VxV)
>
> Signed-off-by: maqimei <2433033762@qq.com>

Thanks for your patch!

But obviously you forgot to run scripts/checkpatch.pl on your own patch:

    ERROR: patch seems to be corrupt (line wrapped?)
    #81: FILE: arch/m68k/q40/q40ints.c:131:
    *dev_id)

    ERROR: Missing Signed-off-by: line by nominal patch author
'hanyu001@208suo.com'

> Fwd: [PATCH] m68k: q40: Add space around '='

Please do not forward patches, as this breaks the tooling.
The proper way to handle this is to add your own Signed-off-by tag,
and submit it yourself, cfr.
https://elixir.bootlin.com/linux/latest/source/Documentation/process/submitting-patches.rst#L434

> index 127d7ec..bede94a 100644
> --- a/arch/m68k/q40/q40ints.c
> +++ b/arch/m68k/q40/q40ints.c
> @@ -132,10 +132,10 @@ static irqreturn_t q40_timer_int(int irq, void
> *dev_id)
>   {
>       ql_ticks = ql_ticks ? 0 : 1;
>       if (sound_ticks) {
> -        unsigned char sval=(sound_ticks & 1) ? 128-SVOL : 128+SVOL;
> +        unsigned char sval = (sound_ticks & 1) ? 128-SVOL : 128+SVOL;
>           sound_ticks--;
> -        *DAC_LEFT=sval;
> -        *DAC_RIGHT=sval;
> +        *DAC_LEFT = sval;
> +        *DAC_RIGHT = sval;
>       }
>
>       if (!ql_ticks) {

This patch is whitespace-damaged and fails to apply.

Please test your patches by running scripts/checkpatch.pl, emailing
them to yourself, and trying to apply them.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
