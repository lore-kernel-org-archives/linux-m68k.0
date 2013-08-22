From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH 0/2] Experimental Amiga Zorro ESP driver
Date: Fri, 23 Aug 2013 08:34:20 +1200
Message-ID: <CAOmrzkKtB4OpnFNFh9PR4V8bc3ExfFXpwtkhGj0veQ4w-d=cqA@mail.gmail.com>
References: <1370552199-15048-1-git-send-email-schmitz@debian.org>
	<520D4AE3.6040801@aalto.fi>
	<520E76FC.9040803@aalto.fi>
	<11425cb5ec432e2fbb7b675052e8b33d@gmail.com>
	<520F5F81.7090409@aalto.fi>
	<52102BEC.7000006@gmail.com>
	<CAMuHMdV9vP-Qg2my5fyT+pa_WcDfZAPx5T1-4kXP8eD1oL8Kog@mail.gmail.com>
	<52108CAF.1010700@gmail.com>
	<CAMuHMdWqNBjHKiDojPdjzuOV65QXzjeMX5VbtUvgU7VTP4iYFg@mail.gmail.com>
	<5211DBD8.5090801@gmail.com>
	<5212840A.4080300@aalto.fi>
	<1ef2d87e4efecb2d8c8c2eaf8ac5fd51@gmail.com>
	<52133E48.50501@aalto.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:48510 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752804Ab3HVUeV (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 22 Aug 2013 16:34:21 -0400
Received: by mail-ob0-f173.google.com with SMTP id ta17so4642923obb.32
        for <linux-m68k@vger.kernel.org>; Thu, 22 Aug 2013 13:34:20 -0700 (PDT)
In-Reply-To: <52133E48.50501@aalto.fi>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Tuomas Vainikka <tuomas.vainikka@aalto.fi>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>

Hello Tuomas,

>> No idea which functions you refer to regarding PIO (reading from FIFO).
>> Anyway, the DMA will read from the same FIFO that the CPU would, if I
>> understand DMA correctly. There really should be no difference-
>
> esp.scsi.c:1058 versus esp.scsi.c:1120

I suppose this is because reconnect_with_tag() cannot rely on the tag
information already being in the FIFO when it is called from
esp_reconnect(). esp_reconnect() is called from the reselection
interrupt so the fifo data is already present.

> In:
> http://pdf.datasheetcatalog.com/datasheet/AdvancedMicroDevices/mXxxsy.pdf
> page 42: Enable Selection/Reselection Command (Command Code 44H/C4H)
>
> explains why the bytes might end up in FIFO; The chip DMA got disabled at
> some point. Also, you need to explicitly issue a specific (don't know which,
> yet) command to let the DMA access the FIFO.

The chip DMA should be activated by the ESP_CMD_DMA bit that is set in
all uses of send_dma_cmd. I can't see where the DMA would have been
disabled.

>> The DMA transfer function can be changed to fetch less than seven bytes
>> from the FIFO by PIO instead of setting up DMA transfer (just poll the FIFO
>> after sending the command to the ESP, instead of first setting up the DMA
>> then sending the command),
>>
> I'd rather find out why and where the DMA is disabled before we resort to
> PIO. It is also possible that the chip interrupt is cleared prematurely by
> reading the interrupt register, in which case the interrupt is not seen by
> The Loop.

That's the attitude - my suggestion was purely pragmatic, in order to
overcome that particular roadblock and see whether there's further
issues. But fixing this properly would be much preferred.

David Miller is still maintainer of the ESP code - I can't think of
anyone better suited to answer ESP specific questions really.

Cheers,

  Michael




On Tue, Aug 20, 2013 at 10:00 PM, Tuomas Vainikka
<tuomas.vainikka@aalto.fi> wrote:
> On 08/20/2013 12:36 PM, Michael Schmitz wrote:
>>
>> Tuomas,
>>
>>> I guess those two bytes have something to do with target (re)selection...
>>> There are two different ways of attempting to read these bytes in the code,
>>> one is reading them from the FIFO byte by byte, and the other way is to
>>> setup a DMA read (write from device). The two different schemes are used in
>>> two different functions, and I do not understand why one method would be
>>> preferred over the other when comparing these functions.
>>
>>
>> What the driver attempts to read on reselection are the tag bytes that
>> were used in the previous disconnect. These have to match otherwise we are
>> not reselecting the command we need.
>>
>> No idea which functions you refer to regarding PIO (reading from FIFO).
>> Anyway, the DMA will read from the same FIFO that the CPU would, if I
>> understand DMA correctly. There really should be no difference-
>
> esp.scsi.c:1058 versus esp.scsi.c:1120
>
>>
>>> I think I managed to find these two bytes; They are not ready for DMA,
>>> but are sitting in the FIFO waiting to be read.
>>> So the loop before the "IRQ2 timeout" is waiting for an interrupt that
>>> would tell that the DMA transfer has finished.
>>
>>
>> The loop checks whether the ESP status indicates the transfer is done - if
>> the bytes are still stuck in the FIFO I'd guess the DMA does not bother to
>> transfer for such small transfer counts.
>
> In:
> http://pdf.datasheetcatalog.com/datasheet/AdvancedMicroDevices/mXxxsy.pdf
> page 42: Enable Selection/Reselection Command (Command Code 44H/C4H)
>
> explains why the bytes might end up in FIFO; The chip DMA got disabled at
> some point. Also, you need to explicitly issue a specific (don't know which,
> yet) command to let the DMA access the FIFO.
>
>>
>> The DMA transfer function can be changed to fetch less than seven bytes
>> from the FIFO by PIO instead of setting up DMA transfer (just poll the FIFO
>> after sending the command to the ESP, instead of first setting up the DMA
>> then sending the command),
>>
> I'd rather find out why and where the DMA is disabled before we resort to
> PIO. It is also possible that the chip interrupt is cleared prematurely by
> reading the interrupt register, in which case the interrupt is not seen by
> The Loop.
>
> -Tuomas
