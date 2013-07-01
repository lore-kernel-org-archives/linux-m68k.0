From: Brad Boyer <flar@allandria.com>
Subject: Re: iop_msg_pool
Date: Mon, 1 Jul 2013 15:51:48 -0700
Message-ID: <20130701225148.GC12663@cynthia.pants.nu>
References: <CAMuHMdUCMUkoDbTFFXnVp-6E0LO5Y=4t64E13cWSpS1jVr2D_w@mail.gmail.com>
 <alpine.LNX.2.00.1306262026380.19790@nippy.intranet>
 <CAMuHMdX7WMDC9XXZrWYdcC0NouFjrS3TK+_U-DvmUAET5JB+DA@mail.gmail.com>
 <alpine.LNX.2.00.1306290034500.1099@nippy.intranet>
 <20130701065713.GB8425@cynthia.pants.nu>
 <alpine.LNX.2.00.1307011750540.9202@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from cynthia.allandria.com ([76.245.85.235]:33083 "EHLO
	cynthia.pants.nu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753736Ab3GAWvu (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 1 Jul 2013 18:51:50 -0400
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.00.1307011750540.9202@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Mon, Jul 01, 2013 at 05:54:41PM +1000, Finn Thain wrote:
> 
> On Sun, 30 Jun 2013, Brad Boyer wrote:
> > 
> > It could become more complicated if we started using the SCC IOP and 
> > wanted to be able to do serial console, although I suppose we could use 
> > bypass mode until the real driver is loaded later and switch at runtime. 
> > It would make some things messy but might still be simpler than 
> > complicating this part of the code.
> 
> I can't imagine anyone writing an IOP-based SCC driver unless they wanted 
> to implement DMA and LocalTalk support. The present code should work fine 
> with the pmac_zilog serial driver. It should also work with EARLY_CONSOLE 
> if MacOS is configured to put the IOPs into bypass (aka "compatible") mode 
> before Penguin boots Linux.

Well, it would be less overhead even for regular serial usage. You wouldn't
need to interrupt the processor as often. But it's probably not worth the
effort. Getting LocalTalk working would be nearly impossible without some
hardware assist such as an IOP (or the PSC-DMA on the models that have it).

	Brad Boyer
	flar@allandria.com
