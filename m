From: Petr Stehlik <pstehlik@sophics.cz>
Subject: Re: [PATCH] m68k: Fix atarimouse init
Date: Fri, 02 Jan 2009 11:20:08 +0100
Message-ID: <1230891608.6383.8.camel@joy>
References: <20081217165557.b4898a4b.sfr@canb.auug.org.au>
	 <Pine.LNX.4.64.0812170915400.29433@anakin>
	 <Pine.LNX.4.64.0812211205270.3499@anakin>
	 <alpine.DEB.1.00.0812282252230.10733@zirkon.biophys.uni-duesseldorf.de>
	 <Pine.LNX.4.64.0812291151200.20983@anakin>
	 <alpine.DEB.1.00.0901020046280.25512@zirkon.biophys.uni-duesseldorf.de>
	 <jed4f6gi2l.fsf@sykes.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp3.vol.cz ([195.250.128.83]:60225 "EHLO smtp3.vol.cz"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751587AbZABKUN (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Fri, 2 Jan 2009 05:20:13 -0500
In-Reply-To: <jed4f6gi2l.fsf@sykes.suse.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@suse.de>
Cc: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Andreas Schwab p=ED=B9e v P=E1 02. 01. 2009 v 10:42 +0100:
> > Hi Geert,
> >
> >> The kernel says (ARAnyM, windowed mode):
> >> | Reseting weird mouse packet: 942, 379, 0
> >> | Reseting weird mouse packet: 943, 379, 0
> >> | Reseting weird mouse packet: 945, 378, 0
> >> | Reseting weird mouse packet: 948, 378, 0
> >> | Reseting weird mouse packet: 956, 376, 0
>=20
> These messages come from ARAnyM.

=2E.and indicates that something wrong is going on. Normally there is o=
nly
one such message when entering the ARAnyM window.
=20
> ARAnyM's emulation of the IKBD does not support changing the y origin=
=2E

will add it there.

> >>   - the middle mouse button is dead
> >
> > As is expexcted - the original code was for a two-button mouse only=
=2E If Petr=20
> > knows what the ikbd format for the third button is (on real hardwar=
e) it's easy=20
> > to add that in.
>=20
> The IKBD does not support more than two buttons.  For a three button
> mouse the middle button was apparently wired to the joystick port.

Yes, that was an old Linux-m68k extension.

What I meant by hardware supporting the mouse wheels was Eiffel:=20
http://pagesperso-orange.fr/didierm/eiffel-e.htm

In about 3/4 of the long page there is a table labelled "Mouse elements=
"
that shows the mouse wheels and buttons scan codes. ARAnyM supports the
wheels (not sure about the buttons 3,4,5 - will check and add it there
eventually).

Petr


--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
