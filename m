From: Vainikka Tuomas <tuomas.vainikka@aalto.fi>
Subject: Re: m68k v3.16 status update
Date: Thu, 14 Dec 2017 12:07:57 +0000
Message-ID: <4403d779c1664692ae5a7ef5b69ec888@aalto.fi>
References: <CAMuHMdXodxq=Z8rQAZ7UUdzUzoPfQLFCSTkJziVeAsq8MMQxmQ@mail.gmail.com>
 <53E48C84.9090709@gmail.com> <53E4DDF1.9060701@kopteri.net>
 <53E54E6C.2040806@gmail.com>
 <53E5C3A7.3040106@kopteri.net>,<68e92278-86e7-faef-f5b2-fbc514c27464@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp.aalto.fi ([130.233.228.121]:53436 "EHLO
        smtp-out-02.aalto.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751538AbdLNMNE (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 14 Dec 2017 07:13:04 -0500
In-Reply-To: <68e92278-86e7-faef-f5b2-fbc514c27464@gmail.com>
Content-Language: en-GB
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@vger.kernel.org>

Hello,

I do have the hardware, but unfortunately I do not have the time to test it.

-Tuomas
________________________________________
From: linux-m68k-owner@vger.kernel.org <linux-m68k-owner@vger.kernel.org> on behalf of Michael Schmitz <schmitzmic@gmail.com>
Sent: 14 December 2017 06:47
To: Tuomas Vainikka
Cc: Geert Uytterhoeven; linux-m68k
Subject: Re: m68k v3.16 status update

Tuomas,

are you still in the position to test tagged queue messages on Zorro ESP
hardware?

I've modified the Zorro ESP driver based on the work Finn Thain did for
the Mac ESP driver (handling message in transfer by PIO, with special
handshaking provisions for the message in case) and tried to test this
on elgar (CyberStorm I ESP) but the original bug does not show up there.
Might be to do with the SCSI disk used, or the CyberStorm I board.

Might be better to test the new code on your hardware where we know the
bug happened in the first place.

Cheers,

        Michael

Am 09.08.2014 um 18:45 schrieb Tuomas Vainikka:
> On 09.08.2014 01:25, Michael Schmitz wrote:
>> Hi Tuomas,
>>>>
>>>> There's still the Amiga Zorro ESP patch out in limbo - DaveM
>>>> suggested a change to enable SCSI-2 features to help with extended
>>>> message bytes but that did not work as intended. Haven't had time to
>>>> follow that one up. Tuomas' fix to the driver to bypass DMA for
>>>> message in works OK though - do you want it submitted back to
>>>> linux-scsi as is, or wait for a perfect solution (pun on me ...)?
>>>>
>>>>
>>> Just to refresh your memory, the final fix was not to bypass DMA at
>>> any level (I did that for the command transfer, but that didn't
>>> help), but to have a dedicated slave_configure() function in the
>>> Amiga Zorro ESP driver that would not enable TCQ.
>>
>> You guessed right about memory failing me - it wasn't about DMA in the
>> end (for some reason, I seem to have DMA stuck in my mind at the
>> moment), Do you see any other avenues to try and enable tagged
>> commands in the ESP chip? We tried one config register only so far...
>>
> I think I've tested almost all possible register settings for the chip,
> but it occurred to me that it is not enough to enable some chip features
> by flipping bits. The code in esp_scsi would need to be modified to
> handle the behaviour of these enabled features also.
>
> So, rethinking the code in esp_scsi would be one option.
>
> The second possibility is that I have a buggy chip in my setup. Removing
> a sticker from my SCSI-board revealed the chip to be an AMD AM53CF94.
> There are different versions of the SCSI-boards out there with different
> chips; NCR, AMD, and QLogic, so if we had more people testing the driver
> we would find out if the chip is actually the problem. (Is anyone even
> testing the ISA/PCI cards that use esp_scsi?)
>
> Those are my suggestions at the TCQ problem.
>
> But do we really need TCQ?
>
> -Tuomas
