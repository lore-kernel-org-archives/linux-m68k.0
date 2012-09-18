From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] clk: Make the managed clk functions generically
	available
Date: Tue, 18 Sep 2012 10:35:36 +0100
Message-ID: <20120918093536.GV12245__13344.811628531$1347960981$gmane$org@n2100.arm.linux.org.uk>
References: <20120909235059.GA2643@sirena.org.uk> <20120910001524.GL13739@n2100.arm.linux.org.uk> <20120910002020.GB16249@opensource.wolfsonmicro.com> <20120910003913.GM13739@n2100.arm.linux.org.uk> <504F4E36.20309@metafoo.de> <1347375033.27206.3.camel@sauron.fi.intel.com> <504FE633.2090304@snapgear.com> <5050F3DB.1050202@metafoo.de> <20120915213151.GM12245@n2100.arm.linux.org.uk> <20120918080037.GA15982@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120918080037.GA15982@avionic-0098.mockup.avionic-design.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thierry Reding <thierry.reding@avionic-design.de>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Greg Ungerer <gerg@snapgear.com>, dedekind1@gmail.com, Mark Brown <broonie@opensource.wolfsonmicro.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, linux-m68k@lists.linux-m68k.org, Greg Ungerer <gerg@uclinux.org>, linux-arm-kernel@lists.infradead.org, Mike Turquette <mturquette@ti.com>

On Tue, Sep 18, 2012 at 10:00:37AM +0200, Thierry Reding wrote:
> On Sat, Sep 15, 2012 at 10:31:52PM +0100, Russell King - ARM Linux wrote:
> > On Wed, Sep 12, 2012 at 10:43:07PM +0200, Lars-Peter Clausen wrote:
> > > I wouldn't mind having this merged sooner rather than later, there is at least
> > > one driver in next which is currently broken due to the missing devm_clk_get.
> > > Russell what's your plan for the patch? Maybe under the given circumstances it
> > > makes sense to let it go through the m68k tree.
> > 
> > Ok, I've merged it but there was no indication in the patch that it was
> > supposed to be a fix... there's no cc: to stable.  Does it need to go to
> > stable?  When was this brokenness introduced?  What's the story for the
> > m68k bit?
> 
> What tree is this supposed to go through? I've checked your ARM tree as
> well as Mike's clock tree but neither seem to carry this patch. The
> reason I ask is because I want to take a patch series that converts the
> Unicore32 PWM code to the PWM framework into linux-next but it depends
> on this patch as well.

It /is/ in my tree (you'll notice that it is in linux-next.)  You're
probably looking at my Linaro tree instead, which doesn't carry
anything which isn't about to be sent to Linus.  I'll publish the
branch for this in the next couple of days.
