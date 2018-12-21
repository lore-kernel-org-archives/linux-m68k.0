From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH net-next] Amiga PCMCIA 100 MBit card support
Date: Sat, 22 Dec 2018 10:30:58 +1300
Message-ID: <2a960bfa-000a-eb14-814b-476da5c1f5df@gmail.com>
References: <20181219222427.GA78871@MacBook.fritz.box>
 <20181220.161053.1268735869147094096.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20181220.161053.1268735869147094096.davem@davemloft.net>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, alex@kazik.de
Cc: netdev@vger.kernel.org, linux-m68k@vger.kernel.org, rolf.anders@physik.uni-augsburg.de
List-Id: linux-m68k@vger.kernel.org

Dave,

Am 21.12.2018 um 13:10 schrieb David Miller:
> From: ALeX Kazik <alex@kazik.de>
> Date: Wed, 19 Dec 2018 23:24:32 +0100
>
>> +	bool "PCMCIA NE2000 100MBit support"
>> +	default n
>> +	depends on ARM_ETHERH=n && AX88796=n && HYDRA=n && MAC8390=n
>> +	depends on MCF8390=n && NE2000=n && NE2K_PCI=n && PCMCIA_AXNET=n
>> +	depends on PCMCIA_PCNET=n && STNIC=n && ULTRA=n && WD80x3=n
>> +	depends on XSURF100=n && ZORRO8390=n
>> +	---help---
>
> Generally I'm not too happy with these changes, they are all very hackish.

I see only one option to address that: rewrite apne.c to include 
lib8390.c directly.

Moving the inb() and outb() redefines into the m68k version of io.h 
(which Geert is likely to veto because of its hackishness) would still 
require a Kconfig hack.

> And in particular this huge complicated Kconfig construct is not
> maintainable at all.

We can trim this down a bit (for reasons I've outlined before):

+if APNE
+config APNE100MBIT
+	bool "PCMCIA NE2000 100MBit support"
+	default n
+	depends on NE2000=n && PCMCIA_AXNET=n
+	depends on PCMCIA_PCNET=n && STNIC=n && ULTRA=n && WD80x3=n

In all honesty, I doubt anyone could ever use the stnic, ultra and wd 
drivers on m68k (Geert?) so these could be omitted as well. Not sure 
pcnet_cs or axnet_cs are possible to use on the Amiga PCMCIA slot, so 
all that remains in practice is the ne driver (which is used on Atari).

Still too ugly?

Cheers,

	Michael

>
> Sorry.
>
