From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: Aranym, more than 244MB FastRAM, garbled display
Date: Thu, 7 Oct 2010 09:47:34 +0200
Message-ID: <AANLkTi=ZrDoFPxFNZ3OKurvcrBuN3fS0gTvAeYpLQqCi@mail.gmail.com>
References: <alpine.LNX.2.00.1010011728270.4788@halbrend.uninett.no>
	<m2tyl5u9hu.fsf@igel.home>
	<alpine.LNX.2.00.1010011908550.4788@halbrend.uninett.no>
	<Pine.BSM.4.64L.1010041947160.3776@herc.mirbsd.org>
	<AANLkTinq7CXPpYVfAYhgH9ea1FQs_f+AhYsU1-+ZdUx+@mail.gmail.com>
	<Pine.BSM.4.64L.1010060910520.21623@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:50145 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760127Ab0JGHrf convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 7 Oct 2010 03:47:35 -0400
Received: by wwj40 with SMTP id 40so561912wwj.1
        for <linux-m68k@vger.kernel.org>; Thu, 07 Oct 2010 00:47:34 -0700 (PDT)
In-Reply-To: <Pine.BSM.4.64L.1010060910520.21623@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org

>>> Args =3D root=3D/dev/hda1 console=3Dtty debug=3Dpar video=3Datafb:v=
ga2
>
>>The problem starts happening as soon as FastRAM >=3D 512.
>
> I suspect atafb:vga2 reduces the amount of memory needed enough
> for it to work.

Certainly - 640x480@1bit isn't much. Even less than sthigh IIRC.

I wonder why it does depend on FastRAM size, though. ST-RAM eaten up
by page tables?

BTW: browsing Geert's git tree online, I noticed that my old patch to
reserve some of ST-RAM for use by atafb etc. has never made it into
git. I'll clean that up and resubmit unless Geert has objections.

See: http://marc.info/?l=3Dlinux-m68k&m=3D124072556805722&w=3D2

The amount of ST-RAM reserved is hardcoded and might need to be increas=
ed.

Cheers,

  Michael


>
> bye,
> //mirabilos
> --
> I believe no one can invent an algorithm. One just happens to hit upo=
n it
> when God enlightens him. Or only God invents algorithms, we merely co=
py them.
> If you don't believe in God, just consider God as Nature if you won't=
 deny
> existence. =A0 =A0 =A0 =A0 =A0 =A0 =A0-- Coywolf Qi Hunt
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
