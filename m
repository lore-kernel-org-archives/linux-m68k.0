From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: _ebss == _edata if MMU
Date: Wed, 18 Apr 2012 13:43:46 +0200
Message-ID: <m2zka99sel.fsf@igel.home>
References: <CAMuHMdXefcfjetrLAtnsqONRT1WefEFU3Ztv0=2itP+sjGJDrg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:43699 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753203Ab2DRLn4 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 18 Apr 2012 07:43:56 -0400
In-Reply-To: <CAMuHMdXefcfjetrLAtnsqONRT1WefEFU3Ztv0=2itP+sjGJDrg@mail.gmail.com>
	(Geert Uytterhoeven's message of "Wed, 18 Apr 2012 09:55:34 +0200")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> On ARAnyM:
>
> Virtual kernel memory layout:
>     vector  : 0x002f4d10 - 0x002f5110   (   1 KiB)
>     kmap    : 0xd0000000 - 0xf0000000   ( 512 MiB)
>     vmalloc : 0x11800000 - 0xd0000000   (3048 MiB)
>     lowmem  : 0x00000000 - 0x11000000   ( 272 MiB)
>       .init : 0x00319000 - 0x0033c000   ( 140 KiB)
>       .text : 0x00001000 - 0x002487b8   (2334 KiB)
>       .data : 0x0024b540 - 0x00318a40   ( 822 KiB)
>       .bss  : 0x002f4ae0 - 0x00318a40   ( 144 KiB)
>
> End of data and end of bss are identical, as arch/m68k/kernel/vmlinux-std.lds
> says bss is a subset of data:

It's just the _edata symbol, I don't think this is a problem.  After
all, bss is only zero-initialized data, thus still part of kernel data.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
