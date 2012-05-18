From: =?ISO-8859-1?Q?David_G=E1lvez?= <dgalvez75@gmail.com>
Subject: Re: EtherNat drivers (was: Re: Atari ROM port ISA)
Date: Fri, 18 May 2012 21:26:03 +0200
Message-ID: <CAL4YKD4Q+SqHhTo+V4iWzGo6X9Gqs-r2yr5kKJk2TkR=cQqnTA@mail.gmail.com>
References: <CAL4YKD6eQN4jOO4LoiDTXLXYBffchPd4Wfjihf-_qnbSZ32+zg@mail.gmail.com>
	<4FB5FD8E.7030400@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:59606 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933049Ab2ERT0E convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 18 May 2012 15:26:04 -0400
Received: by pbbrp8 with SMTP id rp8so4340455pbb.19
        for <linux-m68k@vger.kernel.org>; Fri, 18 May 2012 12:26:03 -0700 (PDT)
In-Reply-To: <4FB5FD8E.7030400@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

2012/5/18 Michael Schmitz <schmitzmic@googlemail.com>:
> On 18/05/12 02:49, David G=E1lvez wrote:
>>
>> What interrupt does it report it uses? Do you see the card interrupt=
s
>> accumulate in /proc/interrupts?
>>
>> smc91x: IOADDR 0902c000 doesn't match configuration (300).
>> smc91x.c: v1.1, sep 22 2004 by Nicolas Pitre<nico@fluxnic.net>
>> eth0: SMC91C11xFD (rev 2) at 0902c000 IRQ 140 [nowait]
>>
>> /proc/interrupts has this entry:
>>
>> 140: =A0 =A0 =A0 =A068 =A0 =A0 =A0 atari =A0 =A0eth0
>
> That's good - now what is the transmit/receive speed you get with thi=
s
> driver on a large file transfer?
>

Transfer by ftp of a 230 MB file, CT060 Falcon is the server, and my
Ubuntu machine the client.
Receiving the file the speed stabilizes around 85 KB/s.
Transmitting the speed stabilizes around 105 KB/s


>> The addresses are these:
>>
>> ISP116X_HCD_ADDR =A0 =A0 =A0 =A00x80000016
>> ISP116X_HCD_DATA =A0 =A0 =A0 =A00x80000012
>
> I don't think I tried that combination - where did you find that?
>

Those addresses are used by the Ethernat USB driver for MiNT, which
it's working quite well.


> Anyway, new test kernel on the way. Won't do anything useful with the=
 USB
> chipset other than hopefully probe it OK.
>

Below, you can find what I'm getting with this new kernel and module.
One important thing, ISP116x data bus has 16 bits, the EtherNat
hardware swaps both bytes before writing them to the bus or after
reading from it. I'm sure the driver doesn't consider this, so I think
this is the reason why an ivalid chip ID is gotten.


usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
isp116x-hcd isp116x-hcd: ISP116x Host Controller
isp116x-hcd isp116x-hcd: new USB bus registered, assigned bus number 1
116x: Clock not ready after 15ms
116x: Please make sure that the H_WAKEUP pin is pulled low!
isp116x-hcd isp116x-hcd: irq 139, io base 0x80000012
116x: Invalid chip ID 1000
isp116x-hcd isp116x-hcd: startup error -19
isp116x-hcd isp116x-hcd: USB bus 1 deregistered
116x: init error, -19
