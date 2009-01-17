From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: mac68k serial
Date: Sat, 17 Jan 2009 17:59:51 +1100 (EST)
Message-ID: <Pine.LNX.4.64.0901171736060.19123@loopy.telegraphics.com.au>
References: <1b1304130901131349n6b67eac5j1c17f4791dd6718e@mail.gmail.com>
 <20090114003245.GA4419@cynthia.pants.nu> <Pine.LNX.4.64.0901141224080.16246@loopy.telegraphics.com.au>
 <alpine.DEB.1.00.0901170022250.27520@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.1.00.0901170022250.27520@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Brad Boyer <flar@allandria.com>, flameman mayer <flamemaniii@gmail.com>, linux-m68k@lists.linux-m68k.org



On Sat, 17 Jan 2009, Michael Schmitz wrote:

> Hi,
> 
> > > > 000004 modules linked in: m68k_handle_int+0x1c/0x36
> > > > 
> > > > call trace mac_scc_dispatch+0x3a/0x40 
> > > > auto_irqhandler_fixup+0x4/0x6
> > > > 
> > > > also, i hacked the "emile-0.12" sources to build a monitor able to 
> > > > serially talk: it works for both the 2 LC475 serial lines :P
> > > > 
> > > > is there anything about serial support for linux-m68k ?
> > > 
> > > The real driver for the serial ports on m68k Macintosh systems got 
> > > removed from the tree a long time ago and has not been replaced as 
> > > of this time. However, we still register mac_scc_dispatch as an 
> > > interrupt handler for the line that the SCC uses. This looks like 
> > > you got an interrupt for the serial chip and the interrupt code got 
> > > confused trying to dispatch to nothing. I've never seen it happen, 
> > > but it does look like that would be the expected behavior of the 
> > > current code.
> > 
> > I've seen it happen. You should avoid sending anything to the mac 
> > serial port. But you can still capture kernel messages from the mac 
> > serial port without triggering the panic.
> 
> Can't you add an empty SCC dispatch that just returns, or will that 
> cause an interrupt storm?

The VIA would be OK with that. Whether it would work or not would depend 
on the SCC. That is, I don't know.

You could also ifdef 0 the relevant code in via.c --

311                 request_irq(IRQ_AUTO_4, mac_scc_dispatch, IRQ_FLG_LOCK,
312                                 "scc", mac_scc_dispatch);

I don't really care enough to send a temporary patch upstream since the 
serial port is presently only useful to those hacking on the kernel 
anyway.

Finn
