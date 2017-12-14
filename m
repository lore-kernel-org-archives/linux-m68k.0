From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: m68k v3.16 status update
Date: Fri, 15 Dec 2017 07:40:07 +1300
Message-ID: <CAOmrzkJJXZb153ig=d=Cywr59hid7X3UJvUD-wgtYtZm7KsCuQ@mail.gmail.com>
References: <CAMuHMdXodxq=Z8rQAZ7UUdzUzoPfQLFCSTkJziVeAsq8MMQxmQ@mail.gmail.com>
 <53E48C84.9090709@gmail.com> <53E4DDF1.9060701@kopteri.net>
 <53E54E6C.2040806@gmail.com> <53E5C3A7.3040106@kopteri.net>
 <68e92278-86e7-faef-f5b2-fbc514c27464@gmail.com> <4403d779c1664692ae5a7ef5b69ec888@aalto.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-it0-f46.google.com ([209.85.214.46]:40511 "EHLO
        mail-it0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754325AbdLNSkJ (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 14 Dec 2017 13:40:09 -0500
Received: by mail-it0-f46.google.com with SMTP id f190so13299442ita.5
        for <linux-m68k@vger.kernel.org>; Thu, 14 Dec 2017 10:40:08 -0800 (PST)
In-Reply-To: <4403d779c1664692ae5a7ef5b69ec888@aalto.fi>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Vainikka Tuomas <tuomas.vainikka@aalto.fi>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@vger.kernel.org>

Hi Tuomas,

fair enough - I'll get the PIO code tested by forcing PIO transfers on
elgar, and submit the driver for review once that's done. Maybe
someone else has a chance to test the fix in the meantime.

Cheers,

  Michael


On Fri, Dec 15, 2017 at 1:07 AM, Vainikka Tuomas
<tuomas.vainikka@aalto.fi> wrote:
> Hello,
>
> I do have the hardware, but unfortunately I do not have the time to test it.
>
> -Tuomas
> ________________________________________
> From: linux-m68k-owner@vger.kernel.org <linux-m68k-owner@vger.kernel.org> on behalf of Michael Schmitz <schmitzmic@gmail.com>
> Sent: 14 December 2017 06:47
> To: Tuomas Vainikka
> Cc: Geert Uytterhoeven; linux-m68k
> Subject: Re: m68k v3.16 status update
>
> Tuomas,
>
> are you still in the position to test tagged queue messages on Zorro ESP
> hardware?
>
> I've modified the Zorro ESP driver based on the work Finn Thain did for
> the Mac ESP driver (handling message in transfer by PIO, with special
> handshaking provisions for the message in case) and tried to test this
> on elgar (CyberStorm I ESP) but the original bug does not show up there.
> Might be to do with the SCSI disk used, or the CyberStorm I board.
>
> Might be better to test the new code on your hardware where we know the
> bug happened in the first place.
>
> Cheers,
>
>         Michael
>
> Am 09.08.2014 um 18:45 schrieb Tuomas Vainikka:
>> On 09.08.2014 01:25, Michael Schmitz wrote:
>>> Hi Tuomas,
>>>>>
>>>>> There's still the Amiga Zorro ESP patch out in limbo - DaveM
>>>>> suggested a change to enable SCSI-2 features to help with extended
>>>>> message bytes but that did not work as intended. Haven't had time to
>>>>> follow that one up. Tuomas' fix to the driver to bypass DMA for
>>>>> message in works OK though - do you want it submitted back to
>>>>> linux-scsi as is, or wait for a perfect solution (pun on me ...)?
>>>>>
>>>>>
>>>> Just to refresh your memory, the final fix was not to bypass DMA at
>>>> any level (I did that for the command transfer, but that didn't
>>>> help), but to have a dedicated slave_configure() function in the
>>>> Amiga Zorro ESP driver that would not enable TCQ.
>>>
>>> You guessed right about memory failing me - it wasn't about DMA in the
>>> end (for some reason, I seem to have DMA stuck in my mind at the
>>> moment), Do you see any other avenues to try and enable tagged
>>> commands in the ESP chip? We tried one config register only so far...
>>>
>> I think I've tested almost all possible register settings for the chip,
>> but it occurred to me that it is not enough to enable some chip features
>> by flipping bits. The code in esp_scsi would need to be modified to
>> handle the behaviour of these enabled features also.
>>
>> So, rethinking the code in esp_scsi would be one option.
>>
>> The second possibility is that I have a buggy chip in my setup. Removing
>> a sticker from my SCSI-board revealed the chip to be an AMD AM53CF94.
>> There are different versions of the SCSI-boards out there with different
>> chips; NCR, AMD, and QLogic, so if we had more people testing the driver
>> we would find out if the chip is actually the problem. (Is anyone even
>> testing the ISA/PCI cards that use esp_scsi?)
>>
>> Those are my suggestions at the TCQ problem.
>>
>> But do we really need TCQ?
>>
>> -Tuomas
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
