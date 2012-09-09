From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] clk: Make the managed clk functions generically
 available
Date: Mon, 10 Sep 2012 00:50:59 +0100
Message-ID: <20120909235059.GA2643__5722.528769593$1347234752$gmane$org@sirena.org.uk>
References: <1347202862-1617-1-git-send-email-lars@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1347202862-1617-1-git-send-email-lars@metafoo.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Mike Turquette <mturquette@ti.com>, Russell King <linux@arm.linux.org.uk>, Greg Ungerer <gerg@uclinux.org>, Julia Lawall <julia.lawall@lip6.fr>, Artem Bityutskiy <dedekind1@gmail.com>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Sun, Sep 09, 2012 at 05:01:02PM +0200, Lars-Peter Clausen wrote:

> The managed clk functions are currently only available when the generic clk
> lookup framework is build. But the managed clk functions are merely wrappers
> around clk_get and clk_put and do not depend on any specifics of the generic
> lookup functions and there are still quite a few custom implementations of the
> clk API. So make the managed functions available whenever the clk API is
> implemented.

> The patch also removes the custom implementation of devm_clk_get for the
> coldfire platform.

I posted a patch for this (clk: Move devm_ APIs out of clkdev into
HAVE_CLK) towards the end of the last release cycle and I think reposted
it since and it had been sent to the patch tracker too (though I can't
find any record of anything except the submission mail now).  It would
be *really* good to get this merged.

Who's looking after clkdev these days?  Mike doesn't seem to take
patches as he's expecting Russell to take them which was happening for a
while but I'm not sure that's the case any more, especially given
Russell's followup here.  Due to the patch tracker the usual things for
following up on unapplied patches don't work terribly well, it's much
less likely that it's just an oversight there.
