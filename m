From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: vme_scc.c breakage (was: Re: linux-next: Tree for November 21)
Date: Sun, 23 Nov 2008 05:40:21 +0100 (CET)
Message-ID: <alpine.DEB.1.00.0811230519350.13266@zirkon.biophys.uni-duesseldorf.de>
References: <20081121181948.ee771502.sfr@canb.auug.org.au>
 <Pine.LNX.4.64.0811221558340.30025@anakin>
 <20081122164738.2226b63e@lxorguk.ukuu.org.uk>
 <alpine.DEB.1.00.0811230250290.8478@zirkon.biophys.uni-duesseldorf.de>
 <20081123025930.GA1409@cynthia.pants.nu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-next-owner@vger.kernel.org>
In-reply-to: <20081123025930.GA1409@cynthia.pants.nu>
Sender: linux-next-owner@vger.kernel.org
To: Brad Boyer <flar@allandria.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Linux/m68k <linux-m68k@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

Hi, 

> > Time to merge with pmac_zilog or ip22zilog (the latter even needing similar 
> > register access delays as Ataris). 
> 
> I can't recommend trying to merge with pmac_zilog. It's got some very
> mac specific bits including workarounds for the hardware bugs in some
> revisions of the ASIC that included Apple's implementation of the Zilog
> ESCC. It also has to handle the odd way Apple hooked up some of the
> non-data lines such as hardware flow control. The last issue would be
> the fact that it's a macio bus driver rather than a platform bus driver
> or something else available more generically.

>From a cursory glance, ip22zilog is not a platform bus driver either. I was 
thinking along the same lines, though.

Atari SCC variants have their own quirks, so something more configurable will 
be needed.

> I'm not even 100% sure I can make pmac_zilog get shared with m68k
> macs, although I'm still looking into it.
> 
> I would definitely look at one of the other *zilog drivers first.

What are the quirks the m68k mac SCC driver woukd add? From memory, I have this 
for Atari:

- hardware recovery delay for register access
- channel A/B reversed on ST ESCC
- TT channel A has 3.672 MHz RTxC, different from channel B; this is generated 
  by timer C and needs to be set up.
- TT ring indicator is wired to separate interrupt
- serial console may have initialized channel B already (ip22zilog 
  handles this).

VME needs interrupt enable in the main interrupt controller. 

Can the platform bus device code define architecture specific init callbacks to 
hide this?

	Michael
