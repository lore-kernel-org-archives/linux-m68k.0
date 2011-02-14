From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68k: remove arch specific non-optimized memcmp()
Date: Mon, 14 Feb 2011 17:39:53 +1000
Message-ID: <4D58DC49.5060800@snapgear.com>
References: <201102070057.p170vUMO009007@goober.internal.moreton.com.au> <4D548FBC.2050902@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:59958 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750740Ab1BNHmy convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 14 Feb 2011 02:42:54 -0500
In-Reply-To: <4D548FBC.2050902@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>

Hi Geert,

> On Fri, Feb 11, 2011 at 02:24, Greg Ungerer <gerg@snapgear.com> wrote=
:
>> On 07/02/11 10:57, Greg Ungerer wrote:
>>>
>>> m68k: remove arch specific non-optimized memcmp()
>>>
>>> The m68k arch implements its own memcmp() function. It is not optim=
ized
>>> in any way (it is the most strait forward coding of memcmp you can =
get).
>>> Remove it and use the kernels standard memcmp() implementation.
>>>
>>> This also goes part of the way to fixing a regression caused by com=
mit
>>> ea61bc461d09e8d331a307916530aaae808c72a2 ("m68k/m68knommu: merge MM=
U and
>>> non-MMU string.h"), which breaks non-coldfire non-mmu builds (which=
 is
>>> the 68x328 and 68360 families). They currently have no memcmp() fun=
ction
>>> defined, since there is none in the m68knommu/lib functions.
>>>
>>> Signed-off-by: Greg Ungerer<gerg@uclinux.org>
>>
>> Does anyone have any comments on this?
>
> Sorry, haven't tried it yet.
>
> Shouldn't you also remove the "#define memcmp(d, s, n)"?

I considered doing that. But leaving that in and going through
__builtin_memcmp() gives the compiler a chance to optimize
some simple calls to memcmp to inline instructions. In practice
it might not matter much, and I don't mind at all leaving it out
if you prefer.


>> I would like to push to Linus very soon now (so in the current
>> 2.6.38-rc). It seems like a clean fix on its own, but in particular
>> it helps me fix the problems caused by commit
>> ea61bc461d09e8d331a307916530aaae808c72a2
>> ("m68k/m68knommu: merge MMU and non-MMU string.h"
>>
>> I have compile and run tested on m68knommu targets, and compile
>> tested on m68k targets.
>
> If it compiles, it's good; if it boots, it's perfect ;-)

Unfortunately I don't have any true 68k machines to run
this on. I do have a lot of ColdFire boards though :-)

Regards
Greg



>>> ---
>>> =C2 arch/m68k/include/asm/string.h | =C2  =C2 4 +---
>>> =C2 arch/m68k/lib/string.c =C2  =C2  =C2  =C2  | =C2  11 ----------=
-
>>> =C2 2 files changed, 1 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/arch/m68k/include/asm/string.h
>>> b/arch/m68k/include/asm/string.h
>>> index 65b1312..ffc3c3f 100644
>>> --- a/arch/m68k/include/asm/string.h
>>> +++ b/arch/m68k/include/asm/string.h
>>> @@ -102,11 +102,9 @@ static inline int strcmp(const char *cs, const=
 char
>>> *ct)
>>>
>>> =C2 #define __HAVE_ARCH_MEMMOVE
>>> =C2 extern void *memmove(void *, const void *, __kernel_size_t);
>>> +#endif /* CONFIG_COLDFIRE */
>>>
>>> -#define __HAVE_ARCH_MEMCMP
>>> -extern int memcmp(const void *, const void *, __kernel_size_t);
>>> =C2 #define memcmp(d, s, n) __builtin_memcmp(d, s, n)
>>> -#endif /* CONFIG_COLDFIRE */
>>>
>>> =C2 #define __HAVE_ARCH_MEMSET
>>> =C2 extern void *memset(void *, int, __kernel_size_t);
>>> diff --git a/arch/m68k/lib/string.c b/arch/m68k/lib/string.c
>>> index 4253f87..d399c5f 100644
>>> --- a/arch/m68k/lib/string.c
>>> +++ b/arch/m68k/lib/string.c
>>> @@ -243,14 +243,3 @@ void *memmove(void *dest, const void *src, siz=
e_t n)
>>> =C2  =C2  =C2  =C2 return xdest;
>>> =C2 }
>>> =C2 EXPORT_SYMBOL(memmove);
>>> -
>>> -int memcmp(const void *cs, const void *ct, size_t count)
>>> -{
>>> - =C2  =C2  =C2  const unsigned char *su1, *su2;
>>> -
>>> - =C2  =C2  =C2  for (su1 =3D cs, su2 =3D ct; count> =C2 0; ++su1, =
++su2, count--)
>>> - =C2  =C2  =C2  =C2  =C2  =C2  =C2  if (*su1 !=3D *su2)
>>> - =C2  =C2  =C2  =C2  =C2  =C2  =C2  =C2  =C2  =C2  =C2  return *su=
1< =C2 *su2 ? -1 : +1;
>>> - =C2  =C2  =C2  return 0;
>>> -}
>>> -EXPORT_SYMBOL(memcmp);
>
> Gr{oetje,eeting}s,
>
> =C2  =C2  =C2  =C2  =C2  =C2  =C2  =C2  =C2  =C2  =C2  =C2  Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linu=
x-m68k.org
>
> In personal conversations with technical people, I call myself a hack=
er. But
> when I'm talking to journalists I just say "programmer" or something =
like that.
> =C2  =C2  =C2  =C2  =C2  =C2  =C2  =C2  =C2  =C2  =C2  =C2  =C2  =C2 =
=C2  =C2 =C2  -- Linus Torvalds

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
