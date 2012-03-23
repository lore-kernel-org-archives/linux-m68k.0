From: Petr Stehlik <pstehlik@sophics.cz>
Subject: ARAnyM 0.9.13 with MPFR even for Lucid
Date: Fri, 23 Mar 2012 13:26:56 +0100
Message-ID: <1332505616.22403.27.camel@petr>
References: <1332282242.3352.7.camel@aspire>
	 <Pine.BSM.4.64L.1203210905300.23907@herc.mirbsd.org>
	 <1332322473.10247.56.camel@petr>
	 <CAMuHMdWNktLMKTCkBitY0VQjtaXRaaWR-L4bmKYdvyeadwOkJg@mail.gmail.com>
	 <1332337279.5083.3.camel@aspire>
	 <CAMuHMdXLUEYpiGrHrtDw=MjSZn3yZ1Of8TLf4wPmiDr9grpreg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.sophics.cz ([188.246.101.24]:55400 "EHLO www.sophics.cz"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756419Ab2CWM1G convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 23 Mar 2012 08:27:06 -0400
In-Reply-To: <CAMuHMdXLUEYpiGrHrtDw=MjSZn3yZ1Of8TLf4wPmiDr9grpreg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: debian-68k@lists.debian.org, Linux/m68k <linux-m68k@vger.kernel.org>

Geert Uytterhoeven p=C3=AD=C5=A1e v St 21. 03. 2012 v 16:08 +0100:
> On Wed, Mar 21, 2012 at 14:41, Petr Stehlik <pstehlik@sophics.cz> wro=
te:
> > I am wondering if it is worth backporting the libmpfr and making ne=
w
> > ARAnyM packages for 10.04 when the 12.04 is to be released in a mon=
th.
>=20
> Indeed, next month we'll all be forced into the new GUI generation...

I couldn't stand the feeling that Geert cannot enjoy new Andreas' MPFR
=46PU emulation in ARAnyM so I have backported the libmpfr4 for Lucid:

http://sourceforge.net/projects/aranym/files/aranym/0.9.13/lucid_mpfr4/

And I have also released a new version of ARAnyM that includes another
fix that Andreas made two days ago:

http://sourceforge.net/projects/aranym/files/aranym/0.9.13/

Enjoy :-)

Petr
