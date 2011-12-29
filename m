From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 35/35] m68k: allow ColdFire 547x and 548x CPUs to be built
 with MMU enabled
Date: Thu, 29 Dec 2011 14:52:17 +1000
Message-ID: <4EFBF201.7090201@snapgear.com>
References: <1324610148-20666-1-git-send-email-gerg@snapgear.com> <1324610148-20666-36-git-send-email-gerg@snapgear.com> <alpine.DEB.2.00.1112261011590.4517@ayla.of.borg> <4EFA726C.6040406@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:33268 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750829Ab1L2Ewq (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 28 Dec 2011 23:52:46 -0500
In-Reply-To: <4EFA726C.6040406@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

Hi Geert,

On 28/12/11 11:35, Greg Ungerer wrote:
> On 27/12/11 05:32, Geert Uytterhoeven wrote:
>> On Fri, 23 Dec 2011, gerg@snapgear.com wrote:
>>> From: Greg Ungerer<gerg@uclinux.org>
>>>
>>> The ColdFire 547x and 548x CPUs have internal MMU hardware. All code
>>> to support this is now in, so we can build kernels with it enabled.
>>>
>>> Signed-off-by: Greg Ungerer<gerg@uclinux.org>
>>> Acked-by: Geert Uytterhoeven<geert@linux-m68k.org>
>>> Acked-by: Matt Waddel<mwaddel@yahoo.com>
>>> Acked-by: Kurt Mahan<kmahan@xmission.com>
>>> ---
>>>    arch/m68k/Kconfig.cpu |    4 ++--
>>>    1 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
>>> index 5ae1d63..a4c75ad 100644
>>> --- a/arch/m68k/Kconfig.cpu
>>> +++ b/arch/m68k/Kconfig.cpu
>>> @@ -226,8 +226,8 @@ config M54xx
>>>
>>>    config M547x
>>>    	bool "MCF547x"
>>> -	depends on !MMU
>>>    	select COLDFIRE
>>> +	select MMU_COLDFIRE if MMU
>>>    	select M54xx
>>>    	select HAVE_CACHE_CB
>>>    	select HAVE_MBAR
>>> @@ -236,8 +236,8 @@ config M547x
>>>
>>>    config M548x
>>>    	bool "MCF548x"
>>> -	depends on !MMU
>>>    	select COLDFIRE
>>> +	select MMU_COLDFIRE if MMU
>>>    	select M54xx
>>>    	select HAVE_CACHE_CB
>>>    	select HAVE_MBAR
>>
>> This breaks allmodconfig, which now tries to build a hybrid classic/coldfire
>> kernel, which is not supported.
>>
>> In addition, M54xx kernels with e.g. Amiga or Atari support won't build
>> neither (I think, I haven't tried --- We may want to reconsider later as
>> there do exist Coldfire accelerator cards for some machines).
>>
>> At first I tried to fix it transparently by introducing CONFIG_M68KCLASSIC and
>> using a combination of select and depends, cfr. Sun3 MMU support, but that
>> failed due to a circular Kconfig dependency.
>>
>> So I came up with the patch below. Note that some defconfigs must be
>> regenerated, as they may create configs without CPU support.
>
> Yep, that makes sense. I had considered during development of these
> patches if we needed something like a M68KCLASSIC define. Looks like
> we do :-)
>
> I applied this patch before the the 0035 patch that created this problem.
> So that should keep everything able to build (and bisectable) with
> allmodconfig. I also squashed the change to use "choice" into this
> patch as well.
>
> When I get another minute I'll look at updating the defconfigs based on
> this too.

Ran through all the defconfigs again, and with the choice change none
of them needed updating. They all build with the correct CPU choices
in place.

Nice work :-)

Regards
Greg



>> from c56cfe6a186f45a88ffc3e628be4649ae51e61ad Mon Sep 17 00:00:00 2001
>> From: Geert Uytterhoeven<geert@linux-m68k.org>
>> Date: Mon, 26 Dec 2011 19:57:33 +0100
>> Subject: [PATCH] m68k/Kconfig: Separate classic m68k and coldfire early
>>
>> While you can build multiplatform kernels for machines with classic
>> m68k processors, you cannot mix support for classic m68k and coldfire
>> processors. To avoid such hybrid kernels, introduce CONFIG_M68KCLASSIC
>> as an antipole for CONFIG_COLDFIRE, and make all specific processor
>> support depend on one of them.
>> All classic m68k machine support also needs to depend on this.
>>
>> The defaults (CONFIG_M68KCLASSIC if MMU, CONFIG_COLDFIRE if !MMU) are
>> chosen such to make most of the existing configs build and work.
>>
>> Signed-off-by: Geert Uytterhoeven<geert@linux-m68k.org>
>> ---
>>    arch/m68k/Kconfig.cpu     |   63 +++++++++++++++++++++++++--------------------
>>    arch/m68k/Kconfig.machine |    4 +++
>>    2 files changed, 39 insertions(+), 28 deletions(-)
>>
>> diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
>> index a4c75ad..58d4b52 100644
>> --- a/arch/m68k/Kconfig.cpu
>> +++ b/arch/m68k/Kconfig.cpu
>> @@ -1,5 +1,34 @@
>>    comment "Processor Type"
>>
>> +config M68KCLASSIC
>> +	bool "Classic M68K CPU family support"
>> +	default y if MMU
>> +	help
>> +	  The Freescale (was Motorola) M68K family of processors implements
>> +	  the full 68000 processor instruction set.
>> +	  If you anticipate running this kernel on a computer with a classic
>> +	  MC68xxx processor, say Y. Otherwise, say N.
>> +
>> +config COLDFIRE
>> +	bool "Coldfire CPU family support"
>> +	depends on !M68KCLASSIC
>> +	select GENERIC_GPIO
>> +	select ARCH_REQUIRE_GPIOLIB
>> +	select CPU_HAS_NO_BITFIELDS
>> +	select CPU_HAS_NO_MULDIV64
>> +	select GENERIC_CSUM
>> +	default y if !MMU
>> +	help
>> +	  The Freescale ColdFire family of processors is a modern derivitive
>> +	  of the 68000 processor family. They are mainly targeted at embedded
>> +	  applications, and are all System-On-Chip (SOC) devices, as opposed
>> +	  to stand alone CPUs. They implement a subset of the original 68000
>> +	  processor instruction set.
>> +	  If you anticipate running this kernel on a computer with a ColdFire
>> +	  processor, say Y. Otherwise, say N.
>> +
>> +if M68KCLASSIC
>> +
>>    config M68000
>>    	bool
>>    	select CPU_HAS_NO_BITFIELDS
>> @@ -20,20 +49,6 @@ config MCPU32
>>    	  based on the 68020 processor. For the most part it is used in
>>    	  System-On-Chip parts, and does not contain a paging MMU.
>>
>> -config COLDFIRE
>> -	bool
>> -	select GENERIC_GPIO
>> -	select ARCH_REQUIRE_GPIOLIB
>> -	select CPU_HAS_NO_BITFIELDS
>> -	select CPU_HAS_NO_MULDIV64
>> -	select GENERIC_CSUM
>> -	help
>> -	  The Freescale ColdFire family of processors is a modern derivitive
>> -	  of the 68000 processor family. They are mainly targeted at embedded
>> -	  applications, and are all System-On-Chip (SOC) devices, as opposed
>> -	  to stand alone CPUs. They implement a subset of the original 68000
>> -	  processor instruction set.
>> -
>>    config M68020
>>    	bool "68020 support"
>>    	depends on MMU
>> @@ -103,10 +118,13 @@ config M68360
>>    	help
>>    	  Motorola 68360 processor support.
>>
>> +endif # M68KCLASSIC
>> +
>> +if COLDFIRE
>> +
>>    config M5206
>>    	bool "MCF5206"
>>    	depends on !MMU
>> -	select COLDFIRE
>>    	select COLDFIRE_SW_A7
>>    	select HAVE_MBAR
>>    	help
>> @@ -115,7 +133,6 @@ config M5206
>>    config M5206e
>>    	bool "MCF5206e"
>>    	depends on !MMU
>> -	select COLDFIRE
>>    	select COLDFIRE_SW_A7
>>    	select HAVE_MBAR
>>    	help
>> @@ -124,7 +141,6 @@ config M5206e
>>    config M520x
>>    	bool "MCF520x"
>>    	depends on !MMU
>> -	select COLDFIRE
>>    	select GENERIC_CLOCKEVENTS
>>    	select HAVE_CACHE_SPLIT
>>    	help
>> @@ -133,7 +149,6 @@ config M520x
>>    config M523x
>>    	bool "MCF523x"
>>    	depends on !MMU
>> -	select COLDFIRE
>>    	select GENERIC_CLOCKEVENTS
>>    	select HAVE_CACHE_SPLIT
>>    	select HAVE_IPSBAR
>> @@ -143,7 +158,6 @@ config M523x
>>    config M5249
>>    	bool "MCF5249"
>>    	depends on !MMU
>> -	select COLDFIRE
>>    	select COLDFIRE_SW_A7
>>    	select HAVE_MBAR
>>    	help
>> @@ -155,7 +169,6 @@ config M527x
>>    config M5271
>>    	bool "MCF5271"
>>    	depends on !MMU
>> -	select COLDFIRE
>>    	select M527x
>>    	select HAVE_CACHE_SPLIT
>>    	select HAVE_IPSBAR
>> @@ -166,7 +179,6 @@ config M5271
>>    config M5272
>>    	bool "MCF5272"
>>    	depends on !MMU
>> -	select COLDFIRE
>>    	select COLDFIRE_SW_A7
>>    	select HAVE_MBAR
>>    	help
>> @@ -175,7 +187,6 @@ config M5272
>>    config M5275
>>    	bool "MCF5275"
>>    	depends on !MMU
>> -	select COLDFIRE
>>    	select M527x
>>    	select HAVE_CACHE_SPLIT
>>    	select HAVE_IPSBAR
>> @@ -186,7 +197,6 @@ config M5275
>>    config M528x
>>    	bool "MCF528x"
>>    	depends on !MMU
>> -	select COLDFIRE
>>    	select GENERIC_CLOCKEVENTS
>>    	select HAVE_CACHE_SPLIT
>>    	select HAVE_IPSBAR
>> @@ -196,7 +206,6 @@ config M528x
>>    config M5307
>>    	bool "MCF5307"
>>    	depends on !MMU
>> -	select COLDFIRE
>>    	select COLDFIRE_SW_A7
>>    	select HAVE_CACHE_CB
>>    	select HAVE_MBAR
>> @@ -206,7 +215,6 @@ config M5307
>>    config M532x
>>    	bool "MCF532x"
>>    	depends on !MMU
>> -	select COLDFIRE
>>    	select HAVE_CACHE_CB
>>    	help
>>    	  Freescale (Motorola) ColdFire 532x processor support.
>> @@ -214,7 +222,6 @@ config M532x
>>    config M5407
>>    	bool "MCF5407"
>>    	depends on !MMU
>> -	select COLDFIRE
>>    	select COLDFIRE_SW_A7
>>    	select HAVE_CACHE_CB
>>    	select HAVE_MBAR
>> @@ -226,7 +233,6 @@ config M54xx
>>
>>    config M547x
>>    	bool "MCF547x"
>> -	select COLDFIRE
>>    	select MMU_COLDFIRE if MMU
>>    	select M54xx
>>    	select HAVE_CACHE_CB
>> @@ -236,7 +242,6 @@ config M547x
>>
>>    config M548x
>>    	bool "MCF548x"
>> -	select COLDFIRE
>>    	select MMU_COLDFIRE if MMU
>>    	select M54xx
>>    	select HAVE_CACHE_CB
>> @@ -244,6 +249,8 @@ config M548x
>>    	help
>>    	  Freescale ColdFire 5480/5481/5482/5483/5484/5485 processor support.
>>
>> +endif # COLDFIRE
>> +
>>
>>    comment "Processor Specific Options"
>>
>> diff --git a/arch/m68k/Kconfig.machine b/arch/m68k/Kconfig.machine
>> index ef4a26a..7cdf6b0 100644
>> --- a/arch/m68k/Kconfig.machine
>> +++ b/arch/m68k/Kconfig.machine
>> @@ -1,5 +1,7 @@
>>    comment "Machine Types"
>>
>> +if M68KCLASSIC
>> +
>>    config AMIGA
>>    	bool "Amiga support"
>>    	depends on MMU
>> @@ -130,6 +132,8 @@ config SUN3
>>
>>    	  If you don't want to compile a kernel exclusively for a Sun 3, say N.
>>
>> +endif # M68KCLASSIC
>> +
>>    config PILOT
>>    	bool
>>
>
>


-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
