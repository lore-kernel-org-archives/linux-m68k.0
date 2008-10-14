From: Brad Boyer <flar@allandria.com>
Subject: Re: write ordering and macfb nop() usage
Date: Tue, 14 Oct 2008 15:04:55 -0700
Message-ID: <20081014220454.GA6601@cynthia.pants.nu>
References: <Pine.LNX.4.64.0810150251270.14578@loopy.telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from [76.245.85.235] ([76.245.85.235]:36882 "EHLO cynthia.pants.nu"
	rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1751056AbYJNWFO (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Tue, 14 Oct 2008 18:05:14 -0400
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0810150251270.14578@loopy.telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k@vger.kernel.org

On Wed, Oct 15, 2008 at 03:56:35AM +1100, Finn Thain wrote:
> I've been working on macfb.c, and I notice that it is full of stuff like 
> this:
> 
>         /* the nop's are there to order writes. */
>         nubus_writeb(_regno, &cmap_regs->addr); nop();
>         nubus_writeb(_red, &cmap_regs->lut);    nop();
>         nubus_writeb(_green, &cmap_regs->lut);  nop();
>         nubus_writeb(_blue, &cmap_regs->lut);
> 
> Timing aside, I don't see what are the nop's are for. I thought accessors 
> like nubus_write/raw_out/out are intended to issue these writes in order 
> anyway?

I would expect the accessor functions to do the right thing, but I would
not be surprised if they don't. The NuBus code is pretty hackish in general
due to lack of documentation of all the implementations. This reminds me
of the via memory bogon stuff that used to be in via.c. Some of the early
mac code is very sloppy. The basic nubus.c code could use some attention.
It's on my list, but that list keeps getting longer and this one isn't
that close to the top of my list.

> And why were nop's were used instead of an empty asm() or just a volatile 
> qualifier anyway? Some accident of history like a compiler bug?

My guess is that this was easier in some way.

> Also, can a nop provide a useful timing constraint when bus speed can vary 
> so much from one machine to another?

No, it can't. The bus interface circuits are supposed to do the clock sync
for us in any case. It's possible that we really should be reading some
kind of status from the card and this delay just happens to make it work
most of the time.

> I'm baffled.

I'd think you'd be used to that by now.  :)

	Brad Boyer
	flar@allandria.com

