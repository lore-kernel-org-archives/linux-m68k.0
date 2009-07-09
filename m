From: Matthew Lear <matt@bubblegen.co.uk>
Subject: Can't start Linux if U-Boot built with CONFIG_WATCHDOG
Date: Thu, 09 Jul 2009 10:45:49 +0100
Message-ID: <4A55BC4D.2000601@bubblegen.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from relay.ptn-ipout01.plus.net ([212.159.7.35]:37619 "EHLO
	relay.ptn-ipout01.plus.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755854AbZGIJpw (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 9 Jul 2009 05:45:52 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: u-boot@lists.denx.de, linux-m68k@vger.kernel.org

Hello all,

I've added watchdog support based on U-Boot (git) for the m68k coldfire
mcf54455evb platform. I've fed the patch to the maintainer to help in
development.

However, I am unable to start my m68k w/MMU coldfire Linux kernel from
U-Boot if U-Boot is built with CONFIG_WATCHDOG regardless if the
watchdog_enable(), watchdog_reset() and watchdog_disable() functions
touch hardware or not.

I initially thought this was a problem with enabling the watchdog
somehow (ie when Linux started, some hw configuration in the device was
getting upset or corrupted etc resulting in the failure), but when I
commented out the code from the above functions that actually accesses
the hw (ie to enable, kick and disable the watchdog timer hw block),
Linux is still unable to start.

In fact, I don't think Linux actually gets started! That's the problem.

If I rebuild the same U-Boot code base with CONFIG_WATCHDOG undefined,
Linux can start just fine. As far as I can tell, there are no functional
differences in building U-Boot with or without CONFIG_WATCHDOG enabled
when the functions above are stubs and do absolutely nothing at all.

If I build U-Boot with debug, what I see is as follows:


## Transferring control to Linux (at address 40020000) ...
BIV

...and then the board is dead. I occasionally see something like the
following from U-Boot:


*** Unexpected exception ***
Vector Number: 4 Format: 04 Fault Status: 0

PC: 4fdbfdc8 SR: 00002700 SP: 4fd72a64
D0: 00000004 D1: 000003f9 D2: 4fdb4202 D3: 004fa3da
D4: 00000000 D5: 4fdc7c8c D6: 122c0034 D7: 4fd82f76
A0: 4033cb98 A1: 4025aa39 A2: 40020000 A3: 4fdbfdc8
A4: 00000000 A5: 4fdc5800 A6: 4fd72afb

*** Please Reset Board! ***


The 'BIV' is relevant because in my 2.6.29 kernel src
arch/m68k/include/asm/bootinfo_mm.h, BOOTINFOV_MAGIC is defined to be
0x4249561A which is BIV^Z. This ascii text is located in the kernel
image header info:

>From arch/m68k/coldfire/head.S:


.section ".text.head","ax"
ENTRY(_stext)
	bras	1f	/* Jump over bootinfo version numbers */

	.long	BOOTINFOV_MAGIC
	.long	0


And from U-Boot itself:


-> md ${loadaddr}
40010000: 27051956 97342d7d 4a54afd5 00300000    '..V.4-}JT...0..
40010010: 40020000 40020000 8a006fc1 050c0200    @...@.....o.....
40010020: 4c696e75 78204b65 726e656c 20496d61    Linux Kernel Ima
40010030: 67650000 00000000 00000000 00000000    ge..............
40010040: 60084249 561a0000 00004ef9 40304000    `.BIV.....N.@0@.


I suspect that the failure of starting Linux is caused by some mismatch
in data structures (or versions there of) shared/copied between Linux
and U-Boot and that this data has somehow changed when U-Boot is built
with CONFIG_WATCHDOG #defined. However, I can't find any evidence of
this in the U-Boot code base. The bras instruction above must be key and
I suspect that this is the area causing the problem.

Can anybody offer any advice / explanation of what exactly could be
going on and why? I wouldn't have expected that defining CONFIG_WATCHDOG
would change anything as fundamental as this.

Apologies for the cross-post (U-Boot and m68k kernel dev) but I hope to
get opinions/feedback/help from both communities.

Any assistance very much appreciated indeed.

Many thanks,
--  Matt
