From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH v3 1/9] net: phy: new Asix Electronics PHY driver
Date: Thu, 19 Apr 2018 10:26:14 +1200
Message-ID: <CAOmrzkJ1TXehJH-gOtiL3zTr8a8=ZRmx2wzCE3PGZY-LWbc7ZA@mail.gmail.com>
References: <1523930895-6973-1-git-send-email-schmitzmic@gmail.com>
 <1524025616-3722-2-git-send-email-schmitzmic@gmail.com> <20180418121356.GA31643@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180418121356.GA31643@lunn.ch>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev <netdev@vger.kernel.org>, Finn Thain <fthain@telegraphics.com.au>, Geert Uytterhoeven <geert@linux-m68k.org>, Florian Fainelli <f.fainelli@gmail.com>, Linux/m68k <linux-m68k@vger.kernel.org>, Michael Karcher <Michael.Karcher@fu-berlin.de>
List-Id: linux-m68k@vger.kernel.org

Hi Andrew,

I agree, that's much better. I had something like that in mind before
I got distracted...

/me looking for brown paper bag now.

Cheers,

  Michael


On Thu, Apr 19, 2018 at 12:13 AM, Andrew Lunn <andrew@lunn.ch> wrote:
>> +
>> +/**
>> + * asix_soft_reset - software reset the PHY via BMCR_RESET bit
>> + * @phydev: target phy_device struct
>> + *
>> + * Description: Perform a software PHY reset using the standard
>> + * BMCR_RESET bit and poll for the reset bit to be cleared.
>> + * Toggle BMCR_RESET bit off to accomodate broken PHY implementations
>> + * such as used on the Individual Computers' X-Surf 100 Zorro card.
>> + *
>> + * Returns: 0 on success, < 0 on failure
>> + */
>> +static int asix_soft_reset(struct phy_device *phydev)
>> +{
>> +     int ret;
>> +
>> +     /* Asix PHY won't reset unless reset bit toggles */
>> +     ret = phy_write(phydev, MII_BMCR, 0);
>> +     if (ret < 0)
>> +             return ret;
>> +
>> +     phy_write(phydev, MII_BMCR, BMCR_RESET);
>> +
>> +     return phy_poll_reset(phydev);
>> +}
>
> Why not simply:
>
> static int asix_soft_reset(struct phy_device *phydev)
> {
>         int ret;
>
>         /* Asix PHY won't reset unless reset bit toggles */
>         ret = phy_write(phydev, MII_BMCR, 0);
>         if (ret < 0)
>                 return ret;
>
>         return genphy_soft_reset(phydev);
> }
>
>         Andrew
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
