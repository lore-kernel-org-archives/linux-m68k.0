From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [RFC 4/4] m68k/atari: fix SCC initialization for debug console
Date: Tue, 4 Mar 2014 13:31:35 +1100 (EST)
Message-ID: <alpine.LNX.2.00.1403041304120.13150@nippy.intranet>
References: <alpine.LNX.2.00.1403022341590.5357@nippy.intranet> <CAOmrzkJhFs=HCBkxKQYNk9tNs1Nd8O5KiUG0qsWDJSRtWGzuGQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAOmrzkJhFs=HCBkxKQYNk9tNs1Nd8O5KiUG0qsWDJSRtWGzuGQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>


On Tue, 4 Mar 2014, Michael Schmitz wrote:

> >
> > The 7.9872 MHz PCLK used in this patch was inferred from the existing 
> > code as I don't have any hardware data.
> 
> The difference in clock source settings is the main reason we can't use 
> the exact same code IIRC.

> >         .byte   14,2,14,3       /* use master clock for BRG, enable */

This is the other difference. For some reason the SCC initialization code 
on a Mac selects the external clock for the Baud Rate Generator, whereas 
on an Atari the master clock is used.

pmac_zilog does the same as the Mac code here. There is some mention of 
MIDI in the comments there. AppleTalk also uses an external clock, IIRC.

I've no idea whether the master clock runs at the same rate across all Mac 
models. Anyway, the existing code works on all the Macs I've tested 
(though it needs the bootloader to "warm up serial ports" on some 
powerbooks).

Finn
