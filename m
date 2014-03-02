From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC 1/4] m68k: remove CONSOLE_PENGIUN macro, adopt CONFIG_LOGO
Date: Sun, 2 Mar 2014 11:07:04 +0100
Message-ID: <CAMuHMdX6+pUS+AUak3xoRHMnC=tdFO3B97E6Aaj21Sd3boParg@mail.gmail.com>
References: <alpine.LNX.2.00.1402151532410.16321@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.1402151532410.16321@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>

On Sat, Feb 15, 2014 at 5:45 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> Allow CONFIG_LOGO to enable/disable the head.S penguin logo as well as the
> framebuffer console logo. This should save a few bytes. It also gets rid
> of the obscure CONSOLE_PENGIUN macro.

Looks fine to me. Can I add your SoB and take it?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
