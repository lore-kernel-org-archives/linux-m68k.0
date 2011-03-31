From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 1/6] m68k: merge mmu and non-mmu versions of muldi3
Date: Thu, 31 Mar 2011 13:57:57 +1000
Message-ID: <4D93FBC5.6060201@snapgear.com>
References: <1301471907-10204-1-git-send-email-gerg@uclinux.org>	<de032cfd09b94c8803091bf143890ce48e61304a.1301471809.git.gerg@uclinux.org> <AANLkTimSLM+nOiWa35vPYmiNWwoOnuO7XwtTWtXVoqnh@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:23743 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753515Ab1CaD62 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 30 Mar 2011 23:58:28 -0400
In-Reply-To: <AANLkTimSLM+nOiWa35vPYmiNWwoOnuO7XwtTWtXVoqnh@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@vger.kernel.org


Hi Geert,

On 31/03/11 04:11, Geert Uytterhoeven wrote:
> On Wed, Mar 30, 2011 at 09:58, Greg Ungerer<gerg@uclinux.org>  wrote:
>> The implementation of gcc's muldi3 support function differs only in
>> the use of the machine's 64 bit sized mul or not. (It isn't based
>> on using an MMU or not). Merge the current mmu and non-mmu versions
>> of arc/m68k/lib/muldi3 and use the appropriate pre-processor
>> conditionals to get the right version for all m68k processor types.
>>
>> Signed-off-by: Greg Ungerer<gerg@uclinux.org>
>> ---
>> =C3=A1arch/m68k/lib/{muldi3_no.c =3D>  muldi3.c} | =C3=A1 14 +++++++
>> =C3=A1arch/m68k/lib/muldi3_mm.c =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=
=A1 =C3=A1 | =C3=A1 63 -------------------------------
>> =C3=A12 files changed, 14 insertions(+), 63 deletions(-)
>> =C3=A1rename arch/m68k/lib/{muldi3_no.c =3D>  muldi3.c} (88%)
>> =C3=A1delete mode 100644 arch/m68k/lib/muldi3_mm.c
>>
>> diff --git a/arch/m68k/lib/muldi3_no.c b/arch/m68k/lib/muldi3.c
>> similarity index 88%
>> rename from arch/m68k/lib/muldi3_no.c
>> rename to arch/m68k/lib/muldi3.c
>> index 34af72c..6bc1c16 100644
>> --- a/arch/m68k/lib/muldi3_no.c
>> +++ b/arch/m68k/lib/muldi3.c
>> @@ -22,6 +22,18 @@ Boston, MA 02111-1307, USA. =C3=A1*/
>> =C3=A1#define BITS_PER_UNIT 8
>> =C3=A1#define SI_TYPE_SIZE 32
>
> SI_TYPE_SIZE is used by the "nommu" (sic) case only.
>
> And BITS_PER_UNIT seems to be unused for both.

Indeed, well spotted. I'll remove BITS_PER_UNIT and move
SI_TYPE_SIZE into the "nommu" section.

Thanks
Greg



>> +#if defined(__mc68020__) || defined(__mc68030__) || \
>> + =C3=A1 =C3=A1defined(__mc68040__) || defined(__mc68060__)
>> +
>> +#define umul_ppmm(w1, w0, u, v) \
>> + =C3=A1__asm__ ("mulu%.l %3,%1:%0" =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1=
 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =
=C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1\
>> + =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 : "=3Dd" ((USItype)(w0)), =C3=A1=
 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =
=C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 \
>> + =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 "=3Dd" ((USItype)(w1)) =C3=
=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1=
 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1\
>> + =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 : "%0" ((USItype)(u)), =C3=A1 =C3=
=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1=
 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1\
>> + =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 "dmi" ((USItype)(v)))
>> +
>> +#else
>> +
>> =C3=A1#define __BITS4 (SI_TYPE_SIZE / 4)
>> =C3=A1#define __ll_B (1L<<  (SI_TYPE_SIZE / 2))
>> =C3=A1#define __ll_lowpart(t) ((USItype) (t) % __ll_B)
>> @@ -51,6 +63,8 @@ Boston, MA 02111-1307, USA. =C3=A1*/
>> =C3=A1 =C3=A1 (w0) =3D __ll_lowpart (__x1) * __ll_B + __ll_lowpart (=
__x0); =C3=A1 =C3=A1 =C3=A1 =C3=A1 \
>> =C3=A1 } while (0)
>>
>> +#endif
>> +
>> =C3=A1#define __umulsidi3(u, v) \
>> =C3=A1 ({DIunion __w; =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1=
 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =
=C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 \
>> =C3=A1 =C3=A1 umul_ppmm (__w.s.high, __w.s.low, u, v); =C3=A1 =C3=A1=
 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =
=C3=A1 \
>> diff --git a/arch/m68k/lib/muldi3_mm.c b/arch/m68k/lib/muldi3_mm.c
>> deleted file mode 100644
>> index be4f275..0000000
>> --- a/arch/m68k/lib/muldi3_mm.c
>> +++ /dev/null
>> @@ -1,63 +0,0 @@
>> -/* muldi3.c extracted from gcc-2.7.2.3/libgcc2.c and
>> - =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=
=A1 =C3=A1 =C3=A1 =C3=A1gcc-2.7.2.3/longlong.h which is: */
>> -/* Copyright (C) 1989, 1992, 1993, 1994, 1995 Free Software Foundat=
ion, Inc.
>> -
>> -This file is part of GNU CC.
>> -
>> -GNU CC is free software; you can redistribute it and/or modify
>> -it under the terms of the GNU General Public License as published b=
y
>> -the Free Software Foundation; either version 2, or (at your option)
>> -any later version.
>> -
>> -GNU CC is distributed in the hope that it will be useful,
>> -but WITHOUT ANY WARRANTY; without even the implied warranty of
>> -MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =C3=A1See the
>> -GNU General Public License for more details.
>> -
>> -You should have received a copy of the GNU General Public License
>> -along with GNU CC; see the file COPYING. =C3=A1If not, write to
>> -the Free Software Foundation, 59 Temple Place - Suite 330,
>> -Boston, MA 02111-1307, USA. =C3=A1*/
>> -
>> -#define BITS_PER_UNIT 8
>> -
>> -#define umul_ppmm(w1, w0, u, v) \
>> - =C3=A1__asm__ ("mulu%.l %3,%1:%0" =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1=
 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =
=C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1\
>> - =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 : "=3Dd" ((USItype)(w0)), =C3=A1=
 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =
=C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 \
>> - =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 "=3Dd" ((USItype)(w1)) =C3=
=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1=
 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1\
>> - =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 : "%0" ((USItype)(u)), =C3=A1 =C3=
=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1=
 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1\
>> - =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 "dmi" ((USItype)(v)))
>> -
>> -#define __umulsidi3(u, v) \
>> - =C3=A1({DIunion __w; =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=
=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1=
 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =
\
>> - =C3=A1 =C3=A1umul_ppmm (__w.s.high, __w.s.low, u, v); =C3=A1 =C3=A1=
 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =
=C3=A1 \
>> - =C3=A1 =C3=A1__w.ll; })
>> -
>> -typedef =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 int=
 SItype =C3=A1 =C3=A1 __attribute__ ((mode (SI)));
>> -typedef unsigned int USItype =C3=A1 __attribute__ ((mode (SI)));
>> -typedef =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 int=
 DItype =C3=A1 =C3=A1 __attribute__ ((mode (DI)));
>> -typedef int word_type __attribute__ ((mode (__word__)));
>> -
>> -struct DIstruct {SItype high, low;};
>> -
>> -typedef union
>> -{
>> - =C3=A1struct DIstruct s;
>> - =C3=A1DItype ll;
>> -} DIunion;
>> -
>> -DItype
>> -__muldi3 (DItype u, DItype v)
>> -{
>> - =C3=A1DIunion w;
>> - =C3=A1DIunion uu, vv;
>> -
>> - =C3=A1uu.ll =3D u,
>> - =C3=A1vv.ll =3D v;
>> -
>> - =C3=A1w.ll =3D __umulsidi3 (uu.s.low, vv.s.low);
>> - =C3=A1w.s.high +=3D ((USItype) uu.s.low * (USItype) vv.s.high
>> - =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1+ (USItype) uu.s.h=
igh * (USItype) vv.s.low);
>> -
>> - =C3=A1return w.ll;
>> -}
>> --
>> 1.7.0.4
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-m68k=
" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =C3=A1http://vger.kernel.org/majordomo-info.h=
tml
>>
>
>
>


--=20
-----------------------------------------------------------------------=
-
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.co=
m
SnapGear Group, McAfee                      PHONE:       +61 7 3435 288=
8
8 Gardner Close                             FAX:         +61 7 3217 532=
3
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.co=
m
