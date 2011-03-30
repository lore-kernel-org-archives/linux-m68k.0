From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/6] m68k: merge mmu and non-mmu versions of muldi3
Date: Wed, 30 Mar 2011 20:11:56 +0200
Message-ID: <AANLkTimSLM+nOiWa35vPYmiNWwoOnuO7XwtTWtXVoqnh@mail.gmail.com>
References: <1301471907-10204-1-git-send-email-gerg@uclinux.org>
	<de032cfd09b94c8803091bf143890ce48e61304a.1301471809.git.gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:46136 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751755Ab1C3SL6 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 30 Mar 2011 14:11:58 -0400
Received: by bwz15 with SMTP id 15so1154817bwz.19
        for <linux-m68k@vger.kernel.org>; Wed, 30 Mar 2011 11:11:56 -0700 (PDT)
In-Reply-To: <de032cfd09b94c8803091bf143890ce48e61304a.1301471809.git.gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@uclinux.org>
Cc: linux-m68k@vger.kernel.org

On Wed, Mar 30, 2011 at 09:58, Greg Ungerer <gerg@uclinux.org> wrote:
> The implementation of gcc's muldi3 support function differs only in
> the use of the machine's 64 bit sized mul or not. (It isn't based
> on using an MMU or not). Merge the current mmu and non-mmu versions
> of arc/m68k/lib/muldi3 and use the appropriate pre-processor
> conditionals to get the right version for all m68k processor types.
>
> Signed-off-by: Greg Ungerer <gerg@uclinux.org>
> ---
> =C2=A0arch/m68k/lib/{muldi3_no.c =3D> muldi3.c} | =C2=A0 14 +++++++
> =C2=A0arch/m68k/lib/muldi3_mm.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 63 -------------------------------
> =C2=A02 files changed, 14 insertions(+), 63 deletions(-)
> =C2=A0rename arch/m68k/lib/{muldi3_no.c =3D> muldi3.c} (88%)
> =C2=A0delete mode 100644 arch/m68k/lib/muldi3_mm.c
>
> diff --git a/arch/m68k/lib/muldi3_no.c b/arch/m68k/lib/muldi3.c
> similarity index 88%
> rename from arch/m68k/lib/muldi3_no.c
> rename to arch/m68k/lib/muldi3.c
> index 34af72c..6bc1c16 100644
> --- a/arch/m68k/lib/muldi3_no.c
> +++ b/arch/m68k/lib/muldi3.c
> @@ -22,6 +22,18 @@ Boston, MA 02111-1307, USA. =C2=A0*/
> =C2=A0#define BITS_PER_UNIT 8
> =C2=A0#define SI_TYPE_SIZE 32

SI_TYPE_SIZE is used by the "nommu" (sic) case only.

And BITS_PER_UNIT seems to be unused for both.

> +#if defined(__mc68020__) || defined(__mc68030__) || \
> + =C2=A0 =C2=A0defined(__mc68040__) || defined(__mc68060__)
> +
> +#define umul_ppmm(w1, w0, u, v) \
> + =C2=A0__asm__ ("mulu%.l %3,%1:%0" =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : "=3Dd" ((USItype)(w0)), =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "=3Dd" ((USItype)(w1)) =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : "%0" ((USItype)(u)), =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "dmi" ((USItype)(v)))
> +
> +#else
> +
> =C2=A0#define __BITS4 (SI_TYPE_SIZE / 4)
> =C2=A0#define __ll_B (1L << (SI_TYPE_SIZE / 2))
> =C2=A0#define __ll_lowpart(t) ((USItype) (t) % __ll_B)
> @@ -51,6 +63,8 @@ Boston, MA 02111-1307, USA. =C2=A0*/
> =C2=A0 =C2=A0 (w0) =3D __ll_lowpart (__x1) * __ll_B + __ll_lowpart (_=
_x0); =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> =C2=A0 } while (0)
>
> +#endif
> +
> =C2=A0#define __umulsidi3(u, v) \
> =C2=A0 ({DIunion __w; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> =C2=A0 =C2=A0 umul_ppmm (__w.s.high, __w.s.low, u, v); =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 \
> diff --git a/arch/m68k/lib/muldi3_mm.c b/arch/m68k/lib/muldi3_mm.c
> deleted file mode 100644
> index be4f275..0000000
> --- a/arch/m68k/lib/muldi3_mm.c
> +++ /dev/null
> @@ -1,63 +0,0 @@
> -/* muldi3.c extracted from gcc-2.7.2.3/libgcc2.c and
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0gcc-2.7.2.3/longlong.h which is: */
> -/* Copyright (C) 1989, 1992, 1993, 1994, 1995 Free Software Foundati=
on, Inc.
> -
> -This file is part of GNU CC.
> -
> -GNU CC is free software; you can redistribute it and/or modify
> -it under the terms of the GNU General Public License as published by
> -the Free Software Foundation; either version 2, or (at your option)
> -any later version.
> -
> -GNU CC is distributed in the hope that it will be useful,
> -but WITHOUT ANY WARRANTY; without even the implied warranty of
> -MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =C2=A0See the
> -GNU General Public License for more details.
> -
> -You should have received a copy of the GNU General Public License
> -along with GNU CC; see the file COPYING. =C2=A0If not, write to
> -the Free Software Foundation, 59 Temple Place - Suite 330,
> -Boston, MA 02111-1307, USA. =C2=A0*/
> -
> -#define BITS_PER_UNIT 8
> -
> -#define umul_ppmm(w1, w0, u, v) \
> - =C2=A0__asm__ ("mulu%.l %3,%1:%0" =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : "=3Dd" ((USItype)(w0)), =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "=3Dd" ((USItype)(w1)) =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : "%0" ((USItype)(u)), =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "dmi" ((USItype)(v)))
> -
> -#define __umulsidi3(u, v) \
> - =C2=A0({DIunion __w; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> - =C2=A0 =C2=A0umul_ppmm (__w.s.high, __w.s.low, u, v); =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 \
> - =C2=A0 =C2=A0__w.ll; })
> -
> -typedef =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int =
SItype =C2=A0 =C2=A0 __attribute__ ((mode (SI)));
> -typedef unsigned int USItype =C2=A0 __attribute__ ((mode (SI)));
> -typedef =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int =
DItype =C2=A0 =C2=A0 __attribute__ ((mode (DI)));
> -typedef int word_type __attribute__ ((mode (__word__)));
> -
> -struct DIstruct {SItype high, low;};
> -
> -typedef union
> -{
> - =C2=A0struct DIstruct s;
> - =C2=A0DItype ll;
> -} DIunion;
> -
> -DItype
> -__muldi3 (DItype u, DItype v)
> -{
> - =C2=A0DIunion w;
> - =C2=A0DIunion uu, vv;
> -
> - =C2=A0uu.ll =3D u,
> - =C2=A0vv.ll =3D v;
> -
> - =C2=A0w.ll =3D __umulsidi3 (uu.s.low, vv.s.low);
> - =C2=A0w.s.high +=3D ((USItype) uu.s.low * (USItype) vv.s.high
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+ (USItype) uu.s.hi=
gh * (USItype) vv.s.low);
> -
> - =C2=A0return w.ll;
> -}
> --
> 1.7.0.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
>



--=20
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
