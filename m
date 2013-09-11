From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH 0/2] Experimental Amiga Zorro ESP driver
Date: Wed, 11 Sep 2013 12:12:19 +0200
Message-ID: <CAOmrzkKP4YcvnHcrtucMvS9WSaeg+6-qnobOWN6hBK=wkUHemg@mail.gmail.com>
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
	<CAOmrzkKtB4OpnFNFh9PR4V8bc3ExfFXpwtkhGj0veQ4w-d=cqA@mail.gmail.com>
	<522F8B67.2080603@aalto.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-we0-f182.google.com ([74.125.82.182]:54256 "EHLO
	mail-we0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753577Ab3IKKMV (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 11 Sep 2013 06:12:21 -0400
Received: by mail-we0-f182.google.com with SMTP id q59so6801307wes.13
        for <linux-m68k@vger.kernel.org>; Wed, 11 Sep 2013 03:12:19 -0700 (PDT)
In-Reply-To: <522F8B67.2080603@aalto.fi>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Tuomas Vainikka <tuomas.vainikka@aalto.fi>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>

Hello Tuomas,

>> That's the attitude - my suggestion was purely pragmatic, in order to
>> overcome that particular roadblock and see whether there's further
>> issues. But fixing this properly would be much preferred.
>>
>> David Miller is still maintainer of the ESP code - I can't think of
>> anyone better suited to answer ESP specific questions really.
>>
>> Cheers,
>>
>>    Michael
>>
> I got it to work. Somehow, at least. I wrote the driver to use PIO for
> command block reads and writes, and found out that it didn't fix the

Thanks, that does indeed absolve DMA.

> problem. Using PIO, only the first byte of the tag message comes through. It
> might not be esp_scsi's fault, but there seems to be an assumption that all
> devices support TCQ. Also, no SCSI-2 features seem to be enabled in the chip
> by esp_scsi.

I'd have to check with DaveM, but such an assumption might in fact exist.

SCSI-2 features might have been disabled in response to your disk's
response in the device configure phase. Maybe someone with a newer
SCSI disk (one that does support TCQ from scratch, and the full SCSI-2
command set or better) should try the original driver sometime.

What exactly does your device support - SCSI-1, SCSI-2 CCS, SCSI-2 or
higher? (Apologies for asking this - it will be in one of your old
logs but I cannot easily read these here.)

> To cut the long story short, I hardwired TCQ off with a replacement function
> for esp_slave_configure().
> The replacement function resides in zorro_esp.c and is essentially doing the
> same thing as the original if ESP_DEFAULT_TAGS was set to zero in
> esp_scsi.h.
>
> There is no need for PIO with the above hack.

That's a good start - now can anyone remember whether the old Zorro
ESP drivers ever used or supported tagged commands? I would not want
to hassle DaveM for something that never worked before.

If we can find out how to detect that TCQ is unsupported, Dave could
splice that into the core esp_slave_configure() and solve our problem.

> I've attached a log of the module loading and some operations on the
> attached hdd. Note that there are messages such as
>
> [ 4627.040000] sd 0:0:0:0: [sda] Got wrong page
> and
> [ 5106.340000] sda1: WRITE SAME failed. Manually zeroing.

WRITE SAME might be unsupported by your device (guessing, I could not
find out where the message originates from). The 'got wrong page' I
had to look up, but it also appears to be a case of unsupported
feature.

> which don't seem normal.

The acid test is - did it destroy your filesystem?

If not, I'd say you did brilliantly.

Thanks again,

  Michael



On Tue, Sep 10, 2013 at 11:13 PM, Tuomas Vainikka
<tuomas.vainikka@aalto.fi> wrote:
> On 08/22/2013 11:34 PM, Michael Schmitz wrote:
>>
>> Hello Tuomas,
>>
>>>> No idea which functions you refer to regarding PIO (reading from FIFO).
>>>> Anyway, the DMA will read from the same FIFO that the CPU would, if I
>>>> understand DMA correctly. There really should be no difference-
>>>
>>> esp.scsi.c:1058 versus esp.scsi.c:1120
>>
>> I suppose this is because reconnect_with_tag() cannot rely on the tag
>> information already being in the FIFO when it is called from
>> esp_reconnect(). esp_reconnect() is called from the reselection
>> interrupt so the fifo data is already present.
>>
>>> In:
>>> http://pdf.datasheetcatalog.com/datasheet/AdvancedMicroDevices/mXxxsy.pdf
>>> page 42: Enable Selection/Reselection Command (Command Code 44H/C4H)
>>>
>>> explains why the bytes might end up in FIFO; The chip DMA got disabled at
>>> some point. Also, you need to explicitly issue a specific (don't know
>>> which,
>>> yet) command to let the DMA access the FIFO.
>>
>> The chip DMA should be activated by the ESP_CMD_DMA bit that is set in
>> all uses of send_dma_cmd. I can't see where the DMA would have been
>> disabled.
>>
>>>> The DMA transfer function can be changed to fetch less than seven bytes
>>>> from the FIFO by PIO instead of setting up DMA transfer (just poll the
>>>> FIFO
>>>> after sending the command to the ESP, instead of first setting up the
>>>> DMA
>>>> then sending the command),
>>>>
>>> I'd rather find out why and where the DMA is disabled before we resort to
>>> PIO. It is also possible that the chip interrupt is cleared prematurely
>>> by
>>> reading the interrupt register, in which case the interrupt is not seen
>>> by
>>> The Loop.
>>
>> That's the attitude - my suggestion was purely pragmatic, in order to
>> overcome that particular roadblock and see whether there's further
>> issues. But fixing this properly would be much preferred.
>>
>> David Miller is still maintainer of the ESP code - I can't think of
>> anyone better suited to answer ESP specific questions really.
>>
>> Cheers,
>>
>>    Michael
>>
> I got it to work. Somehow, at least. I wrote the driver to use PIO for
> command block reads and writes, and found out that it didn't fix the
> problem. Using PIO, only the first byte of the tag message comes through. It
> might not be esp_scsi's fault, but there seems to be an assumption that all
> devices support TCQ. Also, no SCSI-2 features seem to be enabled in the chip
> by esp_scsi.
>
> To cut the long story short, I hardwired TCQ off with a replacement function
> for esp_slave_configure().
> The replacement function resides in zorro_esp.c and is essentially doing the
> same thing as the original if ESP_DEFAULT_TAGS was set to zero in
> esp_scsi.h.
>
> There is no need for PIO with the above hack.
>
> I've attached a log of the module loading and some operations on the
> attached hdd. Note that there are messages such as
>
> [ 4627.040000] sd 0:0:0:0: [sda] Got wrong page
> and
> [ 5106.340000] sda1: WRITE SAME failed. Manually zeroing.
>
> which don't seem normal.
>
> -Tuomas
>
