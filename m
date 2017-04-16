From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 00/10] mac68k: Miscellaneous fixes, cleanup and modernization
Date: Sun, 16 Apr 2017 12:29:57 +0200
Message-ID: <CAMuHMdUU8DYj-TKPCbjMCiCt5KrAi4ciTw9F=iL7eJ2shf9s=g@mail.gmail.com>
References: <cover.1491695243.git.fthain@telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:33825 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752958AbdDPK36 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 16 Apr 2017 06:29:58 -0400
In-Reply-To: <cover.1491695243.git.fthain@telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Finn,

On Sun, Apr 9, 2017 at 1:51 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> This series has various patches from several different people. Two printk
> modernization patches were originally from Geert Uytterhoeven and three
> Nubus patches were originally committed to the Linux/mac68k CVS by
> David Huggins-Daines.

Thanks, most of them look sane enough to apply and still queue for v4.12.

I'm a bit reluctant about the nubus changes (patches 6 and 8), though.
Do you think they need more testing?

Thanks!

> Finn Thain (10):
>   m68k/mac: IOP - Modernize printing of kernel messages
>   m68k/mac: Modernize printing of kernel messages
>   m68k/mac: Adopt platform_device_register_simple()
>   m68k/mac: Clarify IOP message alloc/free confusion
>   nubus: Fix nubus_rewinddir (from mac68k CVS)
>   nubus: Remove slot zero probe (from mac68k CVS)
>   nubus: Clean up printk calls (from mac68k CVS)
>   nubus: Fix pointer validation
>   nubus: Clean up whitespace
>   nubus: Add MVC and VSC video card definitions

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
