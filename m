From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH] reinstate mac rtc
Date: Sun, 26 Oct 2008 14:24:41 +1100 (EST)
Message-ID: <Pine.LNX.4.64.0810261414350.24451@loopy.telegraphics.com.au>
References: <A4BCBF08-9D05-11DD-9A2B-00050249ADE1@kaffe.org>
 <alpine.LNX.2.00.0810181928560.1848@firda.kolla.no>
 <Pine.LNX.4.64.0810191352510.27783@loopy.telegraphics.com.au>
 <alpine.LNX.2.00.0810191813240.1848@firda.kolla.no>
 <alpine.DEB.1.00.0810200140300.14463@zirkon.biophys.uni-duesseldorf.de>
 <A064497F-167C-4BC4-9565-6530A6914285@lvivier.info>
 <alpine.DEB.1.00.0810220916590.18164@zirkon.biophys.uni-duesseldorf.de>
 <alpine.LNX.2.00.0810221309050.3377@halbrend.uninett.no>
 <5AC01130-D57C-4A0E-81EB-D10549A1146C@lvivier.info>
 <alpine.DEB.1.00.0810230538410.22587@zirkon.biophys.uni-duesseldorf.de>
 <Pine.LNX.4.64.0810230910460.7533@anakin>
 <alpine.DEB.1.00.0810250611540.13617@zirkon.biophys.uni-duesseldorf.de>
 <Pine.LNX.4.64.0810251527500.7411@loopy.telegraphics.com.au>
 <alpine.DEB.1.00.0810260358200.22420@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from loopy.telegraphics.com.au ([202.45.126.152]:46757 "EHLO
	loopy.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751969AbYJZDYo (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 25 Oct 2008 23:24:44 -0400
In-Reply-To: <alpine.DEB.1.00.0810260358200.22420@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Laurent Vivier <laurent@lvivier.info>, =?ISO-8859-15?Q?Kolbj=F8rn_Barmen?= <linux-m68k@kolla.no>, Riccardo <riccardo@kaffe.org>, Brad Boyer <flar@allandria.com>, Linux/m68k <linux-m68k@vger.kernel.org>



On Sun, 26 Oct 2008, Michael Schmitz wrote:

> > > Test and improve, please.
> > 
> > I think the patch won't work because the catchall is never invoked.
> 
> My bad - I thought the problem was related to a missing RTC driver on 
> those Macs in question.
>  
> > I'd use a new kernel parameter for this (if I thought we needed 
> > another workaround) rather than assume a working RTC by default. If 
> > you assume it works, you may introduce non-determinism when the clock 
> > battery is flat or missing. Best let userland make the call.
> 
> A new kernel parameter might be used to 'switch off' the RTC. But we 
> could instead use the boot time to initialize the system clock if we 
> find the RTC returns bogus data. How do we detect bogus data?

I don't think you have to attempt that. It is sufficient to test test for 
macintosh_config->ident != MAC_MODEL_IIFX in the 
macintosh_config->adb_type == MAC_ADB_IOP case (since IOP ADB implies IIfx 
or Q9x0). And do something similar for the else condition (RTC write).

Finn


> 
> 	Michael
> 
