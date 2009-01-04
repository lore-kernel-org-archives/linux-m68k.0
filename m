From: Petr Stehlik <pstehlik@sophics.cz>
Subject: Re: [PATCH] m68k: Add Eiffel PS/2 support for Atari mouse driver
Date: Sun, 04 Jan 2009 08:41:54 +0100
Message-ID: <1231054914.6330.15.camel@joy>
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
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp3.vol.cz ([195.250.128.83]:62553 "EHLO smtp3.vol.cz"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750906AbZADHl6 (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sun, 4 Jan 2009 02:41:58 -0500
In-Reply-To: <alpine.DEB.1.00.0901040805190.28468@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Michael Schmitz p=ED=B9e v Ne 04. 01. 2009 v 08:15 +0100:
> > The middle mouse button is mapped to scancode 0x37 (IIRC) while the
> > mouse wheels are provided in IKBD status packet.
>=20
> I've written the first part of the Eiffel PS/2 mouse support, adding =
middle=20
> mouse button support based on the scancode you specified. Implementin=
g the=20
> middle mouse button as a toggle is a bit awkward :-(

Note that I have yet to find out whether _releasing_ the middle mouse
button on real Eiffel hardware does send the 0x37|0x80 scancode or not.
This is unclear from the documentation so I am trying to get a
definitive answer from someone who owns the actual hardware.

> I've not tested the code beyond making sure the two regular buttons s=
till work -=20
> I do not quite see how to activate Eiffel mouse support in ARAnyM.

You must be kidding :-) Get to the SETUP somehow ("aranym -G -c
your_config_file", for example, or use the hotkey) and click the
[ Keyboard + Mouse ] button. The rest (click radio button, click OK,
click Save) should be obvious. Or simply edit the aranym config file yo=
u
use for booting your linux setup, find the [IKBD] section and set the
"WheelEiffel =3D Yes".

Petr


--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
