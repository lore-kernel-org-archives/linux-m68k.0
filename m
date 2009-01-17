From: Brad Boyer <flar@allandria.com>
Subject: Re: mac68k serial
Date: Sat, 17 Jan 2009 00:24:24 -0800
Message-ID: <20090117082424.GA3651@cynthia.pants.nu>
References: <1b1304130901131349n6b67eac5j1c17f4791dd6718e@mail.gmail.com> <20090114003245.GA4419@cynthia.pants.nu> <Pine.LNX.4.64.0901141224080.16246@loopy.telegraphics.com.au> <alpine.DEB.1.00.0901170022250.27520@zirkon.biophys.uni-duesseldorf.de> <Pine.LNX.4.64.0901171736060.19123@loopy.telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0901171736060.19123@loopy.telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>, flameman mayer <flamemaniii@gmail.com>, linux-m68k@lists.linux-m68k.org

On Sat, Jan 17, 2009 at 05:59:51PM +1100, Finn Thain wrote:
> On Sat, 17 Jan 2009, Michael Schmitz wrote:
> > Can't you add an empty SCC dispatch that just returns, or will that 
> > cause an interrupt storm?
> 
> The VIA would be OK with that. Whether it would work or not would depend 
> on the SCC. That is, I don't know.

The SCC IRQ isn't a VIA interrupt as far as I can tell. It looks like
only models with OSS (the IIfx) or PSC (Q660AV + Q840AV) have a way
to block the SCC IRQ. The comments in mac_scc_dispatch specifically
say that the SCC causes interrupt storms if we ignore it.

We really ought to redesign the interrupt handling for macs so it's
obvious how the interrupts wander through all the layers. There is
all that logic in the common m68k interrupt handling to register
different interrupt controllers and the mac code just registers one
giant synthetic interrupt source rather than having each driver
register directly with the core for VIA, OSS, PSC, etc.

> You could also ifdef 0 the relevant code in via.c --
> 
> 311                 request_irq(IRQ_AUTO_4, mac_scc_dispatch, IRQ_FLG_LOCK,
> 312                                 "scc", mac_scc_dispatch);
> 
> I don't really care enough to send a temporary patch upstream since the 
> serial port is presently only useful to those hacking on the kernel 
> anyway.

I don't think that will really fix anything, since IRQ_AUTO_* interrupts
aren't really blocked or ignored if you don't register them. They go
directly into the CPU which doesn't have a true IRQ mask.

	Brad Boyer
	flar@allandria.com

