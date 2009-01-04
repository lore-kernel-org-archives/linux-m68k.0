From: Petr Stehlik <pstehlik@sophics.cz>
Subject: Re: [PATCH] m68k: Fix atarimouse init
Date: Sun, 04 Jan 2009 08:34:40 +0100
Message-ID: <1231054480.6330.7.camel@joy>
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
	 <alpine.DEB.1.00.0901040306290.18900@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp1.vol.cz ([195.250.128.78]:52634 "EHLO smtp1.vol.cz"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750861AbZADHeo (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sun, 4 Jan 2009 02:34:44 -0500
In-Reply-To: <alpine.DEB.1.00.0901040306290.18900@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Andreas Schwab <schwab@suse.de>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Michael Schmitz p=ED=B9e v Ne 04. 01. 2009 v 04:12 +0100:
> > I have added it already. Can you use CVS version of ARAnyM?
>=20
> I've not tried to compile ARAnyM myself in a while, rather installed =
the latest=20
> Debian package as it becomes available.=20

It's a matter of simple ./autogen.sh && make but I could create a binar=
y
deb for i386 or amd64 if it was of any help (probably not :) Or maybe I
could try creating deb-src.

> > You can attach any PS/2 mouse and keyboard to Atari.
>=20
> Seems like this hooks up to the standard keyboard connector so it sho=
uld behave=20
> the same as the regular keyboard/mouse. Good.

right

Petr


--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
