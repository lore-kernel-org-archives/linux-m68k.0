From: Brad Boyer <flar@allandria.com>
Subject: Re: vme_scc.c breakage (was: Re: linux-next: Tree for November 21)
Date: Sat, 22 Nov 2008 18:59:30 -0800
Message-ID: <20081123025930.GA1409@cynthia.pants.nu>
References: <20081121181948.ee771502.sfr@canb.auug.org.au> <Pine.LNX.4.64.0811221558340.30025@anakin> <20081122164738.2226b63e@lxorguk.ukuu.org.uk> <alpine.DEB.1.00.0811230250290.8478@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.1.00.0811230250290.8478@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-next-owner@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

On Sun, Nov 23, 2008 at 03:29:19AM +0100, Michael Schmitz wrote:
> Time to merge with pmac_zilog or ip22zilog (the latter even needing similar 
> register access delays as Ataris). 

I can't recommend trying to merge with pmac_zilog. It's got some very
mac specific bits including workarounds for the hardware bugs in some
revisions of the ASIC that included Apple's implementation of the Zilog
ESCC. It also has to handle the odd way Apple hooked up some of the
non-data lines such as hardware flow control. The last issue would be
the fact that it's a macio bus driver rather than a platform bus driver
or something else available more generically.

I'm not even 100% sure I can make pmac_zilog get shared with m68k
macs, although I'm still looking into it.

I would definitely look at one of the other *zilog drivers first.

	Brad Boyer
	flar@allandria.com
