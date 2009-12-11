From: Maxim Kuvyrkov <maxim@codesourcery.com>
Subject: Re: Add private syscalls to support NPTL
Date: Fri, 11 Dec 2009 19:23:48 +0300
Message-ID: <4B227214.6060004@codesourcery.com>
References: <4A89D037.7090807@codesourcery.com>	 <4B1CBEE8.7000907@codesourcery.com> <10f740e80912110601o2b7f3f19sf0a3ee19fa2dbaad@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.codesourcery.com ([38.113.113.100]:38986 "EHLO
	mail.codesourcery.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750735AbZLKQXo (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 11 Dec 2009 11:23:44 -0500
In-Reply-To: <10f740e80912110601o2b7f3f19sf0a3ee19fa2dbaad@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andreas Schwab <schwab@linux-m68k.org>, linux-m68k@vger.kernel.org, uClinux development list <uclinux-dev@uclinux.org>

On 12/11/09 5:01 PM, Geert Uytterhoeven wrote:
> On Mon, Dec 7, 2009 at 09:38, Maxim Kuvyrkov<maxim@codesourcery.com>  wrote:
...
>> diff --git a/arch/m68k/include/asm/unistd.h b/arch/m68k/include/asm/unistd.h
>> index 48b87f5..d076bea 100644
>> --- a/arch/m68k/include/asm/unistd.h
>> +++ b/arch/m68k/include/asm/unistd.h
>> @@ -336,10 +336,14 @@
>>   #define __NR_pwritev           330
>>   #define __NR_rt_tgsigqueueinfo 331
>>   #define __NR_perf_event_open   332
>> +#define __NR_read_tp           333
>> +#define __NR_write_tp          334
>> +#define __NR_atomic_cmpxchg_32 335
>> +#define __NR_atomic_barrier    336
>
> BTW, other architectures seem to call these __NR_[gs]et_thread_area
> instead of __NR_{read,write}_tp?
> Shouldn't we follow for consistency?

Yes, we may.  As long as the syscall numbers stay the same.  I'll send 
the updated patch once the memory handling issue is resolved.

BTW, does the analysis of the memory handling bug 
(http://marc.info/?l=linux-m68k&m=126043678613032&w=2) look right to you?

Regards,

-- 
Maxim Kuvyrkov
CodeSourcery
maxim@codesourcery.com
(650) 331-3385 x724
