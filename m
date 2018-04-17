From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 08/10] net: ax88796: Make reset more robust on AX88796B
Date: Tue, 17 Apr 2018 03:32:25 +0200
Message-ID: <20180417013225.GA27583@lunn.ch>
References: <1523916285-6057-1-git-send-email-schmitzmic@gmail.com>
 <1523916285-6057-9-git-send-email-schmitzmic@gmail.com>
 <20180416231223.GB23474@lunn.ch>
 <CAOmrzkKoPwNRf5Nq=GN8ktP-9B5dNyGggFsrJ-Tr3D-z=Jj2rQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOmrzkKoPwNRf5Nq=GN8ktP-9B5dNyGggFsrJ-Tr3D-z=Jj2rQ@mail.gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: netdev@vger.kernel.org, Linux/m68k <linux-m68k@vger.kernel.org>, Michael Karcher <Michael.Karcher@fu-berlin.de>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
List-Id: linux-m68k@vger.kernel.org

> > This should really be fixed in the PHY driver, not the MAC.
> 
> OK - do you want this separate, or as part of this series? Might have
> a few side effects on more commonly used hardware, perhaps?

Hi Michael

What PHY driver is used? In the driver you can implement a .soft_reset
function which first does the dummy write, and then uses
genphy_soft_reset() to do the actual reset.

     Andrew
