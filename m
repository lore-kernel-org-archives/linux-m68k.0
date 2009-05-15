From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: current 2.6 on Q950
Date: Fri, 15 May 2009 18:13:07 +1000 (EST)
Message-ID: <Pine.LNX.4.64.0905151720210.32471@loopy.telegraphics.com.au>
References: <75999A9B-4090-11DE-A812-00050249ADE1@kaffe.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from loopy.telegraphics.com.au ([202.45.126.152]:47080 "EHLO
	loopy.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755299AbZEOINS (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 15 May 2009 04:13:18 -0400
In-Reply-To: <75999A9B-4090-11DE-A812-00050249ADE1@kaffe.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Riccardo <riccardo@kaffe.org>
Cc: linux-m68k@vger.kernel.org



On Thu, 14 May 2009, Riccardo wrote:

> Hi,
> 
> > The patches that I sent were merged into that release (2.6.29). So X11
> > works again, and mac_esp supports both SCSI busses on the quadras 9x0.
> >
> 
> very cool, I extra checked and I still had the option to disable the scsi BUS
> in penguin.

That option is ignored by the current driver.

> Indeed I see:
> [42949375.000000] mac_esp: using PDMA for controller 0
> [42949378.080000] mac_esp: using PDMA for controller 1

Good. PDMA is significantly faster than PIO (used in 2.6.26 and earlier).

> My external MO disk doesn't get recognized though. I'll check that it 
> still works on MacOS though.
> 
> X11 doesn't work for me, but I'll write separately about that.
> 
> > I haven't heard anything more since you raised it on this mailing list 
> > back in October. I never implemented the workaround that was discussed 
> > at the time because I have more pressing bugs on my todo list, and 
> > because I'd like to try and figure out how the hardware works before 
> > resorting to workarounds...
> 
> Oh sure, also because once a workaround gets implemented, the motivation 
> to do the real thing gets even less. The real access would be very good 
> together with EMILE.
>
[snip]

Well, we established that the workaround would be OK with either Penguin 
or Emile. But the workaround offers no way to update the RTC, which means 
more clock drift between reboots worse than with a working RTC driver, 
which makes network time more attractive (and as I said in October, clock 
batteries are problematic to begin with, and for me this necessitates 
network time anyway). So that's why it is a low priority for me.

Finn
