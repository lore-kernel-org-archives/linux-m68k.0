From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [PATCH] make NatFeat drivers bool, not tristate
Date: Wed, 24 Jul 2013 13:26:26 +0000 (UTC)
Message-ID: <loom.20130724T152350-539@post.gmane.org>
References: <201307232255.r6NMt8Z9027017@herc.mirbsd.org> <87li4wpc79.fsf@igel.home> <Pine.BSM.4.64L.1307241241550.30771@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from plane.gmane.org ([80.91.229.3]:36006 "EHLO plane.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750795Ab3GXN0t (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Wed, 24 Jul 2013 09:26:49 -0400
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <glpm-linux-m68k@m.gmane.org>)
	id 1V1z5a-00086f-7b
	for linux-m68k@vger.kernel.org; Wed, 24 Jul 2013 15:26:46 +0200
Received: from fb-n15-11.unbelievable-machine.net ([94.198.62.204])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Wed, 24 Jul 2013 15:26:46 +0200
Received: from tg by fb-n15-11.unbelievable-machine.net with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Wed, 24 Jul 2013 15:26:46 +0200
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Thorsten Glaser <tg <at> mirbsd.de> writes:

> Andreas Schwab dixit:
>=20
> >The problem is that aranym expects the parameters of the natfeat cal=
ls
> >to be physical addresses.  The nf_get_id calls use literal strings a=
s
> >parameters which only works when the drivers are builtin because phy=
s =3D=3D
> >virt then.
>=20
> Ah, right, there was that issue=E2=80=A6 so this patch should probabl=
y go in?

At first, anyway.

Maybe if CONFIG_NATFEAT is selected (it=E2=80=99s bool), some bounce bu=
ffer could
be allocated and memlocked, which the other NF* drivers can then use.
(If NatFeat is not found during boot, no memory should be allocated.)

Especially if we had more NF* drivers in the future (hostfs could be ma=
de
into something, maybe with something like umsdos on top for Unix file
permissions? And I=E2=80=99m hoping for a bidirectional =E2=80=9Cvirtio=
/serial=E2=80=9D console=E2=80=A6)
this could be useful sharing, and not needing to have everything else
in the kernel statically.

Well, if someone has time and wants to write this.

bye,
//mirabilos
