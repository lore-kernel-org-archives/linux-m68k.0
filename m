From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH v2 13/13] nubus: Add support for the driver model
Date: Fri, 24 Nov 2017 10:40:20 +1100 (AEDT)
Message-ID: <alpine.LNX.2.00.1711241040150.3@nippy.intranet>
References: <cover.1510960933.git.fthain@telegraphics.com.au> <7f84ae0e2d6195ce0a4af1963d5ac15ff02a4749.1510960933.git.fthain@telegraphics.com.au> <20171118102123.GC8368@kroah.com> <alpine.LNX.2.00.1711190910550.3@nippy.intranet> <alpine.LNX.2.00.1711211046150.3@nippy.intranet>
 <20171123080449.GB490@kroah.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171123080449.GB490@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

On Thu, 23 Nov 2017, Greg Kroah-Hartman wrote:

> On Thu, Nov 23, 2017 at 11:24:38AM +1100, Finn Thain wrote:
> > On Mon, 20 Nov 2017, I wrote:
> > 
> > > > You need to free up the memory allocated, and I don't see that 
> > > > happening here ... The kernel should yell at you ...
> > 
> > > 
> > >                 WARN(1, KERN_ERR "Device '%s' does not have a release() "
> > >                         "function, it is broken and must be fixed.\n",
> > >                         dev_name(dev));
> > > 
> > > This won't fire unless device_del() is called, right?
> > 
> > Sorry, I should have written, "This won't fire unless 
> > device_unregister() is called, right?" -- though I guess it could be 
> > any call to put_device().
> > 
> > If need be I can add code to cleanly tear down the bus devices and the 
> > associated linked lists and procfs structures, just prior to kernel 
> > termination, as a kernel exitcall. But I don't see this pattern in 
> > use.
> 
> When the kernel shuts down, no, the devices are not removed.
> 
> But what happens when the bus code is unloaded if it is built as a 
> module?  The devices will be removed then.  Or they should be.
> 

This bus driver is not a module.

> So please implement the remove device code path,

OK.

> just because some other busses are buggy that way does not mean you need 
> to duplicate their incorrect behavior.
> 

Actually, I think the bug is in porting.txt, when it says "Optionally, the 
bus driver may set the device's name and release fields."

> > 
> > It's not clear to me that the extra complexity is worth it. This may 
> > explain the other devices which never get unregistered (e.g. 
> > rtc_device, rtc_efi_dev, etc.)
> > 
> > I've read Documentation/driver-model/ and watched your presentations 
> > on this topic but it's unclear to me whether you are saying in this 
> > thread that calling device_unregister() is mandatory.
> > 
> > It sounds like you are saying that a non-NULL device.release method is 
> > mandatory (which is easily solved with an empty function). But 
> > Documentation/driver-model/porting.txt says the release method is 
> > optional.
> 
> If you provide a non-NULL empty release function, you get to be made fun 
> of, as per the in-kernel kobject documentation.  The kernel is trying to 
> save you from yourself, that warning is not there just to try to work 
> around.
> 

That warning never shows up at all, because it would only ever appear at 
device_unregister() time, rather than at device_register() time.

Anyway, I will read the in-kernel comments in the kobject code. Thanks for 
the tip.

-- 

> thanks,
> 
> greg k-h
