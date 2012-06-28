From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: remove never used asm/shm.h
Date: Thu, 28 Jun 2012 20:46:52 +0200
Message-ID: <CAMuHMdXjnAbNAjB=0jG1jRt5vWewYG+6Ky9oi01n96ngAUB=dw__10795.3489096419$1340911037$gmane$org@mail.gmail.com>
References: <1340361221.1773.78.camel@x61.thuisdomein>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1340361221.1773.78.camel@x61.thuisdomein>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

On Fri, Jun 22, 2012 at 12:33 PM, Paul Bolle <pebolle@tiscali.nl> wrote=
:
> m68k's asm/shm.h header has been part of the tree ever since m68k
> support got added in v1.3.94. (It started as /include/asm-m68k/shm.h =
and
> moved to its current location a few years ago.) It seems it was never
> used: no file ever included it and nothing used the macros it defines=
=2E
>
> (Actually, from v2.5.46 until v2.6.29-rc3 it was included by m68knomm=
u's
> asm/shm.h. But that header was just a very thin wrapper for this head=
er
> and was itself unused too.)
>
> This header can safely be removed.
>
> Signed-off-by: Paul Bolle <pebolle@tiscali.nl>

Thx, queued for 3.6.

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
