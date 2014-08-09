From: Tuomas Vainikka <tuomas.vainikka@kopteri.net>
Subject: Re: m68k v3.16 status update
Date: Sat, 09 Aug 2014 09:45:59 +0300
Message-ID: <53E5C3A7.3040106@kopteri.net>
References: <CAMuHMdXodxq=Z8rQAZ7UUdzUzoPfQLFCSTkJziVeAsq8MMQxmQ@mail.gmail.com> <53E48C84.9090709@gmail.com> <53E4DDF1.9060701@kopteri.net> <53E54E6C.2040806@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-lb0-f180.google.com ([209.85.217.180]:37007 "EHLO
	mail-lb0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750961AbaHIGqG (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 9 Aug 2014 02:46:06 -0400
Received: by mail-lb0-f180.google.com with SMTP id v6so4392860lbi.25
        for <linux-m68k@vger.kernel.org>; Fri, 08 Aug 2014 23:46:02 -0700 (PDT)
In-Reply-To: <53E54E6C.2040806@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>

On 09.08.2014 01:25, Michael Schmitz wrote:
> Hi Tuomas,
>>>
>>> There's still the Amiga Zorro ESP patch out in limbo - DaveM 
>>> suggested a change to enable SCSI-2 features to help with extended 
>>> message bytes but that did not work as intended. Haven't had time to 
>>> follow that one up. Tuomas' fix to the driver to bypass DMA for 
>>> message in works OK though - do you want it submitted back to 
>>> linux-scsi as is, or wait for a perfect solution (pun on me ...)?
>>>
>>>
>> Just to refresh your memory, the final fix was not to bypass DMA at 
>> any level (I did that for the command transfer, but that didn't 
>> help), but to have a dedicated slave_configure() function in the 
>> Amiga Zorro ESP driver that would not enable TCQ.
>
> You guessed right about memory failing me - it wasn't about DMA in the 
> end (for some reason, I seem to have DMA stuck in my mind at the 
> moment), Do you see any other avenues to try and enable tagged 
> commands in the ESP chip? We tried one config register only so far...
>
I think I've tested almost all possible register settings for the chip, 
but it occurred to me that it is not enough to enable some chip features 
by flipping bits. The code in esp_scsi would need to be modified to 
handle the behaviour of these enabled features also.

So, rethinking the code in esp_scsi would be one option.

The second possibility is that I have a buggy chip in my setup. Removing 
a sticker from my SCSI-board revealed the chip to be an AMD AM53CF94.
There are different versions of the SCSI-boards out there with different 
chips; NCR, AMD, and QLogic, so if we had more people testing the driver 
we would find out if the chip is actually the problem. (Is anyone even 
testing the ISA/PCI cards that use esp_scsi?)

Those are my suggestions at the TCQ problem.

But do we really need TCQ?

-Tuomas
