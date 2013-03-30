From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Atari Ethernet/USB paches for m68k-queue and upstream, refactored timer D interrupt patch
Date: Sat, 30 Mar 2013 13:27:40 +1300
Message-ID: <1364603272-8148-1-git-send-email-schmitz@debian.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f43.google.com ([209.85.160.43]:64046 "EHLO
	mail-pb0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757351Ab3C3A2M (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 29 Mar 2013 20:28:12 -0400
Received: by mail-pb0-f43.google.com with SMTP id md4so423364pbc.30
        for <linux-m68k@vger.kernel.org>; Fri, 29 Mar 2013 17:28:12 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: linux-m68k@vger.kernel.org

Hi Geert,

here's the patch series for m68k-queue again, slightly redone for easier
separation of the debatable polled timer patch. In the first instance,
patches 1, 3, 5, 6, 7, 8, 9 and 10 I would like to see merged upstream. 

All but 7 and 8 should go through your tree, 7 and 8 through netdev, right? 

I will send out the two patches to netdev for comment shortly. 

01/12 m68k/atari: ROM port ISA adapter support
02/12 m68k/irq: Add handle_polled_irq() for timer based soft interrupts
03/12 m68k/atari: use dedicated irq_chip for timer D interrupts
04/12 m68k/atari: use polled interrupt handler for timer D interrupts
05/12 m68k/atari: EtherNAT - platform device and IRQ support code
06/12 m68k/atari: EtherNEC - add platform device support
07/12 m68k/atari: EtherNAT - ethernet support - new driver (smc91x)
08/12 m68k/atari: EtherNEC - ethernet support - new driver (ne.c)
09/12 m68k/atari: EtherNAT - add interrupt chip definition for CPLD interrupts
10/12 m68k: Implement ndelay() based on the existing udelay() logic
11/12 m68k/atari: USB - add platform devices for EtherNAT/NetUSBee ISP1160 HCD
12/12 m68k/atari: USB - add ISP1160 USB host controller support

Cheers,

	Michael
