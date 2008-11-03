From: Brad Boyer <flar@allandria.com>
Subject: Re: I'm back on linux-m68k
Date: Mon, 3 Nov 2008 14:37:51 -0800
Message-ID: <20081103223751.GB19432@cynthia.pants.nu>
References: <6C4F43D4-2A75-48DC-98A2-ABE37A2FB1A9@gmail.com> <Pine.LNX.4.64.0810160022330.21195@loopy.telegraphics.com.au> <CEE35843-1B20-4782-A5F9-35F0C62FE0A8@lvivier.info> <7869EA87-0FA5-4D73-A13F-D7DE6A8AA0A6@gmail.com> <Pine.LNX.4.64.0811031259300.21302@anakin> <20081103194757.GA19432@cynthia.pants.nu> <alpine.DEB.1.00.0811032208480.15114@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from [76.245.85.235] ([76.245.85.235]:60754 "EHLO cynthia.pants.nu"
	rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1751353AbYKCWig (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Mon, 3 Nov 2008 17:38:36 -0500
Content-Disposition: inline
In-Reply-To: <alpine.DEB.1.00.0811032208480.15114@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Joshua Juran <jjuran@gmail.com>, Laurent Vivier <laurent@lvivier.info>, Finn Thain <fthain@telegraphics.com.au>, Linux/m68k <linux-m68k@vger.kernel.org>

On Mon, Nov 03, 2008 at 10:15:41PM +0100, Michael Schmitz wrote:
> > It is also possible to add SCSI buses. I have a NuBus SCSI card that has
> > a 53c9x chip of some flavor on it, although I haven't tried it and suspect
> > that it would take some work to get it supported in Linux. Having a NuBus
> 
> The 53C9x won't be that hard, but you'll have to write register access code 
> going through NUBUS instead of memory mapped IO. The NUBUS ethernet drivers 
> should have plenty of sample code. Leaves the exercise of locating the chip
> in the slot address space :-) 

Well, I did buy the card with the intent of getting a Linux driver working
at some point. It's just not that close to the top of my list. I also have
not really looked at the esp code (either the old or new version) other
than a superficial look at mac_esp.c when Finn was making some fixes. It
doesn't sound too bad from the way you describe it. If it's as easy as
taking mac_esp.c and copying it to nubus_esp.c and writing a new probe
function to detect and setup the card, that shouldn't take long. I notice
that mac_esp.c already uses nubus functions to do some of the work, and
the address space the driver uses for PDMA is in a range normally used
by the nubus code while the device registers are in regular IO space.
This could also be an excuse to dig in to nubus.c as well and get a real
device model framework there.

> > SCSI card was a good option to upgrade performance of some of the mid-range
> > systems where Apple was still using the NCR5380 but better chips were
> > available. I'm pretty sure Apple supported booting off these as long as
> > they had the correct software in the ROM on the card.
> 
> Possible, but someone will just have to report what XPRAM data this would
> set. And booting Linux off these without having a way of writing the kernel
> to that bus won't make much sense. 

I guess I'll try booting from the card whenever I actually put it in something.

	Brad Boyer
	flar@allandria.com

