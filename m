From: Petr Stehlik <pstehlik@sophics.cz>
Subject: Re: [PATCH] m68k: Add Eiffel PS/2 support for Atari mouse driver
Date: Sun, 04 Jan 2009 23:10:39 +0100
Message-ID: <1231107039.14982.3.camel@joy>
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
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp3.vol.cz ([195.250.128.83]:65395 "EHLO smtp3.vol.cz"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752002AbZADWKp (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sun, 4 Jan 2009 17:10:45 -0500
In-Reply-To: <alpine.DEB.1.00.0901042110230.19921@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Michael Schmitz p=ED=B9e v Ne 04. 01. 2009 v 22:50 +0100:
> > Note that I have yet to find out whether _releasing_ the middle mou=
se
> > button on real Eiffel hardware does send the 0x37|0x80 scancode or =
not.
> > This is unclear from the documentation so I am trying to get a
> > definitive answer from someone who owns the actual hardware.
>=20
> Well, if it sends a different scancode that's easy enough to accomoda=
te.

Well I meant that maybe it doesn't send anything.

> > You must be kidding :-) Get to the SETUP somehow ("aranym -G -c
> > your_config_file", for example, or use the hotkey) and click the
>=20
> Actually I'm not. The 'pause' hotkey for setup has never worked (neit=
her has any=20
> of the various hotkeys for mouse release, BTW).

That's why I suggested you to start aranym with "-G". Try that and clic=
k
on the [Hotkeys] dialog to define your own hotkeys.

> Anyway, still no luck with the ungrab hotkey.

See above, it's dead easy to choose your own key.

> And setting WheelEiffel =3D Yes did not yield an additional mouse eve=
nt so far.

Try the wheel - it must work even with 0.9.4, I think. The middle mouse
is supported in the CVS version only.

Petr


--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
