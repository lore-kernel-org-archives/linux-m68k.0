From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [RFC] m68k: Update defconfigs for v3.9
Date: Fri, 24 May 2013 17:27:53 +1000 (EST)
Message-ID: <alpine.LNX.2.00.1305241705020.3487@nippy.intranet>
References: <CAMuHMdVSqN6Bjn1Ph-8xzZ64HzAcj7oBA8B3GNE8PTessUzBkQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:59569 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756887Ab3EXH17 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 24 May 2013 03:27:59 -0400
In-Reply-To: <CAMuHMdVSqN6Bjn1Ph-8xzZ64HzAcj7oBA8B3GNE8PTessUzBkQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>


On Thu, 23 May 2013, Geert Uytterhoeven wrote:

> CONFIG_ADB_MACIISI                    : . . . . . y . . . . . y

This is broken. It should be disabled because it will crash (unless it has 
fixed itself ;-)

I see that you have the pmac zilog serial console enabled, which is 
essential for Macs with either PMU v1 or IIsi ADB.

> CONFIG_INPUT_M68K_BEEP                : m . m . . m . . m . . m
> CONFIG_INPUT_MISC                     : y . y . y y . . y . . y

Dunno if this works on Macs. I never tested it.

> Any comments are welcome! Thanks!

Looks great but I would need to boot something to be sure. That's not 
possible for the time being unfortunately. I expect that your defconfigs 
will get merged before I get around to booting anything (which will make 
testing easier).

I have a strong suspicion that some stuff not enabled in your configs 
would still need to be explicitly disabled to get the best results. I will 
let you know when I get around to testing the mac_defconfig.

Finn
