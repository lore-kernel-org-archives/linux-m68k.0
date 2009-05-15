From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: vmlinuz-2.6.29-1-11May on IIfx
Date: Fri, 15 May 2009 10:14:17 +0200 (CEST)
Message-ID: <alpine.DEB.1.00.0905151009380.15232@zirkon.biophys.uni-duesseldorf.de>
References: <8EF8D4F2-40AD-11DE-9565-00050249ADE1@kaffe.org>
 <20090514210912.GA4292@cynthia.pants.nu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailout-apollo.uni-duesseldorf.de ([134.99.128.36]:41932 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1755673AbZEOIOU (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Fri, 15 May 2009 04:14:20 -0400
Received: from pmxchannel-daemon.mail.rz.uni-duesseldorf.de by
 mail.rz.uni-duesseldorf.de
 (Sun Java(tm) System Messaging Server 6.3-6.03 (built Mar 14 2008; 32bit))
 id <0KJO00400EVVLQ00@mail.rz.uni-duesseldorf.de> for
 linux-m68k@vger.kernel.org; Fri, 15 May 2009 10:14:19 +0200 (MEST)
In-reply-to: <20090514210912.GA4292@cynthia.pants.nu>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Brad Boyer <flar@allandria.com>
Cc: Riccardo <riccardo@kaffe.org>, linux-m68k@vger.kernel.org

Hi,

> > But any activity on the ethernet (remlote login or just a Ping) gives 
> > me:
> > 
> > trigger_send() called  with the transmitter busy
> > 
> > and after a bit
> > 
> > eth0: mismatched read page pointers 45 vs  c.
> > 
> > booting into 2.6.26 I see the driver used is the mac8390. From dmesg of 
> > 2.6.26
> > 
> > [42949395.010000] mac8390.c: v0.4 2001-05-15 David Huggins-Daines 
> > <dhd@debian.org> and others
> > [42949395.030000] eth0: Memory length resource for slot A not found, 
> > probing
> > [42949395.040000] eth0: EtherNet card in slot A (type apple)
> > [42949395.050000] MAC 00:80:ad:13:7c:d0 IRQ 57, 32 KB shared memory at 
> > 0xfaad0000,  32-bit access.
> 
> Did this ethernet card work in an older kernel? The card type detection
> in mac8390.c is partially based on guesses and just trying different
> cards, as I remember. It's possible that it's detecting the wrong type,
> particularly since it isn't finding all the NuBus ROM resources it is
> expecting to be present on this card type. I suspect that it's not
> accessing the card correctly. Both the error messages are that the
> card isn't in a sane state based on what the driver tried to do.

The 'mismatched read page  pointers' I've seen on the EtherNEC 8390 based card 
as well, it seems to indicate that the receive buffer overruns. I'm using a 
timer interrupt there, so that is expected to happen. 

Might 'trigger send called with tx busy' also indicate a failure to receive the 
txdone interrupt? Maybe you're not getting any interrupts from the card? What 
does /proc/interrupts register regarding the 8390 driver?

	Michael

