From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 05/35] m68k: add TASK definitions for ColdFires running
 with MMU
Date: Thu, 8 Dec 2011 15:27:44 +1000
Message-ID: <4EE04AD0.9000809@snapgear.com>
References: <1322192480-22822-1-git-send-email-gerg@snapgear.com> <1322192480-22822-6-git-send-email-gerg@snapgear.com> <BE72CBA69B1D6F44B0680DF984332A32313660@039-SN1MPN1-004.039d.mgd.msft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:49501 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750925Ab1LHF1j (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 8 Dec 2011 00:27:39 -0500
In-Reply-To: <BE72CBA69B1D6F44B0680DF984332A32313660@039-SN1MPN1-004.039d.mgd.msft.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Jin Zhengxiong-R64188 <R64188@freescale.com>
Cc: "linux-m68k@vger.kernel.org" <linux-m68k@vger.kernel.org>, "uclinux-dev@uclinux.org" <uclinux-dev@uclinux.org>, Greg Ungerer <gerg@uclinux.org>

Hi Jason,

On 08/12/11 12:05, Jin Zhengxiong-R64188 wrote:
>
>> @@ -66,10 +68,12 @@ static inline void wrusp(unsigned long usp)
>>    * space during mmap's.
>>    */
>>   #ifdef CONFIG_MMU
>> -#ifndef CONFIG_SUN3
>> -#define TASK_UNMAPPED_BASE	0xC0000000UL
>> -#else
>> +#if defined(CONFIG_COLDFIRE)
>> +#define TASK_UNMAPPED_BASE	0x80000000UL
>
> [Jin Zhengxiong-R64188] Need to set TASK_UNMAPPED_BASE somewhere below 0x80000000
> to not break runtime linker.  When ld.so is invoked explicitly
> (i.e., /lib/ld.so.1 ./myprog), it needs to be loaded below 0x80000000,
> otherwise it will overwrite itself with the program it tries to load.
>
> The comments come from codesourcery and we have set it to 0x60000000
> in the latest BSP.

Ok, thanks. I will change that in the patches to 0x60000000 then.

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
