From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] zorro: Defer device_register() until all devices have
 been identified
Date: Fri, 23 Sep 2011 06:58:17 +0200
Message-ID: <CAMuHMdUnVr+mYr4hgbfSi9n5iMmHGxTK-_E8y-sKn=HOiEAkMw@mail.gmail.com>
References: <alpine.DEB.2.00.1109222140510.8856@ayla.of.borg>
	<CA+55aFxm86xohU4nSuDWe_Ru9SU79x1sLHNdm4nFHyJNH4=mBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CA+55aFxm86xohU4nSuDWe_Ru9SU79x1sLHNdm4nFHyJNH4=mBQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?Q?Ingo_J=C3=BCrgensmann?= <ij@2011.bluespice.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>

On Thu, Sep 22, 2011 at 22:01, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Thu, Sep 22, 2011 at 12:47 PM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>>
>> Authorization code F68KAMYRULEZ.
>
> EUNAUTHORIZED.

I thought we used negative error codes? ;-)

> But applied anyway,

Thanks!

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
