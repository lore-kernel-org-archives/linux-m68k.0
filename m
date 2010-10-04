From: Thorsten Glaser <tg@debian.org>
Subject: Re: [PATCH 1/1] m68k: add missing I/O macros {in,out}{w,l}_p() for
 !CONFIG_ISA
Date: Mon, 4 Oct 2010 10:18:59 +0000
Message-ID: <Pine.BSM.4.64L.1010041016060.29280@herc.mirbsd.org>
References: <Pine.BSM.4.64L.1010031832530.15165@herc.mirbsd.org>
 <Pine.BSM.4.64L.1010031846060.15165@herc.mirbsd.org>
 <AANLkTinJbQY_4jg4dWUA6QxE+zu9=Phcd4o7DDu=UfeR@mail.gmail.com>
 <Pine.BSM.4.64L.1010040809360.8491@herc.mirbsd.org>
 <alpine.OSX.2.00.1010041955060.285@localhost>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from lo.gmane.org ([80.91.229.12]:39721 "EHLO lo.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754495Ab0JDKTN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 4 Oct 2010 06:19:13 -0400
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <glpm-linux-m68k@m.gmane.org>)
	id 1P2i8V-0005Kh-Do
	for linux-m68k@vger.kernel.org; Mon, 04 Oct 2010 12:19:11 +0200
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Mon, 04 Oct 2010 12:19:11 +0200
Received: from tg by static-87-79-237-121.netcologne.de with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Mon, 04 Oct 2010 12:19:11 +0200
In-Reply-To: <alpine.OSX.2.00.1010041955060.285@localhost>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

=46inn Thain dixit:

>Which modules are we talking about? In 2.6.32-23, debian patches speak=
up=20
>into drivers/staging

Yes. They are, however, compiled. This is a problem for me. At the
moment, the one important thing for me is to get this &*#)*^&*(
stuff to compile so we can go on with migration to TLS. I cannot
upload modified source to unstable, so patches must go into the
official Debian packages. Patches are only accepted if they are
accepted by =E2=80=9Csomeone=E2=80=9D =E2=80=93 so if they live in linu=
x-m68k for a while
it=E2=80=99s okay.

http://kernel-handbook.alioth.debian.org/ch-source.html#s-acceptance

Besides, this seems like a simple fix or an accidental omission
to me. What is with all this bikeshedding? Some macros are not
available on m68k if CONFIG_ISA is not set, but they are available
=E2=80=9Calmost=E2=80=9D or even really everywhere else, so drivers use=
 them, so
m68k is buggy in not providing them. (Outsider=E2=80=99s PoV.)

bye,
//mirabilos
--=20
16:47=E2=8E=9C=C2=ABmika:#grml=C2=BB .oO(mira ist einfach gut....)     =
 23:22=E2=8E=9C=C2=ABmikap:#grml=C2=BB
mirabilos: und dein bootloader ist geil :)    23:29=E2=8E=9C=C2=ABmikap=
:#grml=C2=BB und ich
finds saugeil dass ich ein bsd zum booten mit grml hab, das muss ich da=
nn
gleich mal auf usb-stick installieren	-- Michael Prokop =C3=BCber MirOS=
 bsd4grml
