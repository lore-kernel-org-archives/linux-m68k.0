From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH net-next] Amiga PCMCIA 100 MBit card support
Date: Mon, 31 Dec 2018 22:48:49 +1300
Message-ID: <6b725e37-4223-cef8-5430-aa05ddafb551@gmail.com>
References: <20181219222427.GA78871@MacBook.fritz.box>
 <20181220.161053.1268735869147094096.davem@davemloft.net>
 <2a960bfa-000a-eb14-814b-476da5c1f5df@gmail.com>
 <20181228.124330.1798799446491889384.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20181228.124330.1798799446491889384.davem@davemloft.net>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: alex@kazik.de, netdev@vger.kernel.org, linux-m68k@vger.kernel.org, rolf.anders@physik.uni-augsburg.de
List-Id: linux-m68k@vger.kernel.org

Hi Dave,

Am 29.12.2018 um 09:43 schrieb David Miller:
> From: Michael Schmitz <schmitzmic@gmail.com>
> Date: Sat, 22 Dec 2018 10:30:58 +1300
>
>> Am 21.12.2018 um 13:10 schrieb David Miller:
>>> And in particular this huge complicated Kconfig construct is not
>>> maintainable at all.
>>
>> We can trim this down a bit (for reasons I've outlined before):
>>
>> +if APNE
>> +config APNE100MBIT
>> +	bool "PCMCIA NE2000 100MBit support"
>> +	default n
>> +	depends on NE2000=n && PCMCIA_AXNET=n
>> +	depends on PCMCIA_PCNET=n && STNIC=n && ULTRA=n && WD80x3=n
>>
>> In all honesty, I doubt anyone could ever use the stnic, ultra and wd
>> drivers on m68k (Geert?) so these could be omitted as well. Not sure
>> pcnet_cs or axnet_cs are possible to use on the Amiga PCMCIA slot, so
>> all that remains in practice is the ne driver (which is used on
>> Atari).

STNIC can indeed be dropped from the list of exceptions, but I forgot 
about ISA support on Q40.

>>
>> Still too ugly?
>
> I'm sorry, maybe I didn't express my concern clearly.

I understood your concerns - my hope was that the exception list might 
be possible to trim right down to a single driver. Alas, that's not the 
case.

> Any sizable list of exceptions in a Kconfig conditional has long term
> maintainence costs.  If, for some reason, a new variant of support
> for this chip arrives there will be a new Kconfig setting that would
> need to be added here to your expressions.
>
> That is insanely error prone, and I can guarantee it will get missed.
>
> Having so many front end drivers for a chipset should be done in a
> more modular manner, so that in fact they could all coexist if
> necessary.

Not sure I follow your meaning ... are you suggesting to allow the back 
end driver to use run-time selectable IO accessors and other generic 
helper functions, so the drivers currenlty including lib8390.c directly 
could use the core code from the 8390 module instead?

Cheers,

	Michael
