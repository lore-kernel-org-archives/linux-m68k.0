From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [RFC] m68k: Update defconfigs for v3.9
Date: Sat, 25 May 2013 18:04:45 +1000 (EST)
Message-ID: <alpine.LNX.2.00.1305251801050.4391@nippy.intranet>
References: <CAMuHMdVSqN6Bjn1Ph-8xzZ64HzAcj7oBA8B3GNE8PTessUzBkQ@mail.gmail.com> <alpine.LNX.2.00.1305241705020.3487@nippy.intranet> <1329276799.240825.1369392897661.open-xchange@ox-webdesk.1and1.fr>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:41145 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752298Ab3EYIEw (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 25 May 2013 04:04:52 -0400
In-Reply-To: <1329276799.240825.1369392897661.open-xchange@ox-webdesk.1and1.fr>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Laurent Vivier <laurent@vivier.eu>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>


On Fri, 24 May 2013, Laurent Vivier wrote:

> 
> > Le 24 mai 2013 ? 09:27, Finn Thain <fthain@telegraphics.com.au> a 
> > ?crit :
> [...]
> > I have a strong suspicion that some stuff not enabled in your configs 
> > would still need to be explicitly disabled to get the best results. I 
> > will let you know when I get around to testing the mac_defconfig.
> 
> I think I can try this on a quadra 800 this week-end.
> 
> An advices, Finn ?

If you enable EARLY_CONSOLE, don't generate any Zilog SCC interrupts 
before the pmac_zilog driver gets opened (i.e. before getty starts on 
ttyS0). The early boot asm doesn't properly intialise the SCC interrupts 
(known bug).

Finn
