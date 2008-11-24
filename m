From: Brad Boyer <flar@allandria.com>
Subject: Re: vme_scc.c breakage (was: Re: linux-next: Tree for November 21)
Date: Sun, 23 Nov 2008 22:08:38 -0800
Message-ID: <20081124060838.GA15288@cynthia.pants.nu>
References: <20081121181948.ee771502.sfr@canb.auug.org.au> <Pine.LNX.4.64.0811221558340.30025@anakin> <20081122164738.2226b63e@lxorguk.ukuu.org.uk> <alpine.DEB.1.00.0811230250290.8478@zirkon.biophys.uni-duesseldorf.de> <20081123025930.GA1409@cynthia.pants.nu> <alpine.DEB.1.00.0811230519350.13266@zirkon.biophys.uni-duesseldorf.de> <20081123092222.GA4094@cynthia.pants.nu> <alpine.DEB.1.00.0811240217030.18487@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.1.00.0811240217030.18487@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-next-owner@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Linux/m68k <linux-m68k@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

On Mon, Nov 24, 2008 at 02:55:42AM +0100, Michael Schmitz wrote:
> > We probably should have an SCC/ESCC core driver the way we have for
> > a lot of the other common chips like 8390 ethernet or ESP SCSI. I
> > know there's lots of systems with these chips that each have drivers.
> 
> Didn't seem too many of those in drivers/serial ...

I must admit I didn't go count them.

> > Most of the m68k mac serial quirks are the same as the ones in the
> > pmac serial driver. There is only one interrupt for both ports, but
> 
> According to my 2.2.25 source, SCC A is at interrupt number 33, SCC B is
> at 34. Did that change with tha A/UX interrupt style? 

No, those are synthetic interrupt sources. If you look at the interrupt
code, there is a fake interrupt controller registered on IRQ 4 that
looks at the SCC status bits and triggers the correct interrupt. Take
a look at mac_scc_dispatch in arch/m68k/mac/macints.c for details. The
pmac_zilog code does it a little different by tying the two devices
together and only registering for one interrupt and passing them off.

> What seems to be true is all interrupt types for a given channel go to
> the same handler...

That is definitely true on any Mac. Apple was generally stingy with
interrupt sources. For example, some mac systems don't even have a
real IRQ per NuBus slot even though they do all at least have a way
to detect which slot asserted the interrupt.

> The platform device would need to have one interrupt number each for TX, RX, 
> status and special condition for each channel, plus data/control ports forr 
> each, plus flags. The Mac platform device would have only one interrupt per 
> channel (and perhaps a flag indicating that).

I'm sure we could do something like that with flags.

> > built-in modems need enable/disable code for that on m68k macs
> 
> Are there any Macs with builtin modems in the standard configuration?

It depends on what you mean by standard configuration. Some PowerBooks
shipped with internal modems, but I don't think there is any model
that always had one. It was an option on most later m68k PowerBooks
while most early ppc PowerBooks always had an internal modem.

> > There isn't much m68k mac specific, and I don't think the issues
> > you mention for Atari are issues on macs. The AV systems have
> > DMA but don't have a tx-dma channel for the second port. The one
> > interrupt is hooked up to IRQ 4, which means it doesn't go through
> 
> This is on AV Macs only (because the PSC interrupts are at 32-35 there)?

The AV Macs are quite a bit different from an IRQ perspective. They
don't hook much of anything up directly, so the layout is slightly more
logical. In particular, the registration of mac_scc_dispatch to IRQ 4
is conditionalized on !psc_present to exclude the AV models. It's all
the models using VIA1 as the main interrupt controller that need it.
The SCC interrupt line is never hooked up to a VIA chip, but it is
connected to the PSC on AV macs and the SCC IOP on the IIfx.  Sorry
if the way I wrote this was confusing.

> > We could probably do something along those lines, but I can't see
> > tying it directly to the platform bus. I think it would be better
> > to make a zilog SCC/ESCC core driver and write a driver for each
> > bus interface type the way the ESP driver now works. It just seems
> > simpler from a code maintenance perspective.
> 
> I don't think using callbacks would be a clean way of handling this, so your 
> idea may be better. 

It's hard to say for sure without trying it to see how it turns out.

> VME and Atari used to use the same driver in 2.2 so that should still be 
> possible now. 

Seems reasonable.

	Brad Boyer
	flar@allandria.com
