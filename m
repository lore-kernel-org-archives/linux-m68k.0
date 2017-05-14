From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC 0/2] mac68k: NuBus fixes
Date: Sun, 14 May 2017 22:57:55 +0200
Message-ID: <CAMuHMdUY0tZektPTPMZLCyMfnt4KvNihE9gCizJLvDwKYF2sgw@mail.gmail.com>
References: <cover.1492910474.git.fthain@telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:34053 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759097AbdENU54 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 14 May 2017 16:57:56 -0400
Received: by mail-it0-f66.google.com with SMTP id c26so10376633itd.1
        for <linux-m68k@vger.kernel.org>; Sun, 14 May 2017 13:57:56 -0700 (PDT)
In-Reply-To: <cover.1492910474.git.fthain@telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Finn,

On Sun, Apr 23, 2017 at 3:24 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> Geert has agreed to merge these two patches if they receive a favorable
> review. Is anyone willing to do a review?
>
>
> David Huggins-Daines (1):
>   nubus: Remove slot zero probe
>
> Finn Thain (1):
>   nubus: Fix pointer validation

Thanks, both applied with Michael's Reviewed-by, and queued for v4.13.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
