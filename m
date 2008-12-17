From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: atari_mouse_interrupt_hook (was: Re: [PATCH/RFC] atafb and panning)
Date: Wed, 17 Dec 2008 02:13:43 +0100 (CET)
Message-ID: <alpine.DEB.1.00.0812170212310.14228@zirkon.biophys.uni-duesseldorf.de>
References: <Pine.LNX.4.64.0811162235251.20005@anakin>
 <alpine.DEB.1.00.0811190828090.6915@zirkon.biophys.uni-duesseldorf.de>
 <Pine.LNX.4.64.0811190912190.27671@anakin>
 <alpine.DEB.1.00.0811220812440.7263@zirkon.biophys.uni-duesseldorf.de>
 <1227343506.6129.0.camel@joy> <1227379735.6118.10.camel@joy>
 <Pine.LNX.4.64.0811232242480.30025@anakin>
 <alpine.DEB.1.00.0811240050090.15319@zirkon.biophys.uni-duesseldorf.de>
 <Pine.LNX.4.64.0812141725090.5936@anakin>
 <alpine.DEB.1.00.0812150457400.29644@zirkon.biophys.uni-duesseldorf.de>
 <Pine.LNX.4.64.0812162144140.29433@anakin>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailout-venus.uni-duesseldorf.de ([134.99.128.32]:47230 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751914AbYLQBO4 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Tue, 16 Dec 2008 20:14:56 -0500
Received: from pmxchannel-daemon.mail.rz.uni-duesseldorf.de by
 mail.rz.uni-duesseldorf.de
 (Sun Java(tm) System Messaging Server 6.3-6.03 (built Mar 14 2008; 32bit))
 id <0KBZ00200Y4T3X00@mail.rz.uni-duesseldorf.de> for
 linux-m68k@vger.kernel.org; Wed, 17 Dec 2008 02:14:53 +0100 (MET)
In-reply-to: <Pine.LNX.4.64.0812162144140.29433@anakin>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Geert,

> > > Who should use atari_mouse_interrupt_hook (no users left)?
> > 
> > No one should be using atari_mouse_interrupt_hook anymore so it can be killed 
> > off. I probably renamed the hook in all but that one place following a 
> > recommendation from the list. My bad, as usual.
> 
> Looks like you missed one more spot, so I came up with this. OK?
> 
> commit 896d2f2715d1fadd4c510c4125b1e4c0f1918f6f
> Author: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
> Date:   Tue Dec 16 21:26:03 2008 +0100
> 
>     atari: Use the correct mouse interrupt hook
>     
>     The Atari keyboard driver calls atari_mouse_interrupt_hook if it's set, not
>     atari_input_mouse_interrupt_hook. Fix below.
>     
>     [geert] Killed off atari_mouse_interrupt_hook completely, after fixing another
>     incorrect assignment in atarimouse.c.
>     
>     Signed-off-by: Michael Schmitz <schmitz@debian.org>
>     Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

That should fix it for good. Thanks!

	Michael

