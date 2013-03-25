From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 00/11] Atari Ethernet/USB patch series - for upstream and debian-kernel
Date: Mon, 25 Mar 2013 19:37:33 +1300
Message-ID: <1364193464-3890-1-git-send-email-schmitz@debian.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-da0-f54.google.com ([209.85.210.54]:48823 "EHLO
	mail-da0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755379Ab3CYGh5 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 25 Mar 2013 02:37:57 -0400
Received: by mail-da0-f54.google.com with SMTP id p1so3069018dad.13
        for <linux-m68k@vger.kernel.org>; Sun, 24 Mar 2013 23:37:56 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: linux-m68k@vger.kernel.org, tg@mirbsd.de

Hello Geert, 

This series of patches contains Atari EtherNAT and EtherNEC network support, 
plus USB driver support for the ISP1160 chip found on EtherNAT and NetUSBee 
adapters, to be applied to upstream 3.9-rc2 (_not_ m68k-queue or master).

Support stuff:
01/11 m68k/atari: ROM port ISA adapter support
02/11 m68k/irq: Add handle_polled_irq() for timer based soft interrupts
03/11 m68k/atari: use dedicated irq_chip for timer D interrupts

Ethernet:
04/11 m68k/atari: EtherNAT - platform device and IRQ support code
05/11 m68k/atari: EtherNEC - add platform device support
06/11 m68k/atari: EtherNAT - ethernet support - new driver (smc91x)
07/11 m68k/atari: EtherNEC - ethernet support - new driver (ne.c)
08/11 m68k/atari: EtherNAT - add interrupt chip definition for CPLD interrupts

USB:
09/11 m68k: Implement ndelay() based on the existing udelay() logic
10/11 m68k/atari: USB - add platform devices for EtherNAT/NetUSBee ISP1160 HCD
11/11 m68k/atari: USB - add ISP1160 USB host controller support

Again, the polled IRQ support patch is likely controversial. Ethernet patches
should be fairly straightforward to merge upstream, the last patch from the USB
part is of the 'Works For Me' variety and I will have to experiment a bit more
to minimize changes to the core isp116x-hcd interrupt code. The 16 bit access
quirks probably cannot be avoided though. 

My thanks goes to David Galvez for information on the EtherNAT USB register
offsets, NetUSBee 16 bit access tricks and above mentioned 16 bit access quirks.
This code has only been tested on my EtherNAT, so re-testing on NetUSBee might
be a good idea before we can consider kicking the USB portion upstream. It's
fairly self-contained and did not have any history in m68k-queue so I don't
mind for it to live in m68k-queue for a while. 

This patch series should be suitable for inclusion in the debian/68k kernel
packages (if policy allows). Thorsten: If you want help with that, I can try
to cherry-pick into a debian-patched git branch to simplify that process. 

Cheers,

	Michael
