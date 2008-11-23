From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH/RFC] atafb and panning
Date: Sun, 23 Nov 2008 14:03:51 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0811231403070.30025@anakin>
References: <Pine.LNX.4.64.0811162235251.20005@anakin>
 <alpine.DEB.1.00.0811190828090.6915@zirkon.biophys.uni-duesseldorf.de>
 <Pine.LNX.4.64.0811190912190.27671@anakin>
 <alpine.DEB.1.00.0811220812440.7263@zirkon.biophys.uni-duesseldorf.de>
 <1227343506.6129.0.camel@joy>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from winston.telenet-ops.be ([195.130.137.75]:44406 "EHLO
	winston.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753075AbYKWNDx (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 23 Nov 2008 08:03:53 -0500
In-Reply-To: <1227343506.6129.0.camel@joy>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Petr =?ISO-8859-1?Q?Stehl=EDk?= <pstehlik@sophics.cz>
Cc: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>, Linux/m68k <linux-m68k@vger.kernel.org>

On Sat, 22 Nov 2008, Petr Stehl=EDk wrote:
> Michael Schmitz p=ED=B9e v So 22. 11. 2008 v 08:16 +0100:
> > > > If var->xoffset has the low order bits set (sub-word pixel offs=
et)=20
> > > > par->hw.falcon.xoffset takes care of that, and xoffset takes ca=
re of the rest.=20
> > > > Since the partial word offset shifts the beginnig of the scan l=
ine into the=20
> > > > first word, the offset to the next scan line (par->hw.falcon.li=
ne_offset) has to=20
> > > > be shortened.=20
> > >=20
> > > Sounds reasonable. But the shortening part doesn't work on ARAnyM=
, nor do
> > > small panning increments. So it really smells like an ARAnyM bug.
> >=20
> > Petr said as much if I understand him right. No need to fix ARAnyM =
though, we=20
> > just need to keep that in mind.=20
>=20
> ARAnyM's VIDEL emulation has already been fixed by Patrice (yesterday
> night, in CVS).

I can confirm that (for depths 2, 4, and 8). However, it's not flicker-=
free.
Dunno if that's an atafb or ARAnyM issue.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
							    -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
