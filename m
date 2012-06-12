From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: remove six unused headers
Date: Tue, 12 Jun 2012 09:24:10 +0200
Message-ID: <CAMuHMdWn7KsdW1mEcvp8tGrDZeMiD+e6RszB=qH7P3CLZEyftg__44804.7514343218$1339486266$gmane$org@mail.gmail.com>
References: <1339059427.25798.3.camel@x61.thuisdomein>
	<4FD19B29.4050904@snapgear.com>
	<CAMuHMdXisLvXAPbbkuYsYH2UZ_DJSyEhKZOL6_4qwuwLzFcEoQ@mail.gmail.com>
	<4FD6DC69.2090008@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <4FD6DC69.2090008@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: Paul Bolle <pebolle@tiscali.nl>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

On Tue, Jun 12, 2012 at 8:06 AM, Greg Ungerer <gerg@snapgear.com> wrote=
:
>>> Although mcfne.h has been unused for a while I am working on some p=
atches
>>> that do use it. No problem for the others.
>>
>> If I'm not mistaken, that should become mcf8390.h, as "NE2000" means
>> "NE2000-compatible 8390-based Ethernet"? Cfr. the mac8390 and zorro8=
390
>> discussions in the previous millennium.
>
>
> I guess I missed those :-(
> I think I see from the code for those under ~/drivers/net/ethernet/83=
90/
> what this may have been about though.
>
> Interestingly one of the ColdFire platforms (the Arnewsh 5206 board)
> really did have an ISA NE2000 card fitted to it. Most of the follow
> ons that where similar use a Davicom/9000.

If it's a real ISA NE2000 card, you ISA bus support instead of a specia=
l
driver.

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
