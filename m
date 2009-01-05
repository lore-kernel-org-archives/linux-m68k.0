From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [PATCH] m68k: Add Eiffel PS/2 support for Atari mouse driver
Date: Mon, 05 Jan 2009 02:11:23 +0100 (CET)
Message-ID: <alpine.DEB.1.00.0901042316390.19921@zirkon.biophys.uni-duesseldorf.de>
References: <20081217165557.b4898a4b.sfr@canb.auug.org.au>
 <Pine.LNX.4.64.0812170915400.29433@anakin>
 <Pine.LNX.4.64.0812211205270.3499@anakin>
 <alpine.DEB.1.00.0812282252230.10733@zirkon.biophys.uni-duesseldorf.de>
 <Pine.LNX.4.64.0812291151200.20983@anakin>
 <alpine.DEB.1.00.0901020046280.25512@zirkon.biophys.uni-duesseldorf.de>
 <jed4f6gi2l.fsf@sykes.suse.de>
 <alpine.DEB.1.00.0901022257150.738@zirkon.biophys.uni-duesseldorf.de>
 <1230962033.6343.15.camel@joy>
 <alpine.DEB.1.00.0901030758590.17350@zirkon.biophys.uni-duesseldorf.de>
 <1230970564.6343.34.camel@joy>
 <alpine.DEB.1.00.0901040805190.28468@zirkon.biophys.uni-duesseldorf.de>
 <1231054914.6330.15.camel@joy>
 <alpine.DEB.1.00.0901042110230.19921@zirkon.biophys.uni-duesseldorf.de>
 <1231107039.14982.3.camel@joy>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailout-hades.uni-duesseldorf.de ([134.99.128.34]:56422 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751265AbZAEBL0 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 4 Jan 2009 20:11:26 -0500
Received: from pmxchannel-daemon.mail.rz.uni-duesseldorf.de by
 mail.rz.uni-duesseldorf.de
 (Sun Java(tm) System Messaging Server 6.3-6.03 (built Mar 14 2008; 32bit))
 id <0KCZ002004MZZV00@mail.rz.uni-duesseldorf.de> for
 linux-m68k@vger.kernel.org; Mon, 05 Jan 2009 02:11:23 +0100 (MET)
In-reply-to: <1231107039.14982.3.camel@joy>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Petr Stehlik <pstehlik@sophics.cz>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

> > > This is unclear from the documentation so I am trying to get a
> > > definitive answer from someone who owns the actual hardware.
> > 
> > Well, if it sends a different scancode that's easy enough to accomodate.
> 
> Well I meant that maybe it doesn't send anything.

It does in fact not send any scancode ... bummer. I'll use another (regular 
keyboard) scancode for the middle mouse button tests... Whoa - nice oops there. 
New patch coming your way shortly, guys. 
 
> > Actually I'm not. The 'pause' hotkey for setup has never worked (neither has any 
> > of the various hotkeys for mouse release, BTW).
> 
> That's why I suggested you to start aranym with "-G". Try that and click
> on the [Hotkeys] dialog to define your own hotkeys.

I see. Turns out that my alt and apple keys (Powerbook G4 keyboard) were 
ignored. Used control as modifier and it works now, thanks.

> See above, it's dead easy to choose your own key.

Modifiers on Mac powerbooks seem to cause trouble for SDL - how would I go about 
debugging this? 
 
> > And setting WheelEiffel = Yes did not yield an additional mouse event so far.
> 
> Try the wheel - it must work even with 0.9.4, I think. The middle mouse
> is supported in the CVS version only.

The wheel does send what it's supposed to in 0.9.7beta - for the final tests, 
I'll have to get the CVS version it seems. Using F10 as middle mouse button did 
help debugging the whole shebang quite a bit already.

	Michael


