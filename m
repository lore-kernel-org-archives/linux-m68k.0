From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Atari TT
Date: Thu, 5 Jan 2012 21:35:01 +0100
Message-ID: <CAMuHMdXmfY5_9DTabGYeUJdSxz_bWCO+75052ZZJ+SMd70D1hQ@mail.gmail.com>
References: <4F0488A9.5030100@fairlite.co.uk>
	<Pine.BSM.4.64L.1201041911580.19192@herc.mirbsd.org>
	<alpine.LNX.2.00.1201052128060.6601@nippy.intranet>
	<4F059460.5040305@fairlite.co.uk>
	<CAMuHMdUxQq_29g7yeaS2Ktz193CcHNX5FaP8PR9ijU0htnKbZg@mail.gmail.com>
	<4F059AE1.6070707@fairlite.co.uk>
	<4F059DB9.1050209@fairlite.co.uk>
	<CAMuHMdUK=2tkFtxQjua6LLGDJuEkrbK0W+mMVQ6PLBB9MfqPSw@mail.gmail.com>
	<4F05F3DB.3090801@fairlite.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:44030 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758290Ab2AEUfC convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 5 Jan 2012 15:35:02 -0500
Received: by werm1 with SMTP id m1so673051wer.19
        for <linux-m68k@vger.kernel.org>; Thu, 05 Jan 2012 12:35:01 -0800 (PST)
In-Reply-To: <4F05F3DB.3090801@fairlite.co.uk>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Alan Hourihane <alanh@fairlite.co.uk>
Cc: Finn Thain <fthain@telegraphics.com.au>, Thorsten Glaser <tg@mirbsd.de>, debian-68k@lists.debian.org, Linux/m68k <linux-m68k@vger.kernel.org>

On Thu, Jan 5, 2012 at 20:02, Alan Hourihane <alanh@fairlite.co.uk> wro=
te:
>>> unexpected interrupt from 112
>> That's the vector number, so the actual IRQ number is 112 / 4 =3D 28=
, which is
>> IRQ_TT_MFP_TIMD. Sorry, no clues.
>>
>> Can you please try a pristine v3.1? The only relevant differences ar=
e the
>> conversion to the genirq framework and the Atari SCC driver.
>>
>> If that works, I guess it's a regression introduced by the genirq co=
nversion.
>> Then you can bisect between v3.1 and m68k-v3.1.
>>
> No it didn't work. Same problem.

That's bad. So most probably it's been broken on TT for a long time.
AFAIK Atari receives most testing on (emulated -- ARAnyM) Falcon.

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
