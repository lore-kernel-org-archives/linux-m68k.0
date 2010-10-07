From: Petr Stehlik <pstehlik@sophics.cz>
Subject: Re: Aranym, more than 244MB FastRAM, garbled display
Date: Thu, 07 Oct 2010 15:11:22 +0200
Message-ID: <1286457082.1687.52.camel@joy-desktop>
References: <alpine.LNX.2.00.1010011728270.4788@halbrend.uninett.no>
	 <m2tyl5u9hu.fsf@igel.home>
	 <alpine.LNX.2.00.1010011908550.4788@halbrend.uninett.no>
	 <Pine.BSM.4.64L.1010041947160.3776@herc.mirbsd.org>
	 <AANLkTinq7CXPpYVfAYhgH9ea1FQs_f+AhYsU1-+ZdUx+@mail.gmail.com>
	 <Pine.BSM.4.64L.1010060910520.21623@herc.mirbsd.org>
	 <AANLkTi=ZrDoFPxFNZ3OKurvcrBuN3fS0gTvAeYpLQqCi@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mta.inext.cz ([212.111.0.11]:4318 "EHLO mta.inext.cz"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750719Ab0JGQOq convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 7 Oct 2010 12:14:46 -0400
Received: from inext.inext.cz ([212.111.0.10]) by mta.inext.cz
          (Netscape Mail Server v1.1) with SMTP id AAC229
          for <linux-m68k@vger.kernel.org>; Thu, 7 Oct 2010 15:11:23 +0200
Received: from mx.inext.cz ([212.111.0.12])
 by inext.inext.cz (SMSSMTP 4.1.0.19) with SMTP id M2010100715112317423
 for <linux-m68k@vger.kernel.org>; Thu, 07 Oct 2010 15:11:23 +0200
In-Reply-To: <AANLkTi=ZrDoFPxFNZ3OKurvcrBuN3fS0gTvAeYpLQqCi@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: linux-m68k@vger.kernel.org

Michael Schmitz p=C3=AD=C5=A1e v Thu 07. 10. 2010 v 09:47 +0200:
> >>> Args =3D root=3D/dev/hda1 console=3Dtty debug=3Dpar video=3Datafb=
:vga2
> >
> >>The problem starts happening as soon as FastRAM >=3D 512.
> >
> > I suspect atafb:vga2 reduces the amount of memory needed enough
> > for it to work.
>=20
> Certainly - 640x480@1bit isn't much. Even less than sthigh IIRC.

sthigh is 640x400@1bit, I believe, i.e. even less than vga2.

> I wonder why it does depend on FastRAM size, though. ST-RAM eaten up
> by page tables?

why anything is stored in ST-RAM? Besides there's 14 MB of ST-RAM on
ARAnyM, that should be plenty (compare with Falcon's 4 MB).

Petr
