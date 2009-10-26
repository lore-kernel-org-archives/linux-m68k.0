From: Maxim Kuvyrkov <maxim@codesourcery.com>
Subject: Re: [PATCH] Fix siginfo._uid bug
Date: Mon, 26 Oct 2009 17:21:32 +0300
Message-ID: <4AE5B06C.1090303@codesourcery.com>
References: <4AB113C3.1090606@codesourcery.com> <m21vm6k76e.fsf@igel.home> <4AB3A4AC.6000703@codesourcery.com> <4AC5BFA8.4040805@codesourcery.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.codesourcery.com ([38.113.113.100]:49941 "EHLO
	mail.codesourcery.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751186AbZJZO2Q (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 26 Oct 2009 10:28:16 -0400
In-Reply-To: <4AC5BFA8.4040805@codesourcery.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andreas Schwab <schwab@linux-m68k.org>, linux-m68k@vger.kernel.org

Maxim Kuvyrkov wrote:
> Maxim Kuvyrkov wrote:
>> Andreas Schwab wrote:
>>> Maxim Kuvyrkov <maxim@codesourcery.com> writes:
>>>
>>>> The bug is rather elegant and has been present in sources for years.
>>>
>>> For more than 9 years, to be precise, when 32 bit uids were introduced.
> ...
>>> Given that there is no way to keep backward compatibility it might be a
>>> good opportunity to do same cleanup here.  Like going back to the
>>> generic layout.
>>
>> There is yet another bug in siginfo.  si_sigval is expected to be at 
>> the same offsets in _timer and _rt.  At the moment si_sigval is at 
>> offset 8 in _timer and at offset 6 in _rt (the patch for fixing uids 
>> makes that 8@_timer and 10@_rt).
>>
>> This bug causes rt/tst-*timer* tests fail.
>>
>> Moving on to the generic version of siginfo.h will certainly fix the 
>> problem, otherwise, one needs to pad extra 2 bytes in _timer.
> 
> While the discussion is pending, here is an updated version of the patch 
> that also patches up sigval.

Ping?  Broken signal handling is a quite serious bug.

Geert, which option of fixing would you prefer?

-- 
Maxim Kuvyrkov
CodeSourcery
maxim@codesourcery.com
(650) 331-3385 x724
