From: Maxim Kuvyrkov <maxim@codesourcery.com>
Subject: Re: Add private syscalls to support NPTL
Date: Wed, 19 Aug 2009 12:06:35 +0400
Message-ID: <4A8BB28B.3090203@codesourcery.com>
References: <4A89D037.7090807@codesourcery.com> <20090818022850.GA17279@cynthia.pants.nu> <4A8A532E.6060709@codesourcery.com> <20090818234017.GA32464@cynthia.pants.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.codesourcery.com ([65.74.133.4]:47060 "EHLO
	mail.codesourcery.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751693AbZHSIGm (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 19 Aug 2009 04:06:42 -0400
In-Reply-To: <20090818234017.GA32464@cynthia.pants.nu>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Brad Boyer <flar@allandria.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Andreas Schwab <schwab@linux-m68k.org>, linux-m68k@vger.kernel.org

Brad Boyer wrote:
> On Tue, Aug 18, 2009 at 11:07:26AM +0400, Maxim Kuvyrkov wrote:
>> Brad Boyer wrote:
>>> On Tue, Aug 18, 2009 at 01:48:39AM +0400, Maxim Kuvyrkov wrote:
>>>> +/* This syscall gets its arguments in A0 (mem), A1 (oldval) and
>>>> +   D1 (newval).  */
>>>> +asmlinkage int
>>>> +m68k_sys_atomic_cmpxchg_32(unsigned long newval, int d2, int d3, int d4, 
>>>> int d5,
>>>> +			unsigned long __user *mem, unsigned long oldval)
>>>> +{
>>> Any particular reason for this calling convention? The real CAS instruction
>>> specifically takes two data registers for the two values. It seems more
>>> logical to me to have oldval and newval in data registers and just have
>>> the mem argument in an address register.
>> The reason for this calling convention is to minimize difference in 
>> invokation of the vDSO helper and the syscall.  The helper gets its 
>> arguments in a0 (mem), d0 (oldval) and d1 (newval); in a stub, which is 
>> used when vDSO is not available, one then can do:
>>
>> movel %d0,%a1
>> movel #NR,%d0
>> trap #0
> 
> Then wouldn't it make sense to use %d2 instead of %a1?

Thanks for pointing this out, there's no reason for using %a1 /anymore/. 
  As for the past, %d2 is call-clobbered, so it would've needed saving 
on the stack.

Initially, I planned to argue changing ABI of the vDSO kernel helper to 
allow clobber of %a1, but then decided that it doesn't worth it and that 
it's better to save/restore whatever register a value from %d0 is being 
moved to.

As there's no reasoning for using %a1 anymore, I'll make the syscall 
expect its arguments in %a0(mem), %d1(newval) and %d2(oldval).

--
Maxim K.
CodeSourcery
