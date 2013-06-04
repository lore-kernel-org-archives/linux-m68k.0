From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] swim: Release memory region after incorrect return/goto
Date: Tue, 4 Jun 2013 20:53:31 +0200
Message-ID: <CAMuHMdWgzx6P4_GGYarXg90EtPmnMf19sZ4drj=aUo-571piZA@mail.gmail.com>
References: <1370370875.2385.48.camel@joe-AO722>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1370370875.2385.48.camel@joe-AO722>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>, Laurent Vivier <Laurent@vivier.eu>

On Tue, Jun 4, 2013 at 8:34 PM, Joe Perches <joe@perches.com> wrote:
> The code uses
>
>         return foo;
>         goto err_type;
>
> when instead the form should have been
>
>         ret = foo;
>         goto err_type;
>
> Here this causes a useful release_mem_region to be skipped.
>
> Signed-off-by: Joe Perches <joe@perches.com>
> Reviewed-by: Laurent Vivier <Laurent@Vivier.EU>
> ---
>
> Hey Geert.
>
> Just in case you don't see this on lkml.
> I presume this has to go through you.

Thanks, will apply and queue for 3.11.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
