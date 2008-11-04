From: Brad Boyer <flar@allandria.com>
Subject: Re: I'm back on linux-m68k
Date: Tue, 4 Nov 2008 09:59:55 -0800
Message-ID: <20081104175954.GA31150@cynthia.pants.nu>
References: <6C4F43D4-2A75-48DC-98A2-ABE37A2FB1A9@gmail.com> <Pine.LNX.4.64.0810160022330.21195@loopy.telegraphics.com.au> <CEE35843-1B20-4782-A5F9-35F0C62FE0A8@lvivier.info> <7869EA87-0FA5-4D73-A13F-D7DE6A8AA0A6@gmail.com> <Pine.LNX.4.64.0811031259300.21302@anakin> <20081103194757.GA19432@cynthia.pants.nu> <alpine.DEB.1.00.0811032208480.15114@zirkon.biophys.uni-duesseldorf.de> <20081103223751.GB19432@cynthia.pants.nu> <alpine.DEB.1.00.0811040818320.2519@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from [76.245.85.235] ([76.245.85.235]:54084 "EHLO cynthia.pants.nu"
	rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1752810AbYKDSAv (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Tue, 4 Nov 2008 13:00:51 -0500
Content-Disposition: inline
In-Reply-To: <alpine.DEB.1.00.0811040818320.2519@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Joshua Juran <jjuran@gmail.com>, Laurent Vivier <laurent@lvivier.info>, Finn Thain <fthain@telegraphics.com.au>, Linux/m68k <linux-m68k@vger.kernel.org>

On Tue, Nov 04, 2008 at 08:25:31AM +0100, Michael Schmitz wrote:
> The new esp code is much cleaner and should be easier to adapt to a new bus 
> model (I won't deny Nubus might not have quirks of its own there - bus width
> may be an issue, bytes may come spaced by null bytes, you name it, Apple
> thought of it).

The generic nubus code already has some of the bus width problems handled
because it needs to be able to read the ROM chips. It is something of a
pain since it has to support nearly arbitrary arrangements of byte lanes.

> No idea how PDMA would work - may there is a DMA chip even? 

Well, I do know that some NuBus cards have real DMA. The problem is that
it's always card specific. There is never a bus-level DMA controller. I
would hope that a high performance SCSI card would have that, but I've
only seen explicit mention of it on video cards. I'll probably try PIO
first, then try to see if it does DMA. It's possible the card just has
a bunch of local memory for buffers like some ethernet cards.

> > This could also be an excuse to dig in to nubus.c as well and get a real
> > device model framework there.
> 
> The best excuse :-) 

Now I just have to find the time.

	Brad Boyer
	flar@allandria.com

