From: Michael Schmitz <schmitz@mail.biophys.uni-duesseldorf.de>
Subject: Re: Atari TT
Date: Fri, 25 Jan 2013 09:14:02 +0100
Message-ID: <20130125081402.GA1187@mail.biophys.uni-duesseldorf.de>
References: <20130123212251.GA14282@mail.biophys.uni-duesseldorf.de>
 <Pine.BSM.4.64L.1301232213380.14843@herc.mirbsd.org>
 <20130124000856.GA15759@mail.biophys.uni-duesseldorf.de>
 <Pine.BSM.4.64L.1301241759530.6423@herc.mirbsd.org>
 <20130124185341.GA27701@mail.biophys.uni-duesseldorf.de>
 <Pine.BSM.4.64L.1301241946080.6423@herc.mirbsd.org>
 <20130124202050.GA28593@mail.biophys.uni-duesseldorf.de>
 <CAMuHMdUj_OhGOzZ=RHbdTnB8ej4538HZUKVuDuLB_MA7p4LHAQ@mail.gmail.com>
 <20130124214836.GA29490@mail.biophys.uni-duesseldorf.de>
 <CAMuHMdWjwCQFTJRp7onffghMTDtWnAwt2vd4c2rzOTwVCG1H_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from opal-mail.biophys.uni-duesseldorf.de ([134.99.176.33]:40927
	"EHLO mail.biophys.uni-duesseldorf.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751325Ab3AYIOE (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Fri, 25 Jan 2013 03:14:04 -0500
Content-Disposition: inline
In-Reply-To: <CAMuHMdWjwCQFTJRp7onffghMTDtWnAwt2vd4c2rzOTwVCG1H_w@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: debian-68k@lists.debian.org
Cc: linux-m68k@vger.kernel.org

Geert,

> >> The hydra and zorro8390 driver should handle that case fine, as interrupts are
> >> shared on Amiga.
> >
> > But these will only generate interrupts if the card has something to send,
> > or receive has been enabled. The timer polling seems to be the problem here.
> 
> The point of IRQ sharing is that multiple devices use the same interrupt line.
> So it's about _another_ device generating the interrupt.

You're right of course. 

> Both zorro8390 and hydra use IRQ_AMIGA_PORTS. As does Gayle IDE.
> Hence if the IDE hardware on A4000 triggers and interrupt, the
> interrupt handler of
> zorro8390 and hydra will be called as well. Since I'm not aware of any issues
> with zorro8390 and hydra in A4000, I assume zorro8390 and hydra handle this,
> while ne doesn't.

Turns out ne does - atari_ethernec did't. I could boot a kernel with ne
builtin, got the same message as always but this time it didn't hang:

NE*000 ethercard probe at 0x300:
ne ne (unregistered net_device): interrupt from stopped card
00:00:e8:5d:58:cd
eth0: RTL8019 found at 0x300, using IRQ 64.
 sda: AHDI sda1 sda2 sda3 XGM< sda4 sda5 >

That's good enough for me. 

> 
> >> > Geert: is there some way for kernel network drivers to figure out whether the
> >> > network subsystem has been initialized, and hold off interrupt processing
> >> > before that time? I'm using 'if (netif_running(dev))' in atari_ethernec but
> >> > that does not appear to prevent the lockup.
> >>
> >> Doesn't the driver know when it's configured?
> >
> > It does - it will spit out 'interrupt from stopped card' in that case.
> > That's the last message I see from the kernel before it locks up (haven't
> > tried in a while, at least that's what happened a year or two ago). The same
> > still happens when loading the driver as a module - a single message of the
> > kind, nothing more (but the kernel keeps running).
> >
> > I would have thought netif_running(dev) returns false before the device has
> > been started, but that's wrong, apparently.
> 
> How does zorro8390 and hydra handle it? They use __ei_interrupt, while
> ne uses eip_interrupt, but the latter just calls the former?

I'll have to check that - as I said, it seems to have gone away with the
current ne driver. 

Baffled,

	Michael
