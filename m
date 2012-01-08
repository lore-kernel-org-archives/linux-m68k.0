From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: Atari TT (next)
Date: Sun, 08 Jan 2012 10:35:04 +0100
Message-ID: <m2pqeumt9z.fsf@linux-m68k.org>
References: <4F079F6B.8080502@fairlite.co.uk> <4F07EA66.6020603@gmail.com>
	<4F08E748.4020305@fairlite.co.uk> <4F0917E9.9090600@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:57577 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751512Ab2AHJfJ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 8 Jan 2012 04:35:09 -0500
In-Reply-To: <4F0917E9.9090600@gmail.com> (Michael Schmitz's message of "Sun,
	08 Jan 2012 17:13:29 +1300")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Alan Hourihane <alanh@fairlite.co.uk>, Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>

Michael Schmitz <schmitzmic@googlemail.com> writes:

> Come to think of it - does the TT video chipset actually require screen
> memory to reside in ST-RAM?

Yes.  Only the SCSI-DMA and SCC-DMA chips can address TT-RAM.

> That's what I meant - the kernel residing in TT-RAM automatically will map
> this chunk at kernel virtual address 0x0. Something in our mem_init logic
> prevents using RAM with a lower physical address than was used by the
> first chunk. I'm quoting from memory here - Roman Zippel might know the
> exact answer to this.

If the kernel resides in TT-RAM all of ST-RAM is supposed to be used by
stram_alloc.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
