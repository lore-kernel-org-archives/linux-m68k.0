From: Andreas Schwab <schwab@suse.de>
Subject: Re: [PATCH] m68k: Fix atarimouse init
Date: Sat, 03 Jan 2009 09:45:26 +0100
Message-ID: <jek59cg4m1.fsf@sykes.suse.de>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:47730 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752415AbZACIp3 (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sat, 3 Jan 2009 03:45:29 -0500
In-Reply-To: <alpine.DEB.1.00.0901030758590.17350@zirkon.biophys.uni-duesseldorf.de>
	(Michael Schmitz's message of "Sat, 03 Jan 2009 08:23:20 +0100 (CET)")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Petr Stehlik <pstehlik@sophics.cz>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Michael Schmitz <schmitz@biophys.uni-duesseldorf.de> writes:

> That may have been the reason, perhaps before the mouse driver was wr=
itten to=20
> the busmouse interface (not sure I have kernel sources dating that fa=
r back).

You can get historical sources from
<git://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git>.  Tag
v2.5.41 is the last one containing the old atarimouse driver.

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
