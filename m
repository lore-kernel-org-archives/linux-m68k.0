From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: Interrupt issue on m68k platform and some fix
Date: Thu, 02 Jul 2009 10:24:35 +0200
Message-ID: <m3hbxvtruk.fsf@hase.home>
References: <4A4C3267.2040705@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:42679 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750849AbZGBI0x (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Thu, 2 Jul 2009 04:26:53 -0400
In-Reply-To: <4A4C3267.2040705@freescale.com> (Lanttor's message of "Thu, 02
	Jul 2009 12:07:03 +0800")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Lanttor <lanttor.guo@freescale.com>
Cc: linux-m68k@vger.kernel.org, uClinux development list <uclinux-dev@uclinux.org>

Lanttor <lanttor.guo@freescale.com> writes:

> My understanding of "*addql   #1,%curptr@(TASK_INFO+TINFO_PREEMPT+1)*"
> is that its meaning is equal to
> "current_thread_info()->preempt_count += HARDIRQ_OFFSET",

No, it isn't.  It is equivalent to
*(long *)((char *)&current_thread_info()->preempt_count + 1) += 1
which is of course completely bogus.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
