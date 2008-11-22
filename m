From: Petr =?ISO-8859-1?Q?Stehl=EDk?= <pstehlik@sophics.cz>
Subject: Re: [PATCH/RFC] atafb and panning
Date: Sat, 22 Nov 2008 09:45:06 +0100
Message-ID: <1227343506.6129.0.camel@joy>
References: <Pine.LNX.4.64.0811162235251.20005@anakin>
	 <alpine.DEB.1.00.0811190828090.6915@zirkon.biophys.uni-duesseldorf.de>
	 <Pine.LNX.4.64.0811190912190.27671@anakin>
	 <alpine.DEB.1.00.0811220812440.7263@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp2.vol.cz ([195.250.128.75]:49955 "EHLO smtp2.vol.cz"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751072AbYKVIpK (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sat, 22 Nov 2008 03:45:10 -0500
In-Reply-To: <alpine.DEB.1.00.0811220812440.7263@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Michael Schmitz p=ED=B9e v So 22. 11. 2008 v 08:16 +0100:
> > > If var->xoffset has the low order bits set (sub-word pixel offset=
)=20
> > > par->hw.falcon.xoffset takes care of that, and xoffset takes care=
 of the rest.=20
> > > Since the partial word offset shifts the beginnig of the scan lin=
e into the=20
> > > first word, the offset to the next scan line (par->hw.falcon.line=
_offset) has to=20
> > > be shortened.=20
> >=20
> > Sounds reasonable. But the shortening part doesn't work on ARAnyM, =
nor do
> > small panning increments. So it really smells like an ARAnyM bug.
>=20
> Petr said as much if I understand him right. No need to fix ARAnyM th=
ough, we=20
> just need to keep that in mind.=20

ARAnyM's VIDEL emulation has already been fixed by Patrice (yesterday
night, in CVS).

Petr


--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
