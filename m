From: Michael Schmitz <schmitz@mail.biophys.uni-duesseldorf.de>
Subject: Re: Atari TT
Date: Thu, 24 Jan 2013 22:48:36 +0100
Message-ID: <20130124214836.GA29490@mail.biophys.uni-duesseldorf.de>
References: <20130120225718.GA1459@mail.biophys.uni-duesseldorf.de>
 <Pine.BSM.4.64L.1301232011550.14843@herc.mirbsd.org>
 <20130123212251.GA14282@mail.biophys.uni-duesseldorf.de>
 <Pine.BSM.4.64L.1301232213380.14843@herc.mirbsd.org>
 <20130124000856.GA15759@mail.biophys.uni-duesseldorf.de>
 <Pine.BSM.4.64L.1301241759530.6423@herc.mirbsd.org>
 <20130124185341.GA27701@mail.biophys.uni-duesseldorf.de>
 <Pine.BSM.4.64L.1301241946080.6423@herc.mirbsd.org>
 <20130124202050.GA28593@mail.biophys.uni-duesseldorf.de>
 <CAMuHMdUj_OhGOzZ=RHbdTnB8ej4538HZUKVuDuLB_MA7p4LHAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from opal-mail.biophys.uni-duesseldorf.de ([134.99.176.33]:40614
	"EHLO mail.biophys.uni-duesseldorf.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752278Ab3AXVsi (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Thu, 24 Jan 2013 16:48:38 -0500
Content-Disposition: inline
In-Reply-To: <CAMuHMdUj_OhGOzZ=RHbdTnB8ej4538HZUKVuDuLB_MA7p4LHAQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: debian-68k@lists.debian.org
Cc: linux-m68k@vger.kernel.org

Geert,

> > The ne.c network driver does not appear to tolerate interrupts arriving before
> > the device has been configured, at least in the early boot phases. I'm uncertain
> > whether it would work even with my latest patches applied - maybe I can find
> > some time on the weekend to test that.
> 
> Stupid ISA-only driver without IRQ sharing support...

Indeed - but that may be my old hacked driver which does have IRQ sharing. 

> The hydra and zorro8390 driver should handle that case fine, as interrupts are
> shared on Amiga.

But these will only generate interrupts if the card has something to send,
or receive has been enabled. The timer polling seems to be the problem here. 
 
> > Geert: is there some way for kernel network drivers to figure out whether the
> > network subsystem has been initialized, and hold off interrupt processing
> > before that time? I'm using 'if (netif_running(dev))' in atari_ethernec but
> > that does not appear to prevent the lockup.
> 
> Doesn't the driver know when it's configured?

It does - it will spit out 'interrupt from stopped card' in that case.
That's the last message I see from the kernel before it locks up (haven't
tried in a while, at least that's what happened a year or two ago). The same
still happens when loading the driver as a module - a single message of the
kind, nothing more (but the kernel keeps running).

I would have thought netif_running(dev) returns false before the device has
been started, but that's wrong, apparently. 

Cheers,

	Michael
