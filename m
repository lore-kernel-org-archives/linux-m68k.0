From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 07/35] m68k: use addr_limit checking for m68k CPUs that
 do no support address spaces
Date: Tue, 27 Dec 2011 22:30:42 +1000
Message-ID: <4EF9BA72.4030802@snapgear.com>
References: <1324610148-20666-1-git-send-email-gerg@snapgear.com>	<1324610148-20666-8-git-send-email-gerg@snapgear.com> <CAMuHMdXTN6ugyh3LuCYzs+z5PxLM82KXem7e=dPSt8BCyPJQVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:53157 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753450Ab1L0McU (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 27 Dec 2011 07:32:20 -0500
In-Reply-To: <CAMuHMdXTN6ugyh3LuCYzs+z5PxLM82KXem7e=dPSt8BCyPJQVg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>, Alexander Stein <alexander.stein@systec-electronic.com>

Hi Geert,

On 12/26/2011 06:01 AM, Geert Uytterhoeven wrote:
> On Fri, Dec 23, 2011 at 04:15,<gerg@snapgear.com>  wrote:
>> From: Greg Ungerer<gerg@uclinux.org>
>>
>> The ColdFire CPU family, and the original 68000, do not support separate
>> address spaces like the other 680x0 CPU types. Modify the set_fs()/get_fs()
>> functions and macros to use a thread_info addr_limit for address space
>> checking. This is pretty much what all other architectures that do not
>> support separate setable address spaces do.
>>
>> Signed-off-by: Alexander Stein<alexander.stein@systec-electronic.com>
>> Signed-off-by: Greg Ungerer<gerg@uclinux.org>
>> Acked-by: Matt Waddel<mwaddel@yahoo.com>
>> Acked-by: Kurt Mahan<kmahan@xmission.com>
>
>> diff --git a/arch/m68k/include/asm/thread_info.h b/arch/m68k/include/asm/thread_info.h
>> index 01cef3c..29fa6da 100644
>> --- a/arch/m68k/include/asm/thread_info.h
>> +++ b/arch/m68k/include/asm/thread_info.h
>> @@ -3,6 +3,7 @@
>>
>>  #include<asm/types.h>
>>  #include<asm/page.h>
>> +#include<asm/segment.h>
>>
>>  /*
>>   * On machines with 4k pages we default to an 8k thread size, though we
>> @@ -26,6 +27,7 @@ struct thread_info {
>> 	struct task_struct	*task;		/* main task structure */
>> 	unsigned long		flags;
>> 	struct exec_domain	*exec_domain;	/* execution domain */
>> +	mm_segment_t		addr_limit;	/* thread address space */
>
> Shouldn't the above be protected by #ifndef CONFIG_CPU_HAS_ADDRESS_SPACES?

It could be. For the sake of not uglying the code with any more
"ifdef"s I left it in for all cases. Would you prefer it be
conditional?

Regards
Greg



------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close,                            FAX:         +61 7 3891 3630
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
