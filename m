From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68k: merge mmu and non-mmu bitops.h
Date: Fri, 3 Jun 2011 21:10:56 +1000
Message-ID: <4DE8C140.4010007@snapgear.com>
References: <1307083883-10786-1-git-send-email-gerg@snapgear.com> <alpine.OSX.2.00.1106032050380.193@ibook.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:60842 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751834Ab1FCLLK (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 3 Jun 2011 07:11:10 -0400
In-Reply-To: <alpine.OSX.2.00.1106032050380.193@ibook.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>


Hi Finn,

On 03/06/11 21:02, Finn Thain wrote:
>> +#if defined(CONFIG_M68000) || defined(CONFIG_MCPU32) || defined(CONFIG_COLDFIRE)
>> +
>> +/*
>> + *     The newer ColdFire family members support a "bitrev" instruction
>> + *     and we can use that to implement a fast ffs. Older Coldfire parts,
>> + *     and normal 68000 parts don't have anything special, so we use the
>> + *     generic functions for those.
>> + */
>> +#if (defined(__mcfisaaplus__) || defined(__mcfisac__))&&  \
>> +    !defined(CONFIG_M68000)&&  !defined(CONFIG_MCPU32)
>
> Aren't the !defined(CONFIG_M68000)&&  !defined(CONFIG_MCPU32) terms
> redundant?

No, not in this case.

If we were compiling an image that could be run on any of ColdFire
or 68000 or CPU32 then we cannot compile in these specific ColdFire
optimized ffs and __ffs. The bitrev instruction only exists on ColdFire
and those that implement the ISA A+ and above instruction sets.
So to use them we must be only compiling for CONFIG_COLDFIRE.

Regards
Greg


> Finn
>
>> +static inline int __ffs(int x)
>> +{
>> +        __asm__ __volatile__ ("bitrev %0; ff1 %0"
>> +               : "=d" (x)
>> +               : "0" (x));
>> +        return x;
>> +}
>> +
>> +static inline int ffs(int x)
>> +{
>> +        if (!x)
>> +                return 0;
>> +       return __ffs(x) + 1;
>> +}
>> +
>> +#else
>> +#include<asm-generic/bitops/ffs.h>
>> +#include<asm-generic/bitops/__ffs.h>
>> +#endif
>> +
>> +#include<asm-generic/bitops/fls.h>
>> +#include<asm-generic/bitops/__fls.h>
>> +
>>   #else
>>
>
>
>
