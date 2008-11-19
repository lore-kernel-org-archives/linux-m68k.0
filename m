From: Petr Stehlik <pstehlik@sophics.cz>
Subject: Re: [PATCH/RFC] atafb and panning
Date: Wed, 19 Nov 2008 09:51:35 +0100
Message-ID: <1227084695.8542.14.camel@petr>
References: <Pine.LNX.4.64.0811162235251.20005@anakin>
	 <alpine.DEB.1.00.0811190828090.6915@zirkon.biophys.uni-duesseldorf.de>
	 <Pine.LNX.4.64.0811190912190.27671@anakin>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.sophics.cz ([92.61.80.24]:51891 "EHLO www.sophics.cz"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751863AbYKSJNS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 19 Nov 2008 04:13:18 -0500
In-Reply-To: <Pine.LNX.4.64.0811190912190.27671@anakin>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>, Linux/m68k <linux-m68k@vger.kernel.org>

Geert Uytterhoeven p=ED=B9e v St 19. 11. 2008 v 09:15 +0100:
> > par->hw.falcon.xoffset takes care of that, and xoffset takes care o=
f the rest.=20
> > Since the partial word offset shifts the beginnig of the scan line =
into the=20
> > first word, the offset to the next scan line (par->hw.falcon.line_o=
ffset) has to=20
> > be shortened.=20
>=20
> Sounds reasonable. But the shortening part doesn't work on ARAnyM, no=
r do
> small panning increments. So it really smells like an ARAnyM bug.

I guess this is about horizontal scrolling which was used in old 2D
games only and frankly, we don't have many games running on ARAnyM (it'=
s
not the goal of ARAnyM project, anyway). I hacked the VIDEL emulation
many years ago just to get the TOS booting and even though it's been
improved by others since then it's likely nobody run into this yet.

Just please tell me if the xoffset you mention is the 0xff8264 register
or if I am completely out. And for now write the linux kernel according
to the HW docs and I'll then correct the VIDEL emulation to do the righ=
t
thing in fbtests :-)

Thanks :)

Petr

P.S. There is a new release of ARAnyM in sid since last week (that has
the special "--halt" option for Stephen and other installing
Debian/m68k :-) but I am willing to do another release as soon as this
probable/apparent VIDEL deficiency is fixed.


--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
