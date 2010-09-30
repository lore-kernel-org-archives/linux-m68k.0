From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: m68k, signals and single-stepping
Date: Thu, 30 Sep 2010 10:21:47 +0200
Message-ID: <m362xn63qc.fsf@hase.home>
References: <20100930055823.GK19804@ZenIV.linux.org.uk>
	<AANLkTimigeCBQdh1CxsxojKNGXWcoLQg10weE8w1r5v5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:47640 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750972Ab0I3IVu (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 30 Sep 2010 04:21:50 -0400
In-Reply-To: <AANLkTimigeCBQdh1CxsxojKNGXWcoLQg10weE8w1r5v5@mail.gmail.com>
	(Geert Uytterhoeven's message of "Thu, 30 Sep 2010 08:07:05 +0200")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Linux/m68k <linux-m68k@vger.kernel.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

>> So what's that SIGTRAP on exit from syscall in single-stepping mode for?

The trace exception is low priority exception that is executed after all
other exceptions are processed.  So if the cpu single steps over a trap
insns, the trace exception processing is started when the trap exception
processing is complete, which is just before the cpu starts executing
the trap exception handler in the kernel.  You want the SIGTRAP to be
sent to the user process, so you have to delay sending it until the
kernel returns to user space.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
