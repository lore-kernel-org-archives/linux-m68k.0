From: fthain@telegraphics.com.au
Subject: Re: initcall question
Date: Sat, 24 Oct 2009 03:30:11 +1100 (EST)
Message-ID: <alpine.LNX.2.00.0910240325040.26550@nippy.intranet>
References: <alpine.LNX.2.00.0910222357390.22095@nippy.intranet> <20091022192436.GA7969@cynthia.pants.nu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:36736 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752419AbZJWQaM (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 23 Oct 2009 12:30:12 -0400
In-Reply-To: <20091022192436.GA7969@cynthia.pants.nu>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Brad Boyer <flar@allandria.com>
Cc: linux-m68k <linux-m68k@vger.kernel.org>



On Thu, 22 Oct 2009, Brad Boyer wrote:

> On Fri, Oct 23, 2009 at 12:56:50AM +1100, fthain@telegraphics.com.au 
> wrote:
> > If the platform devices are statically defined, they get no release 
> > method which can result in the driver core carping, "Device 'scc.0' 
> > does not have a release() function, it is broken and must be fixed", 
> > and then dumping a backtrace.
> > 
> > The alternative to statically defined devices is 
> > platform_device_alloc(), which does provide a release method, but I 
> > can't call it at arch_initcall time because the console_initcall has 
> > already happened. And I can't use it at setup_arch() time (when the 
> > boot info is parsed) because there's no kmalloc() yet.
> > 
> > What to do? I don't want to export the bootinfo data to the pmac_zilog 
> > driver for console initialisation. And I'd really like to avoid a 
> > bunch of hard coded SCC base addresses.
> > 
> > Any suggestions?
> 
> Could you just define and set a release function that does nothing? 
> That's kind of silly, but it seems like it should work. If it's static 
> memory anyway, there isn't anything to free.

I guess it is a cheap enough. It does work.

Thanks,
Finn

> 	Brad Boyer
> 	flar@allandria.com
> 
