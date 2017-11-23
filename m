From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH v2 13/13] nubus: Add support for the driver model
Date: Thu, 23 Nov 2017 11:24:38 +1100 (AEDT)
Message-ID: <alpine.LNX.2.00.1711211046150.3@nippy.intranet>
References: <cover.1510960933.git.fthain@telegraphics.com.au> <7f84ae0e2d6195ce0a4af1963d5ac15ff02a4749.1510960933.git.fthain@telegraphics.com.au> <20171118102123.GC8368@kroah.com> <alpine.LNX.2.00.1711190910550.3@nippy.intranet>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:38810 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751494AbdKWAYe (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 22 Nov 2017 19:24:34 -0500
In-Reply-To: <alpine.LNX.2.00.1711190910550.3@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 20 Nov 2017, I wrote:

> > You need to free up the memory allocated, and I don't see that 
> > happening here ... The kernel should yell at you ...

> 
>                 WARN(1, KERN_ERR "Device '%s' does not have a release() "
>                         "function, it is broken and must be fixed.\n",
>                         dev_name(dev));
> 
> This won't fire unless device_del() is called, right?

Sorry, I should have written, "This won't fire unless device_unregister() 
is called, right?" -- though I guess it could be any call to put_device().

If need be I can add code to cleanly tear down the bus devices and the 
associated linked lists and procfs structures, just prior to kernel 
termination, as a kernel exitcall. But I don't see this pattern in use.

It's not clear to me that the extra complexity is worth it. This may 
explain the other devices which never get unregistered (e.g. rtc_device, 
rtc_efi_dev, etc.)

I've read Documentation/driver-model/ and watched your presentations on 
this topic but it's unclear to me whether you are saying in this thread 
that calling device_unregister() is mandatory.

It sounds like you are saying that a non-NULL device.release method is 
mandatory (which is easily solved with an empty function). But 
Documentation/driver-model/porting.txt says the release method is 
optional.

If device_unregister() is never called, the release method seems to be 
pointless. Would you clarify your objection please?

-- 
