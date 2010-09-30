From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: m68k, signals and single-stepping
Date: Thu, 30 Sep 2010 14:34:11 +0200
Message-ID: <m3lj6j4dh8.fsf@hase.home>
References: <20100930055823.GK19804@ZenIV.linux.org.uk>
	<AANLkTimigeCBQdh1CxsxojKNGXWcoLQg10weE8w1r5v5@mail.gmail.com>
	<m362xn63qc.fsf@hase.home> <20100930120504.GM19804@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:47819 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755120Ab0I3MeO (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 30 Sep 2010 08:34:14 -0400
In-Reply-To: <20100930120504.GM19804@ZenIV.linux.org.uk> (Al Viro's message of
	"Thu, 30 Sep 2010 13:05:04 +0100")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Al Viro <viro@ZenIV.linux.org.uk> writes:

> On Thu, Sep 30, 2010 at 10:21:47AM +0200, Andreas Schwab wrote:
>> Geert Uytterhoeven <geert@linux-m68k.org> writes:
>> 
>> >> So what's that SIGTRAP on exit from syscall in single-stepping mode for?
>> 
>> The trace exception is low priority exception that is executed after all
>> other exceptions are processed.  So if the cpu single steps over a trap
>> insns, the trace exception processing is started when the trap exception
>> processing is complete, which is just before the cpu starts executing
>> the trap exception handler in the kernel.  You want the SIGTRAP to be
>> sent to the user process, so you have to delay sending it until the
>> kernel returns to user space.
>
> Um...  What's wrong with doing that from trap_c()?

IIRC that was the only way to make gdb work correctly wrt. single
stepping over system calls and into signal handlers.  If anyone wants to
test it with today's kernel on real hardware, please go ahead.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
