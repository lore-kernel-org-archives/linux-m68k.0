From: roman@hodek.net (Roman Hodek)
Subject: Re: Interrupt issue on m68k platform and some fix
Date: Thu,  2 Jul 2009 22:25:32 +0200 (CEST)
Message-ID: <20090702202532.DFD1A7BF89@ridcully.hodek.net>
References: <4A4C3267.2040705@freescale.com> <m3hbxvtruk.fsf@hase.home>
	<4A4C76CB.4000208@freescale.com> <m38wj7tpxk.fsf@hase.home>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from grufti.hodek.net ([213.146.121.132]:3447 "EHLO mail.hodek.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753141AbZGBUwH (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Thu, 2 Jul 2009 16:52:07 -0400
In-reply-to: <m38wj7tpxk.fsf@hase.home> (message from Andreas Schwab on Thu,
	02 Jul 2009 11:05:59 +0200)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: lanttor.guo@freescale.com, linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org


> > So this code sets value 1 to the second byte of preempt_count field.
> 
> No.  Byte would be addqb.

Yep ;) But that's also not what's intended, I think.

Lanttor says he wants to add HARDIRQ_OFFSET:

> HARDIRQ_OFFSET equals (1 << HARDIRQ_SHIT) , and HARDIRQ_SHIFT value is
> 16, so I think this code equals

and 1<<16 == 0x00010000, so correct would be

  addl #0x00010000,%curptr@(TASK_INFO+TINFO_PREEMPT)

And this can be optimized to add 1 to the high word:

  addqw #1,%curptr@(TASK_INFO+TINFO_PREEMPT+2)

As 1 is small enough, you can use an addq statement, and the offset to
the memory location is 2.

The originally proposed "addlq #1, %curptr@(TASK_INFO+TINFO_PREEMPT+1)"
is misaligned and would case an exception. And "addlb #1,
%curptr@(TASK_INFO+TINFO_PREEMPT+1)" wouldn't yield the correct value
as long if the byte overflows ;)

> addqb instruction is not supported on coldfire platform.

Really? The addq instructions are contained in all kind of code, I
guess...

Roman

PS: Hi Andreas! It's quite some years ago, isn't it? ;)
