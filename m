Return-Path: <SRS0=PEg3=DQ=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FC2AC433DF
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Oct 2020 20:49:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3BFB722261
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Oct 2020 20:49:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390846AbgJIUtj (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 9 Oct 2020 16:49:39 -0400
Received: from mail-ot1-f52.google.com ([209.85.210.52]:35067 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727311AbgJIUti (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 9 Oct 2020 16:49:38 -0400
Received: by mail-ot1-f52.google.com with SMTP id s66so10221211otb.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 09 Oct 2020 13:49:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tRxY0gQdY+rgEv7+v704rgMmNuarESDY8jhxWv5oc1k=;
        b=hdQ46xnOFr51MhyhiK5KiSDRFQGjaXkKE3ch6ecDG9DQ3MdFW5smPiod3iY0cjGn6W
         tIJbiu1JjVeiD8UZn4PG+411gB5UZ6IjT3myeHTiVJBtCi4M3+Ao3jmeIax8vwY4k4kA
         fGfxs1F+huW2D4mzUYh25/XUVmfj07r9XP2UEmoplyQf9gbWNmBgE235l/lH6D6JreD8
         R8WcFgc6f+Nzw9vFjQoRFO1h7k4lvb4TbubsSQESuGlMoY3zV/6tAJXAxPLeuq8UoPNW
         gmhycz7XSe9NZbeEu8Mm/oydufoMOpAZpd/tVxxVRsIJWQx1m82lieNGnMOdr55XAiI0
         r61w==
X-Gm-Message-State: AOAM530iRj5sqqYo31Il3EnHnjk4BWIEc/ZxNpfXHv17UbGpB5NCkxre
        Uu1rhJPF0LXCoPG2N5oC1ykHFfFsnqePUMjv0Jw=
X-Google-Smtp-Source: ABdhPJyFaFoyNChd3fG0z5TF3eOykItu2OzqrnT5m7cIttnm+mUyzIZjucHPH5H+jegPBH3fai8QWdKtq4GKsBJnKYo=
X-Received: by 2002:a9d:5e14:: with SMTP id d20mr1604973oti.107.1602276577971;
 Fri, 09 Oct 2020 13:49:37 -0700 (PDT)
MIME-Version: 1.0
References: <a75889ab-4d84-aec4-8f01-7d42e7e015c9@physik.fu-berlin.de>
In-Reply-To: <a75889ab-4d84-aec4-8f01-7d42e7e015c9@physik.fu-berlin.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 9 Oct 2020 22:49:26 +0200
Message-ID: <CAMuHMdWjRpfkQVxTvLvA=+dV=L2-TmtHkVxJYB2W2u0GKvr0SA@mail.gmail.com>
Subject: Re: Upstreaming the CD-TV CD-ROM driver
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Matthew Garrett <mjg59@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Adrian,

On Fri, Oct 9, 2020 at 9:58 PM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> I wanted to try out Matthew Garrett's driver for the Amiga CD-TV CD-ROM drive [1] today
> but it turns out that a simple rebase won't do it since the code in arch/m68k/amiga/dmac.c
> is no longer there.
>
> Can anyone point me to where that code has been moved to?

Upstream never had arch/m68k/amiga/dmac.c.
It was added in the parent commits of [1], by Matthew.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
