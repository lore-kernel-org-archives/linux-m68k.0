From: Brad Boyer <flar@allandria.com>
Subject: Re: m68k-queue
Date: Sat, 18 May 2013 00:09:11 -0700
Message-ID: <20130518070910.GA26647@cynthia.pants.nu>
References: <CAMuHMdVdP2kyb3hD4H4hyY8O30QJwdHdJ+R9p-ujVncwHCCTLA@mail.gmail.com>
 <5191FC4C.8010707@biophys.uni-duesseldorf.de>
 <20130515054540.GA8137@cynthia.pants.nu>
 <CAMuHMdX_Mhd1gnZic1sr0nyJJs=oPt54hx7jRfv7j=Dth46VPQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from cynthia.allandria.com ([76.245.85.235]:40955 "EHLO
	cynthia.pants.nu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753559Ab3ERHJT (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 18 May 2013 03:09:19 -0400
Content-Disposition: inline
In-Reply-To: <CAMuHMdX_Mhd1gnZic1sr0nyJJs=oPt54hx7jRfv7j=Dth46VPQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: schmitz <schmitz@biophys.uni-duesseldorf.de>, Linux/m68k <linux-m68k@vger.kernel.org>

On Wed, May 15, 2013 at 08:53:15AM +0200, Geert Uytterhoeven wrote:
> On Wed, May 15, 2013 at 7:45 AM, Brad Boyer <flar@allandria.com> wrote:
> > On Tue, May 14, 2013 at 08:56:44PM +1200, schmitz wrote:
> >> >  - mac: ADB raw packets
> >> >    I guess this can be dropped?
> >> I'd guess so - I struggle to recall what this was for. Perhaps to
> >> talk to the clock chip on some Macs. Anyone?
> >
> > If you can give instructions on how to look at this one patch (or
> > just send it in email), I'll take a look and hopefully I remember
> > enough of the history to give some kind of explanation.
> 
> https://git.kernel.org/cgit/linux/kernel/git/geert/linux-m68k.git/log/?h=m68k-queue
> and click on the commit you're interested in.

Thank you. I took a look, and I agree with everyone else that this was a
legacy patch that isn't required.

The original idea was to use the same API for both real ADB requests and
everything else that goes through the PMU, Egret, or CUDA chips. This
includes not only RTC/PRAM management, but power control and several
other things as well. It wasn't such a great idea, honestly.

	Brad Boyer
	flar@allandria.com
