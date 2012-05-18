From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: EtherNat drivers (was: Re: Atari ROM port ISA)
Date: Fri, 18 May 2012 19:43:10 +1200
Message-ID: <4FB5FD8E.7030400@gmail.com>
References: <CAL4YKD6eQN4jOO4LoiDTXLXYBffchPd4Wfjihf-_qnbSZ32+zg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:42825 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754304Ab2ERHnP (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 18 May 2012 03:43:15 -0400
Received: by pbbrp8 with SMTP id rp8so3607505pbb.19
        for <linux-m68k@vger.kernel.org>; Fri, 18 May 2012 00:43:15 -0700 (PDT)
In-Reply-To: <CAL4YKD6eQN4jOO4LoiDTXLXYBffchPd4Wfjihf-_qnbSZ32+zg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: =?ISO-8859-1?Q?David_G=E1lvez?= <dgalvez75@gmail.com>
Cc: Michael Schmitz <schmitzmic@googlemail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

On 18/05/12 02:49, David G=E1lvez wrote:
> What interrupt does it report it uses? Do you see the card interrupts
> accumulate in /proc/interrupts?
>
> smc91x: IOADDR 0902c000 doesn't match configuration (300).
> smc91x.c: v1.1, sep 22 2004 by Nicolas Pitre<nico@fluxnic.net>
> eth0: SMC91C11xFD (rev 2) at 0902c000 IRQ 140 [nowait]
>
> /proc/interrupts has this entry:
>
> 140:        68       atari    eth0
That's good - now what is the transmit/receive speed you get with this=20
driver on a large file transfer?
>> Just what I'm getting as well. Back to the drawing board. I'll have =
to get
>> confirmation on the exact addresses being used from the EtherNAT des=
igner.
>>
> The addresses are these:
>
> ISP116X_HCD_ADDR	0x80000016
> ISP116X_HCD_DATA 	0x80000012
I don't think I tried that combination - where did you find that?

Anyway, new test kernel on the way. Won't do anything useful with the=20
USB chipset other than hopefully probe it OK.

Thanks,

   Michael
