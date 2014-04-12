From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH RESEND 3/4] m68k/mvme16x: adopt common boot console
Date: Sat, 12 Apr 2014 11:40:27 +1000 (EST)
Message-ID: <alpine.LNX.2.00.1404121005330.7885@nippy.intranet>
References: <20140411052757.888960081@telegraphics.com.au> <20140411052758.849384587@telegraphics.com.au> <CAMuHMdVVHbyQQq8-OVTOmzNzSzco6jUu7YpVDcLUKw4s1tKiUg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:37280 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755060AbaDLBkt (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 11 Apr 2014 21:40:49 -0400
In-Reply-To: <CAMuHMdVVHbyQQq8-OVTOmzNzSzco6jUu7YpVDcLUKw4s1tKiUg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitz@debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>


On Fri, 11 Apr 2014, Geert Uytterhoeven wrote:

> 
> > +#ifdef CONFIG_MVME16X
> > +static struct console early_console_instance = {
> > +#else
> >  static struct console early_console_instance __initdata = {
> > +#endif
> 
> > +       if (MACH_IS_MVME16x)
> > +               early_console_instance.write = mvme16x_cons_write;
> > +       else
> > +               early_console_instance.write = debug_cons_write;
> 
> > +       if (!early_console || MACH_IS_MVME16x)
> >                 return 0;
> 
> I don't like these tests for MVME16X in (presumably) generic code.
> Is there a way we can avoid this?
> 

Some alternative approaches:

1) Somehow make the tests more precise: "are we running on MVME?"  
   becomes "is the console output code not in .init.text?"
   I don't know that this is feasible.

2) Mark the MVME console output routine __init (making it less useful).  
   If we make all users of earlyprintk lose the boot console at 
   __late_initcall() time, then we can call mvme16x_cons_write() from 
   debug_cons_write().

3) Move all of the head.S console code and data out of .init sections, for 
   all platforms. Not practical I think.

4) If the bloat is acceptable, maybe we could scrap the __init attributes 
   for early_console_instance and debug_cons_write(). And call 
   mvme16x_cons_write() from debug_cons_write(). Then hide all these 
   routines and the __late_initcall within
   #if defined(CONFIG_AMIGA) || defined(CONFIG_ATARI) || ...
   #endif

Thoughts?

-- 
