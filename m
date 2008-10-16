From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [patch 3/2] m68k: Atari EtherNAT - add writew_be for data push
Date: Thu, 16 Oct 2008 05:32:16 +0200 (CEST)
Message-ID: <alpine.DEB.1.00.0810160458540.8799@zirkon.biophys.uni-duesseldorf.de>
References: <20080903071542.615137611@mail.of.borg>
 <20080903071741.424551678@mail.of.borg>
 <20080903073629.GD4104@cs181140183.pp.htv.fi>
 <Pine.LNX.4.64.0809032114590.23421@anakin>
 <alpine.DEB.1.00.0809042347400.3429@zirkon.biophys.uni-duesseldorf.de>
 <Pine.LNX.4.64.0810142146480.25759@anakin>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.rz.uni-duesseldorf.de ([134.99.128.30]:48248 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752040AbYJPDcT (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Wed, 15 Oct 2008 23:32:19 -0400
Received: from conversion-daemon by mail.rz.uni-duesseldorf.de
 (Sun Internet Mail Server sims.4.0.2001.07.26.11.50.p9)
 id <0K8T00C01B5TNC@mail.rz.uni-duesseldorf.de> for linux-m68k@vger.kernel.org;
 Thu, 16 Oct 2008 05:32:17 +0200 (MEST)
In-reply-to: <Pine.LNX.4.64.0810142146480.25759@anakin>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, debian-68k@lists.debian.org

Hi Geert,

>> Regarding performance afforded by having a 100 Mbit PHY instead of a 10 Mbit
>> one:
>>
>> EtherNAT: 210 KB/s out, 140 KB/s in (scp of a 35 MB vmlinux file)
>> EtherNEC: 175 KB/s out, 128 KB/s in (same file)
>>
>> Hardly worth it, eh?
>
> That's slower than my Ariadne?

Still no interrupts.

> BTW, do you have a patch for this?
>
> | drivers/net/atari_91C111.c:2317: error: 'struct smc91x_platdata' has no member named 'irq_flags'
> | drivers/net/atari_91C111.c:2361: error: 'struct smc91x_platdata' has no member named 'irq_flags'
> | drivers/net/atari_91C111.c:2371: error: 'struct smc91x_platdata' has no member named 'irq_flags'
> | drivers/net/atari_91C111.c:2411: error: 'struct smc91x_platdata' has no member named 'irq_flags'

Not yet - I was working on that when I went into headless-chicken mode at work a 
few weeks back. I'll resync my kernel tree and restart.

There's been extensive changes to the parent driver that make me feel it's 
better to start from scratch anyway. I'll think about that (the need to set up 
the timer D and the interrupt wrapper thing is about the only thing I can 
imagine that would be problematic there).

Don't hold your breath just yet :')

 	Michael

