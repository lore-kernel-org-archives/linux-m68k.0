From: Tuomas Vainikka <tuomas.vainikka@aalto.fi>
Subject: Re: [PATCH 0/2] Experimental Amiga Zorro ESP driver
Date: Sun, 18 Aug 2013 12:14:47 +0300
Message-ID: <52109087.5070702@aalto.fi>
References: <1370552199-15048-1-git-send-email-schmitz@debian.org>	<520D4AE3.6040801@aalto.fi>	<520E76FC.9040803@aalto.fi>	<11425cb5ec432e2fbb7b675052e8b33d@gmail.com>	<520F5F81.7090409@aalto.fi>	<52102BEC.7000006@gmail.com> <CAMuHMdV9vP-Qg2my5fyT+pa_WcDfZAPx5T1-4kXP8eD1oL8Kog@mail.gmail.com> <52108CAF.1010700@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="------------060108000702070603040402"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx06.aalto.fi ([130.233.222.105]:36470 "EHLO mx06.aalto.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751910Ab3HRJOu (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sun, 18 Aug 2013 05:14:50 -0400
In-Reply-To: <52108CAF.1010700@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

--------------060108000702070603040402
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/18/2013 11:58 AM, Michael Schmitz wrote:
> Geert,
>> On Sun, Aug 18, 2013 at 4:05 AM, Michael Schmitz 
>> <schmitzmic@gmail.com> wrote:
>>>>>> [  301.880000] esp: esp0: Reconnect IRQ2 timeout
>>
>> Beware that this message (incl. the number) is hardcoded in
>> drivers/scsi/esp_scsi.c:
>>
>>         if (i == ESP_RESELECT_TAG_LIMIT) {
>>                 printk(KERN_ERR PFX "esp%d: Reconnect IRQ2 timeout\n",
>>                        esp->host->unique_id);
>>                 return NULL;
>>         }
>>
>> The driver prints "IRQ1" or "IRQ2".
>>
>> Fortunately, IRQ_AMIGA_PORTS is 2, but this is purely coincidentally...
>
> The driver attempts to DMA two bytes - can the DMA on the Zorro ESP 
> cards handle such short transfers?
>
> I'll also need to check the command_block and command_block_dma 
> addresses - does the DMA require virtual or physical addresses?
>
>>>>> Are there interrupts logged for IRQ2 at all (cat 
>>>>> /proc/interrupts)? It
>>>>> looks to me as though all DMA transfers fail (the first command to 
>>>>> fail is
>>>>> READ_CAPACITY which would usually be issued right after IDENTIFY 
>>>>> IIRC).
>>>> root@amiga:/# cat /proc/interrupts
>>>>            CPU0
>>>>   2:    1066320      auto  CIAA, zorro8390, ide0, Amiga Zorro ESP
>>>>   6:     456970      auto  CIAB
>>>>   8:      38239     amiga  serial TX
>>>>   9:          0     amiga  floppy_dma
>>>>  12:     315934     amiga  fb vertb handler
>>>>  13:     315741     amiga  serial status
>>>>  15:          0     amiga  DMA sound
>>>>  19:        401     amiga  serial RX
>>>>  23:          1       cia  floppy_timer
>>>>  25:          0       cia  amikbd
>>>>  27:     456971       cia  timer
>>>> ERR:          0
>>>>
>>>> Seems like IRQ2 is very popular, so it's hard to say which device has
>>>> generated the interrupts...
>>> Yep - you'll be guaranteed to get a few IDE interrupts just by 
>>> calling up
>>> cat - might be possible to get away without too much interrupts 
>>> generated if
>>> it's all in the buffer cache - try whether the interrupt count 
>>> changes after
>>> a few repetitions of that command.
>>>
>>> Might require more elaborate IRQ bookkeeping though.
>>
>> I guess scsi_esp_intr() is called a lot, as it's a shared interrupt?
>
> That's right - it will indeed be called a lot.
>
>> Can you add some debug prints there, to see if any of the conditions the
>> esp core checks are met?
> The code in question polls for completion in the ESP chip interrupt 
> register, so checking in scsi_esp_intr won't help there. I suspect the 
> ESP gets stuck because the DMA operation never completes. Wonder 
> whether we can just do PIO in send_dma_cmd() in these cases ...
>
The original blz1230 / blz2060 drivers did PIO commands. I attached a 
log of modprobing first without interrupt messages and then with the 
interrupt messages, because, indeed, the zorro_esp_irq_pending function 
gets called a lot, and it takes forever to printk those messages. I have 
no idea about the correct iomappings for the registers, nor do I know 
about the correct sizes for them. I have no idea where to use physical 
addresses and where to use virtual addresses...

What is the difference between ioremap() and ZTWO_VADDR() and which one 
should be used where?

-Tuomas


--------------060108000702070603040402
Content-Type: application/x-gzip; name="zorro_esp.c.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="zorro_esp.c.gz"

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
sZO0s8J2IMooSEuFZqD4D+9tW23TNwAA
--------------060108000702070603040402
Content-Type: application/x-gzip; name="zesp001.cap.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="zesp001.cap.gz"

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
AQYYYIABBhh/IMb/ABskXUTQjgEA
--------------060108000702070603040402--
