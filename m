From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH v2 13/13] nubus: Add support for the driver model
Date: Mon, 20 Nov 2017 12:01:30 +1100 (AEDT)
Message-ID: <alpine.LNX.2.00.1711190910550.3@nippy.intranet>
References: <cover.1510960933.git.fthain@telegraphics.com.au> <7f84ae0e2d6195ce0a4af1963d5ac15ff02a4749.1510960933.git.fthain@telegraphics.com.au> <20171118102123.GC8368@kroah.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:47208 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750952AbdKTBBc (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 19 Nov 2017 20:01:32 -0500
In-Reply-To: <20171118102123.GC8368@kroah.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 18 Nov 2017, Greg Kroah-Hartman wrote:

> On Fri, Nov 17, 2017 at 09:30:11PM -0500, Finn Thain wrote:
> > This patch brings basic support for the Linux Driver Model to the
> > NuBus subsystem.
> > 
> > For flexibility, bus matching is left up to the drivers. This is also
> > the approach taken by NetBSD NuBus drivers in matching cards.
> > 
> > Since a board may have many functions, drivers have to consider all of
> > a board's functional resources, and potentially also the board resource.
> > 
> > However, this implementation does not support binding many drivers to
> > one board. Apple's configuration ROM design is flexible enough to allow
> > it but I don't see a need to support it as I don't see a need to support
> > the "slot zero" (main logic board) ROM or proprietary drivers.
> > 
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Tested-by: Stan Johnson <userm57@yahoo.com>
> > Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
> > 
> > ---
> > The conversion of Mac network drivers from the Space.c convention to
> > the Driver Model takes place in a separate patch series, archived at
> > https://lkml.org/lkml/2017/11/11/25
> > That series motivates many of the definitions found here, such as
> > 'for_each_board_func_rsrc'.
> > ---
> >  drivers/nubus/Makefile |  2 +-
> >  drivers/nubus/bus.c    | 85 ++++++++++++++++++++++++++++++++++++++++++++++++++
> >  drivers/nubus/nubus.c  |  3 ++
> >  include/linux/nubus.h  | 39 +++++++++++++++++++++++
> >  4 files changed, 128 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/nubus/bus.c
> > 
> > diff --git a/drivers/nubus/Makefile b/drivers/nubus/Makefile
> > index 21bda2031e7e..6d063cde39d1 100644
> > --- a/drivers/nubus/Makefile
> > +++ b/drivers/nubus/Makefile
> > @@ -2,6 +2,6 @@
> >  # Makefile for the nubus specific drivers.
> >  #
> >  
> > -obj-y   := nubus.o
> > +obj-y := nubus.o bus.o
> >  
> >  obj-$(CONFIG_PROC_FS) += proc.o
> > diff --git a/drivers/nubus/bus.c b/drivers/nubus/bus.c
> > new file mode 100644
> > index 000000000000..9ee7aa392ca1
> > --- /dev/null
> > +++ b/drivers/nubus/bus.c
> > @@ -0,0 +1,85 @@
> > +/*
> > + * Bus implementation for the NuBus subsystem.
> > + *
> > + * Copyright (C) 2017 Finn Thain
> > + *
> > + * SPDX-License-Identifier: GPL-2.0
> > + */
> > +
> > +#include <linux/nubus.h>
> > +
> > +#define to_nubus_board(d)       container_of(d, struct nubus_board, dev)
> > +#define to_nubus_driver(d)      container_of(d, struct nubus_driver, driver)
> > +
> > +static int nubus_bus_match(struct device *dev, struct device_driver *driver)
> > +{
> > +	return 1;
> > +}
> > +
> > +static int nubus_device_probe(struct device *dev)
> > +{
> > +	struct nubus_driver *ndrv = to_nubus_driver(dev->driver);
> > +	int err = -ENODEV;
> > +
> > +	if (ndrv->probe)
> > +		err = ndrv->probe(to_nubus_board(dev));
> > +	return err;
> > +}
> > +
> > +static int nubus_device_remove(struct device *dev)
> > +{
> > +	struct nubus_driver *ndrv = to_nubus_driver(dev->driver);
> > +	int err = -ENODEV;
> > +
> > +	if (dev->driver && ndrv->remove)
> > +		err = ndrv->remove(to_nubus_board(dev));
> > +	return err;
> > +}
> > +
> > +struct bus_type nubus_bus_type = {
> > +	.name		= "nubus",
> > +	.match		= nubus_bus_match,
> > +	.probe		= nubus_device_probe,
> > +	.remove		= nubus_device_remove,
> > +};
> > +EXPORT_SYMBOL(nubus_bus_type);
> 
> EXPORT_SYMBOL_GPL()?  I have to ask :)
> 

Well, I don't need to take a stand against proprietary NuBus drivers. 
AFAIK, there's no profit motive to constrain their licensing.

> And what happens when a device is removed from the system? Or unbound?

Binding and unbinding works fine. This was tested with a variety of valid 
and invalid permutations and combinations of,

modprobe mac8390
rmmod mac8390
echo slot.E > /sys/bus/nubus/drivers/mac8390/bind
echo slot.E > /sys/bus/nubus/drivers/mac8390/unbind

There's no possibility of cards being removed from the system (or added to 
it) while it is running.

> You need to free up the memory allocated, and I don't see that happening 
> here.

This struct device is embedded in a struct nubus_board. The latter gets 
allocated during subsys_initcall(nubus_init), originally for use by procfs 
as well as drivers. These objects were and are never freed, though I guess 
they could be if there was some benefit.

Rather than add reference counting to the nubus procfs driver, it seems 
simpler to just continue to assume these structures are permanent 
(likewise the linked lists, nubus_boards and nubus_func_rsrcs).

> Have you tested it out?

Stan tested it on his Macs using scripts that I wrote.

> The kernel should yell at you for not having a release function for your 
> bus type.
> 

There is no "release" method in struct bus_type... Are you referring to 
this error message in device_release()?

                WARN(1, KERN_ERR "Device '%s' does not have a release() "
                        "function, it is broken and must be fixed.\n",
                        dev_name(dev));

This won't fire unless device_del() is called, right? Certainly there are 
no errors in the console logs that Stan captured when he tested these 
patches (using ignore_loglevel).

The struct device that I pass to device_register() always lacks a release 
method, but there are other examples of this in the kernel (see 
drivers/eisa/eisa-bus.c, drivers/tc/tc.c, drivers/w1/w1_int.c etc.).
Would it be better to have empty functions used as release methods?

Thanks for your feedback.

-- 

> thanks,
> 
> greg k-h
