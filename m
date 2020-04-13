Return-Path: <SRS0=0yiB=55=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFCCBC2BA19
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Apr 2020 09:42:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A74A320575
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Apr 2020 09:42:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727997AbgDMJmR (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 13 Apr 2020 05:42:17 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:37901 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727968AbgDMJmR (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 13 Apr 2020 05:42:17 -0400
Received: by mail-ot1-f66.google.com with SMTP id n8so3113575otk.5
        for <linux-m68k@vger.kernel.org>; Mon, 13 Apr 2020 02:42:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v8aq/FuPwdfAQWITkndPNdXLCQMI0Uz44m4744u3ai4=;
        b=e8MWmIvffsgFgONI2ocB1U8er/9MavEdqpWi0Ip0RYUpJy/GWT4U/+ScjQ0L8W5N1u
         +LaTNZ5FQmh8Vc3bFYWxtyTo4XH4jY0oMJaaYarbB02j7Dw6oEEwFLLxaRXx/uBOSRDO
         CEXu8EYnUv9skZYIPkImO1c0zT3cTDRkPxWMr2USZ6uopJuo3q+PTwMrbHGYofORx0sP
         SguAKY0GgK+Lphv+19wfNhGqpGv+6ZgDeRlOLxll2vuy2xgjK35xyKDyxJ7KTBmw5+Qt
         RmG7RcpPhu9ofqbO4wrZv2NWHDVNx2CK6HqIA/zI6UpGL9I6ik3bcaykhh/FdxFw3gVC
         Tllw==
X-Gm-Message-State: AGi0PuZIFLSF8lPp3aGyG3Sl/6Vg7fm18qLYgTOW0qKdwsGXmxOnnqII
        1tCMO9tRUIOI2sX5pAajl7eey64olnHQb7Kk/wWfbg==
X-Google-Smtp-Source: APiQypL3rZy+S2NEwD2obVDuFID5t23VflRUbI8BQMJskGZ042gJ3CHlyuIFfcwcoG7u9dPPE1wAflOblHdE94zZqxU=
X-Received: by 2002:a9d:6299:: with SMTP id x25mr8619321otk.107.1586770936007;
 Mon, 13 Apr 2020 02:42:16 -0700 (PDT)
MIME-Version: 1.0
References: <b1e930f3-7775-6955-860e-a2886627caa8@landley.net>
 <c4a784d9-2fef-ee90-9ff3-b1d8487e8a8b@physik.fu-berlin.de>
 <238ea76c-fa8e-0134-667b-3864938d9a78@landley.net> <alpine.LNX.2.22.394.2004130922090.8@nippy.intranet>
 <7a9ada44-e0d4-6743-3819-92dc44f3f156@landley.net> <alpine.LNX.2.22.394.2004131146180.15@nippy.intranet>
 <eb942a46-515f-9e1e-eeab-22c50b56e07c@landley.net> <29e2cf8a-35fa-b24a-bce2-84e05e54d4c5@landley.net>
In-Reply-To: <29e2cf8a-35fa-b24a-bce2-84e05e54d4c5@landley.net>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 13 Apr 2020 11:42:04 +0200
Message-ID: <CAMuHMdXyhB52yLZ59njZ6fTZB8B1cZNWLFHcGaCxZ2TuKt7_0g@mail.gmail.com>
Subject: Re: GCC?, was Re: Running m68k on qemu with external initramfs?
To:     Rob Landley <rob@landley.net>
Cc:     Finn Thain <fthain@telegraphics.com.au>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "Linux/m68k" <linux-m68k@vger.kernel.org>,
        Laurent Vivier <Laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Rob,

On Mon, Apr 13, 2020 at 11:37 AM Rob Landley <rob@landley.net> wrote:
> On 4/13/20 2:07 AM, Rob Landley wrote:
> >> It would be great to have a minimal reproducer from toysh. Getting that
> >> from the python build looks hard, even with creduce.
> >> https://embed.cs.utah.edu/creduce/
> >
> > Oh it's not hard, it's just tedious.
>
> Did you know that if you disable optimizations you can get _more_ warnings?
>
> _disabling_ the gcse optimization triggered one of those "may be used
> uninitialized but is a false positive 99% of the time" which in this case,
> turned out to have a path that could trigger in a function I added last week,
> which which was called in an else case 5 lines down. (Yes, when it DIDN'T
> segfault, it gave me the warning.)

It's indeed a pity.  I looked into each and every one of them when I could
still compile the kernel with gcc 4.1, to find the few cases that were real
bugs...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
