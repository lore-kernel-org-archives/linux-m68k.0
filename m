From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: EtherNat drivers (was: Re: Atari ROM port ISA)
Date: Sun, 20 May 2012 09:50:31 +1200
Message-ID: <4FB815A7.3030206@gmail.com>
References: <CAL4YKD6eQN4jOO4LoiDTXLXYBffchPd4Wfjihf-_qnbSZ32+zg@mail.gmail.com> <4FB5FD8E.7030400@gmail.com> <CAL4YKD4Q+SqHhTo+V4iWzGo6X9Gqs-r2yr5kKJk2TkR=cQqnTA@mail.gmail.com> <4FB71C30.70609@gmail.com> <CAL4YKD7qS8midQ-ugPZfDOMYasxorJNWgxP_r08iiocM1dc0CA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:52327 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754144Ab2ESVug (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 19 May 2012 17:50:36 -0400
Received: by dady13 with SMTP id y13so5232513dad.19
        for <linux-m68k@vger.kernel.org>; Sat, 19 May 2012 14:50:35 -0700 (PDT)
In-Reply-To: <CAL4YKD7qS8midQ-ugPZfDOMYasxorJNWgxP_r08iiocM1dc0CA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: =?ISO-8859-1?Q?David_G=E1lvez?= <dgalvez75@gmail.com>
Cc: Michael Schmitz <schmitzmic@googlemail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org

David,
> That's not that great - I think I can get similar speeds with the EtherNEC.
> Do you know how to use netcat?
>
> No, I've never used it, but I can learn :-)
I'll send you what I used in my tests (reading from /dev/zero on one 
end, writing to /dev/null on the other).

> To have something to be compared to, these are the speed values under
> MiNT with the same file, MiNT as ftp server:
>
> Transferring is around 1.1 MB/s
> Receiving is around 630 KB/s
That's more like it.
> I wonder if the culprit of the low transfer values under Linux is the
> driver. I mean, for me here under Linux everything seems very slow,
> long booting time, install a packet with apt-get also takes very long.
> Don't you think that this issue of kernel only able to be run from
> ST-Ram is the culprit here? When a module is installed  where is
> loaded into the ST-Ram or TT-Ram?
I don't honestly know - I't think it would be TT-RAM though.

Kernel load times and response times have degraded progressively since 
the 2.4 series. On the same hardware.
>> I've never seen MiNT sources for the EtherNAT USB. Can I download that
>> somewhere to check how the register access is done there?
>>
> http://sparemint.org/cgi-bin/cvsweb/freemint/sys/usb/src.km/ucd/ethernat/#dirlist
I'll take a look at that.
> The good news is that the routines to access the data bus of the
> ISP116x chip are almost the same in both drivers.
> Take a look at the changes I did in the functions
> write_ptddata_to_fifo and read_ptddata_from_fifo in the MiNT driver.
> Also in functions pack_fifo and unpack_fifo there are changes
> regarding swapping bytes
Thanks, I don't think we've got to anything in relation to the PTD data 
yet (that uses __raw_inw on Linux which still may have endianness issues).
>> The ISP1160 is a little endian device, as is the SMC91C111. For the 91C111,
>> the driver swaps bytes in word or longword transfers; there's no hardware
>> byte swap apparently. For the ISP116x driver, the bus is assumed to be
>> little endian and the driver swaps all word transfers.
>>
>> I'll change that to use non-swapped accessors, let's see how that goes.
>>
> Consider also the function isp116x_write_addr in isp116x.h, this
> function shouldn't swap the bytes to write the register addresses to
> the bus because is going to be done by EtherNat hardware. I think
> Linux driver is writing wrong register addresses because this.
No, I've removed the byte swapping from both read and write accessors. 
Register numbers should be OK that way.

>> Byte swapping makes the chip ID come out as 0010. It should be something
>> like 61xx. I'll send the new module anyway, maybe your result is different.
>>
> I get the same as you.
Still hope for my EtherNAT then :-)

I'll poke around some more and post what patches I have for USB.

Thanks yet again,

   Michael
