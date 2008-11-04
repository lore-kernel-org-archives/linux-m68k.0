From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: I'm back on linux-m68k
Date: Tue, 04 Nov 2008 08:25:31 +0100 (CET)
Message-ID: <alpine.DEB.1.00.0811040818320.2519@zirkon.biophys.uni-duesseldorf.de>
References: <6C4F43D4-2A75-48DC-98A2-ABE37A2FB1A9@gmail.com>
 <Pine.LNX.4.64.0810160022330.21195@loopy.telegraphics.com.au>
 <CEE35843-1B20-4782-A5F9-35F0C62FE0A8@lvivier.info>
 <7869EA87-0FA5-4D73-A13F-D7DE6A8AA0A6@gmail.com>
 <Pine.LNX.4.64.0811031259300.21302@anakin>
 <20081103194757.GA19432@cynthia.pants.nu>
 <alpine.DEB.1.00.0811032208480.15114@zirkon.biophys.uni-duesseldorf.de>
 <20081103223751.GB19432@cynthia.pants.nu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.rz.uni-duesseldorf.de ([134.99.128.30]:33747 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752028AbYKDHZe (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 4 Nov 2008 02:25:34 -0500
Received: from conversion-daemon by mail.rz.uni-duesseldorf.de
 (Sun Internet Mail Server sims.4.0.2001.07.26.11.50.p9)
 id <0K9S00701SMKOQ@mail.rz.uni-duesseldorf.de> for linux-m68k@vger.kernel.org;
 Tue,  4 Nov 2008 08:25:32 +0100 (MET)
In-reply-to: <20081103223751.GB19432@cynthia.pants.nu>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Brad Boyer <flar@allandria.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Joshua Juran <jjuran@gmail.com>, Laurent Vivier <laurent@lvivier.info>, Finn Thain <fthain@telegraphics.com.au>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi,

> > The 53C9x won't be that hard, but you'll have to write register access code 
> > going through NUBUS instead of memory mapped IO. The NUBUS ethernet drivers 
> > should have plenty of sample code. Leaves the exercise of locating the chip
> > in the slot address space :-) 
> 
> Well, I did buy the card with the intent of getting a Linux driver working
> at some point. It's just not that close to the top of my list. I also have
> not really looked at the esp code (either the old or new version) other
> than a superficial look at mac_esp.c when Finn was making some fixes. It

The new esp code is much cleaner and should be easier to adapt to a new bus 
model (I won't deny Nubus might not have quirks of its own there - bus width may 
be an issue, bytes may come spaced by null bytes, you name it, Apple thought of 
it).

> doesn't sound too bad from the way you describe it. If it's as easy as
> taking mac_esp.c and copying it to nubus_esp.c and writing a new probe
> function to detect and setup the card, that shouldn't take long. I notice
> that mac_esp.c already uses nubus functions to do some of the work, and
> the address space the driver uses for PDMA is in a range normally used
> by the nubus code while the device registers are in regular IO space.

No idea how PDMA would work - may there is a DMA chip even? 

> This could also be an excuse to dig in to nubus.c as well and get a real
> device model framework there.

The best excuse :-) 
 
	Michael

