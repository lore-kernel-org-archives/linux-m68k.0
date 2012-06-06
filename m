From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: Use generic strncpy_from_user(), strlen_user(), and strnlen_user()
Date: Wed, 6 Jun 2012 19:46:02 +0200
Message-ID: <CAMuHMdWg6W4uOm3N-etXJud5Lw-vBkstQ2h7HK=6i+sCLgeksQ__41882.3981345215$1339005210$gmane$org@mail.gmail.com>
References: <1338327216-15309-1-git-send-email-geert@linux-m68k.org>
	<20120530102226.GA28628@frolo.macqel>
	<CAMuHMdV5GVZR1BvGD3EncDFfPt=Bt9ndkKE8Mp7euE9KoSaGNQ@mail.gmail.com>
	<20120530140444.GA10543@frolo.macqel>
	<CAMuHMdW29QYN6XpBb9F3GGoJ-9frrD-00Wx=FchT9ALqW1LcPg@mail.gmail.com>
	<4FCEF956.9090603@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <4FCEF956.9090603@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: Philippe De Muyter <phdm@macqel.be>, Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Hi Greg,

On Wed, Jun 6, 2012 at 8:31 AM, Greg Ungerer <gerg@snapgear.com> wrote:
> Yes, looks like that should have a "|| defined(CONFIG_CPU32)".
> (According to the CPU32 reference manual words and long words must
> be aligned on word boundaries.)
>
> I think something like CONFIG_CPU_HAS_NO_UNALIGNED makes sense.

OK, doing that now...

Then I saw arch/m68k/lib/memcpy.c.

commit f230e80b423f6cb002015ab4771c06a53d5a2287
("m68k: fix memcpy to unmatched/unaligned source and dest on 68000")

| The original 68000 processors cannot copy 16bit or larger quantities =
from
| odd addresses. All newer members of the 68k family (including ColdFir=
e)
| can do this.

So all Coldfires can do unaligned _reads_, but not unaligned _writes_
(exceptions below)?

>>> I also think that the Coldfire 5272 can do unaligned accesses, but =
I
>>> cannot test that at the moment.
>
>
> According to the MCF5272 User Manual, "it supports misaligned data
> accesses ...". So it looks like it does.
>
> Having a CONFIG_CPU_HAS_NO_UNALIGNED looks like a really good solutio=
n
> then. We need to be able select it as required on individual CPU type=
s.

=46or now, I just make COLDFIRE select it, but we can move it to the in=
dividual
CPU types later.

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
