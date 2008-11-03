From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: I'm back on linux-m68k
Date: Mon, 03 Nov 2008 22:15:41 +0100 (CET)
Message-ID: <alpine.DEB.1.00.0811032208480.15114@zirkon.biophys.uni-duesseldorf.de>
References: <6C4F43D4-2A75-48DC-98A2-ABE37A2FB1A9@gmail.com>
 <Pine.LNX.4.64.0810160022330.21195@loopy.telegraphics.com.au>
 <CEE35843-1B20-4782-A5F9-35F0C62FE0A8@lvivier.info>
 <7869EA87-0FA5-4D73-A13F-D7DE6A8AA0A6@gmail.com>
 <Pine.LNX.4.64.0811031259300.21302@anakin>
 <20081103194757.GA19432@cynthia.pants.nu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.rz.uni-duesseldorf.de ([134.99.128.30]:50436 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752346AbYKCVPo (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 3 Nov 2008 16:15:44 -0500
Received: from conversion-daemon by mail.rz.uni-duesseldorf.de
 (Sun Internet Mail Server sims.4.0.2001.07.26.11.50.p9)
 id <0K9S00H010E5QY@mail.rz.uni-duesseldorf.de> for linux-m68k@vger.kernel.org;
 Mon,  3 Nov 2008 22:15:41 +0100 (MET)
In-reply-to: <20081103194757.GA19432@cynthia.pants.nu>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Brad Boyer <flar@allandria.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Joshua Juran <jjuran@gmail.com>, Laurent Vivier <laurent@lvivier.info>, Finn Thain <fthain@telegraphics.com.au>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi,

> > At least the Quadra 900 and 950 have two SCSI buses, as deducted from Finn'ss
> > recent patch.
> 
> It is also possible to add SCSI buses. I have a NuBus SCSI card that has
> a 53c9x chip of some flavor on it, although I haven't tried it and suspect
> that it would take some work to get it supported in Linux. Having a NuBus

The 53C9x won't be that hard, but you'll have to write register access code 
going through NUBUS instead of memory mapped IO. The NUBUS ethernet drivers 
should have plenty of sample code. Leaves the exercise of locating the chip in 
the slot address space :-) 

> SCSI card was a good option to upgrade performance of some of the mid-range
> systems where Apple was still using the NCR5380 but better chips were
> available. I'm pretty sure Apple supported booting off these as long as
> they had the correct software in the ROM on the card.

Possible, but someone will just have to report what XPRAM data this would set. 
And booting Linux off these without having a way of writing the kernel to that 
bus won't make much sense. 

	Michael

