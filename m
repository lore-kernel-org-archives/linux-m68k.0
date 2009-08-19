From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: Add private syscalls to support NPTL
Date: Wed, 19 Aug 2009 10:35:39 +0200
Message-ID: <m3skfonquc.fsf@hase.home>
References: <4A89D037.7090807@codesourcery.com>
	<20090818022850.GA17279@cynthia.pants.nu>
	<4A8A532E.6060709@codesourcery.com>
	<20090818234017.GA32464@cynthia.pants.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:57442 "EHLO mx2.redhat.com"
	rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1750923AbZHSIh5 (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Wed, 19 Aug 2009 04:37:57 -0400
In-Reply-To: <20090818234017.GA32464@cynthia.pants.nu> (Brad Boyer's message
	of "Tue, 18 Aug 2009 16:40:17 -0700")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Brad Boyer <flar@allandria.com>
Cc: Maxim Kuvyrkov <maxim@codesourcery.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org

Brad Boyer <flar@allandria.com> writes:

> On Tue, Aug 18, 2009 at 11:07:26AM +0400, Maxim Kuvyrkov wrote:
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

d2 is a callee-saved register, a1 isn't.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
