From: Petr Stehlik <pstehlik@sophics.cz>
Subject: Re: nfhd performance
Date: Tue, 20 Aug 2013 08:52:17 +0200
Message-ID: <1376981537.5651.18.camel@pracovni>
References: <CAMuHMdUwzzx5Ae7sdvbRBtgY4UoXpo5-ig4PfdqFH4beWv_AHQ@mail.gmail.com>
	 <03094f45e85bca24df9306f73df2c84c@biophys.uni-duesseldorf.de>
	 <CAMuHMdUkMEorK34WnV9==thRPCVRXV0ySWq=fFTNFO1fe3Qc6g@mail.gmail.com>
	 <21010.11209.818043.191186@pilspetsen.it.uu.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx.zln.cz ([188.246.101.4]:50635 "EHLO mx.zln.cz"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750816Ab3HTGwW convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 20 Aug 2013 02:52:22 -0400
In-Reply-To: <21010.11209.818043.191186@pilspetsen.it.uu.se>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Mikael Pettersson <mikpe@it.uu.se>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>, Linux/m68k <linux-m68k@vger.kernel.org>, aranym@lists.bobek.cz

Mikael Pettersson p=ED=B9e v Po 19. 08. 2013 v 16:29 +0200:
> There are also other things in xhdi.cpp I don't really like, such as =
going through
> stdio when raw Unix file-descriptors would do

I think I recall that we did that for portability of LARGE FILES (64bit
offsets) at that time (think 10 years ago, various linux distros, MS
Windows, Mac OS, BeOS, various BSD Unices...). Perhaps the situation is
better (file descriptors with 64bit offsets are more portable) now?

Anyway, I have just converted the XHDI to using raw Unix file
descriptors and guess what - there's NO measurable difference (at least
using the previously mentioned XFERRATE.TTP).

Unless someone has a good reason for committing the Unix file
descriptors I'll throw it away and return to good old stdio.

Petr
