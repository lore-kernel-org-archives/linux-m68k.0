From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/2] Experimental Amiga Zorro ESP driver
Date: Sun, 18 Aug 2013 10:23:15 +0200
Message-ID: <CAMuHMdV9vP-Qg2my5fyT+pa_WcDfZAPx5T1-4kXP8eD1oL8Kog@mail.gmail.com>
References: <1370552199-15048-1-git-send-email-schmitz@debian.org>
	<520D4AE3.6040801@aalto.fi>
	<520E76FC.9040803@aalto.fi>
	<11425cb5ec432e2fbb7b675052e8b33d@gmail.com>
	<520F5F81.7090409@aalto.fi>
	<52102BEC.7000006@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f52.google.com ([209.85.160.52]:63643 "EHLO
	mail-pb0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752710Ab3HRIXQ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 18 Aug 2013 04:23:16 -0400
Received: by mail-pb0-f52.google.com with SMTP id wz12so3652248pbc.25
        for <linux-m68k@vger.kernel.org>; Sun, 18 Aug 2013 01:23:16 -0700 (PDT)
In-Reply-To: <52102BEC.7000006@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Tuomas Vainikka <tuomas.vainikka@aalto.fi>, Linux/m68k <linux-m68k@vger.kernel.org>

On Sun, Aug 18, 2013 at 4:05 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
>>>> [  301.880000] esp: esp0: Reconnect IRQ2 timeout

Beware that this message (incl. the number) is hardcoded in
drivers/scsi/esp_scsi.c:

        if (i == ESP_RESELECT_TAG_LIMIT) {
                printk(KERN_ERR PFX "esp%d: Reconnect IRQ2 timeout\n",
                       esp->host->unique_id);
                return NULL;
        }

The driver prints "IRQ1" or "IRQ2".

Fortunately, IRQ_AMIGA_PORTS is 2, but this is purely coincidentally...

>>> Are there interrupts logged for IRQ2 at all (cat /proc/interrupts)? It
>>> looks to me as though all DMA transfers fail (the first command to fail is
>>> READ_CAPACITY which would usually be issued right after IDENTIFY IIRC).
>>
>> root@amiga:/# cat /proc/interrupts
>>            CPU0
>>   2:    1066320      auto  CIAA, zorro8390, ide0, Amiga Zorro ESP
>>   6:     456970      auto  CIAB
>>   8:      38239     amiga  serial TX
>>   9:          0     amiga  floppy_dma
>>  12:     315934     amiga  fb vertb handler
>>  13:     315741     amiga  serial status
>>  15:          0     amiga  DMA sound
>>  19:        401     amiga  serial RX
>>  23:          1       cia  floppy_timer
>>  25:          0       cia  amikbd
>>  27:     456971       cia  timer
>> ERR:          0
>>
>> Seems like IRQ2 is very popular, so it's hard to say which device has
>> generated the interrupts...
>
>
> Yep - you'll be guaranteed to get a few IDE interrupts just by calling up
> cat - might be possible to get away without too much interrupts generated if
> it's all in the buffer cache - try whether the interrupt count changes after
> a few repetitions of that command.
>
> Might require more elaborate IRQ bookkeeping though.

I guess scsi_esp_intr() is called a lot, as it's a shared interrupt?
Can you add some debug prints there, to see if any of the conditions the
esp core checks are met?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
