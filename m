From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 13/13] nubus: Add support for the driver model
Date: Fri, 24 Nov 2017 09:24:28 +0100
Message-ID: <20171124082428.GA21608@kroah.com>
References: <cover.1510960933.git.fthain@telegraphics.com.au>
 <7f84ae0e2d6195ce0a4af1963d5ac15ff02a4749.1510960933.git.fthain@telegraphics.com.au>
 <20171118102123.GC8368@kroah.com>
 <alpine.LNX.2.00.1711190910550.3@nippy.intranet>
 <alpine.LNX.2.00.1711211046150.3@nippy.intranet>
 <20171123080449.GB490@kroah.com>
 <alpine.LNX.2.00.1711241040150.3@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:43886 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751858AbdKXIYY (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 24 Nov 2017 03:24:24 -0500
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.00.1711241040150.3@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Nov 24, 2017 at 10:40:20AM +1100, Finn Thain wrote:
> On Thu, 23 Nov 2017, Greg Kroah-Hartman wrote:
> 
> > On Thu, Nov 23, 2017 at 11:24:38AM +1100, Finn Thain wrote:
> > > On Mon, 20 Nov 2017, I wrote:
> > > 
> > > > > You need to free up the memory allocated, and I don't see that 
> > > > > happening here ... The kernel should yell at you ...
> > > 
> > > > 
> > > >                 WARN(1, KERN_ERR "Device '%s' does not have a release() "
> > > >                         "function, it is broken and must be fixed.\n",
> > > >                         dev_name(dev));
> > > > 
> > > > This won't fire unless device_del() is called, right?
> > > 
> > > Sorry, I should have written, "This won't fire unless 
> > > device_unregister() is called, right?" -- though I guess it could be 
> > > any call to put_device().
> > > 
> > > If need be I can add code to cleanly tear down the bus devices and the 
> > > associated linked lists and procfs structures, just prior to kernel 
> > > termination, as a kernel exitcall. But I don't see this pattern in 
> > > use.
> > 
> > When the kernel shuts down, no, the devices are not removed.
> > 
> > But what happens when the bus code is unloaded if it is built as a 
> > module?  The devices will be removed then.  Or they should be.
> > 
> 
> This bus driver is not a module.

It can not be built as a module ever?

> > So please implement the remove device code path,
> 
> OK.
> 
> > just because some other busses are buggy that way does not mean you need 
> > to duplicate their incorrect behavior.
> > 
> 
> Actually, I think the bug is in porting.txt, when it says "Optionally, the 
> bus driver may set the device's name and release fields."

Yes, it's not required for a bus, but _someone_ has to set the device
release function.  If it's not the bus, it can be the class, or the
device type, otherwise you will trip the warning message in
device_release() when the device finally gets freed.

thanks,

greg k-h
