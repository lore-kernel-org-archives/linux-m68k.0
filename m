From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH 1/4] m68k/mac: More printk modernization
Date: Sat, 28 Oct 2017 09:35:45 +1100 (AEDT)
Message-ID: <alpine.LNX.2.00.1710280923440.3@nippy.intranet>
References: <cover.1509071937.git.fthain@telegraphics.com.au> <afe6ecb8fcbe726eecc42bd967e5d71502658f40.1509071937.git.fthain@telegraphics.com.au> <CACz-3riWPO6Kef8mtSHWp=zm0Tzi5P-GvbRdgqp6RTSwauOrYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:51484 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752593AbdJ0Wfl (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 27 Oct 2017 18:35:41 -0400
In-Reply-To: <CACz-3riWPO6Kef8mtSHWp=zm0Tzi5P-GvbRdgqp6RTSwauOrYg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Kars de Jong <jongk@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 27 Oct 2017, Kars de Jong wrote:

> 2017-10-27 4:45 GMT+02:00 Finn Thain <fthain@telegraphics.com.au>:
> > Log message fragments used to be printed on one line but now get split 
> > up. Fix this. Also, suppress log spam that merely prints known pointer 
> > values.
> >
> > Tested-by: Stan Johnson <userm57@yahoo.com>
> > Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
> > ---
> >  arch/m68k/mac/baboon.c |  2 +-
> >  arch/m68k/mac/iop.c    |  4 ++--
> >  arch/m68k/mac/psc.c    |  6 ++----
> >  arch/m68k/mac/via.c    | 18 +++++-------------
> >  4 files changed, 10 insertions(+), 20 deletions(-)
> 
> ...
> 
> > diff --git a/arch/m68k/mac/psc.c b/arch/m68k/mac/psc.c
> > index 439a2a2e5874..8d547df4e16c 100644
> > --- a/arch/m68k/mac/psc.c
> > +++ b/arch/m68k/mac/psc.c
> > @@ -42,7 +42,7 @@ static void psc_debug_dump(void)
> >                 return;
> >
> >         for (i = 0x30 ; i < 0x70 ; i += 0x10) {
> > -               printk("PSC #%d:  IFR = 0x%02X IER = 0x%02X\n",
> > +               printk(KERN_DEBUG "PSC #%d:  IFR = 0x%02X IER = 0x%02X\n",
> >                         i >> 4,
> >                         (int) psc_read_byte(pIFRbase + i),
> >                         (int) psc_read_byte(pIERbase + i));
> 
> Any particular reason why you didn't use pr_debug() here? I'm guessing 
> it's because this is not a known pointer value?
> 

It's because the call to psc_debug_dump() is already conditional on #ifdef 
DEBUG_PSC.

Having the printk conditional on both DEBUG and DEBUG_PSC would be 
annoying. And I didn't want an unconditional call to psc_debug_dump() 
because I think PSC_DEBUG could become more useful given that PSC support 
is woefully incomplete.

Generally, I like to avoid pr_debug(). But printk() now works differently, 
and now I have to avoid pr_cont(). And if I can avoid pr_cont() then it 
actually makes sense to use pr_debug().

-- 

> Kars.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
