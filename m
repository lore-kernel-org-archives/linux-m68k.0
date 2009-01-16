From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: mac68k serial
Date: Sat, 17 Jan 2009 00:31:00 +0100 (CET)
Message-ID: <alpine.DEB.1.00.0901170022250.27520@zirkon.biophys.uni-duesseldorf.de>
References: <1b1304130901131349n6b67eac5j1c17f4791dd6718e@mail.gmail.com>
 <20090114003245.GA4419@cynthia.pants.nu>
 <Pine.LNX.4.64.0901141224080.16246@loopy.telegraphics.com.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
In-reply-to: <Pine.LNX.4.64.0901141224080.16246@loopy.telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Brad Boyer <flar@allandria.com>, flameman mayer <flamemaniii@gmail.com>, linux-m68k@lists.linux-m68k.org

Hi,

> > > 000004 modules linked in: m68k_handle_int+0x1c/0x36
> > > 
> > > call trace mac_scc_dispatch+0x3a/0x40 auto_irqhandler_fixup+0x4/0x6
> > > 
> > > also, i hacked the "emile-0.12" sources to build a monitor able to
> > > serially talk: it works for both the 2 LC475 serial lines :P
> > > 
> > > is there anything about serial support for linux-m68k ?
> > 
> > The real driver for the serial ports on m68k Macintosh systems got 
> > removed from the tree a long time ago and has not been replaced as of 
> > this time. However, we still register mac_scc_dispatch as an interrupt 
> > handler for the line that the SCC uses. This looks like you got an 
> > interrupt for the serial chip and the interrupt code got confused trying 
> > to dispatch to nothing. I've never seen it happen, but it does look like 
> > that would be the expected behavior of the current code.
> 
> I've seen it happen. You should avoid sending anything to the mac serial 
> port. But you can still capture kernel messages from the mac serial port 
> without triggering the panic.

Can't you add an empty SCC dispatch that just returns, or will that cause an 
interrupt storm? 

> > It's on my list to fix, but I honestly haven't had much time to work on 
> > it. My plan is to either share or copy pmac_zilog.c which is the driver 
> > for the serial on PowerMacs rather than start from the Atari driver as 
> > mentioned in the web page above. It's not only the same chip but 
> > attached to the system in mostly the same way.
> 
> It's on my list, too. But above it are frame buffer, Nubus, SCSI and PMU 
> issues.

I'll get to working on simplifying the Atari SCC driver eventually, but that's 
not top of my list either. I could give mac_scc a shot after that (starting 
from pmac_zilog). 

	Michael

