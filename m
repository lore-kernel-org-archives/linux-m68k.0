From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH] m68knommu: remove dead code
Date: Sun, 27 Aug 2017 23:11:49 +0200
Message-ID: <20170827211149.6evcbhfhrenotb3c@piout.net>
References: <20170824143407.21273-1-alexandre.belloni@free-electrons.com>
 <363abb76-2001-f072-fd8e-332014ee07e0@sysam.it>
 <20170827190959.ueii2yihdzbi263s@piout.net>
 <201708271236.31222.sfking@fdwdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201708271236.31222.sfking@fdwdc.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Steven King <sfking@fdwdc.com>
Cc: linux-m68k@vger.kernel.org, Angelo Dureghello <angelo@sysam.it>, Greg Ungerer <gerg@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

On 27/08/2017 at 12:36:31 -0700, Steven King wrote:
> On Sunday 27 August 2017 12:09:59 pm Alexandre Belloni wrote:
> > On 27/08/2017 at 13:22:09 +0200, Angelo Dureghello wrote:
> > > Hi,
> > >
> > > just to inform you that i have in mind to add spi(soon, at least seems
> > > just a matter con Kconfig changes) and usdhc(later)
> > > drivers/support for stmark2 mcf5441x based board.
> > > But no problem, in case i'll re-add the this code as needed.
> >
> > I think it is easy enough to reintroduce init_BSP with your patch. It is
> > unfortunate that this useless function stayed that way so long, waiting
> > for a real user :)
> 
> I believe I was the original author, I dont remember why the code wasn't 
> merged.  I still have the branch, if some wants to take it over and see it 
> gets merged I wouldn't have any objections ;-)

There were comments from Geert that were not addressed:
http://patchwork.ozlabs.org/patch/165328/

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
