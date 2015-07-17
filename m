From: Yannick GICQUEL <yannick.gicquel@open.eurogiciel.org>
Subject: Re: [RFC 1/8] m68k: coldfire: unlink FPU presence from MMU activation
Date: Fri, 17 Jul 2015 12:46:46 +0200
Message-ID: <55A8DD16.5050900@open.eurogiciel.org>
References: <1436349092-2214-1-git-send-email-yannick.gicquel@gmail.com> <1436349092-2214-2-git-send-email-yannick.gicquel@gmail.com> <559D2765.4040104@westnet.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:34926 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1945896AbbGQKqt (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 17 Jul 2015 06:46:49 -0400
Received: by wibxm9 with SMTP id xm9so35715474wib.0
        for <linux-m68k@vger.kernel.org>; Fri, 17 Jul 2015 03:46:48 -0700 (PDT)
In-Reply-To: <559D2765.4040104@westnet.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gregungerer@westnet.com.au>, linux-m68k@vger.kernel.org

Hi Greg,

Ok with that.
Source code rework and feature activation are two different things.
Keep it in mind for future...

Regards,
Yannick

Le 08/07/2015 15:36, Greg Ungerer a =E9crit :
> Hi Yannick,
>
> I think this needs to be two separate patches.
> The FPU change is logically one.
> The change to the MCF5441x config is another - and it
> really needs to be the last one in the series (so that all
> the actuall code support is in place first).
>
> Regards
> Greg
>
>
> On 08/07/15 19:51, Yannick GICQUEL wrote:
>> m5441x coldfire chips contains a MMU and no FPU.
>> This patch allow building this chip with MMU activated.
>>
>> Signed-off-by: Yannick GICQUEL <yannick.gicquel@gmail.com>
>> ---
>>   arch/m68k/Kconfig     | 2 +-
>>   arch/m68k/Kconfig.cpu | 4 +++-
>>   2 files changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
>> index 2dd8f63..d704c16 100644
>> --- a/arch/m68k/Kconfig
>> +++ b/arch/m68k/Kconfig
>> @@ -14,7 +14,7 @@ config M68K
>>       select GENERIC_IOMAP
>>       select GENERIC_STRNCPY_FROM_USER if MMU
>>       select GENERIC_STRNLEN_USER if MMU
>> -    select FPU if MMU
>> +    select FPU if MMU && !COLDFIRE
>>       select ARCH_WANT_IPC_PARSE_VERSION
>>       select ARCH_USES_GETTIMEOFFSET if MMU && !COLDFIRE
>>       select HAVE_FUTEX_CMPXCHG if MMU && FUTEX
>> diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
>> index 33013df..3661eb4 100644
>> --- a/arch/m68k/Kconfig.cpu
>> +++ b/arch/m68k/Kconfig.cpu
>> @@ -257,6 +257,7 @@ config M54xx
>>   config M547x
>>       bool "MCF547x"
>>       select M54xx
>> +    select FPU
>>       select MMU_COLDFIRE if MMU
>>       select HAVE_CACHE_CB
>>       select HAVE_MBAR
>> @@ -265,6 +266,7 @@ config M547x
>>
>>   config M548x
>>       bool "MCF548x"
>> +    select FPU
>>       select MMU_COLDFIRE if MMU
>>       select M54xx
>>       select HAVE_CACHE_CB
>> @@ -274,7 +276,7 @@ config M548x
>>
>>   config M5441x
>>       bool "MCF5441x"
>> -    depends on !MMU
>> +    select MMU_COLDFIRE if MMU
>>       select GENERIC_CLOCKEVENTS
>>       select HAVE_CACHE_CB
>>       help
>>
>
