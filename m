From: Maxim Kuvyrkov <maxim@codesourcery.com>
Subject: Re: Add private syscalls to support NPTL
Date: Tue, 18 Aug 2009 13:36:50 +0400
Message-ID: <4A8A7632.9030305@codesourcery.com>
References: <4A89D037.7090807@codesourcery.com> <m27hx2um3t.fsf@igel.home>	 <4A8A54F9.3080100@codesourcery.com> <m3d46tpmue.fsf@hase.home>	 <4A8A6CA2.4040806@codesourcery.com> <10f740e80908180222p4d95b19bp3069e037a6bc590e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.codesourcery.com ([65.74.133.4]:46391 "EHLO
	mail.codesourcery.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750880AbZHRJg5 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 18 Aug 2009 05:36:57 -0400
In-Reply-To: <10f740e80908180222p4d95b19bp3069e037a6bc590e@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andreas Schwab <schwab@linux-m68k.org>, linux-m68k@vger.kernel.org

Geert Uytterhoeven wrote:
> On Tue, Aug 18, 2009 at 10:56, Maxim Kuvyrkov<maxim@codesourcery.com> wrote:
>> Andreas Schwab wrote:
>>> Maxim Kuvyrkov <maxim@codesourcery.com> writes:
>>>> The need would be (a) use numbers that are very unlikely to used for
>>>> normal syscalls,
>>> I don't understand.  These are normal syscalls.
>>>
>>>> and (b) using -1..-4 for the syscall numbers works out quite nicely
>>>> for the code in entry.S.  It adds just a couple of instructions to the
>>>> execution path.
>>> Those additional instructions are totally unnecessary.
>> Hm, I though it would be preferable to keep syscalls that are specific to
>> m68k (in the sense that no other target requires them) separate from the
>> ones implementing standard unix/linux functionality.
>>
>> If the consensus is that the new syscalls should received 331..334 numbers,
>> that would only simplify the implementation.
> 
> I prefer to just add them at the bottom of the list.
> 
> (slowly recovering from my backlog) I noticed some new syscalls got
> added recently:
> 
> | <stdin>:1515:2: warning: #warning syscall rt_tgsigqueueinfo not implemented
> | <stdin>:1519:2: warning: #warning syscall perf_counter_open not implemented
> 
> Probably I should wire those up first (for 2.6.31, if still possible).
> 
> Next I should reserve 333..336 for you?

That's fine, thank you.  I'll follow up with an updated patch in couple 
of days.

--
Maxim

