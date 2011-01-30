From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: build warnings
Date: Sun, 30 Jan 2011 13:53:49 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1101301353090.30539@herc.mirbsd.org>
References: <alpine.DEB.2.00.1101131539400.19098@tglase.bonn.tarent.de>
 <alpine.DEB.2.00.1101141023130.5300@tglase.bonn.tarent.de>
 <AANLkTi=2Cb+EHR9xAgNPa7wGsSWWydZ56_iAGRDN-hXU@mail.gmail.com>
 <AANLkTinN+0i9gZxvUn0cig1kp0aM9iJ+fph0=-R-ChKZ@mail.gmail.com>
 <Pine.BSM.4.64L.1101161347480.11797@herc.mirbsd.org>
 <AANLkTimcvXaCqRrn+uZ9eVjxg0UyncSF1YL=Xpz2FiNF@mail.gmail.com>
 <Pine.BSM.4.64L.1101162226120.11797@herc.mirbsd.org>
 <AANLkTi=QH7=6ddP=KoTywDpYrwnB21XGnmwhmFkZganD@mail.gmail.com>
 <4D44F92C.2050707@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:4616 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752129Ab1A3N6t convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 30 Jan 2011 08:58:49 -0500
In-Reply-To: <4D44F92C.2050707@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org

Michael Schmitz dixit:

[ =E2=80=A6 ]
> I've tried a few leads related to network stuff, but in the end repla=
cing the
> option CONFIG_SLUB=3Dy by CONFIG_SLAB=3Dy did fix it.
>
> Whatever the reason - the SLUB allocator either is buggy outright for=
 m68k, or
> we run into memory pressure a lot sooner than other architectures and=
 the VM
> subsystem needs optimizing for SLUB.

Oh, okay. Thanks a huge lot for taking the time to track this down.

> I'd just replace the Debian default for the m68k kernels....

Sounds reasonable.

Thanks,
//mirabilos
--=20
22:20=E2=8E=9C<asarch> The crazy that persists in his craziness becomes=
 a master
22:21=E2=8E=9C<asarch> And the distance between the craziness and genia=
lity is
only measured by the success                       22:21=E2=8E=9C<mksh>=
 it=E2=80=99s a
very thin line anyway=E2=80=A6 with some, you don=E2=80=99t know which =
side they=E2=80=99re on
