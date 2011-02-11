From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: remove arch specific non-optimized memcmp()
Date: Fri, 11 Feb 2011 07:46:16 +0100
Message-ID: <AANLkTimWqFVpu-z0=BvQb=pPo1uKG=wyTj1cNhTzwG--@mail.gmail.com>
References: <201102070057.p170vUMO009007@goober.internal.moreton.com.au>
	<4D548FBC.2050902@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:51602 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751751Ab1BKGqS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 11 Feb 2011 01:46:18 -0500
Received: by fxm20 with SMTP id 20so2343481fxm.19
        for <linux-m68k@vger.kernel.org>; Thu, 10 Feb 2011 22:46:17 -0800 (PST)
In-Reply-To: <4D548FBC.2050902@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: linux-m68k@vger.kernel.org, gerg@uclinux.org

On Fri, Feb 11, 2011 at 02:24, Greg Ungerer <gerg@snapgear.com> wrote:
> On 07/02/11 10:57, Greg Ungerer wrote:
>>
>> m68k: remove arch specific non-optimized memcmp()
>>
>> The m68k arch implements its own memcmp() function. It is not optimi=
zed
>> in any way (it is the most strait forward coding of memcmp you can g=
et).
>> Remove it and use the kernels standard memcmp() implementation.
>>
>> This also goes part of the way to fixing a regression caused by comm=
it
>> ea61bc461d09e8d331a307916530aaae808c72a2 ("m68k/m68knommu: merge MMU=
 and
>> non-MMU string.h"), which breaks non-coldfire non-mmu builds (which =
is
>> the 68x328 and 68360 families). They currently have no memcmp() func=
tion
>> defined, since there is none in the m68knommu/lib functions.
>>
>> Signed-off-by: Greg Ungerer<gerg@uclinux.org>
>
> Does anyone have any comments on this?

Sorry, haven't tried it yet.

Shouldn't you also remove the "#define memcmp(d, s, n)"?

> I would like to push to Linus very soon now (so in the current
> 2.6.38-rc). It seems like a clean fix on its own, but in particular
> it helps me fix the problems caused by commit
> ea61bc461d09e8d331a307916530aaae808c72a2
> ("m68k/m68knommu: merge MMU and non-MMU string.h"
>
> I have compile and run tested on m68knommu targets, and compile
> tested on m68k targets.

If it compiles, it's good; if it boots, it's perfect ;-)

>> ---
>> =C2=A0arch/m68k/include/asm/string.h | =C2=A0 =C2=A04 +---
>> =C2=A0arch/m68k/lib/string.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 11=
 -----------
>> =C2=A02 files changed, 1 insertions(+), 14 deletions(-)
>>
>> diff --git a/arch/m68k/include/asm/string.h
>> b/arch/m68k/include/asm/string.h
>> index 65b1312..ffc3c3f 100644
>> --- a/arch/m68k/include/asm/string.h
>> +++ b/arch/m68k/include/asm/string.h
>> @@ -102,11 +102,9 @@ static inline int strcmp(const char *cs, const =
char
>> *ct)
>>
>> =C2=A0#define __HAVE_ARCH_MEMMOVE
>> =C2=A0extern void *memmove(void *, const void *, __kernel_size_t);
>> +#endif /* CONFIG_COLDFIRE */
>>
>> -#define __HAVE_ARCH_MEMCMP
>> -extern int memcmp(const void *, const void *, __kernel_size_t);
>> =C2=A0#define memcmp(d, s, n) __builtin_memcmp(d, s, n)
>> -#endif /* CONFIG_COLDFIRE */
>>
>> =C2=A0#define __HAVE_ARCH_MEMSET
>> =C2=A0extern void *memset(void *, int, __kernel_size_t);
>> diff --git a/arch/m68k/lib/string.c b/arch/m68k/lib/string.c
>> index 4253f87..d399c5f 100644
>> --- a/arch/m68k/lib/string.c
>> +++ b/arch/m68k/lib/string.c
>> @@ -243,14 +243,3 @@ void *memmove(void *dest, const void *src, size=
_t n)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0return xdest;
>> =C2=A0}
>> =C2=A0EXPORT_SYMBOL(memmove);
>> -
>> -int memcmp(const void *cs, const void *ct, size_t count)
>> -{
>> - =C2=A0 =C2=A0 =C2=A0 const unsigned char *su1, *su2;
>> -
>> - =C2=A0 =C2=A0 =C2=A0 for (su1 =3D cs, su2 =3D ct; count> =C2=A00; =
++su1, ++su2, count--)
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*su1 !=3D *su=
2)
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return *su1< =C2=A0*su2 ? -1 : +1;
>> - =C2=A0 =C2=A0 =C2=A0 return 0;
>> -}
>> -EXPORT_SYMBOL(memcmp);

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
