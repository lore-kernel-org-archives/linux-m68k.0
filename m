From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [RFC 3/4] m68k: multi-platform EARLY_PRINTK
Date: Tue, 18 Feb 2014 13:45:30 +1100 (EST)
Message-ID: <alpine.LNX.2.00.1402181311200.5417@nippy.intranet>
References: <alpine.LNX.2.00.1402151533350.16321@nippy.intranet> <CAMuHMdULJ+61j4SreJXjPwnHVcQ_W4_ousfBzZz1+RqgF+hSGA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdULJ+61j4SreJXjPwnHVcQ_W4_ousfBzZz1+RqgF+hSGA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>, Sam Creasey <sammy@sammy.net>


On Mon, 17 Feb 2014, Geert Uytterhoeven wrote:

> On Sat, Feb 15, 2014 at 5:47 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> > --- linux-m68k.orig/arch/m68k/Kconfig.debug     2014-02-15 14:49:18.000000000 +1100
> > +++ linux-m68k/arch/m68k/Kconfig.debug  2014-02-15 15:06:30.000000000 +1100
> > @@ -12,12 +12,15 @@ config BOOTPARAM_STRING
> >
> >  config EARLY_PRINTK
> >         bool "Early printk"
> > -       depends on MVME16x || MAC
> 
> This should depend on !SUN3, as arch/m68k/kernel/sun3-head.S doesn't 
> have debug_cons_write:
> 
> arch/m68k/kernel/built-in.o: In function `early_cons_write':
> early_printk.c:(.init.text+0x512): undefined reference to `debug_cons_write'
> 
> Alternatively, we can have a loop around prom_putchar() here in the
> #ifdef CONFIG_SUN3 case?

Why not?

I just noticed that there's another debug console in arch/m68k/sun3x/prom.c
We could replace that one too (as with MVME16x), assuming someone can test 
the changes.

Or we could just do,
 config EARLY_PRINTK
        bool "Early printk"
-       depends on MVME16x || MAC
+       depends on !SUN3 && !SUN3X

I guess !SUN3 && !SUN3X is correct for this patch anyway; any work on the 
other platforms I will put into subsequent patches in the same series.

Finn
