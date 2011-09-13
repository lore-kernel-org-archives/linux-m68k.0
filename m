From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH 00/28 v6] m68k: Convert to genirq
Date: Wed, 14 Sep 2011 03:26:45 +1000 (EST)
Message-ID: <alpine.LNX.2.00.1109140023490.20729@nippy.intranet>
References: <1315742394-16036-1-git-send-email-geert@linux-m68k.org> <alpine.LNX.2.00.1109132030020.14483@nippy.intranet> <CAMuHMdXJEeooAjdQo+JhUWJcrGzKZb-jQPPhVggy3ocQyPe3Lw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdXJEeooAjdQo+JhUWJcrGzKZb-jQPPhVggy3ocQyPe3Lw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org


On Tue, 13 Sep 2011, Geert Uytterhoeven wrote:

> > --- linux-m68k.orig/drivers/net/macmace.c       2011-09-13 18:33:55.0000000$
> > +++ linux-m68k/drivers/net/macmace.c    2011-09-13 18:34:05.000000000 +1000
> > @@ -31,8 +31,8 @@
> >  #include <linux/dma-mapping.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/gfp.h>
> > +#include <linux/interrupt.h>
> >  #include <asm/io.h>
> > -#include <asm/irq.h>
> >  #include <asm/macints.h>
> >  #include <asm/mac_psc.h>
> >  #include <asm/page.h>
> >
> > Would you please check whether this is still needed after the v6 
> > series?
> 
> Will do. Don't think I ever saw that problem, though.

Sorry, my bad. The patch above was needed by a cleanup patch I was working 
on which removes the #include <asm/macintosh.h> from macmace.c.

Finn
