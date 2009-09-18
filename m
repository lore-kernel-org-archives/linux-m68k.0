From: Maxim Kuvyrkov <maxim@codesourcery.com>
Subject: Re: [PATCH] Fix siginfo._uid bug
Date: Fri, 18 Sep 2009 19:18:04 +0400
Message-ID: <4AB3A4AC.6000703@codesourcery.com>
References: <4AB113C3.1090606@codesourcery.com> <m21vm6k76e.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.codesourcery.com ([65.74.133.4]:41899 "EHLO
	mail.codesourcery.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752637AbZIRPSL (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 18 Sep 2009 11:18:11 -0400
In-Reply-To: <m21vm6k76e.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org

Andreas Schwab wrote:
> Maxim Kuvyrkov <maxim@codesourcery.com> writes:
> 
>> The bug is rather elegant and has been present in sources for years.
> 
> For more than 9 years, to be precise, when 32 bit uids were introduced.
> 
>> The problem is that m68k uses a custom siginfo layout due to having
>> a 16-bit uid field for 'backward compatibility'.  I.e., siginfo._kill
>> fields are:
> 
> I've found this interesting thread from 2000:
> 
> http://marc.info/?l=linux-kernel&m=94829131029274&w=2
> 
> The change went in 2.3.41, and undid the change made in 2.3.39.  It was
> reintroduced (for asm-m68k/siginfo.h only and with __kernel_* types; no
> other siginfo header used them at that time) in 2.4.0-test12.
> 
> Now looking at the glibc side, m68k has always used the generic
> linux/bits/siginfo.h (with a single 32bit uid field), until Richard
> Sandiford introduced linux/m68k/siginfo.h in October 2006, copying the
> (broken) layout from the kernel.
> 
> Given that there is no way to keep backward compatibility it might be a
> good opportunity to do same cleanup here.  Like going back to the
> generic layout.

There is yet another bug in siginfo.  si_sigval is expected to be at the 
same offsets in _timer and _rt.  At the moment si_sigval is at offset 8 
in _timer and at offset 6 in _rt (the patch for fixing uids makes that 
8@_timer and 10@_rt).

This bug causes rt/tst-*timer* tests fail.

Moving on to the generic version of siginfo.h will certainly fix the 
problem, otherwise, one needs to pad extra 2 bytes in _timer.

--
Maxim K.
CodeSourcery

