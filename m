Return-Path: <SRS0=xXxx=BW=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D9C0C433E0
	for <linux-m68k@archiver.kernel.org>; Wed, 12 Aug 2020 08:30:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2037820774
	for <linux-m68k@archiver.kernel.org>; Wed, 12 Aug 2020 08:30:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726962AbgHLIaQ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 12 Aug 2020 04:30:16 -0400
Received: from mail-oi1-f177.google.com ([209.85.167.177]:41801 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726946AbgHLIaQ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 12 Aug 2020 04:30:16 -0400
Received: by mail-oi1-f177.google.com with SMTP id b22so1106812oic.8
        for <linux-m68k@lists.linux-m68k.org>; Wed, 12 Aug 2020 01:30:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TAuIj4vkbpSM6ntftE274EAQ8mrEwWoXbysBRZPgmhY=;
        b=rCdcmPoO+49PYAueP440qDedDXagwjyONTek0PhykLYQE0nmpPt3Y8eQkRriHv+cP6
         bSwNfYLOok3L4eXIA05zQn1jZ7pBFFHiiTqAn1YLpYrY0iaivDqD48YrlfZt0vuZOfIM
         DjHBGJB7Pswr0wGTTfhdCB2IvR4k1YKv3G1v5tsSuu9QIaNrTfUl834RoGWyUZYLzgLR
         LJyTffA9LXbq1u7gAR3EBIJ5hcO8nkoMiHymDYB31T7Ob4xYIdnBlaQO9HyYpqUpfll4
         ZQlL0EGjhomLxglYwD/otpV81+ExFnii8iyR24Z7ezEX0P7TSTGTeElkAMteEqnFMtyY
         zctg==
X-Gm-Message-State: AOAM530dWkXxRSz1O07sQs/UF4jvqFUJgjws///oZWE3ApagGUHVMom2
        SxSQ2KSzGAH6EcdDFfQkxVKNKP0eEe+LUQ29gjE=
X-Google-Smtp-Source: ABdhPJyS+gcYFiLZKSNJtpori0L4le1YMEvRdB5nDRNZcdGgM8ls8gwpvHkqhe/eCJXLC/LmfxWA7nuQdXWLTaWUrxk=
X-Received: by 2002:aca:b742:: with SMTP id h63mr6322028oif.148.1597221015149;
 Wed, 12 Aug 2020 01:30:15 -0700 (PDT)
MIME-Version: 1.0
References: <86v9hoffcd.fsf@emacs.strotmann.de>
In-Reply-To: <86v9hoffcd.fsf@emacs.strotmann.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 12 Aug 2020 10:30:04 +0200
Message-ID: <CAMuHMdWThu9QW-HAQ84TBi4ZGUmzpDw4t=WN37uwAoec7ynsvA@mail.gmail.com>
Subject: Re: m68k chat 21st Aug 2020 - "the Amitari - EmuTOS and Atari
 Software on the Amiga"
To:     Carsten Strotmann <cas@strotmann.de>
Cc:     Debian m68k <debian-68k@lists.debian.org>,
        emutos-devel@lists.sourceforge.net, amigaml@freelists.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Carsten,

On Wed, Aug 12, 2020 at 10:17 AM Carsten Strotmann <cas@strotmann.de> wrote:
> We will have a short demo: "the Amitari - EmuTOS and Atari
> Software on
> the Amiga" and discuss the experiences of running Atari software
> on the
> Amiga (might the reverse be possible too --> running AmigaOS
> command
> line binaries on TOS?)

Why not?

There did exist a small AmigaOS emulator for Amiga UNIX, basically
implementing a hunk loader and a few exec.library and dos.library calls.
This was rumored to be sufficient to run e.g. the SAS C compiler.
I tried it once on Linux/m68k, and it could run a simple Hello World.

The only entrypoint you need to provide to run AmigaOS binaries is a
pointer to ExecBase at address 4.  If TOS doesn't use that location for
something else, you can implement AmigaOS support.

Good luck! ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
