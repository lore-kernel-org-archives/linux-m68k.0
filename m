From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next] Amiga PCMCIA 100 MBit card support
Date: Fri, 28 Dec 2018 12:43:30 -0800 (PST)
Message-ID: <20181228.124330.1798799446491889384.davem@davemloft.net>
References: <20181219222427.GA78871@MacBook.fritz.box>
        <20181220.161053.1268735869147094096.davem@davemloft.net>
        <2a960bfa-000a-eb14-814b-476da5c1f5df@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <2a960bfa-000a-eb14-814b-476da5c1f5df@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: schmitzmic@gmail.com
Cc: alex@kazik.de, netdev@vger.kernel.org, linux-m68k@vger.kernel.org, rolf.anders@physik.uni-augsburg.de
List-Id: linux-m68k@vger.kernel.org

From: Michael Schmitz <schmitzmic@gmail.com>
Date: Sat, 22 Dec 2018 10:30:58 +1300

> Am 21.12.2018 um 13:10 schrieb David Miller:
>> And in particular this huge complicated Kconfig construct is not
>> maintainable at all.
> 
> We can trim this down a bit (for reasons I've outlined before):
> 
> +if APNE
> +config APNE100MBIT
> +	bool "PCMCIA NE2000 100MBit support"
> +	default n
> +	depends on NE2000=n && PCMCIA_AXNET=n
> +	depends on PCMCIA_PCNET=n && STNIC=n && ULTRA=n && WD80x3=n
> 
> In all honesty, I doubt anyone could ever use the stnic, ultra and wd
> drivers on m68k (Geert?) so these could be omitted as well. Not sure
> pcnet_cs or axnet_cs are possible to use on the Amiga PCMCIA slot, so
> all that remains in practice is the ne driver (which is used on
> Atari).
> 
> Still too ugly?

I'm sorry, maybe I didn't express my concern clearly.

Any sizable list of exceptions in a Kconfig conditional has long term
maintainence costs.  If, for some reason, a new variant of support
for this chip arrives there will be a new Kconfig setting that would
need to be added here to your expressions.

That is insanely error prone, and I can guarantee it will get missed.

Having so many front end drivers for a chipset should be done in a
more modular manner, so that in fact they could all coexist if
necessary.
