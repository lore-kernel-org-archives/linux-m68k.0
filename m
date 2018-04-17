From: "Michael Karcher" <michael.karcher@fu-berlin.de>
Subject: Re: [PATCH 08/10] net: ax88796: Make reset more robust on AX88796B
Date: Tue, 17 Apr 2018 07:18:10 +0200
Message-ID: <58605.92.192.176.127.1523942290.webmail@webmail.zedat.fu-berlin.de>
References: <1523916285-6057-1-git-send-email-schmitzmic@gmail.com>
    <1523916285-6057-9-git-send-email-schmitzmic@gmail.com>
    <20180416231223.GB23474@lunn.ch>
    <CAOmrzkKoPwNRf5Nq=GN8ktP-9B5dNyGggFsrJ-Tr3D-z=Jj2rQ@mail.gmail.com>
    <20180417013225.GA27583@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180417013225.GA27583@lunn.ch>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Michael Schmitz <schmitzmic@gmail.com>, netdev@vger.kernel.org, Linux/m68k <linux-m68k@vger.kernel.org>, Michael Karcher <michael.karcher@fu-berlin.de>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
List-Id: linux-m68k@vger.kernel.org

[Andrew, sorry for the dup. I did hit reply-to-auhor instead of
reply-to-all first.]

Andrew Lunn schrieb:
>> > This should really be fixed in the PHY driver, not the MAC.
>>
>> OK - do you want this separate, or as part of this series? Might have
>> a few side effects on more commonly used hardware, perhaps?
>
> Hi Michael
>
> What PHY driver is used?
The ax88796b comes with its own integrated (buggy) PHY needing this
workaround. This PHY has its own ID which is not known by Linux, so it is
using the genphy driver as fallback.

> In the driver you can implement a .soft_reset
> function which first does the dummy write, and then uses
> genphy_soft_reset() to do the actual reset.
We could do that - but I dont't see the point in creating a PHY driver
that is only ever used by this MAC driver, just to add a single line to
the genphy driver. If the same PHY might be used with a different MAC,
you definitely would have a point there, though.

Kind regards,
  Michael Karcher
