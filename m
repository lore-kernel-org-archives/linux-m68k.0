From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 08/10] net: ax88796: Make reset more robust on AX88796B
Date: Tue, 17 Apr 2018 11:08:17 -0700
Message-ID: <4e18a2db-b2e5-2000-b1c3-4c6ddcc0d3ed@gmail.com>
References: <1523916285-6057-1-git-send-email-schmitzmic@gmail.com>
 <1523916285-6057-9-git-send-email-schmitzmic@gmail.com>
 <20180416231223.GB23474@lunn.ch>
 <CAOmrzkKoPwNRf5Nq=GN8ktP-9B5dNyGggFsrJ-Tr3D-z=Jj2rQ@mail.gmail.com>
 <20180417013225.GA27583@lunn.ch>
 <58605.92.192.176.127.1523942290.webmail@webmail.zedat.fu-berlin.de>
 <20180417130106.GG2591@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180417130106.GG2591@lunn.ch>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Michael Karcher <michael.karcher@fu-berlin.de>
Cc: Michael Schmitz <schmitzmic@gmail.com>, netdev@vger.kernel.org, Linux/m68k <linux-m68k@vger.kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
List-Id: linux-m68k@vger.kernel.org

On 04/17/2018 06:01 AM, Andrew Lunn wrote:
> On Tue, Apr 17, 2018 at 07:18:10AM +0200, Michael Karcher wrote:
>> [Andrew, sorry for the dup. I did hit reply-to-auhor instead of
>> reply-to-all first.]
>>
>> Andrew Lunn schrieb:
>>>>> This should really be fixed in the PHY driver, not the MAC.
>>>>
>>>> OK - do you want this separate, or as part of this series? Might have
>>>> a few side effects on more commonly used hardware, perhaps?
>>>
>>> Hi Michael
>>>
>>> What PHY driver is used?
>> The ax88796b comes with its own integrated (buggy) PHY needing this
>> workaround. This PHY has its own ID which is not known by Linux, so it is
>> using the genphy driver as fallback.
>>
>>> In the driver you can implement a .soft_reset
>>> function which first does the dummy write, and then uses
>>> genphy_soft_reset() to do the actual reset.
>> We could do that - but I dont't see the point in creating a PHY driver
>> that is only ever used by this MAC driver, just to add a single line to
>> the genphy driver. If the same PHY might be used with a different MAC,
>> you definitely would have a point there, though.
> 
> 
> Hi Michael
> 
> We try to keep the core code clean, and put all workarounds for buggy
> hardware in drivers specific to them. It just helps keep the core code
> maintainable.
> 
> I would prefer a driver specific to this PHY with the workaround. But
> lets see what Florian says.

If you are already using the generic PHY driver, coming up with a custom
one that only overrides the soft_reset and/or config_init callback is
really not that much work, and as Andrew says, it helps make things
clearer and properly isolated. As far as where to place that driver, you
can either create a new file under drivers/net/phy/* or you can even
register a phy_driver instance from within ax88796 if that makes it any
clearer.

FWIW, there are plenty of examples where there is a PHY driver used by a
single MAC, and that is perfectly fine, because the abstraction is still
preserved.
-- 
Florian
