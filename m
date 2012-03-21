From: Petr Stehlik <pstehlik@sophics.cz>
Subject: Re: new ARAnyM with better FPU
Date: Wed, 21 Mar 2012 10:34:33 +0100
Message-ID: <1332322473.10247.56.camel@petr>
References: <1332282242.3352.7.camel@aspire>
	 <Pine.BSM.4.64L.1203210905300.23907@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.sophics.cz ([188.246.101.24]:47721 "EHLO www.sophics.cz"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750969Ab2CUJer convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 21 Mar 2012 05:34:47 -0400
In-Reply-To: <Pine.BSM.4.64L.1203210905300.23907@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: debian-68k@lists.debian.org, Linux/m68k <linux-m68k@vger.kernel.org>

Thorsten Glaser p=C3=AD=C5=A1e v St 21. 03. 2012 v 09:07 +0000:
> >ARAnyM Debian maintainer is working on updating the package in Debia=
n
> >sid as well.
>=20
> OK, great. I=E2=80=99ll wait for that, upgrade the box with sid on
> it and will backport to *shudder* hardy

Well, beware: Ubuntu < 10.10 (including the 10.04 LTS Lucid Lynx) does
not have the necessary libmpfr3+. That also means that the Ubuntu Lucid
packages I have prepared at=20

http://sourceforge.net/projects/aranym/files/aranym/0.9.12/

do NOT contain the new MPFR based FPU core made by Andreas.

So if you really want to try out the new ARAnyM FPU on your Hardy make
sure you'll backport libmpfr3+ there first.

Petr
