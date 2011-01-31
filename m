From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: build warnings
Date: Mon, 31 Jan 2011 08:10:15 +0100
Message-ID: <AANLkTinGGbu4ZgUfARsi9DKLp+U17DJHMEfnkYvSfmVd@mail.gmail.com>
References: <alpine.DEB.2.00.1101131539400.19098@tglase.bonn.tarent.de>
	<alpine.DEB.2.00.1101141023130.5300@tglase.bonn.tarent.de>
	<AANLkTi=2Cb+EHR9xAgNPa7wGsSWWydZ56_iAGRDN-hXU@mail.gmail.com>
	<AANLkTinN+0i9gZxvUn0cig1kp0aM9iJ+fph0=-R-ChKZ@mail.gmail.com>
	<Pine.BSM.4.64L.1101161347480.11797@herc.mirbsd.org>
	<AANLkTimcvXaCqRrn+uZ9eVjxg0UyncSF1YL=Xpz2FiNF@mail.gmail.com>
	<Pine.BSM.4.64L.1101162226120.11797@herc.mirbsd.org>
	<AANLkTi=QH7=6ddP=KoTywDpYrwnB21XGnmwhmFkZganD@mail.gmail.com>
	<4D44F92C.2050707@gmail.com>
	<AANLkTimB1fpvMsSeTbRn5ZTU1NCpZpjrAXQ+xRShAsZN@mail.gmail.com>
	<4D461512.8080609@gmail.com>
	<alpine.LNX.2.00.1101311424100.6256@nippy.intranet>
	<4D465998.60006@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:59852 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750912Ab1AaHKR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 31 Jan 2011 02:10:17 -0500
Received: by fxm20 with SMTP id 20so5283520fxm.19
        for <linux-m68k@vger.kernel.org>; Sun, 30 Jan 2011 23:10:16 -0800 (PST)
In-Reply-To: <4D465998.60006@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Finn Thain <fthain@telegraphics.com.au>, Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

On Mon, Jan 31, 2011 at 07:41, Michael Schmitz
<schmitzmic@googlemail.com> wrote:
>> I haven't compared the log from Thorsten's kernel failure with the
>> failures I saw, but (anecdotally) my experience was the same: SLUB o=
n m68k
>> was not usable, going back some years.
>>
>> The introduction of the SLUB allocator was 2.6.22, but I can't help =
you
>> bisect because I don't recall that it worked ever (?)
>>
>
> Thanks for sharing that information - that does sound like quite a
> fundamental problem, and not just limited to Atari then.
>>
>> Anyway, I do recall building SLUB kernels at the time that would fai=
l more
>> often than they booted ... maybe the old releases could offer some c=
lues?
>>
>
> At least they fail in a very consistent manner now. I wonder whether =
it's
> worth debugging this at all?

Not for us, but please send your findings (e.g. crash log) to the SLUB =
people.

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
