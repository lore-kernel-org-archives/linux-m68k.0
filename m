From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH 0/2] Experimental Amiga Zorro ESP driver
Date: Sun, 18 Aug 2013 20:58:23 +1200
Message-ID: <52108CAF.1010700@gmail.com>
References: <1370552199-15048-1-git-send-email-schmitz@debian.org>	<520D4AE3.6040801@aalto.fi>	<520E76FC.9040803@aalto.fi>	<11425cb5ec432e2fbb7b675052e8b33d@gmail.com>	<520F5F81.7090409@aalto.fi>	<52102BEC.7000006@gmail.com> <CAMuHMdV9vP-Qg2my5fyT+pa_WcDfZAPx5T1-4kXP8eD1oL8Kog@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f181.google.com ([209.85.192.181]:41913 "EHLO
	mail-pd0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752794Ab3HRI6q (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 18 Aug 2013 04:58:46 -0400
Received: by mail-pd0-f181.google.com with SMTP id g10so3830864pdj.12
        for <linux-m68k@vger.kernel.org>; Sun, 18 Aug 2013 01:58:46 -0700 (PDT)
In-Reply-To: <CAMuHMdV9vP-Qg2my5fyT+pa_WcDfZAPx5T1-4kXP8eD1oL8Kog@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Tuomas Vainikka <tuomas.vainikka@aalto.fi>, Linux/m68k <linux-m68k@vger.kernel.org>

Geert,
> On Sun, Aug 18, 2013 at 4:05 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
>   
>>>>> [  301.880000] esp: esp0: Reconnect IRQ2 timeout
>>>>>           
>
> Beware that this message (incl. the number) is hardcoded in
> drivers/scsi/esp_scsi.c:
>
>         if (i == ESP_RESELECT_TAG_LIMIT) {
>                 printk(KERN_ERR PFX "esp%d: Reconnect IRQ2 timeout\n",
>                        esp->host->unique_id);
>                 return NULL;
>         }
>
> The driver prints "IRQ1" or "IRQ2".
>
> Fortunately, IRQ_AMIGA_PORTS is 2, but this is purely coincidentally...
>   

The driver attempts to DMA two bytes - can the DMA on the Zorro ESP 
cards handle such short transfers?

I'll also need to check the command_block and command_block_dma 
addresses - does the DMA require virtual or physical addresses?

>   
>>>> Are there interrupts logged for IRQ2 at all (cat /proc/interrupts)? It
>>>> looks to me as though all DMA transfers fail (the first command to fail is
>>>> READ_CAPACITY which would usually be issued right after IDENTIFY IIRC).
>>>>         
>>> root@amiga:/# cat /proc/interrupts
>>>            CPU0
>>>   2:    1066320      auto  CIAA, zorro8390, ide0, Amiga Zorro ESP
>>>   6:     456970      auto  CIAB
>>>   8:      38239     amiga  serial TX
>>>   9:          0     amiga  floppy_dma
>>>  12:     315934     amiga  fb vertb handler
>>>  13:     315741     amiga  serial status
>>>  15:          0     amiga  DMA sound
>>>  19:        401     amiga  serial RX
>>>  23:          1       cia  floppy_timer
>>>  25:          0       cia  amikbd
>>>  27:     456971       cia  timer
>>> ERR:          0
>>>
>>> Seems like IRQ2 is very popular, so it's hard to say which device has
>>> generated the interrupts...
>>>       
>> Yep - you'll be guaranteed to get a few IDE interrupts just by calling up
>> cat - might be possible to get away without too much interrupts generated if
>> it's all in the buffer cache - try whether the interrupt count changes after
>> a few repetitions of that command.
>>
>> Might require more elaborate IRQ bookkeeping though.
>>     
>
> I guess scsi_esp_intr() is called a lot, as it's a shared interrupt?
>   

That's right - it will indeed be called a lot.

> Can you add some debug prints there, to see if any of the conditions the
> esp core checks are met?
>   
The code in question polls for completion in the ESP chip interrupt 
register, so checking in scsi_esp_intr won't help there. I suspect the 
ESP gets stuck because the DMA operation never completes. Wonder whether 
we can just do PIO in send_dma_cmd() in these cases ...

Cheers,

    Michael
