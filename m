From: Petr Stehlik <pstehlik@sophics.cz>
Subject: Re: new ARAnyM with better FPU
Date: Wed, 21 Mar 2012 14:41:19 +0100
Message-ID: <1332337279.5083.3.camel@aspire>
References: <1332282242.3352.7.camel@aspire>
	 <Pine.BSM.4.64L.1203210905300.23907@herc.mirbsd.org>
	 <1332322473.10247.56.camel@petr>
	 <CAMuHMdWNktLMKTCkBitY0VQjtaXRaaWR-L4bmKYdvyeadwOkJg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx.zln.cz ([188.246.101.4]:40664 "EHLO mx.zln.cz"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754860Ab2CUNl0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 21 Mar 2012 09:41:26 -0400
In-Reply-To: <CAMuHMdWNktLMKTCkBitY0VQjtaXRaaWR-L4bmKYdvyeadwOkJg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: debian-68k@lists.debian.org, Linux/m68k <linux-m68k@vger.kernel.org>

Geert Uytterhoeven p=C3=AD=C5=A1e v Wed 21. 03. 2012 v 11:08 +0100:
> > Well, beware: Ubuntu < 10.10 (including the 10.04 LTS Lucid Lynx) d=
oes
> > not have the necessary libmpfr3+. That also means that the Ubuntu L=
ucid
> > packages I have prepared at
> >
> > http://sourceforge.net/projects/aranym/files/aranym/0.9.12/
> >
> > do NOT contain the new MPFR based FPU core made by Andreas.
> >
> > So if you really want to try out the new ARAnyM FPU on your Hardy m=
ake
> > sure you'll backport libmpfr3+ there first.

> I've just installed the binary for Lucid, and now cp/mv/du from coreu=
tils
> work again (they failed with out-of-memory errors under Ubuntu's 0.9.=
9).
> I guess that was due to the CAS/CAS2 bugs?

Most probably.

I am wondering if it is worth backporting the libmpfr and making new
ARAnyM packages for 10.04 when the 12.04 is to be released in a month.

Petr
