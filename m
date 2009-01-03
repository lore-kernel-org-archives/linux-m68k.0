From: Petr Stehlik <pstehlik@sophics.cz>
Subject: Re: [PATCH] m68k: Fix atarimouse init
Date: Sat, 03 Jan 2009 07:15:08 +0100
Message-ID: <1230963308.6343.22.camel@joy>
References: <20081217165557.b4898a4b.sfr@canb.auug.org.au>
	 <Pine.LNX.4.64.0812170915400.29433@anakin>
	 <Pine.LNX.4.64.0812211205270.3499@anakin>
	 <alpine.DEB.1.00.0812282252230.10733@zirkon.biophys.uni-duesseldorf.de>
	 <Pine.LNX.4.64.0812291151200.20983@anakin>
	 <alpine.DEB.1.00.0901020046280.25512@zirkon.biophys.uni-duesseldorf.de>
	 <jed4f6gi2l.fsf@sykes.suse.de>
	 <alpine.DEB.1.00.0901022257150.738@zirkon.biophys.uni-duesseldorf.de>
	 <1230962033.6343.15.camel@joy>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp1.vol.cz ([195.250.128.78]:53844 "EHLO smtp1.vol.cz"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750787AbZACGPN (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sat, 3 Jan 2009 01:15:13 -0500
In-Reply-To: <1230962033.6343.15.camel@joy>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Andreas Schwab <schwab@suse.de>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Petr Stehlik p=ED=B9e v So 03. 01. 2009 v 06:53 +0100:
> Michael Schmitz p=ED=B9e v P=E1 02. 01. 2009 v 23:10 +0100:
> > > > Weird - the inversion of the y direction increment is taken fro=
m the old=20
> > > > busmouse driver code where it used to work OK. The point of ref=
erence is set to=20
> > > > be at the top of the 'screen' so moving the mouse down ought to=
 generate=20
> > > > positive increments.
> > >=20
> > > ARAnyM's emulation of the IKBD does not support changing the y or=
igin.
> >=20
> > Bummer - any reason the origin was set to the top initially?
>=20
> Isn't it sane to have the origin at top so the mouse increments are
> logically in sync with video coordinates?

BTW, I have just noticed that "origin at top =3D lower left of screen".=
 I
was thinking that top would be upper left of screen. Sorry. Anyway, I a=
m
just adding the 0x0f/0x10 IKBD opcodes support to ARAnyM.

Petr


--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
