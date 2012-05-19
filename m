From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: EtherNat drivers (was: Re: Atari ROM port ISA)
Date: Sat, 19 May 2012 16:06:08 +1200
Message-ID: <4FB71C30.70609@gmail.com>
References: <CAL4YKD6eQN4jOO4LoiDTXLXYBffchPd4Wfjihf-_qnbSZ32+zg@mail.gmail.com> <4FB5FD8E.7030400@gmail.com> <CAL4YKD4Q+SqHhTo+V4iWzGo6X9Gqs-r2yr5kKJk2TkR=cQqnTA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:46509 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750703Ab2ESEGM (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 19 May 2012 00:06:12 -0400
Received: by pbbrp8 with SMTP id rp8so4726836pbb.19
        for <linux-m68k@vger.kernel.org>; Fri, 18 May 2012 21:06:12 -0700 (PDT)
In-Reply-To: <CAL4YKD4Q+SqHhTo+V4iWzGo6X9Gqs-r2yr5kKJk2TkR=cQqnTA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: =?ISO-8859-1?Q?David_G=E1lvez?= <dgalvez75@gmail.com>
Cc: Michael Schmitz <schmitzmic@googlemail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org

Hi David,
>> That's good - now what is the transmit/receive speed you get with this
>> driver on a large file transfer?
>>
> Transfer by ftp of a 230 MB file, CT060 Falcon is the server, and my
> Ubuntu machine the client.
> Receiving the file the speed stabilizes around 85 KB/s.
> Transmitting the speed stabilizes around 105 KB/s
That's not that great - I think I can get similar speeds with the 
EtherNEC. Do you know how to use netcat?
>
>
>>> The addresses are these:
>>>
>>> ISP116X_HCD_ADDR        0x80000016
>>> ISP116X_HCD_DATA        0x80000012
>> I don't think I tried that combination - where did you find that?
>>
> Those addresses are used by the Ethernat USB driver for MiNT, which
> it's working quite well.
I've never seen MiNT sources for the EtherNAT USB. Can I download that 
somewhere to check how the register access is done there?
>
>
>> Anyway, new test kernel on the way. Won't do anything useful with the USB
>> chipset other than hopefully probe it OK.
>>
> Below, you can find what I'm getting with this new kernel and module.
> One important thing, ISP116x data bus has 16 bits, the EtherNat
> hardware swaps both bytes before writing them to the bus or after
> reading from it. I'm sure the driver doesn't consider this, so I think
> this is the reason why an ivalid chip ID is gotten.
The ISP1160 is a little endian device, as is the SMC91C111. For the 
91C111, the driver swaps bytes in word or longword transfers; there's no 
hardware byte swap apparently. For the ISP116x driver, the bus is 
assumed to be little endian and the driver swaps all word transfers.

I'll change that to use non-swapped accessors, let's see how that goes.
> usbcore: registered new interface driver usbfs
> usbcore: registered new interface driver hub
> usbcore: registered new device driver usb
> isp116x-hcd isp116x-hcd: ISP116x Host Controller
> isp116x-hcd isp116x-hcd: new USB bus registered, assigned bus number 1
> 116x: Clock not ready after 15ms
> 116x: Please make sure that the H_WAKEUP pin is pulled low!
> isp116x-hcd isp116x-hcd: irq 139, io base 0x80000012
> 116x: Invalid chip ID 1000
> isp116x-hcd isp116x-hcd: startup error -19
> isp116x-hcd isp116x-hcd: USB bus 1 deregistered
> 116x: init error, -19
Seems I've left my debug hacks in the driver :-) My Falcon reports the 
exact same thing so maybe the USB part of the EtherNAT is still working.

Byte swapping makes the chip ID come out as 0010. It should be something 
like 61xx. I'll send the new module anyway, maybe your result is different.

Thanks,

   Michael
