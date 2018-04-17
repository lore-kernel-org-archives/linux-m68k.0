From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH 08/10] net: ax88796: Make reset more robust on AX88796B
Date: Tue, 17 Apr 2018 12:14:50 +1200
Message-ID: <CAOmrzkKoPwNRf5Nq=GN8ktP-9B5dNyGggFsrJ-Tr3D-z=Jj2rQ@mail.gmail.com>
References: <1523916285-6057-1-git-send-email-schmitzmic@gmail.com>
 <1523916285-6057-9-git-send-email-schmitzmic@gmail.com> <20180416231223.GB23474@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180416231223.GB23474@lunn.ch>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, Linux/m68k <linux-m68k@vger.kernel.org>, Michael Karcher <Michael.Karcher@fu-berlin.de>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
List-Id: linux-m68k@vger.kernel.org

Hi Andrew,

On Tue, Apr 17, 2018 at 11:12 AM, Andrew Lunn <andrew@lunn.ch> wrote:
> On Tue, Apr 17, 2018 at 10:04:43AM +1200, Michael Schmitz wrote:
>> From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
>>
>> The AX88796B as installed on the X-Surf-100 does not recognize a MII reset
>> request if the previous write to the MII control register also was a reset
>> request. So a dummy write to the control register makes the soft reset in
>> the PHY initialization code work.
>>
>> Signed-off-by: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
>> ---
>>  drivers/net/ethernet/8390/ax88796.c |    4 ++++
>>  1 files changed, 4 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/8390/ax88796.c b/drivers/net/ethernet/8390/ax88796.c
>> index 6af9aca..a2f9a09 100644
>> --- a/drivers/net/ethernet/8390/ax88796.c
>> +++ b/drivers/net/ethernet/8390/ax88796.c
>> @@ -374,6 +374,10 @@ static int ax_mii_probe(struct net_device *dev)
>>               return -ENODEV;
>>       }
>>
>> +     /* write a non-reset pattern to the control register to
>> +      * re-arm the reset request detection logic (needed on AX88796B)
>> +      */
>> +     phy_write(phy_dev, MII_BMCR, 0);
>
> This should really be fixed in the PHY driver, not the MAC.

OK - do you want this separate, or as part of this series? Might have
a few side effects on more commonly used hardware, perhaps?

Cheers,

  Michael

>
>      Andrew
