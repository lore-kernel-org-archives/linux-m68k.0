From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68k: remove arch specific non-optimized memcmp()
Date: Wed, 16 Feb 2011 09:41:45 +1000
Message-ID: <4D5B0F39.9090006@snapgear.com>
References: <201102070057.p170vUMO009007@goober.internal.moreton.com.au> <AANLkTi=FOcs4KDJ51Rsx+DwU9zW2Hn1F6EB0tUny3EXQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:21857 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755772Ab1BOXoQ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 15 Feb 2011 18:44:16 -0500
In-Reply-To: <AANLkTi=FOcs4KDJ51Rsx+DwU9zW2Hn1F6EB0tUny3EXQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, gerg@uclinux.org, gregungerer@westnet.com.au

On 16/02/11 05:50, Geert Uytterhoeven wrote:
> On Mon, Feb 7, 2011 at 01:57, Greg Ungerer<gerg@snapgear.com>  wrote:
>> m68k: remove arch specific non-optimized memcmp()
>>
>> The m68k arch implements its own memcmp() function. It is not optimized
>> in any way (it is the most strait forward coding of memcmp you can get).
>> Remove it and use the kernels standard memcmp() implementation.
>>
>> This also goes part of the way to fixing a regression caused by commit
>> ea61bc461d09e8d331a307916530aaae808c72a2 ("m68k/m68knommu: merge MMU and
>> non-MMU string.h"), which breaks non-coldfire non-mmu builds (which is
>> the 68x328 and 68360 families). They currently have no memcmp() function
>> defined, since there is none in the m68knommu/lib functions.
>>
>> Signed-off-by: Greg Ungerer<gerg@uclinux.org>
>
> Go ahead!
>
> Acked-by: Geert Uytterhoeven<geert@linux-m68k.org>

Thanks Geert!

I'll get this off to Linus today.

Regards
Greg


>> ---
>>   arch/m68k/include/asm/string.h |    4 +---
>>   arch/m68k/lib/string.c         |   11 -----------
>>   2 files changed, 1 insertions(+), 14 deletions(-)
>>
>> diff --git a/arch/m68k/include/asm/string.h b/arch/m68k/include/asm/string.h
>> index 65b1312..ffc3c3f 100644
>> --- a/arch/m68k/include/asm/string.h
>> +++ b/arch/m68k/include/asm/string.h
>> @@ -102,11 +102,9 @@ static inline int strcmp(const char *cs, const char *ct)
>>
>>   #define __HAVE_ARCH_MEMMOVE
>>   extern void *memmove(void *, const void *, __kernel_size_t);
>> +#endif /* CONFIG_COLDFIRE */
>>
>> -#define __HAVE_ARCH_MEMCMP
>> -extern int memcmp(const void *, const void *, __kernel_size_t);
>>   #define memcmp(d, s, n) __builtin_memcmp(d, s, n)
>> -#endif /* CONFIG_COLDFIRE */
>>
>>   #define __HAVE_ARCH_MEMSET
>>   extern void *memset(void *, int, __kernel_size_t);
>> diff --git a/arch/m68k/lib/string.c b/arch/m68k/lib/string.c
>> index 4253f87..d399c5f 100644
>> --- a/arch/m68k/lib/string.c
>> +++ b/arch/m68k/lib/string.c
>> @@ -243,14 +243,3 @@ void *memmove(void *dest, const void *src, size_t n)
>>         return xdest;
>>   }
>>   EXPORT_SYMBOL(memmove);
>> -
>> -int memcmp(const void *cs, const void *ct, size_t count)
>> -{
>> -       const unsigned char *su1, *su2;
>> -
>> -       for (su1 = cs, su2 = ct; count>  0; ++su1, ++su2, count--)
>> -               if (*su1 != *su2)
>> -                       return *su1<  *su2 ? -1 : +1;
>> -       return 0;
>> -}
>> -EXPORT_SYMBOL(memcmp);
>
> Gr{oetje,eeting}s,
>
>                          Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
>


-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
