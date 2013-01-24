From: Michael Schmitz <schmitz@mail.biophys.uni-duesseldorf.de>
Subject: Re: Atari TT
Date: Thu, 24 Jan 2013 21:20:50 +0100
Message-ID: <20130124202050.GA28593@mail.biophys.uni-duesseldorf.de>
References: <20130120205231.GC32291@mail.biophys.uni-duesseldorf.de>
 <Pine.BSM.4.64L.1301202117270.27441@herc.mirbsd.org>
 <20130120225718.GA1459@mail.biophys.uni-duesseldorf.de>
 <Pine.BSM.4.64L.1301232011550.14843@herc.mirbsd.org>
 <20130123212251.GA14282@mail.biophys.uni-duesseldorf.de>
 <Pine.BSM.4.64L.1301232213380.14843@herc.mirbsd.org>
 <20130124000856.GA15759@mail.biophys.uni-duesseldorf.de>
 <Pine.BSM.4.64L.1301241759530.6423@herc.mirbsd.org>
 <20130124185341.GA27701@mail.biophys.uni-duesseldorf.de>
 <Pine.BSM.4.64L.1301241946080.6423@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from opal-mail.biophys.uni-duesseldorf.de ([134.99.176.33]:40510
	"EHLO mail.biophys.uni-duesseldorf.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1030194Ab3AXUUw (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Thu, 24 Jan 2013 15:20:52 -0500
Content-Disposition: inline
In-Reply-To: <Pine.BSM.4.64L.1301241946080.6423@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: debian-68k@lists.debian.org
Cc: linux-m68k@vger.kernel.org

Thorsten,

> >Does the other kernel show any boot progress on the screen at all, after the
> >bootstrap has finished loading and passed control to the kernel? 
> 
> Coloured pixels.

If the other kernel (nonet) shows a proper boot screen, that's a kernel size
issue. 

On the other hand: 

> 
> >Can you send me the contents of arch/m68k/atari/config.c and
> >arch/m68k/atari/atariints.c from the patched source tree you used for these
> >kernels? 
> 
> Sure:

That does not include my more recent patches to the interrupt code. I
suspect you may be using the atari_ethernec driver instead of the generic ne
one as well. I'll check your kernel image to see what it does use. 

The ne.c network driver does not appear to tolerate interrupts arriving before 
the device has been configured, at least in the early boot phases. I'm uncertain
whether it would work even with my latest patches applied - maybe I can find
some time on the weekend to test that. 

Geert: is there some way for kernel network drivers to figure out whether the
network subsystem has been initialized, and hold off interrupt processing
before that time? I'm using 'if (netif_running(dev))' in atari_ethernec but
that does not appear to prevent the lockup. 

Cheers,

	Michael
 
