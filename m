From: Greg Ungerer <gregungerer@westnet.com.au>
Subject: Re: [PATCH] m68k: allow ColdFire m5441x parts to run with MMU enabled
Date: Wed, 9 Aug 2017 23:04:20 +1000
Message-ID: <30318b18-e955-1615-975e-9b378d3201b8@westnet.com.au>
References: <bc3dc168-aaae-1271-b73b-4d649db5e301@sysam.it>
 <d1ce1669-0286-ebad-7c6c-e9dfe37c266c@sysam.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out5.external.iinet.net.au ([203.59.1.221]:28659
        "EHLO icp-osb-irony-out5.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751942AbdHINE2 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 9 Aug 2017 09:04:28 -0400
In-Reply-To: <d1ce1669-0286-ebad-7c6c-e9dfe37c266c@sysam.it>
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Angelo Dureghello <angelo@sysam.it>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Angelo,

On 15/07/17 09:47, Angelo Dureghello wrote:
> On 15/07/2017 01:21, Angelo Dureghello wrote:
>> The Freescale ColdFire M5441x system-on-chip parts have full paged MMU
>> hardware support. So far though we have only allowed them to be
>> configured for use in non-MMU mode.
>>
>> All required kernel changes to support operation of the M5441x parts
>> with MMU enabled have been pushed into the kernel, so now we can allow
>> it to be configured and used with the MMU enabled.
>>
>> I don't actually have any M5441x based hardware so I can't do any real
>> testing on this. The changes up to now were based on Yannick Gicquel
>> initial patches to support this. Is anybody out there able to test
>> this properly?  I won't push this any further until we have some
>> confirmation that it all works as expected.
>>
>> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
>> ---
>>   arch/m68k/Kconfig.cpu | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
>> index d2219f30..4dc51c0 100644
>> --- a/arch/m68k/Kconfig.cpu
>> +++ b/arch/m68k/Kconfig.cpu
>> @@ -283,7 +283,7 @@ config M548x
>>
>>   config M5441x
>>       bool "MCF5441x"
>> -    depends on !MMU
>> +    select MMU_COLDFIRE if MMU
>>       select GENERIC_CLOCKEVENTS
>>       select HAVE_CACHE_CB
>>       help
> 
> forgot some useful info on my test:
> 
> - i built a 4.12 kernel from mainline (just pulled git master) and tested
> to boot properly as no-mmu
> 
> - i have those entries in my defconfig:
> ....
> CONFIG_BINFMT_FLAT=y
> CONFIG_BINFMT_ZFLAT=y
> CONFIG_BINFMT_SHARED_FLAT=y
> CONFIG_BINFMT_MISC=y
> ....
> 
> 
> I can help on debug when back from holidays, in 3 weeks.

Thanks for trying this out.

Let me know when you have some time to debug further.
First up I would like to know what your RAM setup looks like.
Is it mapped from a base address of 0?
What is the RAM size?

Regards
Greg
