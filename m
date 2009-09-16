From: Maxim Kuvyrkov <maxim@codesourcery.com>
Subject: Re: [PATCH] Fix siginfo._uid bug
Date: Wed, 16 Sep 2009 23:56:06 +0400
Message-ID: <4AB142D6.3050602@codesourcery.com>
References: <4AB113C3.1090606@codesourcery.com> <m21vm6k76e.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.codesourcery.com ([65.74.133.4]:49539 "EHLO
	mail.codesourcery.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
	with ESMTP id S1754623AbZIPT4L (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 16 Sep 2009 15:56:11 -0400
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

I can only cheer for going to the generic layout as I don't want repeat 
the exercise of hunting a bug that is both in the kernel and glibc.

--
Maxim
