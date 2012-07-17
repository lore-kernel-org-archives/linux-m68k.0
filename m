From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH v2] m68k: fix ColdFire clear cache operation
Date: Tue, 17 Jul 2012 16:03:58 +1000
Message-ID: <5005004E.7080201@snapgear.com>
References: <1341967036-14645-1-git-send-email-gerg@snapgear.com> <CAMuHMdXV+PiY5LbahntSOAsV6GZgR-WuKQTmwDM=2wrM13wE7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:60574 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753057Ab2GQGJa convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 17 Jul 2012 02:09:30 -0400
In-Reply-To: <CAMuHMdXV+PiY5LbahntSOAsV6GZgR-WuKQTmwDM=2wrM13wE7g@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>

Hi Geert,

On 17/07/12 05:13, Geert Uytterhoeven wrote:
> On Wed, Jul 11, 2012 at 2:37 AM,  <gerg@snapgear.com> wrote:
>> --- a/arch/m68k/include/asm/cacheflush_mm.h
>> +++ b/arch/m68k/include/asm/cacheflush_mm.h
>> @@ -17,6 +17,41 @@
>>   #define DCACHE_SETMASK 0
>>   #endif
>>
>> +/*
>> + * ColdFire architecture has no way to clear individual cache lines=
, so we
>> + * are stuck invalidating all the cache entries when we want a clea=
r operation.
>> + */
>> +static inline void clear_cf_icache(unsigned long start, unsigned lo=
ng end)
>> +{
>> +       __asm__ __volatile__ (
>> +               "movec  %0,%%cacr\n\t"
>> +               "nop\n\t"
>> +               :
>> +               : "r" (CACHE_MODE | CACR_ICINVA | CACR_BCINVA));
>
> These new functions should be moved inside the #ifdef CONFIG_COLDFIRE
> at the top of the file:
>
> arch/m68k/include/asm/cacheflush_mm.h:30:10: error: 'CACHE_MODE'
> undeclared (first use in this function)
> arch/m68k/include/asm/cacheflush_mm.h:30:23: error: 'CACR_ICINVA'
> undeclared (first use in this function)
> arch/m68k/include/asm/cacheflush_mm.h:30:37: error: 'CACR_BCINVA'
> undeclared (first use in this function)
> arch/m68k/include/asm/cacheflush_mm.h:39:10: error: 'CACHE_MODE'
> undeclared (first use in this function)
> arch/m68k/include/asm/cacheflush_mm.h:39:23: error: 'CACR_DCINVA'
> undeclared (first use in this function)
> arch/m68k/include/asm/cacheflush_mm.h:48:10: error: 'CACHE_MODE'
> undeclared (first use in this function)
> arch/m68k/include/asm/cacheflush_mm.h:48:23: error: 'CACR_ICINVA'
> undeclared (first use in this function)
> arch/m68k/include/asm/cacheflush_mm.h:48:37: error: 'CACR_BCINVA'
> undeclared (first use in this function)
> arch/m68k/include/asm/cacheflush_mm.h:48:51: error: 'CACR_DCINVA'
> undeclared (first use in this function)
>
> http://kisskb.ellerman.id.au/kisskb/buildresult/6720541/

Ah yes. Just moving those functions into a CONFIG_COLDFIRE region
is not enough though. That will fail with:

   CC      arch/m68k/mm/memory.o
arch/m68k/mm/memory.c: In function =91cache_clear=92:
arch/m68k/mm/memory.c:206:2: error: implicit declaration of function =91=
clear_cf_bcache=92

I hit the same problem with the other ColdFire flush functions too.
To fix those I locally defined the required definitions if they are
not set. I can do the same here with:

   #ifndef CACHE_MODE
   #define CACHE_MODE      0
   #define CACR_ICINVA     0
   #define CACR_DCINVA     0
   #define CACR_BCINVA     0
   #endif

This pollutes the code less than littering the code with #ifdefs on
the use COFIG_COLDFIRE, and doesn't seem any worse than defining
empty cache clear and push functions when not CONFIG_COLDFIRE.

Regards
Greg


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
