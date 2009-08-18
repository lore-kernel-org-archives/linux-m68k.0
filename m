From: Maxim Kuvyrkov <maxim@codesourcery.com>
Subject: Re: Add private syscalls to support NPTL
Date: Tue, 18 Aug 2009 11:10:53 +0400
Message-ID: <4A8A53FD.2050205@codesourcery.com>
References: <4A89D037.7090807@codesourcery.com> <m23a7qulrv.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.codesourcery.com ([65.74.133.4]:54856 "EHLO
	mail.codesourcery.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751886AbZHRHK7 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 18 Aug 2009 03:10:59 -0400
In-Reply-To: <m23a7qulrv.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org

Andreas Schwab wrote:
> Maxim Kuvyrkov <maxim@codesourcery.com> writes:
> 
>> +		{
>> +			int do_page_fault(struct pt_regs *, unsigned long,
>> +					unsigned long);
> 
> Functions should always be declared in headers, and definitely never in
> block scope.

I missed that when cleaning up the patch, will follow up with the fix 
once other issues are resolved.

--
Maxim
