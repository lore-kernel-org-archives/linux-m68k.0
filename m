From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: Fix ndelay() macro
Date: Fri, 28 Oct 2016 18:09:41 +0200
Message-ID: <CAMuHMdUw=k4uFjRm=16qrMmdBAn3UJgQ+1Yjy6CboXY4Y6u1nA@mail.gmail.com>
References: <1477667548-740-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1477667548-740-1-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Boris,

On Fri, Oct 28, 2016 at 5:12 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> The current ndelay() macro definition has an extra semi-colon at the
> end of the line thus leading to a compilation error when ndelay is used
> in a conditional block with curly braces like this one:
>
>         if (cond)
>                 ndelay(t);
>         else
>                 ...
>
> which, after the preprocessor pass gives:
>
>         if (cond)
>                 m68k_ndelay(t);;
>         else
>                 ...
>
> thus leading to the following gcc error:
>
>         error: 'else' without a previous 'if'
>
> Remove this extra semi-colon.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Thank you, will apply and queue for v4.9.

> Fixes: c8ee038bd1488 ("m68k: Implement ndelay() based on the existing udelay() logic")

Wow, that's even a quite recent commit. Needs backporting only to v3.10+...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
