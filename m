From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: build warnings
Date: Mon, 17 Jan 2011 07:51:26 +0100
Message-ID: <AANLkTimnXi0g_F4TT7gv3JnebwBcJe2oH7NNo83JN2XZ@mail.gmail.com>
References: <alpine.DEB.2.00.1101131539400.19098@tglase.bonn.tarent.de>
	<alpine.DEB.2.00.1101141023130.5300@tglase.bonn.tarent.de>
	<AANLkTi=2Cb+EHR9xAgNPa7wGsSWWydZ56_iAGRDN-hXU@mail.gmail.com>
	<AANLkTinN+0i9gZxvUn0cig1kp0aM9iJ+fph0=-R-ChKZ@mail.gmail.com>
	<Pine.BSM.4.64L.1101161347480.11797@herc.mirbsd.org>
	<AANLkTimcvXaCqRrn+uZ9eVjxg0UyncSF1YL=Xpz2FiNF@mail.gmail.com>
	<Pine.BSM.4.64L.1101162226120.11797@herc.mirbsd.org>
	<AANLkTi=QH7=6ddP=KoTywDpYrwnB21XGnmwhmFkZganD@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:34056 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750863Ab1AQGv1 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 17 Jan 2011 01:51:27 -0500
Received: by fxm20 with SMTP id 20so5614781fxm.19
        for <linux-m68k@vger.kernel.org>; Sun, 16 Jan 2011 22:51:26 -0800 (PST)
In-Reply-To: <AANLkTi=QH7=6ddP=KoTywDpYrwnB21XGnmwhmFkZganD@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

On Mon, Jan 17, 2011 at 03:48, Michael Schmitz
<schmitzmic@googlemail.com> wrote:
>>>Mmh - Geert's 2.6.37 does work just fine for me; I'll better get you=
r
>>>patches applied to a vanilla kernel and see how that differs from
>>>2.6.37-m68k. vanilla plus the git branch m68k-queue _should_ just ge=
t
>>>us to 2.6.37-m68k, right?
>>
>> I applied all of m68k-queue and for-linus of that day (which is the
>> signal patchset for both m68ks and the rest of the queue) but on top
>> of a 2.6.37-1~experimental.1 Debian kernel.
>
> for-linus is what I would have missed ...

for-linus is a always[*] subset of m68k-queue, so you can ignore it.

[*] Except if I feed extra stuff, like this time the m68knommu signal f=
ixes.
    But those don't matter for m68k.

>>>sometime. Not something the consumer electronics shops in Auckland C=
BD
>>>stock, for some reason.
>>
>> Heh well. I=E2=80=99ve had fun times buying an IDE drive with less t=
han 1024
>> cylinders, floppies, and printer paper (not loose pages like copier
>> paper they use nowadays, no, real 21x30.48cm endless paper) too ;-)
>
> Floppies is a dark chapter indeed. I salvage floppies wherever I find
> them. Will see about the 1024 cylinder limit though.

Guys, what are you smoking?
I was pleasantly surprised when my Amiga detected a "540 MB" drive, as =
the
one I bought was advertised as a "524 MB" drive. Turned out due to MS-D=
OS
supporting only 1024 cylinders, while the Amiga saw 1057 ;-)
I have to admit I bought this drive in 1993, not yesterday.

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
