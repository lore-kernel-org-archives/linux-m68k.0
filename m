From: Kars de Jong <jongk@linux-m68k.org>
Subject: Re: Kernel 2.6.24, binutils-2.18, and tftplilo on diskless MVME167.
Date: Thu, 13 Nov 2008 23:01:16 +0100
Message-ID: <1226613676.4267.20.camel@kars.perseus.home>
References: <OFF2D16A54.2029BAD8-ONCA2574FD.0079BF46-CA2574FE.000FBF52@csc.com>
	 <Pine.LNX.4.64.0811111055100.19341@anakin>
	 <1226611986.4267.16.camel@kars.perseus.home>
	 <Pine.LNX.4.64.0811132244320.11953@anakin>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtpq4.tb.mail.iss.as9143.net ([212.54.42.167]:60545 "EHLO
	smtpq4.tb.mail.iss.as9143.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751653AbYKMWXI (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Thu, 13 Nov 2008 17:23:08 -0500
In-Reply-To: <Pine.LNX.4.64.0811132244320.11953@anakin>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen N Chivers <schivers@csc.com.au>, Roman Zippel <zippel@linux-m68k.org>, Andreas Schwab <schwab@suse.de>, Debian GNU/Linux m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On do, 2008-11-13 at 22:48 +0100, Geert Uytterhoeven wrote:
> On Thu, 13 Nov 2008, Kars de Jong wrote:
> > On di, 2008-11-11 at 11:01 +0100, Geert Uytterhoeven wrote:
> > > On Tue, 11 Nov 2008, Stephen N Chivers wrote:
> > > > In the past few days I have attempted to get 2.6 kernels booting on my
> > > > diskless MVME167 boards.
> > > > I have tried several kernels, including:
> > > > linux-image-2.6.26-1-mvme16x_2.6.26-9_m68k.deb.
> > > > 
> > > > I traced the "freeze" of the kernel to the 'BUG_ON' test in
> > > > 'm68k_setup_user_interrupt' in file
> > > > arch/m68k/ints.c:
> > > > 
> > > >       BUG_ON(IRQ_USER + cnt >= NR_IRQS);
> > > > 
> > > > Now, for the VME boards, IRQ_USER is 8, cnt is 192 and NR_IRQS is 200. So
> > > > this test will
> > > > trigger the BUG_ON action, and so the kernel appears to stop without
> > > > logging any diagnostics.
> > > 
> > > Oops, that looks like an off-by-one error.  It has been introduced by commit
> > > 69961c375288bdab7604e0bb1c8d22999bb8a347 ("[PATCH] m68k/Atari: Interrupt
> > > updates").
> > 
> > Hm, no fair! I already reported this bug back in 2006, asking for
> > feedback:
> > 
> > http://www.nabble.com/Re%3A-CVS-Update%3A-linux-tt6999670.html
> > 
> > ... but I never got any ;)
> 
> Bummer...
> 
> > By the way, I tested Linus' HEAD today (with your quilt patches, Geert)
> > on my MVME167, it only needed the above fixed and it booted.
> 
> OK. Can I add your Tested-by? Then I'll forward it to Linus ASAP.

Yes, no problem, if your patch would look something like this (I like
git already!):

diff --git a/arch/m68k/kernel/ints.c b/arch/m68k/kernel/ints.c
index 7e8a0d3..761ee04 100644
--- a/arch/m68k/kernel/ints.c
+++ b/arch/m68k/kernel/ints.c
@@ -133,7 +133,7 @@ void __init m68k_setup_user_interrupt(unsigned int vec, unsigned int cnt,
 {
        int i;
 
-       BUG_ON(IRQ_USER + cnt >= NR_IRQS);
+       BUG_ON(IRQ_USER + cnt > NR_IRQS);
        m68k_first_user_vec = vec;
        for (i = 0; i < cnt; i++)
                irq_controller[IRQ_USER + i] = &user_irq_controller;


