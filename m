From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH 14/14] nubus: Add support for the driver model
Date: Sun, 12 Nov 2017 14:52:32 +1100 (AEDT)
Message-ID: <alpine.LNX.2.00.1711121407590.3@nippy.intranet>
References: <cover.1510377368.git.fthain@telegraphics.com.au> <6c64ec1ff338853f8ba34783e70896565f968854.1510377369.git.fthain@telegraphics.com.au> <20171111084553.GA6403@kroah.com> <20171111084653.GB6403@kroah.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171111084653.GB6403@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

On Sat, 11 Nov 2017, Greg Kroah-Hartman wrote:

> On Sat, Nov 11, 2017 at 09:45:53AM +0100, Greg Kroah-Hartman wrote:
> > 
> > I can't take patches without any changelog text at all, that's not 
> > good engineering, sorry :(
> > 

I forgot to write it, sorry. I was going to explain the decision to leave 
the bus matching up to the driver.

> > Please fix up and resend and I will be glad to review.
> 
> Also, please test device removal, I don't think you did that :(
> 

The modprobe, rmmod, modprobe sequence was tested. But I think that isn't 
what you meant.

Are you saying there is a missing NULL check? That is,

 static int nubus_device_remove(struct device *dev)
 {
 	struct nubus_driver *ndrv = to_nubus_driver(dev->driver);
 	int err = -ENODEV;
 
-	if (ndrv->remove)
+	if (dev->driver && ndrv->remove)
 		err = ndrv->remove(to_nubus_board(dev));
 	return err;
 }

Anyway, I will revise the patch and test the unbind operation on a device 
not already bound.

Thanks for your feedback.

-- 
