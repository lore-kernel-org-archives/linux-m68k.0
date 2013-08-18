From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH 0/2] Experimental Amiga Zorro ESP driver
Date: Sun, 18 Aug 2013 14:05:32 +1200
Message-ID: <52102BEC.7000006@gmail.com>
References: <1370552199-15048-1-git-send-email-schmitz@debian.org> <520D4AE3.6040801@aalto.fi> <520E76FC.9040803@aalto.fi> <11425cb5ec432e2fbb7b675052e8b33d@gmail.com> <520F5F81.7090409@aalto.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f172.google.com ([209.85.192.172]:33203 "EHLO
	mail-pd0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752588Ab3HRCFi (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 17 Aug 2013 22:05:38 -0400
Received: by mail-pd0-f172.google.com with SMTP id z10so3643170pdj.17
        for <linux-m68k@vger.kernel.org>; Sat, 17 Aug 2013 19:05:38 -0700 (PDT)
In-Reply-To: <520F5F81.7090409@aalto.fi>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Tuomas Vainikka <tuomas.vainikka@aalto.fi>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>

Tuomas,
>>
>>> [  301.880000] esp: esp0: Reconnect IRQ2 timeout
>>
>> Are there interrupts logged for IRQ2 at all (cat /proc/interrupts)? 
>> It looks to me as though all DMA transfers fail (the first command to 
>> fail is READ_CAPACITY which would usually be issued right after 
>> IDENTIFY IIRC).
>
> root@amiga:/# cat /proc/interrupts
>            CPU0
>   2:    1066320      auto  CIAA, zorro8390, ide0, Amiga Zorro ESP
>   6:     456970      auto  CIAB
>   8:      38239     amiga  serial TX
>   9:          0     amiga  floppy_dma
>  12:     315934     amiga  fb vertb handler
>  13:     315741     amiga  serial status
>  15:          0     amiga  DMA sound
>  19:        401     amiga  serial RX
>  23:          1       cia  floppy_timer
>  25:          0       cia  amikbd
>  27:     456971       cia  timer
> ERR:          0
>
> Seems like IRQ2 is very popular, so it's hard to say which device has 
> generated the interrupts...

Yep - you'll be guaranteed to get a few IDE interrupts just by calling 
up cat - might be possible to get away without too much interrupts 
generated if it's all in the buffer cache - try whether the interrupt 
count changes after a few repetitions of that command.

Might require more elaborate IRQ bookkeeping though.

> Should the assigned irq name match the module name?
No, that's just the string passed to request_irq. I'm not aware of a 
policy mandating use of module names there.

Another question, after I had a look at your driver: are you certain 
mapping a size of 0x20 is enough for the Mark IV DMA engine? The latch 
register is at offset 0x8000 from the address register ...

All (or most) other ESP drivers use 16 bit transfer counts only - you 
set the 1230 to use 24 bit, can it actually do that?

Cheers,

    Michael
