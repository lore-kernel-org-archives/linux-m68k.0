From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH v3 00/10] New network driver for Amiga X-Surf 100
 (m68k)
Date: Wed, 18 Apr 2018 15:45:25 +1000 (AEST)
Message-ID: <alpine.LNX.2.21.1804181531180.8@nippy.intranet>
References: <1523930895-6973-1-git-send-email-schmitzmic@gmail.com> <1524025616-3722-1-git-send-email-schmitzmic@gmail.com> <CAOmrzk+zUTmSzXWU9WoXYauBx2Z4qkAh+Y4d49faA8Tu5RRQnQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <CAOmrzk+zUTmSzXWU9WoXYauBx2Z4qkAh+Y4d49faA8Tu5RRQnQ@mail.gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: netdev <netdev@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>, Geert Uytterhoeven <geert@linux-m68k.org>, Florian Fainelli <f.fainelli@gmail.com>, Linux/m68k <linux-m68k@vger.kernel.org>, Michael Karcher <Michael.Karcher@fu-berlin.de>
List-Id: linux-m68k@vger.kernel.org

On Wed, 18 Apr 2018, Michael Schmitz wrote:

> All,
> 
> just noticed belatedly that the Makefile hunk of patch 9 does no
> longer apply cleanly in 4.17-rc1, sorry. My series was based on 4.16.
> I'll resend that one, OK?
> 

I might end up simpler to resend the whole series --

> Cheers,
> 
>   Michael
> 
> 
> > 1/9 net: phy: new Asix Electronics PHY driver
> > 2/9 net: ax88796: Fix MAC address reading
> > 3/9 net: ax88796: Attach MII bus only when open
> > 4/9 net: ax88796: Do not free IRQ in ax_remove() (already freed in ax_close()).
> > 5/9 net: ax88796: Add block_input/output hooks to ax_plat_data

I found that git am rejects this one, though 'patch' applies it with fuzz.

> > 6/9 net: ax88796: add interrupt status callback to platform data
> > 7/9 net: ax88796: set IRQF_SHARED flag when IRQ resource is marked as shareable
> > 8/9 net: ax88796: release platform device drvdata on probe error and module remove
> > 9/9 net: New ax88796 platform driver for Amiga X-Surf 100 Zorro board (m68k)

git am rejected this one and also complained about trailing whitespace.

I'd rebase on v4.17-rc1 and also run checkpatch over the results.

-- 

> >
> >  drivers/net/ethernet/8390/Kconfig    |   17 ++-
> >  drivers/net/ethernet/8390/Makefile   |    1 +
> >  drivers/net/ethernet/8390/ax88796.c  |  228 ++++++++++++--------
> >  drivers/net/ethernet/8390/xsurf100.c |  381 ++++++++++++++++++++++++++++++++++
> >  drivers/net/phy/Kconfig              |    6 +
> >  drivers/net/phy/Makefile             |    1 +
> >  drivers/net/phy/asix.c               |   65 ++++++
> >  drivers/net/phy/phy_device.c         |    3 +-
> >  include/linux/phy.h                  |    1 +
> >  include/net/ax88796.h                |   14 ++
> >  10 files changed, 621 insertions(+), 96 deletions(-)
> >
> > Cheers,
> >
> >   Michael
