From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [PATCH] reinstate mac rtc
Date: Sun, 26 Oct 2008 04:04:35 +0100 (CET)
Message-ID: <alpine.DEB.1.00.0810260358200.22420@zirkon.biophys.uni-duesseldorf.de>
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
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.rz.uni-duesseldorf.de ([134.99.128.30]:48255 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751753AbYJZDEh (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Sat, 25 Oct 2008 23:04:37 -0400
Received: from conversion-daemon by mail.rz.uni-duesseldorf.de
 (Sun Internet Mail Server sims.4.0.2001.07.26.11.50.p9)
 id <0K9B00501SJNMC@mail.rz.uni-duesseldorf.de> for linux-m68k@vger.kernel.org;
 Sun, 26 Oct 2008 04:04:35 +0100 (MET)
In-reply-to: <Pine.LNX.4.64.0810251527500.7411@loopy.telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Laurent Vivier <laurent@lvivier.info>, =?ISO-8859-15?Q?Kolbj=F8rn_Barmen?= <linux-m68k@kolla.no>, Riccardo <riccardo@kaffe.org>, Brad Boyer <flar@allandria.com>, Linux/m68k <linux-m68k@vger.kernel.org>

> > Test and improve, please.
> 
> I think the patch won't work because the catchall is never invoked.

My bad - I thought the problem was related to a missing RTC driver on those 
Macs in question. 
 
> I'd use a new kernel parameter for this (if I thought we needed another 
> workaround) rather than assume a working RTC by default. If you assume it 
> works, you may introduce non-determinism when the clock battery is flat or 
> missing. Best let userland make the call.

A new kernel parameter might be used to 'switch off' the RTC. But we could 
instead use the boot time to initialize the system clock if we find the RTC 
returns bogus data. How do we detect bogus data? 

	Michael
