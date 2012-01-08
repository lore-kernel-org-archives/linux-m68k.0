From: Alan Hourihane <alanh@fairlite.co.uk>
Subject: Re: Atari TT (next)
Date: Sun, 08 Jan 2012 14:42:50 +0000
Message-ID: <4F09AB6A.6070803@fairlite.co.uk>
References: <4F079F6B.8080502@fairlite.co.uk> <m2vcoml3il.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from fairlite.demon.co.uk ([80.176.228.186]:53364 "EHLO
	fairlite.demon.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751799Ab2AHOnF (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 8 Jan 2012 09:43:05 -0500
In-Reply-To: <m2vcoml3il.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

On 08/01/12 13:36, Andreas Schwab wrote:
> Alan Hourihane <alanh@fairlite.co.uk> writes:
>
>> Now the next problem is that the console is all corrupted because atafb
>> initializes and shows this...
>>
>> atafb_init: start
>> atafb_init: initializing TT hw
>> atafb: screen_base 0046e000 real_screen_base 0046e000 screen_len 311296
>> Determined 640x480, depth 4
>>   virtual 640x972
>>
>> Now, that screen_base is above 4MB, and I've only got 4MB STRAM.
> screen_base is a virtual address, the physical address is actually
> 0x146e000.

I thought that might be the case, given the TTRAM segment offset. But
still, it's in the wrong area.

>> But there's also this further up the boot log.
>>
>> Ignoring memory chunk at 0x0:0x400000 before the first chunk
> Since 12d810c1b8c2b913d48e629e2b5c01d105029839 (m68k: discontinuous
> memory support) there is no longer support for memory regions with
> physical addresses that are out of order.  Before that, if the kernel
> was loaded to TT-RAM the ST-RAM was virtually mapped just after TT-RAM.
>

Thanks for the pointer.

Alan.
