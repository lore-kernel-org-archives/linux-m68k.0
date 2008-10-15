From: Brad Boyer <flar@allandria.com>
Subject: Re: write ordering and macfb nop() usage
Date: Wed, 15 Oct 2008 12:08:01 -0700
Message-ID: <20081015190801.GA21373@cynthia.pants.nu>
References: <Pine.LNX.4.64.0810150251270.14578@loopy.telegraphics.com.au> <20081014220454.GA6601@cynthia.pants.nu> <Pine.LNX.4.64.0810151843380.21195@loopy.telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from [76.245.85.235] ([76.245.85.235]:36943 "EHLO cynthia.pants.nu"
	rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1752506AbYJOTIQ (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Wed, 15 Oct 2008 15:08:16 -0400
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0810151843380.21195@loopy.telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k@vger.kernel.org

On Thu, Oct 16, 2008 at 02:01:37AM +1100, Finn Thain wrote:
> On Tue, 14 Oct 2008, Brad Boyer wrote:
> > I would expect the accessor functions to do the right thing, but I would 
> > not be surprised if they don't.
> 
> Well, if the volatile qualifier doesn't provide write ordering, then the 
> next question would be, do we need a barrier in nubus_read/write?

The volatile qualifier just prevents certain types of reordering by
the compiler. However, the 68k chips and early Mac hardware were
generally simple enough to not have the same runtime ordering issues
as more modern architectures. It's probably enough for us, but I
doubt it's enough for ppc systems with NuBus. I will note that they
seem to have added some barriers in their version of nubus.c.

> Or are you suggesting that the cache might re-order these writes? NuBus 
> frame buffers don't have CLUT registers ioremap'd in macfb.c, but the 
> built-in frame buffers do. Presumably that's because nubus slot space is 
> already mapped PAGE_NOCACHE by head.S.

We really shouldn't rely on that in the generic NuBus code, particularly
since that puts an extra burden on the ppc people whenever they get their
code working again.

> > ...The basic nubus.c code could use some attention.
> 
> Not sure what you have in mind? I notice that there was some work done 
> there for Linux/ppc-nubus*...

Moving to the modern device/driver model would be nice. This would let
us integrate much better with the rest of the kernel. Removing some of
the m68k centric assumptions would be good, too.

> I've been working on nubus.c too, since it has a bug that seems to 
> register cards twice (causing a stack trace from the procfs driver and 
> also causing macfb to match the same card twice). And there's some patches 
> from the mac68k repo that I've forward-ported. And the usual minor fixes 
> and cleanups.

That's always a good thing, although it's separate from what I was
considering. We obviously need to fix bugs.

> > It's possible that we really should be reading some kind of status from 
> > the card and this delay just happens to make it work most of the time.
> 
> I did some digging in the mac68k CVS. It looks like the nops first 
> appeared in the code for TFB and MDC support** ("to order writes"), and 
> were simultaneously added for RBV. (TFB and MDC are nubus, RBV isn't of 
> course.) Then in the next commit nops were added to all other pallete 
> routines with no reason given. (The other routines, like RBV, were 
> apparently already working at that point.)

My guess is that someone just tried to make them all look alike without
understanding why they were there in the other code. What we may actually
need is just a really short delay. Some of the mac support code already
does that sort of thing for hardware that takes time to settle that isn't
handled automatically by the bus interface logic.

> I guess I'll just remove the nops and test the palette code.

It's worth trying. If there's hardware you don't have but want to test,
I do have a fair number of systems laying around. Maybe someone else
will be where they could test other hardware as well. I have some Toby
video cards, but not any of the other supported NuBus video cards. I
also have a couple unsupported NuBus video cards that just make Linux
not boot at all.

	Brad Boyer
	flar@allandria.com

