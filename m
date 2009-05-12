From: Brad Boyer <flar@allandria.com>
Subject: Re: current 2.6 on Q950
Date: Tue, 12 May 2009 00:15:18 -0700
Message-ID: <20090512071518.GA971@cynthia.pants.nu>
References: <BE30877A-3E70-11DE-B44C-00050249ADE1@kaffe.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from [76.245.85.235] ([76.245.85.235]:40139 "EHLO cynthia.pants.nu"
	rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1758903AbZELHP3 (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Tue, 12 May 2009 03:15:29 -0400
Content-Disposition: inline
In-Reply-To: <BE30877A-3E70-11DE-B44C-00050249ADE1@kaffe.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Riccardo <riccardo@kaffe.org>
Cc: linux-m68k@vger.kernel.org

On Mon, May 11, 2009 at 11:14:41PM +0200, Riccardo wrote:
> after several weeks/months I grabbed a kernel from here
> 
> 
> http://people.debian.org/~smarenka/d-i/m68k/images/daily/kernels/
> 
> and slapped it on my quadra 950.
> 
> Some good news: it boots!

That's good to hear. This is a model that doesn't get a lot of testing.

> And it hasn't crashed the past 2 hours of moderate use.
> 
> Now what is new? Can I test that soemthign was added/fixed? I noticed 
> that the clock is still wrong and that hard disk performance is still 
> bad. I read there was some activity on the floppy driver, does it work 
> on the Q950?

We don't know how to access the hardware clock on the Q900 or Q950. The
other models all had support at one point, but these two have never
worked. In fact, they used to crash because they were trying to use an
access method that didn't work for those systems.

The Q900 and Q950 also don't have the standard access method for the
floppy drives. We know more or less how to access them, but it's a
separate driver. There was a driver in the tree for a while that could
detect disks and eject them properly, but read/write never worked. I
have the documentation laying around, but I never had the time to get
it working. The floppy is the same as the IIfx, which I have. I don't
have either Q9x0 model. They aren't very common. Technically speaking
it would be possible to use the normal swim driver, but it requires
disabling the ADB ports. It would be tough to use the system without
any input devices.

The SCSI is the other thing that is special on these models, so it's
good to hear that it still works. Does the external SCSI port work?
That's something that used to be broken. I think Finn was working
on some of that code to try to get both ports working.

	Brad Boyer
	flar@allandria.com

