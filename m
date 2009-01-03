From: Petr Stehlik <pstehlik@sophics.cz>
Subject: Re: [PATCH] m68k: Fix atarimouse init
Date: Sat, 03 Jan 2009 06:53:53 +0100
Message-ID: <1230962033.6343.15.camel@joy>
References: <20081217165557.b4898a4b.sfr@canb.auug.org.au>
	 <Pine.LNX.4.64.0812170915400.29433@anakin>
	 <Pine.LNX.4.64.0812211205270.3499@anakin>
	 <alpine.DEB.1.00.0812282252230.10733@zirkon.biophys.uni-duesseldorf.de>
	 <Pine.LNX.4.64.0812291151200.20983@anakin>
	 <alpine.DEB.1.00.0901020046280.25512@zirkon.biophys.uni-duesseldorf.de>
	 <jed4f6gi2l.fsf@sykes.suse.de>
	 <alpine.DEB.1.00.0901022257150.738@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp3.vol.cz ([195.250.128.83]:57281 "EHLO smtp3.vol.cz"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750767AbZACFx7 (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sat, 3 Jan 2009 00:53:59 -0500
In-Reply-To: <alpine.DEB.1.00.0901022257150.738@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Andreas Schwab <schwab@suse.de>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Michael Schmitz p=ED=B9e v P=E1 02. 01. 2009 v 23:10 +0100:
> > > Weird - the inversion of the y direction increment is taken from =
the old=20
> > > busmouse driver code where it used to work OK. The point of refer=
ence is set to=20
> > > be at the top of the 'screen' so moving the mouse down ought to g=
enerate=20
> > > positive increments.
> >=20
> > ARAnyM's emulation of the IKBD does not support changing the y orig=
in.
>=20
> Bummer - any reason the origin was set to the top initially?

Isn't it sane to have the origin at top so the mouse increments are
logically in sync with video coordinates?

I mean I am not sure what's wrong in this chain but I have just tested
ARAnyM to ensure that moving the mouse down on the screen generates
positive y-axis increments.

> I guess we could reverse that (at least for ARAnyM).

I am against changing generic Atari related things just for ARAnyM. I
said earlier (about 12 hours before you posted this mail) that I would
fix anything in ARAnyM to make it more linux-m68k compatible.

I am just not sure what's wrong here - does the linux-m68k indeed
switches the point of origin to bottom of screen and relies on that? Wh=
y
if you say that the old busmouse code used the "normal" top-screen
origin?

> How would I go about figuring out the kernel runs on ARAnyM, Petr?

Using the NatFeats, of course. But see above - I am against such hacks
and I'll add the code for reversing Y-axis real quick if its really
necessary.
=20
> > > knows what the ikbd format for the third button is (on real hardw=
are) it's easy=20
> > > to add that in.
> >=20
> > The IKBD does not support more than two buttons.  For a three butto=
n
> > mouse the middle button was apparently wired to the joystick port.
> >=20
> > See also <http://dev-docs.atariforge.org/files/ikbd_Prot_2-26-1985.=
pdf>.
>=20
> Thanks, Andreas. Seems I'll have to revive the old joystick code, the=
n.=20

Michael, I don't think there is anybody out there using such hardware
joystick-mouse modification. But there is number of people using the
Eiffel PS/2 adapter so if supporting anything then I'd go for that.

BTW, is it just my feeling that you kind of didn't take my mail
(Thursday 11:20) into account when replying to Andreas?

Petr


--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
