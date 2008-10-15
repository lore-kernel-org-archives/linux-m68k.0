From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: write ordering and macfb nop() usage
Date: Thu, 16 Oct 2008 02:01:37 +1100 (EST)
Message-ID: <Pine.LNX.4.64.0810151843380.21195@loopy.telegraphics.com.au>
References: <Pine.LNX.4.64.0810150251270.14578@loopy.telegraphics.com.au>
 <20081014220454.GA6601@cynthia.pants.nu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from loopy.telegraphics.com.au ([202.45.126.152]:40607 "EHLO
	loopy.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752774AbYJOPBi (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 15 Oct 2008 11:01:38 -0400
In-Reply-To: <20081014220454.GA6601@cynthia.pants.nu>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Brad Boyer <flar@allandria.com>
Cc: linux-m68k@vger.kernel.org



On Tue, 14 Oct 2008, Brad Boyer wrote:

> On Wed, Oct 15, 2008 at 03:56:35AM +1100, Finn Thain wrote:

> I would expect the accessor functions to do the right thing, but I would 
> not be surprised if they don't.

Well, if the volatile qualifier doesn't provide write ordering, then the 
next question would be, do we need a barrier in nubus_read/write?

Or are you suggesting that the cache might re-order these writes? NuBus 
frame buffers don't have CLUT registers ioremap'd in macfb.c, but the 
built-in frame buffers do. Presumably that's because nubus slot space is 
already mapped PAGE_NOCACHE by head.S.

> ...The basic nubus.c code could use some attention.

Not sure what you have in mind? I notice that there was some work done 
there for Linux/ppc-nubus*...

I've been working on nubus.c too, since it has a bug that seems to 
register cards twice (causing a stack trace from the procfs driver and 
also causing macfb to match the same card twice). And there's some patches 
from the mac68k repo that I've forward-ported. And the usual minor fixes 
and cleanups.

> It's possible that we really should be reading some kind of status from 
> the card and this delay just happens to make it work most of the time.

I did some digging in the mac68k CVS. It looks like the nops first 
appeared in the code for TFB and MDC support** ("to order writes"), and 
were simultaneously added for RBV. (TFB and MDC are nubus, RBV isn't of 
course.) Then in the next commit nops were added to all other pallete 
routines with no reason given. (The other routines, like RBV, were 
apparently already working at that point.)

I guess I'll just remove the nops and test the palette code.

Finn


* http://nubus-pmac.cvs.sourceforge.net/viewvc/nubus-pmac/linuxppc-2.4-nubus/drivers/nubus/nubus.c?r1=1.5&r2=1.6
** http://linux-mac68k.cvs.sourceforge.net/viewvc/linux-mac68k/linux-mac68k/drivers/video/macfb.c?r1=1.19&r2=1.20&pathrev=MAIN
