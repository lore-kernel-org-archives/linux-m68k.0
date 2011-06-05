From: Brad Boyer <flar@allandria.com>
Subject: Re: m68k: Convert to genirq (WIP)
Date: Sat, 4 Jun 2011 23:27:02 -0700
Message-ID: <20110605062702.GA2034@cynthia.pants.nu>
References: <alpine.DEB.2.00.1105282010370.16617@ayla.of.borg>
 <alpine.OSX.2.00.1106011300550.199@ibook.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.OSX.2.00.1106011300550.199@ibook.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, Thomas Gleixner <tglx@linutronix.de>, Linux Kernel Development <linux-kernel@vger.kernel.org>

On Fri, Jun 03, 2011 at 09:20:23PM +1000, Finn Thain wrote:
> On Sat, 28 May 2011, Geert Uytterhoeven wrote:
> > Of course any help is welcome, especially for Mac
> 
> What kind of help are you looking for? I read through your patch series 
> but I'm not sure how much work is left. Probably I need to look at a 
> genirq reference implementation to get an idea of the goal...

If there are any good documents on genirq, I would like to look at it
as well. I didn't see anything obvious in Documentation/ in the tree.

> > (with its maze of interrupt controllers)
> 
> Perhaps we do not need to model that complexity in generic irq terms?
> 
> The mac port could probably make good use of the irq startup and shutdown 
> hooks though.

If we could really map all the interrupt controllers, we could probably
cut down on the largest interrupt number. Most Macs really only have
20 or 30 actual interrupt sources. The problem is the two or three
layers of cascaded mess. None of them have just a single layer. Just
getting rid of the fixed global mapping could take us down to 64 since
nothing has both Baboon and PSC, but we have unique numbers for them.
We have 3 whole blocks of 8 just for PSC, even though that's just in
two models. We don't even know what most of those do, if anything.

We would probably need to move everything to platform devices if we
do that so that drivers don't need to use hard-coded interrupts. I
suppose we really should do that anyway.

	Brad Boyer
	flar@allandria.com
