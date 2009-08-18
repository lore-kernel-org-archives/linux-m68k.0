From: Maxim Kuvyrkov <maxim@codesourcery.com>
Subject: Re: Add private syscalls to support NPTL
Date: Tue, 18 Aug 2009 11:15:05 +0400
Message-ID: <4A8A54F9.3080100@codesourcery.com>
References: <4A89D037.7090807@codesourcery.com> <m27hx2um3t.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.codesourcery.com ([65.74.133.4]:47847 "EHLO
	mail.codesourcery.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750743AbZHRHPM (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 18 Aug 2009 03:15:12 -0400
In-Reply-To: <m27hx2um3t.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org

Andreas Schwab wrote:
> Maxim Kuvyrkov <maxim@codesourcery.com> writes:
> 
>> diff --git a/arch/m68k/include/asm/unistd.h b/arch/m68k/include/asm/unistd.h
>> index aa29a86..619677c 100644
>> --- a/arch/m68k/include/asm/unistd.h
>> +++ b/arch/m68k/include/asm/unistd.h
>> @@ -335,9 +335,16 @@
>>  #define __NR_preadv		329
>>  #define __NR_pwritev		330
>>  
>> +/* Private syscalls.  */
>> +#define __M68K_NR_read_tp		0xffffffff
>> +#define __M68K_NR_write_tp		0xfffffffe
>> +#define __M68K_NR_atomic_cmpxchg_32	0xfffffffd
>> +#define __M68K_NR_atomic_barrier	0xfffffffc
> 
> I don't see the need for these weird syscall numbers.

The need would be (a) use numbers that are very unlikely to used for 
normal syscalls, and (b) using -1..-4 for the syscall numbers works out 
quite nicely for the code in entry.S.  It adds just a couple of 
instructions to the execution path.

Do you think it's better to assign different numbers to the 
m68k-specific syscall?

--
Maxim
