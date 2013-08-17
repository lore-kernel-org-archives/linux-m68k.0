From: Tuomas Vainikka <tuomas.vainikka@aalto.fi>
Subject: Re: [PATCH 0/2] Experimental Amiga Zorro ESP driver
Date: Sat, 17 Aug 2013 14:33:21 +0300
Message-ID: <520F5F81.7090409@aalto.fi>
References: <1370552199-15048-1-git-send-email-schmitz@debian.org> <520D4AE3.6040801@aalto.fi> <520E76FC.9040803@aalto.fi> <11425cb5ec432e2fbb7b675052e8b33d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx04.aalto.fi ([130.233.222.103]:56560 "EHLO mx04.aalto.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752614Ab3HQLdY (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sat, 17 Aug 2013 07:33:24 -0400
In-Reply-To: <11425cb5ec432e2fbb7b675052e8b33d@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, David Miller <davem@davemloft.net>, Geert Uytterhoeven <geert@linux-m68k.org>

On 08/17/2013 04:49 AM, Michael Schmitz wrote:
>
>> [  301.880000] esp: esp0: Reconnect IRQ2 timeout
>
> Are there interrupts logged for IRQ2 at all (cat /proc/interrupts)? It 
> looks to me as though all DMA transfers fail (the first command to 
> fail is READ_CAPACITY which would usually be issued right after 
> IDENTIFY IIRC).

root@amiga:/# cat /proc/interrupts
            CPU0
   2:    1066320      auto  CIAA, zorro8390, ide0, Amiga Zorro ESP
   6:     456970      auto  CIAB
   8:      38239     amiga  serial TX
   9:          0     amiga  floppy_dma
  12:     315934     amiga  fb vertb handler
  13:     315741     amiga  serial status
  15:          0     amiga  DMA sound
  19:        401     amiga  serial RX
  23:          1       cia  floppy_timer
  25:          0       cia  amikbd
  27:     456971       cia  timer
ERR:          0

Seems like IRQ2 is very popular, so it's hard to say which device has 
generated the interrupts...
Should the assigned irq name match the module name?

-Tuomas
