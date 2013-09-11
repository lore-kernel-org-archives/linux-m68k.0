From: Tuomas Vainikka <tuomas.vainikka@aalto.fi>
Subject: Re: [PATCH 0/2] Experimental Amiga Zorro ESP driver
Date: Wed, 11 Sep 2013 23:14:09 +0300
Message-ID: <5230CF11.1000901@aalto.fi>
References: <1370552199-15048-1-git-send-email-schmitz@debian.org> <520D4AE3.6040801@aalto.fi> <520E76FC.9040803@aalto.fi> <11425cb5ec432e2fbb7b675052e8b33d@gmail.com> <520F5F81.7090409@aalto.fi> <52102BEC.7000006@gmail.com> <CAMuHMdV9vP-Qg2my5fyT+pa_WcDfZAPx5T1-4kXP8eD1oL8Kog@mail.gmail.com> <52108CAF.1010700@gmail.com> <CAMuHMdWqNBjHKiDojPdjzuOV65QXzjeMX5VbtUvgU7VTP4iYFg@mail.gmail.com> <5211DBD8.5090801@gmail.com> <5212840A.4080300@aalto.fi> <1ef2d87e4efecb2d8c8c2eaf8ac5fd51@gmail.com> <52133E48.50501@aalto.fi> <CAOmrzkKtB4OpnFNFh9PR4V8bc3ExfFXpwtkhGj0veQ4w-d=cqA@mail.gmail.com> <522F8B67.2080603@aalto.fi> <CAOmrzkKP4YcvnHcrtucMvS9WSaeg+6-qnobOWN6hBK=wkUHemg@mail.gmail.com> <52306B53.6030306@aalto.fi>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="------------060006010602060504050206"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx03.aalto.fi ([130.233.222.102]:44324 "EHLO mx03.aalto.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932080Ab3IKUOM (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Wed, 11 Sep 2013 16:14:12 -0400
In-Reply-To: <52306B53.6030306@aalto.fi>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>

--------------060006010602060504050206
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/11/2013 04:08 PM, Tuomas Vainikka wrote:
> On 09/11/2013 01:12 PM, Michael Schmitz wrote:
>> Hello Tuomas,
>>
>>>> That's the attitude - my suggestion was purely pragmatic, in order to
>>>> overcome that particular roadblock and see whether there's further
>>>> issues. But fixing this properly would be much preferred.
>>>>
>>>> David Miller is still maintainer of the ESP code - I can't think of
>>>> anyone better suited to answer ESP specific questions really.
>>>>
>>>> Cheers,
>>>>
>>>>     Michael
>>>>
>>> I got it to work. Somehow, at least. I wrote the driver to use PIO for
>>> command block reads and writes, and found out that it didn't fix the
>> Thanks, that does indeed absolve DMA.
>>
>>> problem. Using PIO, only the first byte of the tag message comes 
>>> through. It
>>> might not be esp_scsi's fault, but there seems to be an assumption 
>>> that all
>>> devices support TCQ. Also, no SCSI-2 features seem to be enabled in 
>>> the chip
>>> by esp_scsi.
>> I'd have to check with DaveM, but such an assumption might in fact 
>> exist.
>>
>> SCSI-2 features might have been disabled in response to your disk's
>> response in the device configure phase. Maybe someone with a newer
> In fact, the features are never enabled under any circumstance. But, 
> they only seem to add some functionality in how queue tag messages are 
> processed by the chip and not necessarily forbid the functionality if 
> not used.
>> SCSI disk (one that does support TCQ from scratch, and the full SCSI-2
>> command set or better) should try the original driver sometime.
>>
>> What exactly does your device support - SCSI-1, SCSI-2 CCS, SCSI-2 or
>> higher? (Apologies for asking this - it will be in one of your old
>> logs but I cannot easily read these here.)
>>
> The drive you would find by searching with the model number in the 
> logs would point you to an IDE drive, which is actually connected to a 
> bridge adapter (ACard AEC-7720U) that supports full Ultra SCSI 
> features. I also have a 'real' ST51080N that supports Fast SCSI-2 that 
> I've also tested with the driver to no avail. I will double check 
> again with the real SCSI drive to ascertain that the bridge adapter is 
> not the culprit, just to make sure.
>
The driver without the slave_configure hack fails with the same IRQ2 
timeout when the ST51080N hdd is used (see zesp164_orig_slave_cfg.cap).
When the hack is enabled, the hdd works like a charm; none of the 
aforementioned messages (wrong page, write again) are produced (and the 
speed is nearly acceptable :-) ) (see zesp165_hacked_slave_cfg.cap).

-Tuomas

--------------060006010602060504050206
Content-Type: application/x-gzip; name="zesp164_orig_slave_cfg.cap.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="zesp164_orig_slave_cfg.cap.gz"

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
--------------060006010602060504050206
Content-Type: application/x-gzip; name="zesp165_hacked_slave_cfg.cap.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="zesp165_hacked_slave_cfg.cap.gz"

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
--------------060006010602060504050206--
