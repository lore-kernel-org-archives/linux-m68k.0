From: Tuomas Vainikka <tuomas.vainikka@aalto.fi>
Subject: Re: [PATCH 0/2] Experimental Amiga Zorro ESP driver
Date: Wed, 11 Sep 2013 16:08:35 +0300
Message-ID: <52306B53.6030306@aalto.fi>
References: <1370552199-15048-1-git-send-email-schmitz@debian.org> <520D4AE3.6040801@aalto.fi> <520E76FC.9040803@aalto.fi> <11425cb5ec432e2fbb7b675052e8b33d@gmail.com> <520F5F81.7090409@aalto.fi> <52102BEC.7000006@gmail.com> <CAMuHMdV9vP-Qg2my5fyT+pa_WcDfZAPx5T1-4kXP8eD1oL8Kog@mail.gmail.com> <52108CAF.1010700@gmail.com> <CAMuHMdWqNBjHKiDojPdjzuOV65QXzjeMX5VbtUvgU7VTP4iYFg@mail.gmail.com> <5211DBD8.5090801@gmail.com> <5212840A.4080300@aalto.fi> <1ef2d87e4efecb2d8c8c2eaf8ac5fd51@gmail.com> <52133E48.50501@aalto.fi> <CAOmrzkKtB4OpnFNFh9PR4V8bc3ExfFXpwtkhGj0veQ4w-d=cqA@mail.gmail.com> <522F8B67.2080603@aalto.fi> <CAOmrzkKP4YcvnHcrtucMvS9WSaeg+6-qnobOWN6hBK=wkUHemg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx06.aalto.fi ([130.233.222.105]:39665 "EHLO mx06.aalto.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753184Ab3IKNIj (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Wed, 11 Sep 2013 09:08:39 -0400
In-Reply-To: <CAOmrzkKP4YcvnHcrtucMvS9WSaeg+6-qnobOWN6hBK=wkUHemg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>

On 09/11/2013 01:12 PM, Michael Schmitz wrote:
> Hello Tuomas,
>
>>> That's the attitude - my suggestion was purely pragmatic, in order to
>>> overcome that particular roadblock and see whether there's further
>>> issues. But fixing this properly would be much preferred.
>>>
>>> David Miller is still maintainer of the ESP code - I can't think of
>>> anyone better suited to answer ESP specific questions really.
>>>
>>> Cheers,
>>>
>>>     Michael
>>>
>> I got it to work. Somehow, at least. I wrote the driver to use PIO for
>> command block reads and writes, and found out that it didn't fix the
> Thanks, that does indeed absolve DMA.
>
>> problem. Using PIO, only the first byte of the tag message comes through. It
>> might not be esp_scsi's fault, but there seems to be an assumption that all
>> devices support TCQ. Also, no SCSI-2 features seem to be enabled in the chip
>> by esp_scsi.
> I'd have to check with DaveM, but such an assumption might in fact exist.
>
> SCSI-2 features might have been disabled in response to your disk's
> response in the device configure phase. Maybe someone with a newer
In fact, the features are never enabled under any circumstance. But, 
they only seem to add some functionality in how queue tag messages are 
processed by the chip and not necessarily forbid the functionality if 
not used.
> SCSI disk (one that does support TCQ from scratch, and the full SCSI-2
> command set or better) should try the original driver sometime.
>
> What exactly does your device support - SCSI-1, SCSI-2 CCS, SCSI-2 or
> higher? (Apologies for asking this - it will be in one of your old
> logs but I cannot easily read these here.)
>
The drive you would find by searching with the model number in the logs 
would point you to an IDE drive, which is actually connected to a bridge 
adapter (ACard AEC-7720U) that supports full Ultra SCSI features. I also 
have a 'real' ST51080N that supports Fast SCSI-2 that I've also tested 
with the driver to no avail. I will double check again with the real 
SCSI drive to ascertain that the bridge adapter is not the culprit, just 
to make sure.

-Tuomas
