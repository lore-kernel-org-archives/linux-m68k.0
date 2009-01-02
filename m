From: Andreas Schwab <schwab@suse.de>
Subject: Re: [PATCH] m68k: Fix atarimouse init
Date: Fri, 02 Jan 2009 10:42:26 +0100
Message-ID: <jed4f6gi2l.fsf@sykes.suse.de>
References: <20081217165557.b4898a4b.sfr@canb.auug.org.au>
	<Pine.LNX.4.64.0812170915400.29433@anakin>
	<Pine.LNX.4.64.0812211205270.3499@anakin>
	<alpine.DEB.1.00.0812282252230.10733@zirkon.biophys.uni-duesseldorf.de>
	<Pine.LNX.4.64.0812291151200.20983@anakin>
	<alpine.DEB.1.00.0901020046280.25512@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:49613 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752164AbZABJma (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Fri, 2 Jan 2009 04:42:30 -0500
In-Reply-To: <alpine.DEB.1.00.0901020046280.25512@zirkon.biophys.uni-duesseldorf.de>
	(Michael Schmitz's message of "Fri, 02 Jan 2009 01:12:55 +0100 (CET)")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Michael Schmitz <schmitz@biophys.uni-duesseldorf.de> writes:

> Hi Geert,
>
>> The kernel says (ARAnyM, windowed mode):
>> | Reseting weird mouse packet: 942, 379, 0
>> | Reseting weird mouse packet: 943, 379, 0
>> | Reseting weird mouse packet: 945, 378, 0
>> | Reseting weird mouse packet: 948, 378, 0
>> | Reseting weird mouse packet: 956, 376, 0

These messages come from ARAnyM.

>>=20
>> When running X under ARAnyM (depth 16), some shortcomings show up:
>>   - up and down are interchanged (works fine when rolling the mouse =
over the
>>     bottom surface of the table --- old arabic map style ;-)
>
> Weird - the inversion of the y direction increment is taken from the =
old=20
> busmouse driver code where it used to work OK. The point of reference=
 is set to=20
> be at the top of the 'screen' so moving the mouse down ought to gener=
ate=20
> positive increments.

ARAnyM's emulation of the IKBD does not support changing the y origin.

>>   - the left and right mouse button are interchanged
>
> The busmouse driver had no annotation as to the semantics of the butt=
ons so O=20
> guessed bit 0 was for the left button. Guessed wrong, it seems.

Note that the mouse button bits are also inverted, ie. 0 means down.

>>   - the middle mouse button is dead
>
> As is expexcted - the original code was for a two-button mouse only. =
If Petr=20
> knows what the ikbd format for the third button is (on real hardware)=
 it's easy=20
> to add that in.

The IKBD does not support more than two buttons.  For a three button
mouse the middle button was apparently wired to the joystick port.

See also <http://dev-docs.atariforge.org/files/ikbd_Prot_2-26-1985.pdf>=
=2E

Andreas.

--=20
Andreas Schwab, SuSE Labs, schwab@suse.de
SuSE Linux Products GmbH, Maxfeldstra=DFe 5, 90409 N=FCrnberg, Germany
PGP key fingerprint =3D 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4=
ED5
"And now for something completely different."
--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
