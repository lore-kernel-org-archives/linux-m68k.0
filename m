From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [PATCH 1/1] m68k: add missing I/O macros {in,out}{w,l}_p() for
 !CONFIG_ISA
Date: Mon, 4 Oct 2010 11:37:12 +0000
Message-ID: <Pine.BSM.4.64L.1010041130280.4312@herc.mirbsd.org>
References: <Pine.BSM.4.64L.1010031832530.15165@herc.mirbsd.org>
 <Pine.BSM.4.64L.1010031846060.15165@herc.mirbsd.org>
 <AANLkTinJbQY_4jg4dWUA6QxE+zu9=Phcd4o7DDu=UfeR@mail.gmail.com>
 <Pine.BSM.4.64L.1010040809360.8491@herc.mirbsd.org>
 <alpine.OSX.2.00.1010041955060.285@localhost> <Pine.BSM.4.64L.1010041016060.29280@herc.mirbsd.org>
 <alpine.OSX.2.00.1010042123060.285@localhost>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from lo.gmane.org ([80.91.229.12]:58265 "EHLO lo.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755227Ab0JDLhX convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 4 Oct 2010 07:37:23 -0400
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <glpm-linux-m68k@m.gmane.org>)
	id 1P2jM9-0000SL-8S
	for linux-m68k@vger.kernel.org; Mon, 04 Oct 2010 13:37:21 +0200
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Mon, 04 Oct 2010 13:37:21 +0200
Received: from tg by static-87-79-237-121.netcologne.de with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Mon, 04 Oct 2010 13:37:21 +0200
In-Reply-To: <alpine.OSX.2.00.1010042123060.285@localhost>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

=46inn Thain dixit:

>It built for me at the time, so I was suprised to find out it didn't b=
uild
>for you, and naturally I wanted to know what I did wrong.

Well, we found out it didn=E2=80=99t build for you now too.

>It may be that speakup works on amiga and atari (I don't know). It doe=
sn't
>work on mac as there are no audio drivers. It has long frustrated me t=
hat

There=E2=80=99s a software backend. (You could probably use network aud=
io.)

>there is bloat in the debian kernel configs. So perhaps I am guilty of

Yes, there is bloat. However, to remove *that* would be even more
difficult to both do and find reasons for, is *WAY* beyong my
knowledge; remember I=E2=80=99m first and foremost a BSD developer.

So, we have a speakup driver broken without=C2=B9 the patch I submitted=
=2E

>being unfairly obstructionist here, in the hope that the config file
>issues could be addressed. My apologies.

I don=E2=80=99t even *want* to go there. I do believe I=E2=80=99d fail,=
 and I want
to focus on getting enough packages built to be able to use eglibc
with TLS and cowbuilder, which includes having a newer kernel only
as side effect (and the kernel is said to be the least problematic
part of them all=E2=80=A6 *sigh*).

>You may be right. I confess to being ignorant when it comes to ISA.

I=E2=80=99m ignorant regarding both the Linux kernel and m68k, which ma=
y be
a reason for different views. And bringing in fresh wind/blood=E2=80=A6

Anyway, it appears to build with the exact patch I submitted applied:

[=E2=80=A6]
  CC [M]  drivers/ssb/driver_chipcommon_pmu.o
  LD [M]  drivers/ssb/ssb.o
  CC      drivers/staging/staging.o
  LD      drivers/staging/built-in.o
  LD      drivers/staging/speakup/built-in.o
  CC [M]  drivers/staging/speakup/speakup_acntsa.o
  CC [M]  drivers/staging/speakup/speakup_acntpc.o
  CC [M]  drivers/staging/speakup/speakup_apollo.o
  CC [M]  drivers/staging/speakup/speakup_audptr.o
  CC [M]  drivers/staging/speakup/speakup_bns.o
  CC [M]  drivers/staging/speakup/speakup_dectlk.o
  CC [M]  drivers/staging/speakup/speakup_decext.o
  CC [M]  drivers/staging/speakup/speakup_dtlk.o
  CC [M]  drivers/staging/speakup/speakup_keypc.o
  CC [M]  drivers/staging/speakup/speakup_ltlk.o
  CC [M]  drivers/staging/speakup/speakup_soft.o
  CC [M]  drivers/staging/speakup/speakup_spkout.o
  CC [M]  drivers/staging/speakup/speakup_txprt.o
  CC [M]  drivers/staging/speakup/speakup_dummy.o
  CC [M]  drivers/staging/speakup/buffers.o
  CC [M]  drivers/staging/speakup/devsynth.o
  CC [M]  drivers/staging/speakup/i18n.o
  CC [M]  drivers/staging/speakup/fakekey.o
  CC [M]  drivers/staging/speakup/main.o
  CC [M]  drivers/staging/speakup/keyhelp.o
  CC [M]  drivers/staging/speakup/kobjects.o
  CC [M]  drivers/staging/speakup/selection.o
  CC [M]  drivers/staging/speakup/serialio.o
/root/linux-2.6-2.6.32/debian/build/source_m68k_none/drivers/staging/sp=
eakup/serialio.c: In function =E2=80=98spk_serial_init=E2=80=99:       =
                                                                       =
                   /root/linux-2.6-2.6.32/debian/build/source_m68k_none=
/drivers/staging/speakup/serialio.c:44: warning: format =E2=80=98%x=E2=80=
=99 expects type =E2=80=98unsigned int=E2=80=99, but argument 2 has typ=
e =E2=80=98long unsigned int=E2=80=99
/root/linux-2.6-2.6.32/debian/build/source_m68k_none/drivers/staging/sp=
eakup/serialio.c: In function =E2=80=98start_serial_interrupt=E2=80=99:=
                                                                       =
                   /root/linux-2.6-2.6.32/debian/build/source_m68k_none=
/drivers/staging/speakup/serialio.c:112: warning: statement with no eff=
ect
/root/linux-2.6-2.6.32/debian/build/source_m68k_none/drivers/staging/sp=
eakup/serialio.c:113: warning: statement with no effect
/root/linux-2.6-2.6.32/debian/build/source_m68k_none/drivers/staging/sp=
eakup/serialio.c:114: warning: statement with no effect
/root/linux-2.6-2.6.32/debian/build/source_m68k_none/drivers/staging/sp=
eakup/serialio.c:115: warning: statement with no effect
  CC [M]  drivers/staging/speakup/synth.o
  CC [M]  drivers/staging/speakup/thread.o
  CC [M]  drivers/staging/speakup/varhandlers.o
  LD [M]  drivers/staging/speakup/speakup.o
  LD      drivers/uio/built-in.o
  CC [M]  drivers/uio/uio.o
[=E2=80=A6]

This lets me think I=E2=80=99m doing something right here. Still buildi=
ng=E2=80=A6

[=E2=80=A6]
  CC [M]  net/ipv6/xfrm6_input.o

This is where I am at right now, and I wonder how much longer it will
take. However, I somewhat feel proud to get so far even with Debian=E2=80=
=99s
admitted bloat, which on the other hand is something I=E2=80=99d *expec=
t* from
a general-purpose distribution.

bye,
//mirabilos
--=20
> Hi, does anyone sell openbsd stickers by themselves and not packaged
> with other products?
No, the only way I've seen them sold is for $40 with a free OpenBSD CD.
	-- Haroon Khalid and Steve Shockley in gmane.os.openbsd.misc
