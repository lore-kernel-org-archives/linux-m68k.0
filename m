Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA541C63798
	for <linux-m68k@archiver.kernel.org>; Fri, 20 Nov 2020 08:03:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8CDE12222F
	for <linux-m68k@archiver.kernel.org>; Fri, 20 Nov 2020 08:03:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726629AbgKTICt (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 20 Nov 2020 03:02:49 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:37623 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725797AbgKTICt (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 20 Nov 2020 03:02:49 -0500
Received: by mail-oi1-f193.google.com with SMTP id j15so4197373oih.4
        for <linux-m68k@lists.linux-m68k.org>; Fri, 20 Nov 2020 00:02:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FNW2tMEqeVMvx00SS3WlWpA2yC7CPr7bbQBd7mo/OdM=;
        b=gxGR2xr6A5P2+aiA8yw1wHcJaD3IIzpkZsPKvAY6GH9BEIJls0T4PnQTVPQ3+HMzJ+
         ZlSp54nUY/ZSfETPDhg51bipZM3BYhB5aau1Sw93RTvAyy98H9VcAs5Gb1SF433E+tyG
         2cUdCKlmx8s5+sgk6TCWvuVuGGxD+CuJfS135UIUOzgnFf25Da/iBWzNgRqGqbexbk6V
         xCCAEK/TO5sgDaUx7PD3DxLzbe2hpoEJOeeeGPFWERDx+WsCuhByZrXbKLXTzWrn/ohN
         fjbv7GpvdR/3XNXLuC+lwoXjVaIsqRKWguPBiRkD6IrtOaDsVCbpijFVxY4AEzW64k7G
         A9ZQ==
X-Gm-Message-State: AOAM532WT24SCezyHW7dkfly2/sGxRmgOmeXmro0Wu/vU15Zjt00LLGZ
        jGdYBPs9KaVYHPa5YDzEJ/f1PkJXkBNL2n5lHO4=
X-Google-Smtp-Source: ABdhPJyCk3kYjnyDhMztComlhPO59zBYUUFW/lu6YKHfj3Pzhcnpkg1JnW6JN6uVFE00P4w42rRAYZtYnlSRj1HbDWI=
X-Received: by 2002:aca:4bc3:: with SMTP id y186mr5276812oia.153.1605859368606;
 Fri, 20 Nov 2020 00:02:48 -0800 (PST)
MIME-Version: 1.0
References: <c6b1d9620af3e8f89dd0157a41fa4147294b251d.1605847196.git.fthain@telegraphics.com.au>
In-Reply-To: <c6b1d9620af3e8f89dd0157a41fa4147294b251d.1605847196.git.fthain@telegraphics.com.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 20 Nov 2020 09:02:37 +0100
Message-ID: <CAMuHMdWOrPhS-QML+aK4PKj6qp2DDcWO2XbAzZ2U6XTKkGFK6Q@mail.gmail.com>
Subject: Re: [PATCH] m68k/mac: Remove redundant VIA register writes
To:     Finn Thain <fthain@telegraphics.com.au>
Cc:     Joshua Thompson <funaho@jurai.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Nov 20, 2020 at 5:51 AM Finn Thain <fthain@telegraphics.com.au> wrote:
> There's no need to write the same value to the timer latch and timer
> counter registers. Values written to the counter registers get stored
> in the latches anyway. The write to vT1CH copies the latch values to
> the counter.
>
> Cc: Joshua Thompson <funaho@jurai.org>
> Tested-by: Stan Johnson <userm57@yahoo.com>
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v5.11 branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
