From: =?ISO-8859-1?Q?David_G=E1lvez?= <dgalvez75@gmail.com>
Subject: EtherNat drivers (was: Re: Atari ROM port ISA)
Date: Thu, 17 May 2012 16:49:33 +0200
Message-ID: <CAL4YKD6eQN4jOO4LoiDTXLXYBffchPd4Wfjihf-_qnbSZ32+zg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:46891 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759873Ab2EQOte convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 17 May 2012 10:49:34 -0400
Received: by dady13 with SMTP id y13so2512491dad.19
        for <linux-m68k@vger.kernel.org>; Thu, 17 May 2012 07:49:34 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

2012/5/17 Michael Schmitz <schmitzmic@googlemail.com>:
> On 17/05/12 18:10, David G=E1lvez wrote:
>>
>> EtherNat's nertwork driver is working fine.
>
> That's good to know. Well, not entirely - it does mean my EtherNAT is=
 dead
> ...
>
> What interrupt does it report it uses? Do you see the card interrupts
> accumulate in /proc/interrupts?
>

smc91x: IOADDR 0902c000 doesn't match configuration (300).
smc91x.c: v1.1, sep 22 2004 by Nicolas Pitre <nico@fluxnic.net>
eth0: SMC91C11xFD (rev 2) at 0902c000 IRQ 140 [nowait]

/proc/interrupts has this entry:

140:        68       atari    eth0

>> When loading the USB driver I'm getting this:
>>
>> usbcore: registered new interface driver usbfs
>> usbcore: registered new interface driver hub
>> usbcore: registered new device driver usb
>> isp116x-hcd isp116x-hcd: ISP116x Host Controller
>> isp116x-hcd isp116x-hcd: new USB bus registered, assigned bus number=
 1
>> 116x: Clock not ready after 15ms
>> 116x: Please make sure that the H_WAKEUP pin is pulled low!
>> isp116x-hcd isp116x-hcd: can't setup
>> isp116x-hcd isp116x-hcd: USB bus 1 deregistered
>> 116x: init error, -19
>
> Just what I'm getting as well. Back to the drawing board. I'll have t=
o get
> confirmation on the exact addresses being used from the EtherNAT desi=
gner.
>

The addresses are these:

ISP116X_HCD_ADDR	0x80000016
ISP116X_HCD_DATA 	0x80000012

Regards
