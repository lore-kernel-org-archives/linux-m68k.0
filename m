From: Petr Stehlik <pstehlik@sophics.cz>
Subject: Re: [PATCH] m68k: Fix atarimouse init
Date: Sat, 03 Jan 2009 09:16:04 +0100
Message-ID: <1230970564.6343.34.camel@joy>
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
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp2.vol.cz ([195.250.128.75]:62589 "EHLO smtp2.vol.cz"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750736AbZACIQY (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sat, 3 Jan 2009 03:16:24 -0500
In-Reply-To: <alpine.DEB.1.00.0901030758590.17350@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Andreas Schwab <schwab@suse.de>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Michael Schmitz p=ED=B9e v So 03. 01. 2009 v 08:23 +0100:
> Yep, I do recall that - my intention was to reverse the logic in orde=
r to give=20
> Geert (and myself) something to test while you add the necessary bits=
 to ARAnyM.=20

I have added it already. Can you use CVS version of ARAnyM?

> The original (and current) mouse driver explicitly set the top screen=
 origin -=20
> either at keyboard init (old) or at mouse device open (now). I do ass=
ume that is=20
> not the default, power-up state of the hardware.

I have added the 0x0f, 0x10 IKBD opcodes emulation to ARAnyM but I don'=
t
see how that could help if linux-m68k sets the upper left screen as the
mouse origin (I am trying to avoid the "top"/"bottom" words as they are
implemented differently in the IKBD than in my head).

Anyway, just give it a try, please, and let me know.
=20
> > Michael, I don't think there is anybody out there using such hardwa=
re
> > joystick-mouse modification. But there is number of people using th=
e
> > Eiffel PS/2 adapter so if supporting anything then I'd go for that.
>=20
> How does that one work?=20

http://hardware.atari.org/eiffel/index.htm
http://hardware.atari.org/photos/eiffel.jpg

You can attach any PS/2 mouse and keyboard to Atari.

> The only reason for reviving the joystick hack would have been to hav=
e a=20
> 'standard' way of passing a third mouse button. If the PS/2 adapter i=
s that=20
> standard way now, that's fine. I'll just need to know what interrupt/=
device this=20
> is hooked up to, and what the data format is.=20

It just adds new scancodes - I have provided a link to the scan codes
table in one of my previous mails.

The middle mouse button is mapped to scancode 0x37 (IIRC) while the
mouse wheels are provided in IKBD status packet.

Or check this:
http://www.sophics.cz/cgi-bin/viewvc.cgi/aranym/src/input.cpp?view=3Dma=
rkup
search for SDL_BUTTON_MIDDLE and SDL_BUTTON_WHEELUP/WHEELDOWN.

Petr


--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
