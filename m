From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [v4,1/9] net-next: phy: new Asix Electronics PHY driver
Date: Fri, 18 Jan 2019 11:22:39 +0100 (CET)
Message-ID: <alpine.DEB.2.21.1901181121101.1647@nanos.tec.linutronix.de>
References: <1524103526-12240-2-git-send-email-schmitzmic@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1524103526-12240-2-git-send-email-schmitzmic@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: netdev@vger.kernel.org, andrew@lunn.ch, fthain@telegraphics.com.au, geert@linux-m68k.org, f.fainelli@gmail.com, linux-m68k@vger.kernel.org, Michael.Karcher@fu-berlin.de, LKML <linux-kernel@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, Kate Stewart <kstewart@linuxfoundation.org>
List-Id: linux-m68k@vger.kernel.org

Michael,

On Thu, 19 Apr 2018, Michael Schmitz wrote:

> --- /dev/null
> +++ b/drivers/net/phy/asix.c
> @@ -0,0 +1,63 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Driver for Asix PHYs
> + *
> + * Author: Michael Schmitz <schmitzmic@gmail.com>
> + *
> + * This program is free software; you can redistribute  it and/or modify it
> + * under  the terms of  the GNU General  Public License as published by the
> + * Free Software Foundation;  either version 2 of the  License, or (at your
> + * option) any later version.
> + *
> + */

This license information is broken. The SPDX license identifier and the
boiler plate text are contradicting. The SPDX id is GPL v2 only and the
boiler plate says v2 or later.

Please decide which version you want and fix ASAP. If you fix that up
please add a Fixes: tag and cc stable. While at it please remove the boiler
plate text as the SPDX id is sufficient and the boiler plate is redundant
information.

See Documentation/process/license-rules.txt

Thanks,

        tglx
