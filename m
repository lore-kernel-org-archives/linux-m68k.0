From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [v4,1/9] net-next: phy: new Asix Electronics PHY driver
Date: Sun, 20 Jan 2019 18:43:12 +0100
Message-ID: <20190120174312.GC15048@lunn.ch>
References: <1524103526-12240-2-git-send-email-schmitzmic@gmail.com>
 <alpine.DEB.2.21.1901181121101.1647@nanos.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1901181121101.1647@nanos.tec.linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Michael Schmitz <schmitzmic@gmail.com>, netdev@vger.kernel.org, fthain@telegraphics.com.au, geert@linux-m68k.org, f.fainelli@gmail.com, linux-m68k@vger.kernel.org, Michael.Karcher@fu-berlin.de, LKML <linux-kernel@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, Kate Stewart <kstewart@linuxfoundation.org>
List-Id: linux-m68k@vger.kernel.org

On Fri, Jan 18, 2019 at 11:22:39AM +0100, Thomas Gleixner wrote:
> Michael,
> 
> On Thu, 19 Apr 2018, Michael Schmitz wrote:
> 
> > --- /dev/null
> > +++ b/drivers/net/phy/asix.c
> > @@ -0,0 +1,63 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/* Driver for Asix PHYs
> > + *
> > + * Author: Michael Schmitz <schmitzmic@gmail.com>
> > + *
> > + * This program is free software; you can redistribute  it and/or modify it
> > + * under  the terms of  the GNU General  Public License as published by the
> > + * Free Software Foundation;  either version 2 of the  License, or (at your
> > + * option) any later version.
> > + *
> > + */
> 
> This license information is broken. The SPDX license identifier and the
> boiler plate text are contradicting. The SPDX id is GPL v2 only and the
> boiler plate says v2 or later.

Hi Thomas

Please see:

https://www.spinics.net/lists/netdev/msg544312.html

The first two patches are simple SPDX converstions. Then it gets
interesting trying to sort out license inconsistencies.

	Andrew
