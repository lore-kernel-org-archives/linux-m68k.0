From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: why the PAGE_OFFSET is not 0xc0000000 on m68k platform
Date: Thu, 21 May 2009 13:29:44 +0200
Message-ID: <m23aaylmmv.fsf@igel.home>
References: <4A14D5E5.9070103@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:49717 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752451AbZEUL3r (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 21 May 2009 07:29:47 -0400
In-Reply-To: <4A14D5E5.9070103@freescale.com> (Lanttor's message of "Thu, 21
	May 2009 12:17:41 +0800")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Lanttor <lanttor.guo@freescale.com>
Cc: linux-m68k@vger.kernel.org

Lanttor <lanttor.guo@freescale.com> writes:

> In my understanding, the kernel page mapping depends on PAGE_OFFSET.
> For example, if PAGE_OFFSET is 0x00000000 (assuming 256M memory), the
> kernel virtual address will be at (0x00000000 - 0x10000000), right?

On m68k, the kernel virtual addresses are in a separate address space
from user space, thus the value of PAGE_OFFSET is somewhat arbitrary.

> Could this incur some side effect? I see the definition of PAGE_OFFSET
> is 0xc0000000 on much platforms.

On those platforms kernel and user space share the same address space,
and PAGE_OFFSET makes sure that they don't overlap.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
