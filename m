From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Kernel 2.6.24, binutils-2.18, and tftplilo on diskless MVME167.
Date: Fri, 14 Nov 2008 08:11:01 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0811140810440.11953@anakin>
References: <OFF2D16A54.2029BAD8-ONCA2574FD.0079BF46-CA2574FE.000FBF52@csc.com>
 <Pine.LNX.4.64.0811111055100.19341@anakin> <1226611986.4267.16.camel@kars.perseus.home>
 <Pine.LNX.4.64.0811132244320.11953@anakin> <1226613676.4267.20.camel@kars.perseus.home>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from monty.telenet-ops.be ([195.130.132.56]:38715 "EHLO
	monty.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750821AbYKNHLG (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 14 Nov 2008 02:11:06 -0500
In-Reply-To: <1226613676.4267.20.camel@kars.perseus.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Kars de Jong <jongk@linux-m68k.org>
Cc: Stephen N Chivers <schivers@csc.com.au>, Roman Zippel <zippel@linux-m68k.org>, Andreas Schwab <schwab@suse.de>, Debian GNU/Linux m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Thu, 13 Nov 2008, Kars de Jong wrote:
> On do, 2008-11-13 at 22:48 +0100, Geert Uytterhoeven wrote:
> > On Thu, 13 Nov 2008, Kars de Jong wrote:
> > > On di, 2008-11-11 at 11:01 +0100, Geert Uytterhoeven wrote:
> > > > On Tue, 11 Nov 2008, Stephen N Chivers wrote:
> > > > > In the past few days I have attempted to get 2.6 kernels booting on my
> > > > > diskless MVME167 boards.
> > > > > I have tried several kernels, including:
> > > > > linux-image-2.6.26-1-mvme16x_2.6.26-9_m68k.deb.
> > > > > 
> > > > > I traced the "freeze" of the kernel to the 'BUG_ON' test in
> > > > > 'm68k_setup_user_interrupt' in file
> > > > > arch/m68k/ints.c:
> > > > > 
> > > > >       BUG_ON(IRQ_USER + cnt >= NR_IRQS);
> > > > > 
> > > > > Now, for the VME boards, IRQ_USER is 8, cnt is 192 and NR_IRQS is 200. So
> > > > > this test will
> > > > > trigger the BUG_ON action, and so the kernel appears to stop without
> > > > > logging any diagnostics.
> > > > 
> > > > Oops, that looks like an off-by-one error.  It has been introduced by commit
> > > > 69961c375288bdab7604e0bb1c8d22999bb8a347 ("[PATCH] m68k/Atari: Interrupt
> > > > updates").
> > > 
> > > Hm, no fair! I already reported this bug back in 2006, asking for
> > > feedback:
> > > 
> > > http://www.nabble.com/Re%3A-CVS-Update%3A-linux-tt6999670.html
> > > 
> > > ... but I never got any ;)
> > 
> > Bummer...
> > 
> > > By the way, I tested Linus' HEAD today (with your quilt patches, Geert)
> > > on my MVME167, it only needed the above fixed and it booted.
> > 
> > OK. Can I add your Tested-by? Then I'll forward it to Linus ASAP.
> 
> Yes, no problem, if your patch would look something like this (I like

Yes it does.

> git already!):

Good!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
