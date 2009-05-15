From: Riccardo <riccardo@kaffe.org>
Subject: Re: vmlinuz-2.6.29-1-11May on IIfx
Date: Fri, 15 May 2009 11:26:19 +0200
Message-ID: <7284F359-4132-11DE-9D14-00050249ADE1@kaffe.org>
References: <alpine.DEB.1.00.0905151009380.15232@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0 (Apple Message framework v553)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from cp-out12.libero.it ([212.52.84.112]:46803 "EHLO
	cp-out12.libero.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757268AbZEOJ0b (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 15 May 2009 05:26:31 -0400
In-Reply-To: <alpine.DEB.1.00.0905151009380.15232@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Brad Boyer <flar@allandria.com>, linux-m68k@vger.kernel.org

Hi,

>> Did this ethernet card work in an older kernel? The card type 
>> detection
>> in mac8390.c is partially based on guesses and just trying different
>> cards, as I remember. It's possible that it's detecting the wrong 
>> type,
>> particularly since it isn't finding all the NuBus ROM resources it is
>> expecting to be present on this card type. I suspect that it's not
>> accessing the card correctly. Both the error messages are that the
>> card isn't in a sane state based on what the driver tried to do.
>
> The 'mismatched read page  pointers' I've seen on the EtherNEC 8390 
> based card
> as well, it seems to indicate that the receive buffer overruns. I'm 
> using a
> timer interrupt there, so that is expected to happen.
>
> Might 'trigger send called with tx busy' also indicate a failure to 
> receive the
> txdone interrupt? Maybe you're not getting any interrupts from the 
> card? What
> does /proc/interrupts register regarding the 8390 driver?
>

under linux, 2.6.29 I get:

mac 57: 74 8390 Ethernet

I attempt to ping a host, which fails, then it says:

mac 57: 86 8390 Ethernet


Riccardo

