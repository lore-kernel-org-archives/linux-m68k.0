From: Brad Boyer <flar@allandria.com>
Subject: Re: mac68k serial
Date: Sat, 17 Jan 2009 21:18:29 -0800
Message-ID: <20090118051829.GB15876@cynthia.pants.nu>
References: <1b1304130901131349n6b67eac5j1c17f4791dd6718e@mail.gmail.com> <20090114003245.GA4419@cynthia.pants.nu> <Pine.LNX.4.64.0901141224080.16246@loopy.telegraphics.com.au> <alpine.DEB.1.00.0901170022250.27520@zirkon.biophys.uni-duesseldorf.de> <Pine.LNX.4.64.0901171736060.19123@loopy.telegraphics.com.au> <20090117082424.GA3651@cynthia.pants.nu> <alpine.DEB.1.00.0901180133220.8392@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.1.00.0901180133220.8392@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Finn Thain <fthain@telegraphics.com.au>, flameman mayer <flamemaniii@gmail.com>, linux-m68k@lists.linux-m68k.org

On Sun, Jan 18, 2009 at 01:43:07AM +0100, Michael Schmitz wrote:
> > The SCC IRQ isn't a VIA interrupt as far as I can tell. It looks like
> 
> If it's not on the same level as one of the VIAs the SCC definitely would be 
> handling the exception protocol itself. But then, it should have been
> possible to specify an interrupt vector for each side - ISTR someone telling
> me that's not possible because of how it is hooked up. 

The standard way it is connected is as follows:

VIA1 IRQ -> bus logic -> CPU IRQ 1
VIA2 IRQ -> bus logic -> CPU IRQ 2
SCC [all IRQ outputs together] -> bus logic -> CPU IRQ 4

Apple was really sloppy with their IRQ usage back in the old days,
especially on the early Macs that we don't support. On the original
Macintosh model (and up to the SE), it was like this:

VIA IRQ output -> /IPL0 line on CPU
SCC IRQ output -> /IPL1 line on CPU
"Interrupt Switch" -> /IPL2 line on CPU

This means that they don't even decode properly such that if you
have both chips assert an interrupt at the same time, you end up
with the addition of them. There was a PAL that would force /IPL0
high when /IPL1 went low, but there was enough time for the CPU
to see both and trigger the wrong interrupt. The Mac II added the
GLUE chip that handled the IRQ interface among other things. The
IIfx is the odd one in that it is the only 68k Mac that really
has a single top-level interrupt controller that mediates all
IRQ lines. The GLUE chip is not programmable in any way, which
means that an SCC interrupt will always get to the CPU on anything
but the IIfx and AV Macs (or the Q900/950 if the IOP chip is running).

Apple was famous for these kinds of hacks to reduce the chip count
of the Macintosh (the PWM sound was another one).

> It should still be possible to shut down the SCC - after all, we have the
> base address in the bootinfo? Best do that in the early arch init code before 
> interrupts are turned on. 

Yes, we do have the SCC base in the bootinfo. However, shutting off the
chip would break the serial debug output. I know I've used that from
time to time and would miss it.

> Can we just use boilerplate SCC init code on all Mac models for this, or does 
> OSS/PSC/IOP make life more interesting there? 

The IOP is the only thing that makes any difference here, although the
only model with OSS is also one of the models with IOPs (Mac IIfx). We
already have the code in iop.c to put the SCC IOP into bypass mode. The
OSS and PSC just change how it shows up in the IRQ range. For OSS,
we make it show up as IRQ 4 but it can be masked in the OSS. With PSC, the
SCC interrupts show up through the PSC. In fact, there are apparently
two different SCC interrupt lines in this case. The code found in
m68k/mac/macints.c specifically lists two bits for SCC interrupts
with one labelled as channel A and one for channel B on PSC systems.
These two interrupts on the PSC are the same numbers that the
mac_scc_dispatch code generates per channel so that the actual
SCC driver could register these two numbers and have it work everywhere.

	Brad Boyer
	flar@allandria.com

