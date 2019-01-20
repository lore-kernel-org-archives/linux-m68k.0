From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [v4,1/9] net-next: phy: new Asix Electronics PHY driver
Date: Mon, 21 Jan 2019 11:44:45 +1300
Message-ID: <68512084-2ba5-9b58-38b5-0052fddce734@gmail.com>
References: <1524103526-12240-2-git-send-email-schmitzmic@gmail.com>
 <alpine.DEB.2.21.1901181121101.1647@nanos.tec.linutronix.de>
 <20190120174312.GC15048@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190120174312.GC15048@lunn.ch>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Thomas Gleixner <tglx@linutronix.de>
Cc: netdev@vger.kernel.org, fthain@telegraphics.com.au, geert@linux-m68k.org, f.fainelli@gmail.com, linux-m68k@vger.kernel.org, Michael.Karcher@fu-berlin.de, LKML <linux-kernel@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, Kate Stewart <kstewart@linuxfoundation.org>
List-Id: linux-m68k@vger.kernel.org

Hi Andrew,

no objection for you to pick this up as part as a larger cleanup. I've 
tried to reconstruct how this happened (i.e. what other phy driver file 
I used as a 'template' for asix.c) - all I can say is that the 2.0+ 
boiler plate text was in my initial commit, and the incorrect SPDX tag 
was added in response to checkpath complaints. So 2.0+ would be correct.

Thomas: does that suit your purpose?

Cheers,

     Michael


On 21/01/19 6:43 AM, Andrew Lunn wrote:
> On Fri, Jan 18, 2019 at 11:22:39AM +0100, Thomas Gleixner wrote:
>> Michael,
>>
>> On Thu, 19 Apr 2018, Michael Schmitz wrote:
>>
>>> --- /dev/null
>>> +++ b/drivers/net/phy/asix.c
>>> @@ -0,0 +1,63 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/* Driver for Asix PHYs
>>> + *
>>> + * Author: Michael Schmitz <schmitzmic@gmail.com>
>>> + *
>>> + * This program is free software; you can redistribute  it and/or modify it
>>> + * under  the terms of  the GNU General  Public License as published by the
>>> + * Free Software Foundation;  either version 2 of the  License, or (at your
>>> + * option) any later version.
>>> + *
>>> + */
>> This license information is broken. The SPDX license identifier and the
>> boiler plate text are contradicting. The SPDX id is GPL v2 only and the
>> boiler plate says v2 or later.
> Hi Thomas
>
> Please see:
>
> https://www.spinics.net/lists/netdev/msg544312.html
>
> The first two patches are simple SPDX converstions. Then it gets
> interesting trying to sort out license inconsistencies.
>
> 	Andrew
