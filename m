From: Maxim Kuvyrkov <maxim@codesourcery.com>
Subject: Re: [PATCH] Fix siginfo._uid bug
Date: Thu, 19 Nov 2009 22:47:28 +0300
Message-ID: <4B05A0D0.4040401@codesourcery.com>
References: <4AB113C3.1090606@codesourcery.com> <m21vm6k76e.fsf@igel.home>	 <4AB3A4AC.6000703@codesourcery.com>	 <4AC5BFA8.4040805@codesourcery.com>	 <4AE5B06C.1090303@codesourcery.com> <10f740e80911191131o4a58c67ejb3073a9c8cb9fd6c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.codesourcery.com ([38.113.113.100]:53962 "EHLO
	mail.codesourcery.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754203AbZKSTra (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 19 Nov 2009 14:47:30 -0500
In-Reply-To: <10f740e80911191131o4a58c67ejb3073a9c8cb9fd6c@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andreas Schwab <schwab@linux-m68k.org>, linux-m68k@vger.kernel.org

Geert Uytterhoeven wrote:
> On Mon, Oct 26, 2009 at 15:21, Maxim Kuvyrkov <maxim@codesourcery.com> wrote:
>> Maxim Kuvyrkov wrote:
>>> Maxim Kuvyrkov wrote:
>>>> Andreas Schwab wrote:
...
>>>> Moving on to the generic version of siginfo.h will certainly fix the
>>>> problem, otherwise, one needs to pad extra 2 bytes in _timer.
>>> While the discussion is pending, here is an updated version of the patch
>>> that also patches up sigval.
>> Ping?  Broken signal handling is a quite serious bug.
>>
>> Geert, which option of fixing would you prefer?
> 
> Unfortunately I'm far from a signal expert...
> 
> Fixing this breaks backwards compatibility, right?

Not really.  Fixing this bug will only make applications to receive 
expected results in signal handlers they register.

> So what are the consequences? Which applications are affected? Just
> gdb? So we need a fixed gdb binary in Debian?

While GDB is a heavy user of signals, it's not the only application 
that's affected.  GLIBC is affected for sure, as is anything that is 
using signals to the extent of checking UID of the process which sent 
the signal.

The question is which solution should we adopt.  The patch I posted 
fixes all current problems with have on our hands.  Andreas suggested to 
move to the generic layout of `struct siginfo' which will make future 
problems less likely, but this approach may need additional investigation.

Regards,

-- 
Maxim Kuvyrkov
CodeSourcery
maxim@codesourcery.com
(650) 331-3385 x724
