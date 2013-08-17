From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH 0/2] Experimental Amiga Zorro ESP driver
Date: Sat, 17 Aug 2013 13:49:51 +1200
Message-ID: <11425cb5ec432e2fbb7b675052e8b33d@gmail.com>
References: <1370552199-15048-1-git-send-email-schmitz@debian.org> <520D4AE3.6040801@aalto.fi> <520E76FC.9040803@aalto.fi>
Mime-Version: 1.0 (Apple Message framework v624)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f177.google.com ([209.85.192.177]:59013 "EHLO
	mail-pd0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751420Ab3HQBuC (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 16 Aug 2013 21:50:02 -0400
Received: by mail-pd0-f177.google.com with SMTP id y10so2894840pdj.22
        for <linux-m68k@vger.kernel.org>; Fri, 16 Aug 2013 18:50:01 -0700 (PDT)
In-Reply-To: <520E76FC.9040803@aalto.fi>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Tuomas Vainikka <tuomas.vainikka@aalto.fi>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, David Miller <davem@davemloft.net>, Geert Uytterhoeven <geert@linux-m68k.org>

HelloTuomas,

> On 08/16/2013 12:40 AM, Tuomas Vainikka wrote:
>> On 06/06/2013 11:56 PM, Michael Schmitz wrote:
>>> Geert,
>>>
>>> other than 'it compiles', I can't really say much about this one.
>>> I've done what seemed necessary to do the ESP probe setup in the
>>> zorro driver framework (using the NCR7xx driver as a guideline),
>>> and used the old Blizzard 2060 driver as a model for the DMA setup.
>>>
>>> To adapt to another style of ESP integration, the DMA setup function
>>> will need to be changed. The simplest way to cater for multipe boards
>>> in this driver may be to provide a separate DMA setup function for
>>> each, and substitute the correct one for the default esp_ops field in
>>> the driver probe. Please correct me if you see a better or simpler 
>>> way.
>> Thank you for rewriting the driver.
>>
>> I copypasted the appropriate DMA code from blz1230.c, and added some 
>> code to switch
>> to the appropriate function. I compiled the module, and was able to 
>> insert and remove it.

Thanks, I will merge that with my current version of the driver. Thanks 
also for testing!

>>
>> The dmesg output is attached. I also attached the modified 
>> zorro_esp.c.
>>
>> There is a HDD attached to the SCSI bus, but the scan does not take 
>> place.
>>
>> The chip on the controller is a FAS216, but it is identified as a 
>> FAS236. Does that matter?

I would not think so - David Miller as author of the ESP core might 
know better though. The m68k mac esp driver is the only one I ever 
worked on - fifteen years ago.

> I got a little further, but now there seems to be something wrong with 
> the IRQ:
>
> [  297.720000] esp: esp0, regs[80ea8000:80eb0000] irq[2]
> [  297.730000] esp: esp0 is a FAS236, 40 MHz (ccf=0), SCSI ID 7
> [  300.750000] scsi0 : esp
> [  301.020000] scsi 0:0:1:0: Direct-Access     SAMSUNG SP1213N         
>  TL10 PQ: 0 ANSI: 2
> [  301.030000] scsi target0:0:1: Beginning Domain Validation
> [  301.060000] scsi target0:0:1: FAST-10 SCSI 10.0 MB/s ST (100 ns, 
> offset 15)
> [  301.090000] scsi target0:0:1: Domain Validation skipping write tests
> [  301.100000] scsi target0:0:1: Ending Domain Validation
> [  301.880000] esp: esp0: Reconnect IRQ2 timeout

Are there interrupts logged for IRQ2 at all (cat /proc/interrupts)? It 
looks to me as though all DMA transfers fail (the first command to fail 
is READ_CAPACITY which would usually be issued right after IDENTIFY 
IIRC).

> [  332.040000] esp: esp0: Aborting command [0f9998a0:12]
> [  332.040000] esp: esp0: Current command [0f999940:25]
> [  332.040000] esp: esp0: Queued command [0f9998a0:12]
> [  332.040000] esp: esp0: Active command [0f999940:25]
> [  332.040000] esp: esp0: Dumping command log
> ...
>
> I attached a full log containing the dmesg output from both probing 
> and removing the module.

Thanks, I will try to make sense of the log...

Cheers,

	Michael


>
> -Tuomas
> <zorro_esp.c.gz><zorro_esp_modprobe2.cap.gz>
