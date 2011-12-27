From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 17/35] m68k: define PAGE_OFFSET_RAW for ColdFire CPU with
 MMU enabled
Date: Tue, 27 Dec 2011 22:08:58 +1000
Message-ID: <4EF9B55A.7000106@snapgear.com>
References: <1324610148-20666-1-git-send-email-gerg@snapgear.com>	<1324610148-20666-18-git-send-email-gerg@snapgear.com> <CAMuHMdUUAsHRWHh4PukFJBM187UB_xj-R5rrs1+WuhtJmEO7tQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:21987 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753241Ab1L0MJU (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 27 Dec 2011 07:09:20 -0500
In-Reply-To: <CAMuHMdUUAsHRWHh4PukFJBM187UB_xj-R5rrs1+WuhtJmEO7tQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

Hi Geert,

On 12/26/2011 06:15 AM, Geert Uytterhoeven wrote:
> On Fri, Dec 23, 2011 at 04:15,<gerg@snapgear.com>  wrote:
>> From: Greg Ungerer<gerg@uclinux.org>
>>
>> The ColdFire CPU configurations need PAGE_OFFSET_RAW set to the base of
>> their RAM. It doesn't matter if they are running with the MMU enabled or
>> disabled, it is always set to the base of RAM.
>>
>> We can keep the choices simple here and key of CONFIG_RAMBASE. If it is
>> defined we are on a plaftorm (ColdFire or other non-MMU systems) which
>> have a configurable RAM base, just use it.
>>
>> Reported-by: Alexander Stein<alexander.stein@systec-electronic.com>
>> Signed-off-by: Greg Ungerer<gerg@uclinux.org>
>> Acked-by: Matt Waddel<mwaddel@yahoo.com>
>> Acked-by: Kurt Mahan<kmahan@xmission.com>
>
> Acked-by: Geert Uytterhoeven<geert@linux-m68k.org>
>
> but see below ...
>
>> -#ifdef CONFIG_MMU
>> -#ifndef CONFIG_SUN3
>> +#if defined(CONFIG_RAMBASE)
>> +#define PAGE_OFFSET_RAW	CONFIG_RAMBASE
>> +#elif !defined(CONFIG_SUN3)
>>  #define PAGE_OFFSET_RAW	0x00000000
>>  #else
>>  #define PAGE_OFFSET_RAW	0x0E000000
>>  #endif
>> -#else
>> -#define PAGE_OFFSET_RAW	CONFIG_RAMBASE
>> -#endif
>
> To avoid alternating between defined and !defined, I'd suggest writing
> it instead like:
>
> #if defined(CONFIG_RAMBASE)
> #define PAGE_OFFSET_RAW         CONFIG_RAMBASE
> #elif defined(CONFIG_SUN3)
> #define PAGE_OFFSET_RAW         0x0E000000
> #else
> #define PAGE_OFFSET_RAW         0x00000000
> #endif

Yep, absolutely, that is nicer. I'll change it to this.

Thanks
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close,                            FAX:         +61 7 3891 3630
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
