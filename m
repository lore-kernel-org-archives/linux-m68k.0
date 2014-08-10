From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: m68k v3.16 status update
Date: Sun, 10 Aug 2014 13:44:13 +1200
Message-ID: <53E6CE6D.9040602@gmail.com>
References: <CAMuHMdXodxq=Z8rQAZ7UUdzUzoPfQLFCSTkJziVeAsq8MMQxmQ@mail.gmail.com> <53E48C84.9090709@gmail.com> <53E4DDF1.9060701@kopteri.net> <53E54E6C.2040806@gmail.com> <53E5C3A7.3040106@kopteri.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f180.google.com ([209.85.192.180]:59544 "EHLO
	mail-pd0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751575AbaHJBoM (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 9 Aug 2014 21:44:12 -0400
Received: by mail-pd0-f180.google.com with SMTP id v10so7080695pde.25
        for <linux-m68k@vger.kernel.org>; Sat, 09 Aug 2014 18:44:11 -0700 (PDT)
In-Reply-To: <53E5C3A7.3040106@kopteri.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Tuomas Vainikka <tuomas.vainikka@kopteri.net>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>

Tuomas,
>>
>> You guessed right about memory failing me - it wasn't about DMA in 
>> the end (for some reason, I seem to have DMA stuck in my mind at the 
>> moment), Do you see any other avenues to try and enable tagged 
>> commands in the ESP chip? We tried one config register only so far...
>>
> I think I've tested almost all possible register settings for the 
> chip, but it occurred to me that it is not enough to enable some chip 
> features by flipping bits. The code in esp_scsi would need to be 
> modified to handle the behaviour of these enabled features also.
>
> So, rethinking the code in esp_scsi would be one option.

Other versions of ESP SCSI cards do appear to handle TCQ correctly with 
the default configuration of the chip, i.e. pass on the additional 
message bytes without any problem. From that I'd guess reading the tag 
message works OK in the current esp_scsi code. Other features (target 
mode) we are not really interested in, and without a second initiator on 
the bus, nothing should ever try to select our ESP host. What else is 
there to look out for?

> The second possibility is that I have a buggy chip in my setup. 
> Removing a sticker from my SCSI-board revealed the chip to be an AMD 
> AM53CF94.
> There are different versions of the SCSI-boards out there with 
> different chips; NCR, AMD, and QLogic, so if we had more people 
> testing the driver we would find out if the chip is actually the 
> problem. (Is anyone even testing the ISA/PCI cards that use esp_scsi?)

Some Macs/PowerMacs use esp_scsi IIRC - I suspect we would have heard if 
the driver was broken altogether.

> Those are my suggestions at the TCQ problem.
>
> But do we really need TCQ?

Maybe not - if no one's missed the feature in the original Amiga ESP 
drivers, we probably shouldn't worry.

Cheers,

    Michael
