From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: remove six unused headers
Date: Sun, 10 Jun 2012 10:40:17 +0200
Message-ID: <CAMuHMdXisLvXAPbbkuYsYH2UZ_DJSyEhKZOL6_4qwuwLzFcEoQ__24872.1566204496$1339318043$gmane$org@mail.gmail.com>
References: <1339059427.25798.3.camel@x61.thuisdomein>
	<4FD19B29.4050904@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <4FD19B29.4050904@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: Paul Bolle <pebolle@tiscali.nl>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

On Fri, Jun 8, 2012 at 8:26 AM, Greg Ungerer <gerg@snapgear.com> wrote:
> On 07/06/12 18:57, Paul Bolle wrote:
>> There are six entirely unused headers in arch/m68k/include/asm. Noth=
ing
>> includes these headers. And a few tests found no hits for the things
>> they provide (which makes sense).
>>
>> MC68332.h, mac_mouse.h, mcfmbus.h, and mcfne.h are all unused since =
at
>> least v2.6.12-rc2 (I didn't bother looking further back than that).
>
>
> Although mcfne.h has been unused for a while I am working on some pat=
ches
> that do use it. No problem for the others.

If I'm not mistaken, that should become mcf8390.h, as "NE2000" means
"NE2000-compatible 8390-based Ethernet"? Cfr. the mac8390 and zorro8390
discussions in the previous millennium.

>> Signed-off-by: Paul Bolle<pebolle@tiscali.nl>
>
>
> Acked-by: Greg Ungerer<gerg@uclinux.org>

Thanks, queued for 3.6.

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
