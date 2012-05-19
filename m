From: =?ISO-8859-1?Q?David_G=E1lvez?= <dgalvez75@gmail.com>
Subject: Re: EtherNat drivers (was: Re: Atari ROM port ISA)
Date: Sat, 19 May 2012 11:30:51 +0200
Message-ID: <CAL4YKD7qS8midQ-ugPZfDOMYasxorJNWgxP_r08iiocM1dc0CA@mail.gmail.com>
References: <CAL4YKD6eQN4jOO4LoiDTXLXYBffchPd4Wfjihf-_qnbSZ32+zg@mail.gmail.com>
	<4FB5FD8E.7030400@gmail.com>
	<CAL4YKD4Q+SqHhTo+V4iWzGo6X9Gqs-r2yr5kKJk2TkR=cQqnTA@mail.gmail.com>
	<4FB71C30.70609@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:45499 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751287Ab2ESJav (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 19 May 2012 05:30:51 -0400
Received: by dady13 with SMTP id y13so4814202dad.19
        for <linux-m68k@vger.kernel.org>; Sat, 19 May 2012 02:30:51 -0700 (PDT)
In-Reply-To: <4FB71C30.70609@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org

Hi Michael,

2012/5/19 Michael Schmitz <schmitzmic@googlemail.com>:
> Hi David,
>> Transfer by ftp of a 230 MB file, CT060 Falcon is the server, and my
>> Ubuntu machine the client.
>> Receiving the file the speed stabilizes around 85 KB/s.
>> Transmitting the speed stabilizes around 105 KB/s
>
> That's not that great - I think I can get similar speeds with the EtherNEC.
> Do you know how to use netcat?
>

No, I've never used it, but I can learn :-)

To have something to be compared to, these are the speed values under
MiNT with the same file, MiNT as ftp server:

Transferring is around 1.1 MB/s
Receiving is around 630 KB/s

I wonder if the culprit of the low transfer values under Linux is the
driver. I mean, for me here under Linux everything seems very slow,
long booting time, install a packet with apt-get also takes very long.
Don't you think that this issue of kernel only able to be run from
ST-Ram is the culprit here? When a module is installed  where is
loaded into the ST-Ram or TT-Ram?

>
> I've never seen MiNT sources for the EtherNAT USB. Can I download that
> somewhere to check how the register access is done there?
>

http://sparemint.org/cgi-bin/cvsweb/freemint/sys/usb/src.km/ucd/ethernat/#dirlist

The good news is that the routines to access the data bus of the
ISP116x chip are almost the same in both drivers.
Take a look at the changes I did in the functions
write_ptddata_to_fifo and read_ptddata_from_fifo in the MiNT driver.
Also in functions pack_fifo and unpack_fifo there are changes
regarding swapping bytes

>> Below, you can find what I'm getting with this new kernel and module.
>> One important thing, ISP116x data bus has 16 bits, the EtherNat
>> hardware swaps both bytes before writing them to the bus or after
>> reading from it. I'm sure the driver doesn't consider this, so I think
>> this is the reason why an ivalid chip ID is gotten.
>
> The ISP1160 is a little endian device, as is the SMC91C111. For the 91C111,
> the driver swaps bytes in word or longword transfers; there's no hardware
> byte swap apparently. For the ISP116x driver, the bus is assumed to be
> little endian and the driver swaps all word transfers.
>
> I'll change that to use non-swapped accessors, let's see how that goes.
>

Consider also the function isp116x_write_addr in isp116x.h, this
function shouldn't swap the bytes to write the register addresses to
the bus because is going to be done by EtherNat hardware. I think
Linux driver is writing wrong register addresses because this.


>
> Byte swapping makes the chip ID come out as 0010. It should be something
> like 61xx. I'll send the new module anyway, maybe your result is different.
>

I get the same as you.

isp116x-hcd isp116x-hcd: ISP116x Host Controller
isp116x-hcd isp116x-hcd: new USB bus registered, assigned bus number 1
116x: Clock not ready after 15ms
116x: Please make sure that the H_WAKEUP pin is pulled low!
isp116x-hcd isp116x-hcd: irq 139, io base 0x80000012
116x: Invalid chip ID 0010
isp116x-hcd isp116x-hcd: startup error -19
isp116x-hcd isp116x-hcd: USB bus 1 deregistered
116x: init error, -19


Regards
