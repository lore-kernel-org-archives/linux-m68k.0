From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: Atari TT (next)
Date: Sun, 08 Jan 2012 14:36:50 +0100
Message-ID: <m2vcoml3il.fsf@igel.home>
References: <4F079F6B.8080502@fairlite.co.uk>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:35374 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753419Ab2AHNg4 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 8 Jan 2012 08:36:56 -0500
In-Reply-To: <4F079F6B.8080502@fairlite.co.uk> (Alan Hourihane's message of
	"Sat, 07 Jan 2012 01:27:07 +0000")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Alan Hourihane <alanh@fairlite.co.uk>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Alan Hourihane <alanh@fairlite.co.uk> writes:

> Now the next problem is that the console is all corrupted because atafb
> initializes and shows this...
>
> atafb_init: start
> atafb_init: initializing TT hw
> atafb: screen_base 0046e000 real_screen_base 0046e000 screen_len 311296
> Determined 640x480, depth 4
>   virtual 640x972
>
> Now, that screen_base is above 4MB, and I've only got 4MB STRAM.

screen_base is a virtual address, the physical address is actually
0x146e000.

> But there's also this further up the boot log.
>
> Ignoring memory chunk at 0x0:0x400000 before the first chunk

Since 12d810c1b8c2b913d48e629e2b5c01d105029839 (m68k: discontinuous
memory support) there is no longer support for memory regions with
physical addresses that are out of order.  Before that, if the kernel
was loaded to TT-RAM the ST-RAM was virtually mapped just after TT-RAM.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
