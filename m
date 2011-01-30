From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: build warnings
Date: Sun, 30 Jan 2011 19:57:15 +0100
Message-ID: <AANLkTimB1fpvMsSeTbRn5ZTU1NCpZpjrAXQ+xRShAsZN@mail.gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:47531 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751901Ab1A3S5R convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 30 Jan 2011 13:57:17 -0500
Received: by fxm20 with SMTP id 20so4932263fxm.19
        for <linux-m68k@vger.kernel.org>; Sun, 30 Jan 2011 10:57:16 -0800 (PST)
In-Reply-To: <4D44F92C.2050707@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

On Sun, Jan 30, 2011 at 06:37, Michael Schmitz
<schmitzmic@googlemail.com> wrote:
> I've seen a similar panic as the one you posted when I had quite a bi=
t of
> memory pressure due to ext2fsck running. Otherwise, the kernel built =
with my
> old binutils boots fine and eventually crashes the emulator with:
>
> terminate called after throwing an instance of 'm68k_exception'
>
> after getting well into runlevel 2 and starting a few services.
>
> Retesting your kernel - when I leave swap off I also get to runlevel =
2, and
> it starts to throw panic messages as soon as inetd is started.
> I've tried a few leads related to network stuff, but in the end repla=
cing
> the =C2=A0option CONFIG_SLUB=3Dy by CONFIG_SLAB=3Dy did fix it.
>
> Whatever the reason - the SLUB allocator either is buggy outright for=
 m68k,
> or we run into memory pressure a lot sooner than other architectures =
and the
> VM subsystem needs optimizing for SLUB.
>
> I'd just replace the Debian default for the m68k kernels....

If switching from SLUB to SLAB fixes the problem, please enable
CONFIG_SLUB_DEBUG and bring it up on lkml/with the SLUB people.

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
