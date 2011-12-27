From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 33/35] m68k: do not use m68k startup or interrupt code
 for ColdFire CPU's
Date: Tue, 27 Dec 2011 22:24:28 +1000
Message-ID: <4EF9B8FC.7080206@snapgear.com>
References: <1324610148-20666-1-git-send-email-gerg@snapgear.com>	<1324610148-20666-34-git-send-email-gerg@snapgear.com> <CAMuHMdX00Q9PFWPXRBRyMCFJgXaCmBtP7RLB-R+mU58iPHLwCA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:52757 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753539Ab1L0M15 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 27 Dec 2011 07:27:57 -0500
In-Reply-To: <CAMuHMdX00Q9PFWPXRBRyMCFJgXaCmBtP7RLB-R+mU58iPHLwCA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

Hi Geert,

On 12/26/2011 06:33 AM, Geert Uytterhoeven wrote:
> On Fri, Dec 23, 2011 at 04:15,<gerg@snapgear.com>  wrote:
>> From: Greg Ungerer<gerg@uclinux.org>
>>
>> The ColdFire CPUs have their own startup and interrupt code (in the
>> platform/coldfire directory), and do not use the general m68k startup
>> and interrupt code. So if CONFIG_COLDFIRE is true do not compile the
>> general code for them.
>>
>> Signed-off-by: Greg Ungerer<gerg@uclinux.org>
>> Acked-by: Matt Waddel<mwaddel@yahoo.com>
>> Acked-by: Kurt Mahan<kmahan@xmission.com>
>> ---
>>  arch/m68k/kernel/Makefile | 4 +++-
>>  1 files changed, 3 insertions(+), 1 deletions(-)
>>
>> diff --git a/arch/m68k/kernel/Makefile b/arch/m68k/kernel/Makefile
>> index ea0a396..a327816 100644
>> --- a/arch/m68k/kernel/Makefile
>> +++ b/arch/m68k/kernel/Makefile
>> @@ -4,13 +4,15 @@
>>
>>  extra-$(CONFIG_MMU)		:= head.o
>>  extra-$(CONFIG_SUN3)	:= sun3-head.o
>> +extra-$(CONFIG_COLDFIRE)	:=
>
> Why do you need the line above?

That is to avoid using a "#ifndef CONFIG_COLDFIRE" around these.
This entry clears out extra-y for the case when both CONFIG_MMU
and CONFIG_COLDFIRE are set.


>>  obj-y	:= entry.o init_task.o irq.o m68k_ksyms.o module.o process.o ptrace.o
>>  obj-y	+= setup.o signal.o sys_m68k.o syscalltable.o time.o traps.o
>>
>> +ifndef CONFIG_COLDFIRE
>>  obj-$(CONFIG_MMU) += ints.o vectors.o
>> -
>> +endif
>
> Alternatively:
>
> obj-$(CONFIG_MMU_MOTOROLA) += ints.o vectors.o
> obj-$(CONFIG_MMU_SUN3) += ints.o vectors.o

Yes, that looks nice. I'll change it to that.


>>  ifndef CONFIG_MMU_SUN3
>>  obj-y	+= dma.o
>>  endif
>
> Hmm, here it's more difficult to get rid of the "ifndef", as there's
> no CONFIG_NOMMU.

Yes, unfortunately, I couldn't see anyway to not use the "ifndef" here.

Thanks
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close,                            FAX:         +61 7 3891 3630
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
