From: Brad Boyer <flar@allandria.com>
Subject: Re: initcall question
Date: Thu, 22 Oct 2009 12:24:36 -0700
Message-ID: <20091022192436.GA7969@cynthia.pants.nu>
References: <alpine.LNX.2.00.0910222357390.22095@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from [76.245.85.235] ([76.245.85.235]:49027 "EHLO cynthia.pants.nu"
	rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1752995AbZJVUBV (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Thu, 22 Oct 2009 16:01:21 -0400
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.00.0910222357390.22095@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: fthain@telegraphics.com.au
Cc: linux-m68k <linux-m68k@vger.kernel.org>

On Fri, Oct 23, 2009 at 12:56:50AM +1100, fthain@telegraphics.com.au wrote:
> If the platform devices are statically defined, they get no release method 
> which can result in the driver core carping, "Device 'scc.0' does not have 
> a release() function, it is broken and must be fixed", and then dumping a 
> backtrace.
> 
> The alternative to statically defined devices is platform_device_alloc(), 
> which does provide a release method, but I can't call it at arch_initcall 
> time because the console_initcall has already happened. And I can't use it 
> at setup_arch() time (when the boot info is parsed) because there's no 
> kmalloc() yet.
> 
> What to do? I don't want to export the bootinfo data to the pmac_zilog 
> driver for console initialisation. And I'd really like to avoid a bunch of 
> hard coded SCC base addresses.
> 
> Any suggestions?

Could you just define and set a release function that does nothing? That's
kind of silly, but it seems like it should work. If it's static memory
anyway, there isn't anything to free.

	Brad Boyer
	flar@allandria.com
