From: Petr Stehlik <pstehlik@sophics.cz>
Subject: Re: new ARAnyM with better FPU
Date: Tue, 27 Mar 2012 10:06:25 +0200
Message-ID: <1332835585.6243.45.camel@petr>
References: <1332282242.3352.7.camel@aspire>
	 <Pine.BSM.4.64L.1203210905300.23907@herc.mirbsd.org>
	 <1332322473.10247.56.camel@petr>
	 <CAMuHMdWNktLMKTCkBitY0VQjtaXRaaWR-L4bmKYdvyeadwOkJg@mail.gmail.com>
	 <1332337279.5083.3.camel@aspire>
	 <CAMuHMdVegR=pb_JPYH_PBWjYCZzt0Ga4jgFdTcFjEuyxhm_DJQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.sophics.cz ([188.246.101.24]:56180 "EHLO www.sophics.cz"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753558Ab2C0IGb convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 27 Mar 2012 04:06:31 -0400
In-Reply-To: <CAMuHMdVegR=pb_JPYH_PBWjYCZzt0Ga4jgFdTcFjEuyxhm_DJQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: debian-68k@lists.debian.org, Linux/m68k <linux-m68k@vger.kernel.org>

Geert Uytterhoeven p=C3=AD=C5=A1e v Po 26. 03. 2012 v 22:41 +0200:

> Bad news:
>=20
> aranym_0.9.12-1.lucid_amd64.deb: du works
> aranym_0.9.13-1.lucid.mpfr4_amd64.deb: du fails with "memory exhauste=
d",
> just like in 0.9.9.

Hmm. The difference between those two particular packages is that the
latter has the new MPFR FPU that should have been better than the one i=
n
previous versions (otherwise Andreas wouldn't bother implementing it, I
believe).

Could you please try building the http://packages.debian.org/sid/aranym
that contains a patch for another post-release FPU bugfix? If that
doesn't help then feel free to stay with 0.9.12 as it contains the CPU
CAS fixes and also the proven FPU.

Andreas is reading this for sure so he might have a clue about the
failing 'du' with MPFR FPU emulation as well.

Petr
