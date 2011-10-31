From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 27/36] m68k: add code to setup a ColdFire 54xx platform
 when MMU enabled
Date: Mon, 31 Oct 2011 14:59:38 +1000
Message-ID: <4EAE2B3A.5050107@snapgear.com>
References: <1319527168-11166-1-git-send-email-gerg@snapgear.com>	<1319527168-11166-28-git-send-email-gerg@snapgear.com> <CAMuHMdU8Lso_1kobyqFCyTWnA3XP0b883r3Bu3Ngzx0oViOOHA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:28924 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750891Ab1JaE6e (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 31 Oct 2011 00:58:34 -0400
In-Reply-To: <CAMuHMdU8Lso_1kobyqFCyTWnA3XP0b883r3Bu3Ngzx0oViOOHA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>


Hi Geert,

On 30/10/11 23:39, Geert Uytterhoeven wrote:
> On Tue, Oct 25, 2011 at 09:19,<gerg@snapgear.com>  wrote:
>> From: Greg Ungerer<gerg@uclinux.org>
>>
>> We use the same setup code for ColdFire MMU enabled platforms as
>> standard m68k. So add support for it to setup our 54xx ColdFire
>> platforms. They do not support the same bootinfo parsing as other
>> m68k platforms.
>>
>> Signed-off-by: Greg Ungerer<gerg@uclinux.org>
>> ---
>> arch/m68k/kernel/setup_mm.c 8 +++++++-
>> 1 files changed, 7 insertions(+), 1 deletions(-)
>>
>> diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
>> index 52e17d1..b3938ad 100644
>> --- a/arch/m68k/kernel/setup_mm.c
>> +++ b/arch/m68k/kernel/setup_mm.c
>> @@ -221,7 +221,8 @@ void __init setup_arch(char **cmdline_p)
>> #endif
>>
>>  	/* The bootinfo is located right after the kernel bss */
>> -	m68k_parse_bootinfo((const struct bi_record *)_end);
>> +	if (!CPU_IS_COLDFIRE)
>> +		m68k_parse_bootinfo((const struct bi_record *)_end);
>>
>>  	if (CPU_IS_040)
>>  		m68k_is040or060 = 4;
>> @@ -327,6 +328,11 @@ void __init setup_arch(char **cmdline_p)
>>  		config_sun3x();
>>  		break;
>>  #endif
>> +#ifdef CONFIG_COLDFIRE
>> +	case MACH_M54XX:
>> +		config_BSP(NULL, 0);
>
> config_M54xx?

config_BSP is the name of the existing function as it used for non-MMU,
so I just left it unchanged. The non-mmu code is built for a specific
processor type (no multi-cpu image support), and all those functions
for each CPU type are just called config_BSP.

So I was trying to minimize the changed needed here. Although the name
is not too descriptive. In the furture I want to merge all the separate
config_BSP() functions into a single one for ColdFire. They are almost
all the same. I plan on renaming it then.

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
