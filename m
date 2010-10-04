From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [PATCH 1/1] m68k: add missing I/O macros {in,out}{w,l}_p() for
 !CONFIG_ISA
Date: Mon, 4 Oct 2010 08:13:06 +0000
Message-ID: <Pine.BSM.4.64L.1010040809360.8491@herc.mirbsd.org>
References: <Pine.BSM.4.64L.1010031832530.15165@herc.mirbsd.org>
 <Pine.BSM.4.64L.1010031846060.15165@herc.mirbsd.org>
 <AANLkTinJbQY_4jg4dWUA6QxE+zu9=Phcd4o7DDu=UfeR@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from lo.gmane.org ([80.91.229.12]:39758 "EHLO lo.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752671Ab0JDINQ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 4 Oct 2010 04:13:16 -0400
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <glpm-linux-m68k@m.gmane.org>)
	id 1P2gAd-0005u3-39
	for linux-m68k@vger.kernel.org; Mon, 04 Oct 2010 10:13:15 +0200
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Mon, 04 Oct 2010 10:13:15 +0200
Received: from tg by static-87-79-237-121.netcologne.de with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Mon, 04 Oct 2010 10:13:15 +0200
In-Reply-To: <AANLkTinJbQY_4jg4dWUA6QxE+zu9=Phcd4o7DDu=UfeR@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Michael Schmitz dixit:

>please take care not to disturb these macros for any other case than
>the default one (nothing related to ISA emulation configured at all).

The chunk is inside the !CONFIG_ISA part.

>Are you certain the speakup driver has a chance to work, once you got
>it to compile?

Not much, except for the software one. But it=E2=80=99s not the only on=
e, only
the first one, to use the *_p() macros, and given they=E2=80=99re defin=
ed in
the CONFIG_ISA case and _some_ are defined for !CONFIG_ISA, this looks
like an obvious omission to me.

Besides, it=E2=80=99s easier to get a bunch of modules that don=E2=80=99=
t do anything
except say the hardware they steer isn=E2=80=99t available to compile t=
han to
change the config (especially as the latter potentially has to be done
for every new kernel version, and I=E2=80=99d rather keep things workin=
g, as
they seem to change very quickly and nobody can keep up really).

bye,
//mirabilos
--=20
=E2=80=9CIt is inappropriate to require that a time represented as
 seconds since the Epoch precisely represent the number of
 seconds between the referenced time and the Epoch.=E2=80=9D
	-- IEEE Std 1003.1b-1993 (POSIX) Section B.2.2.2
