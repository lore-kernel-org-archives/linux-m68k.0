From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: Patch for broken lsl64() "old code" with incorrect shift
Date: Sat, 11 Jun 2011 14:01:35 +0200
Message-ID: <BANLkTimz90oWNDYYNnpX5aDhJ192LhDkXA@mail.gmail.com>
References: <BANLkTimUSvQi9CPgO+cCUrEdQq-+ohbzFg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <BANLkTimUSvQi9CPgO+cCUrEdQq-+ohbzFg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Jonathan Elchison <JElchison@gmail.com>
Cc: linux-m68k@lists.linux-m68k.org, Jiri Kosina <trivial@kernel.org>, linux-kernel@vger.kernel.org, David Huggins-Daines <dhd@debian.org>

On Sat, Jun 11, 2011 at 05:50, Jonathan Elchison <JElchison@gmail.com> =
wrote:
> In arch/m68k/math-emu/multi_arith.h, lsl64() doesn't calculate a
> correct HI_WORD(*dest) when count < 32, due to an incorrect shift
> operation. =C2=A0This line:
>
> =C2=A0 =C2=A0HI_WORD(*dest) =3D (HI_WORD(*dest) << count) | (LO_WORD(=
*dest) >> count);
>
> ...should be...
>
> =C2=A0 =C2=A0HI_WORD(*dest) =3D (HI_WORD(*dest) << count) | (LO_WORD(=
*dest) >>
> (32 - count));
>
> This function is ifdef'd out, marked as "old code". =C2=A0However, I =
fell
> into the same trap into which I suspect others have fallen (or will
> fall): =C2=A0On rare occasion when I need to implement my own library
> functions, I depend on the Linux kernel to provide solid code. =C2=A0=
This
> bug, albeit in old code, led me astray.
>
> I'm asking that this old code (lsl64) be corrected or removed.

I think it's better to just remove all #ifdefed out parts in the code.

> diff -up linux-2.6/arch/m68k/math-emu/multi_arith.h
> linux-2.6_orig/arch/m68k/math-emu/multi_arith.h
> --- linux-2.6/arch/m68k/math-emu/multi_arith.h =C2=A02011-06-10
> 22:50:32.538711320 -0400
> +++ linux-2.6_orig/arch/m68k/math-emu/multi_arith.h =C2=A0 =C2=A0 201=
1-06-10
> 22:47:43.407285452 -0400
> @@ -236,7 +236,7 @@ static inline void lsl64(int count, unsi
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (count < 32) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HI_WORD(*dest)=
 =3D (HI_WORD(*dest) << count)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | (L=
O_WORD(*dest) >> (32 - count));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | (L=
O_WORD(*dest) >> count);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LO_WORD(*dest)=
 <<=3D count;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}

The patch is reversed?

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
