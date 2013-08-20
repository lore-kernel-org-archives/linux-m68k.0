From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH 0/2] Experimental Amiga Zorro ESP driver
Date: Tue, 20 Aug 2013 21:36:22 +1200
Message-ID: <1ef2d87e4efecb2d8c8c2eaf8ac5fd51@gmail.com>
References: <1370552199-15048-1-git-send-email-schmitz@debian.org>	<520D4AE3.6040801@aalto.fi>	<520E76FC.9040803@aalto.fi>	<11425cb5ec432e2fbb7b675052e8b33d@gmail.com>	<520F5F81.7090409@aalto.fi>	<52102BEC.7000006@gmail.com>	<CAMuHMdV9vP-Qg2my5fyT+pa_WcDfZAPx5T1-4kXP8eD1oL8Kog@mail.gmail.com>	<52108CAF.1010700@gmail.com> <CAMuHMdWqNBjHKiDojPdjzuOV65QXzjeMX5VbtUvgU7VTP4iYFg@mail.gmail.com> <5211DBD8.5090801@gmail.com> <5212840A.4080300@aalto.fi>
Mime-Version: 1.0 (Apple Message framework v624)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:59139 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750791Ab3HTJge (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 20 Aug 2013 05:36:34 -0400
Received: by mail-pa0-f51.google.com with SMTP id lf1so490540pab.24
        for <linux-m68k@vger.kernel.org>; Tue, 20 Aug 2013 02:36:33 -0700 (PDT)
In-Reply-To: <5212840A.4080300@aalto.fi>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Tuomas Vainikka <tuomas.vainikka@aalto.fi>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>

Tuomas,

> I guess those two bytes have something to do with target 
> (re)selection... There are two different ways of attempting to read 
> these bytes in the code, one is reading them from the FIFO byte by 
> byte, and the other way is to setup a DMA read (write from device). 
> The two different schemes are used in two different functions, and I 
> do not understand why one method would be preferred over the other 
> when comparing these functions.

What the driver attempts to read on reselection are the tag bytes that 
were used in the previous disconnect. These have to match otherwise we 
are not reselecting the command we need.

No idea which functions you refer to regarding PIO (reading from FIFO). 
Anyway, the DMA will read from the same FIFO that the CPU would, if I 
understand DMA correctly. There really should be no difference-

> I think I managed to find these two bytes; They are not ready for DMA, 
> but are sitting in the FIFO waiting to be read.
> So the loop before the "IRQ2 timeout" is waiting for an interrupt that 
> would tell that the DMA transfer has finished.

The loop checks whether the ESP status indicates the transfer is done - 
if the bytes are still stuck in the FIFO I'd guess the DMA does not 
bother to transfer for such small transfer counts.

The DMA transfer function can be changed to fetch less than seven bytes 
from the FIFO by PIO instead of setting up DMA transfer (just poll the 
FIFO after sending the command to the ESP, instead of first setting up 
the DMA then sending the command),

I haven't yet merged your changes into my source - will try to do that 
tomorrow.

Cheers,

	Michael


> ...
>
> [13433.390000] ESP: Disconnecting tgt[1] tag[20:0]
> [13433.400000] zorro_esp_irq_pending(): ESP_STATUS = 0x97, 2 bytes in 
> FIFO.
> [13433.400000] ESP: intr sreg[97] seqreg[04] sreg2[00] ireg[0c]
> [13433.400000] ESP: reconnect tag, zorro_esp_irq_pending(): ESP_STATUS 
> = 0x97, 0 bytes in FIFO.
> [13433.400000] IRQ(0:10:97), zorro_esp: esp_count = 2,  dma_count = 2, 
> addr = 0x7fa59000. Writing.
> [13433.400000] zorro_esp_irq_pending(): ESP_STATUS = 0x17, 2 bytes in 
> FIFO.
> [13433.400000] zorro_esp_irq_pending(): ESP_STATUS = 0x17, 2 bytes in 
> FIFO.
> [13433.400000] zorro_esp_irq_pending(): ESP_STATUS = 0x17, 2 bytes in 
> FIFO.
> [13433.400000] zorro_esp_irq_pending(): ESP_STATUS = 0x17, 2 bytes in 
> FIFO.
> [13433.400000] zorro_esp_irq_pending(): ESP_STATUS = 0x17, 2 bytes in 
> FIFO.
> [13433.400000] zorro_esp_irq_pending(): ESP_STATUS = 0x17, 2 bytes in 
> FIFO.
> [13433.400000] zorro_esp_irq_pending(): ESP_STATUS = 0x17, 2 bytes in 
> FIFO.
> [13433.400000] zorro_esp_irq_pending(): ESP_STATUS = 0x17, 2 bytes in 
> FIFO.
> [13433.400000] zorro_esp_irq_pending(): ESP_STATUS = 0x17, 2 bytes in 
> FIFO.
> [13433.400000] zorro_esp_irq_pending(): ESP_STATUS = 0x17, 2 bytes in 
> FIFO.
> [13433.400000] zorro_esp_irq_pending(): ESP_STATUS = 0x17, 2 bytes in 
> FIFO.
> [13433.400000] zorro_esp_irq_pending(): ESP_STATUS = 0x17, 2 bytes in 
> FIFO.
> [13433.400000] zorro_esp_irq_pending(): ESP_STATUS = 0x17, 2 bytes in 
> FIFO.
> [13433.400000] zorro_esp_irq_pending(): ESP_STATUS = 0x17, 2 bytes in 
> FIFO.
> [13433.400000] zorro_esp_irq_pending(): ESP_STATUS = 0x17, 2 bytes in 
> FIFO.
> ...
> Remember that write is read :)
>
> Now, I guess, I have to check whether those two bytes contain the 
> right information...
>
> -Tuomas
> <zesp014.cap.gz>
