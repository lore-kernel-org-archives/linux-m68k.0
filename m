From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 0/13] Atari EtherNAT/EtherNEC/NetUSBee support
Date: Sat,  6 Apr 2013 13:26:34 +1300
Message-ID: <1365208006-16227-1-git-send-email-schmitz@debian.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f42.google.com ([209.85.160.42]:39111 "EHLO
	mail-pb0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1163082Ab3DFA1B (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 5 Apr 2013 20:27:01 -0400
Received: by mail-pb0-f42.google.com with SMTP id up7so2257683pbc.29
        for <linux-m68k@vger.kernel.org>; Fri, 05 Apr 2013 17:27:01 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: linux-m68k@vger.kernel.org

Hi Geert,

here's my rewrite of the Atari patch series for upstream submission - 
the only changes are to patches 9 and 12. 

The USB patch no longer disables the chip interrupt in the interrupt 
handler - it turns out this wasn't necessary at all. It also does away 
with direct writes to the EtherNAT interrupt control register, and uses 
enable_irq() and disable_irq() instead. The probe code has become a lot 
cleaner as a result.

Defering interrupt enable until HCD start callback time is still necessary 
though - if interrups are enabled when the handler is registered from 
usb_hcd_add, the dead interrupt watchdog fires and disables the interrupt 
again. This may be a result of the handler returning IRQ_NONE if the chip 
hasn't been started yet - I need to look into that. 

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
