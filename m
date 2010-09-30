From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: m68k, signals and single-stepping
Date: Thu, 30 Sep 2010 13:05:04 +0100
Message-ID: <20100930120504.GM19804@ZenIV.linux.org.uk>
References: <20100930055823.GK19804@ZenIV.linux.org.uk>
 <AANLkTimigeCBQdh1CxsxojKNGXWcoLQg10weE8w1r5v5@mail.gmail.com>
 <m362xn63qc.fsf@hase.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:40949 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755309Ab0I3MFF (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 30 Sep 2010 08:05:05 -0400
Content-Disposition: inline
In-Reply-To: <m362xn63qc.fsf@hase.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Thu, Sep 30, 2010 at 10:21:47AM +0200, Andreas Schwab wrote:
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
> 
> >> So what's that SIGTRAP on exit from syscall in single-stepping mode for?
> 
> The trace exception is low priority exception that is executed after all
> other exceptions are processed.  So if the cpu single steps over a trap
> insns, the trace exception processing is started when the trap exception
> processing is complete, which is just before the cpu starts executing
> the trap exception handler in the kernel.  You want the SIGTRAP to be
> sent to the user process, so you have to delay sending it until the
> kernel returns to user space.

Um...  What's wrong with doing that from trap_c()?
