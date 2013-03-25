From: Michael Schmitz <schmitzmic@gmail.com>
Subject: (unknown)
Date: Mon, 25 Mar 2013 14:16:18 +1300
Message-ID: <1364174192-25406-1-git-send-email-schmitz@debian.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-da0-f43.google.com ([209.85.210.43]:37089 "EHLO
	mail-da0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756451Ab3CYBQm (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 24 Mar 2013 21:16:42 -0400
Received: by mail-da0-f43.google.com with SMTP id u36so2993420dak.30
        for <linux-m68k@vger.kernel.org>; Sun, 24 Mar 2013 18:16:42 -0700 (PDT)
Subject: 
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: linux-m68k@vger.kernel.org, debian-68k@lists.debian.org

Hello Geert,


This series of patches updates Atari EtherNAT and EtherNEC network support, 
plus adds USB driver support for the ISP1160 chip found on EtherNAT and 
NetUSBee adapters.

It is meant to apply on top of your m68k-queue or master branches. Expect a 
merge conflict in #4 (the EtherNAT base address has been moved to atarihw.h
as per your feedback). I can provide the necessary patch on top of the 'Initial 
EtherNAT support' patch from your queue that would avoid the conflict. 

Network stuff:
01/14 m68k/atari EtherNEC: remove original EtherNEC driver
02/14 m68k/atari EtherNAT: remove original EtherNAT driver
03/14 m68k/atari: use CONFIG_ATARI in smc91x.h
04/14 m68k/atari: EtherNAT - change number of Atari interrupt sources
05/14 m68k/irq: add handle_polled_irq() for timer based soft interrupts
06/14 m68k/atari: use dedicated irq_chip for timer D interrupts
07/14 m68k/atari: EtherNEC - add platform device support
08/14 m68k/atari: EtherNAT - ethernet support - new driver (smc91x)
09/14 m68k/atari: EtherNEC - ethernet support - new driver (ne.c)
10/14 m68k/atari: EtherNAT - add interrupt chip for Ethernet and USB interrupts

USB related:
11/14 m68k/atari: Implement 16 bit access macros for ROM port
12/14 m68k: Implement ndelay() based on the existing udelay() logic
13/14 m68k/atari: USB - add platform device definitions for ISP1160 HCD
14/14 m68k/atari: USB - Add ISP1160 USB host controller support

You may well decide to leave out #5 - use of EtherNEC and NetUSBee is then possible
only with the 'noirqdebug' kernel option.

Many thanks to David Galvez for setting me straight on register locations, ways to deal
with the USB fifo transfers and testing/fixing the code for the NetUSBee case. I have
departed from the code David used to switch between NetUSBee and EtherNAT access, but
only slighlty. Please test this version and yell if it's not doing the right thing, David.

With the present code, the timer D interrupt frequency is approximately 100 Hz. On fast
hardware, it should probably be doubled (change the timer D counter value fron 254 to 123
to achieve that. I had the timer rate adjustable via kernel options in an earlier
incarnation pf the ethernet drivers. Or make it a function of the processor clock rate 
- whoever feels like it can revive that bit please).

Thorsten: I will shortly send another patch series against upstream linus-3.9-rc2. 
That one may be easier to integrate into Debian kernel sources. 

Cheers,

	Michael
