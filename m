From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [RFC 3/4] m68k: multi-platform EARLY_PRINTK
Date: Sun, 16 Feb 2014 23:59:08 +1100 (EST)
Message-ID: <alpine.LNX.2.00.1402162320580.21487@nippy.intranet>
References: <alpine.LNX.2.00.1402151533350.16321@nippy.intranet> <CAMuHMdWfZRXKdqabTFmvCjW0NcM5HnfmMwx=Pgvu27drZcDkmw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdWfZRXKdqabTFmvCjW0NcM5HnfmMwx=Pgvu27drZcDkmw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>


On Sun, 16 Feb 2014, Geert Uytterhoeven wrote:

> On Sat, Feb 15, 2014 at 5:47 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> > --- linux-m68k.orig/arch/m68k/Kconfig.debug     2014-02-15 14:49:18.000000000 +1100
> > +++ linux-m68k/arch/m68k/Kconfig.debug  2014-02-15 15:06:30.000000000 +1100
> > @@ -12,12 +12,15 @@ config BOOTPARAM_STRING
> >
> >  config EARLY_PRINTK
> >         bool "Early printk"
> > -       depends on MVME16x || MAC
> >         help
> >            Write kernel log output directly to a serial port.
> > +          Where implemented, output goes to the framebuffer as well.
> > +
> > +          Pass "earlyprintk=debug" on the kernel command line to get a
> > +          boot console (not required on MVME16x).
> 
> Just "earlyprintk" should be enough?

Perhaps. I ended up using the "debug" parameter because of MVME16x. At the 
moment it has its own early console implementation.

MVME16x might need some interrupt masking added before the head.S boot 
console can work there. (BTW, the interrupt problem may affect other 
platforms too. Atari has the same SCC initialization bugs that I fixed for 
the Mac. I should patch that. Does anyone know the Zilog SCC PCLK rate on 
Atari?)

Otherwise the existing MVME16x early console could be scrapped in favour 
of the head.S console. Or those users might want both options: the 
existing console in arch/m68k/mvme16x/config.c (say, "earlyprintk=cd2401") 
as well as the head.S console (as "earlyprintk=debug") ... or they might 
want no head.S boot console at all (and "earlyprintk" would imply CD2401) 
... or something completely different ...

> 
> Please also consider adding m68k to Documentation/kernel-parameters.txt

Will do.

Finn
