Return-Path: <SRS0=3RHc=7N=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B662BC433DF
	for <linux-m68k@archiver.kernel.org>; Sun, 31 May 2020 08:41:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9AA8220707
	for <linux-m68k@archiver.kernel.org>; Sun, 31 May 2020 08:41:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725991AbgEaIlW (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 31 May 2020 04:41:22 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:42266 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725898AbgEaIlV (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 31 May 2020 04:41:21 -0400
Received: by mail-ot1-f65.google.com with SMTP id o7so1060429oti.9
        for <linux-m68k@lists.linux-m68k.org>; Sun, 31 May 2020 01:41:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hhhqHeZBf2NBcL6NS4/8J6McKxeRLMMjf81gIVoAbbk=;
        b=jXRD0zFhZ5xUqw4S1f3q5pqPs3ACsEAC+93SWSlB06W1wCGka3lA8Uyd+4gLFN/dB6
         PpdlucApkvuAKS1e3Zi3ymIoFZSken6vwDyef5zLDIybbnep0cSjcEvGf92dYNI9uoxT
         7hkER3A2TuZUbRNVusQrTaKXs9ptZI/4+PglTjRGmhuBfqEkfqyjQ9NTm8Cq9uuKS8zu
         1qBk9Hq0J22BJWxf8PA00wPHdkzmgJlUdOTAuYqyEHO2XB5KSZQ3aqV7svDQVtmvZygY
         U1JIP0bTJLxEfbounUJbwYoZdBhjHLVWIJi0DXQ1SEEe3Ocw64/in8nABa9c/zeGAF4M
         nyEg==
X-Gm-Message-State: AOAM5323hStdYhNXtrMgbU4RhNdT6eebpmIRlWEwkniZxXpk5CQmpTCw
        sqGt9/sIDW/qalH/pSto5m3/DUF+gVpbTCP40pYlxg==
X-Google-Smtp-Source: ABdhPJw5XtUShQ228hZwf6/S9PJg+4GolOTeI2Cwsk00CllMO7BCEY4aPmr0oBAAJec2PsN236AWbD/9ruGqtXG7G5o=
X-Received: by 2002:a05:6830:141a:: with SMTP id v26mr722368otp.250.1590914481117;
 Sun, 31 May 2020 01:41:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590880333.git.fthain@telegraphics.com.au>
In-Reply-To: <cover.1590880333.git.fthain@telegraphics.com.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 31 May 2020 10:41:09 +0200
Message-ID: <CAMuHMdVb2C7asip_-_zbc3JP+nqn6siKqmikOK98tM5=2BYqcQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] Mac IOP driver fixes
To:     Finn Thain <fthain@telegraphics.com.au>
Cc:     Joshua Thompson <funaho@jurai.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On Sun, May 31, 2020 at 1:16 AM Finn Thain <fthain@telegraphics.com.au> wrote:
> This patch series has several bug fixes for the IOP driver and some
> improvements to the debug level log messages.

Thanks for your series!

> Geert, please consider pushing these fixes for v5.8, if not the
> whole series.

I'm afraid it's a bit too late for that, as I expect the v5.8 merge window
to open tonight.  Unless the fix is for a regression in v5.7.
BTW, how does the issue being fixed manifest itself? That's not clear to
me from the patch description.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
