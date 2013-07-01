From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: iop_msg_pool
Date: Mon, 1 Jul 2013 17:54:41 +1000 (EST)
Message-ID: <alpine.LNX.2.00.1307011750540.9202@nippy.intranet>
References: <CAMuHMdUCMUkoDbTFFXnVp-6E0LO5Y=4t64E13cWSpS1jVr2D_w@mail.gmail.com> <alpine.LNX.2.00.1306262026380.19790@nippy.intranet> <CAMuHMdX7WMDC9XXZrWYdcC0NouFjrS3TK+_U-DvmUAET5JB+DA@mail.gmail.com> <alpine.LNX.2.00.1306290034500.1099@nippy.intranet>
 <20130701065713.GB8425@cynthia.pants.nu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:33563 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752457Ab3GAHyv (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 1 Jul 2013 03:54:51 -0400
In-Reply-To: <20130701065713.GB8425@cynthia.pants.nu>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Brad Boyer <flar@allandria.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>


On Sun, 30 Jun 2013, Brad Boyer wrote:

> On Sat, Jun 29, 2013 at 02:47:34PM +1000, Finn Thain wrote:
> > The devices attached to the IOPs are SWIM, SCC and ADB. iop_preinit() 
> > places the SCC channel in bypass mode, so we don't need iop_init() to 
> > use the SCC. ADB doesn't start until device_initcall(adb_init).
> 
> It could become more complicated if we started using the SCC IOP and 
> wanted to be able to do serial console, although I suppose we could use 
> bypass mode until the real driver is loaded later and switch at runtime. 
> It would make some things messy but might still be simpler than 
> complicating this part of the code.

I can't imagine anyone writing an IOP-based SCC driver unless they wanted 
to implement DMA and LocalTalk support. The present code should work fine 
with the pmac_zilog serial driver. It should also work with EARLY_CONSOLE 
if MacOS is configured to put the IOPs into bypass (aka "compatible") mode 
before Penguin boots Linux.

Finn

> 
> 	Brad Boyer
> 	flar@allandria.com
> 
