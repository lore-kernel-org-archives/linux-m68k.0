From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: vme_scc.c breakage (was: Re: linux-next: Tree for November 21)
Date: Mon, 24 Nov 2008 02:55:42 +0100 (CET)
Message-ID: <alpine.DEB.1.00.0811240217030.18487@zirkon.biophys.uni-duesseldorf.de>
References: <20081121181948.ee771502.sfr@canb.auug.org.au>
 <Pine.LNX.4.64.0811221558340.30025@anakin>
 <20081122164738.2226b63e@lxorguk.ukuu.org.uk>
 <alpine.DEB.1.00.0811230250290.8478@zirkon.biophys.uni-duesseldorf.de>
 <20081123025930.GA1409@cynthia.pants.nu>
 <alpine.DEB.1.00.0811230519350.13266@zirkon.biophys.uni-duesseldorf.de>
 <20081123092222.GA4094@cynthia.pants.nu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailout-hades.uni-duesseldorf.de ([134.99.128.34]:45850 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751668AbYKXBzo (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Sun, 23 Nov 2008 20:55:44 -0500
In-reply-to: <20081123092222.GA4094@cynthia.pants.nu>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Brad Boyer <flar@allandria.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Linux/m68k <linux-m68k@vger.kernel.org>

Hi,

> > Atari SCC variants have their own quirks, so something more configurable 
> > will be needed.
> 
> We probably should have an SCC/ESCC core driver the way we have for
> a lot of the other common chips like 8390 ethernet or ESP SCSI. I
> know there's lots of systems with these chips that each have drivers.

Didn't seem too many of those in drivers/serial ...

> > What are the quirks the m68k mac SCC driver woukd add? From memory, I have this 
> 
> Most of the m68k mac serial quirks are the same as the ones in the
> pmac serial driver. There is only one interrupt for both ports, but

According to my 2.2.25 source, SCC A is at interrupt number 33, SCC B is at 34. 
Did that change with tha A/UX interrupt style? 
What seems to be true is all interrupt types for a given channel go to the same 
handler...

The platform device would need to have one interrupt number each for TX, RX, 
status and special condition for each channel, plus data/control ports forr 
each, plus flags. The Mac platform device would have only one interrupt per 
channel (and perhaps a flag indicating that).

> the drivers do funny things to make it look mostly like each port
> has its own interrupt. There are some odd things about how Apple
> hooked up the hardware flow control. I suspect that any models with

Right you are ...

> built-in modems need enable/disable code for that on m68k macs

Are there any Macs with builtin modems in the standard configuration?

> There isn't much m68k mac specific, and I don't think the issues
> you mention for Atari are issues on macs. The AV systems have
> DMA but don't have a tx-dma channel for the second port. The one
> interrupt is hooked up to IRQ 4, which means it doesn't go through

This is on AV Macs only (because the PSC interrupts are at 32-35 there)?

> > Can the platform bus device code define architecture specific init callbacks
> > to hide this?
> 
> We could probably do something along those lines, but I can't see
> tying it directly to the platform bus. I think it would be better
> to make a zilog SCC/ESCC core driver and write a driver for each
> bus interface type the way the ESP driver now works. It just seems
> simpler from a code maintenance perspective.

I don't think using callbacks would be a clean way of handling this, so your 
idea may be better. 

VME and Atari used to use the same driver in 2.2 so that should still be 
possible now. 

	Michael

