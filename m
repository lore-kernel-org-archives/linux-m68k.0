From: Petr Stehlik <pstehlik@sophics.cz>
Subject: Re: [PATCH] m68k: Fix atarimouse init
Date: Tue, 30 Dec 2008 10:18:21 +0100
Message-ID: <1230628701.6336.7.camel@joy>
References: <20081217165557.b4898a4b.sfr@canb.auug.org.au>
	 <Pine.LNX.4.64.0812170915400.29433@anakin>
	 <Pine.LNX.4.64.0812211205270.3499@anakin>
	 <alpine.DEB.1.00.0812282252230.10733@zirkon.biophys.uni-duesseldorf.de>
	 <Pine.LNX.4.64.0812291151200.20983@anakin>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp2.vol.cz ([195.250.128.75]:58105 "EHLO smtp2.vol.cz"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751133AbYL3Jgt (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Tue, 30 Dec 2008 04:36:49 -0500
In-Reply-To: <Pine.LNX.4.64.0812291151200.20983@anakin>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>, Linux/m68k <linux-m68k@vger.kernel.org>

Geert Uytterhoeven p=ED=B9e v Po 29. 12. 2008 v 11:57 +0100:

> I get events from /dev/input/mouse0 and /dev/input/mice (atari_defcon=
fig).
>=20
> When running X under ARAnyM (depth 16), some shortcomings show up:
>   - the middle mouse button is dead

BTW, ARAnyM implements a mouse extension for the wheels that is
compatible with an existing hardware modification (or an add-on).
Sometime later we could implement its support in linux to get true
middle mouse button and its wheels.

Petr


--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
