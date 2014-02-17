From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC 3/4] m68k: multi-platform EARLY_PRINTK
Date: Mon, 17 Feb 2014 11:03:20 +0100
Message-ID: <CAMuHMdULJ+61j4SreJXjPwnHVcQ_W4_ousfBzZz1+RqgF+hSGA@mail.gmail.com>
References: <alpine.LNX.2.00.1402151533350.16321@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.1402151533350.16321@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>, Sam Creasey <sammy@sammy.net>

On Sat, Feb 15, 2014 at 5:47 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> --- linux-m68k.orig/arch/m68k/Kconfig.debug     2014-02-15 14:49:18.000000000 +1100
> +++ linux-m68k/arch/m68k/Kconfig.debug  2014-02-15 15:06:30.000000000 +1100
> @@ -12,12 +12,15 @@ config BOOTPARAM_STRING
>
>  config EARLY_PRINTK
>         bool "Early printk"
> -       depends on MVME16x || MAC

This should depend on !SUN3, as arch/m68k/kernel/sun3-head.S doesn't
have debug_cons_write:

arch/m68k/kernel/built-in.o: In function `early_cons_write':
early_printk.c:(.init.text+0x512): undefined reference to `debug_cons_write'

Alternatively, we can have a loop around prom_putchar() here in the
#ifdef CONFIG_SUN3 case?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
