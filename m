From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [PATCH] m68k: Fix atarimouse init
Date: Sun, 04 Jan 2009 04:12:33 +0100 (CET)
Message-ID: <alpine.DEB.1.00.0901040306290.18900@zirkon.biophys.uni-duesseldorf.de>
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
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailout-hades.uni-duesseldorf.de ([134.99.128.34]:47049 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751499AbZADDMh (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 3 Jan 2009 22:12:37 -0500
Received: from pmxchannel-daemon.mail.rz.uni-duesseldorf.de by
 mail.rz.uni-duesseldorf.de
 (Sun Java(tm) System Messaging Server 6.3-6.03 (built Mar 14 2008; 32bit))
 id <0KCX00900FKYU500@mail.rz.uni-duesseldorf.de> for
 linux-m68k@vger.kernel.org; Sun, 04 Jan 2009 04:12:34 +0100 (MET)
In-reply-to: <1230970564.6343.34.camel@joy>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Petr Stehlik <pstehlik@sophics.cz>
Cc: Andreas Schwab <schwab@suse.de>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Petr,

> > Geert (and myself) something to test while you add the necessary bits to ARAnyM. 
> 
> I have added it already. Can you use CVS version of ARAnyM?

I've not tried to compile ARAnyM myself in a while, rather installed the latest 
Debian package as it becomes available. 

> I have added the 0x0f, 0x10 IKBD opcodes emulation to ARAnyM but I don't
> see how that could help if linux-m68k sets the upper left screen as the
> mouse origin (I am trying to avoid the "top"/"bottom" words as they are
> implemented differently in the IKBD than in my head).
> 
> Anyway, just give it a try, please, and let me know.

Will do - 

> > > Michael, I don't think there is anybody out there using such hardware
> > > joystick-mouse modification. But there is number of people using the
> > > Eiffel PS/2 adapter so if supporting anything then I'd go for that.
> > 
> > How does that one work? 
> 
> http://hardware.atari.org/eiffel/index.htm
> http://hardware.atari.org/photos/eiffel.jpg
> 
> You can attach any PS/2 mouse and keyboard to Atari.

Seems like this hooks up to the standard keyboard connector so it should behave 
the same as the regular keyboard/mouse. Good.
 
> > The only reason for reviving the joystick hack would have been to have a 
> > 'standard' way of passing a third mouse button. If the PS/2 adapter is that 
> > standard way now, that's fine. I'll just need to know what interrupt/device this 
> > is hooked up to, and what the data format is. 
> 
> It just adds new scancodes - I have provided a link to the scan codes
> table in one of my previous mails.

Sorry, I must have missed that. 
 
> The middle mouse button is mapped to scancode 0x37 (IIRC) while the
> mouse wheels are provided in IKBD status packet.
> 
> Or check this:
> http://www.sophics.cz/cgi-bin/viewvc.cgi/aranym/src/input.cpp?view=markup
> search for SDL_BUTTON_MIDDLE and SDL_BUTTON_WHEELUP/WHEELDOWN.

Thanks, that does in fact explain it in sufficient detail. I'll try to add that 
to the core keyboard driver, and synthesize the appropriate mouse packets. 

	Michael

