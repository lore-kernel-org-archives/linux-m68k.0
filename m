From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC 3/4] m68k: multi-platform EARLY_PRINTK
Date: Sun, 16 Feb 2014 12:58:07 +0100
Message-ID: <CAMuHMdWfZRXKdqabTFmvCjW0NcM5HnfmMwx=Pgvu27drZcDkmw@mail.gmail.com>
References: <alpine.LNX.2.00.1402151533350.16321@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.1402151533350.16321@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>

On Sat, Feb 15, 2014 at 5:47 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> --- linux-m68k.orig/arch/m68k/Kconfig.debug     2014-02-15 14:49:18.000000000 +1100
> +++ linux-m68k/arch/m68k/Kconfig.debug  2014-02-15 15:06:30.000000000 +1100
> @@ -12,12 +12,15 @@ config BOOTPARAM_STRING
>
>  config EARLY_PRINTK
>         bool "Early printk"
> -       depends on MVME16x || MAC
>         help
>            Write kernel log output directly to a serial port.
> +          Where implemented, output goes to the framebuffer as well.
> +
> +          Pass "earlyprintk=debug" on the kernel command line to get a
> +          boot console (not required on MVME16x).\

Just "earlyprintk" should be enough?

Please also consider adding m68k to Documentation/kernel-parameters.txt

> +static int __init setup_early_printk(char *buf)
> +{
> +       /* MVME16x registers an early console after interrupt setup. */
> +       if (MACH_IS_MVME16x)
> +               return 0;
> +
> +       if (early_console || !buf || strcmp(buf, "debug"))

I don't think the check for "debug" is needed. ARM also doesn't do it.

> +               return 0;
> +
> +       early_console = &early_console_instance;
> +       register_console(early_console);
> +
> +       return 0;
> +}
> +
> +early_param("earlyprintk", setup_early_printk);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
