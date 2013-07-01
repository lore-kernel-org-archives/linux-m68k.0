From: Brad Boyer <flar@allandria.com>
Subject: Re: iop_msg_pool
Date: Sun, 30 Jun 2013 23:57:13 -0700
Message-ID: <20130701065713.GB8425@cynthia.pants.nu>
References: <CAMuHMdUCMUkoDbTFFXnVp-6E0LO5Y=4t64E13cWSpS1jVr2D_w@mail.gmail.com>
 <alpine.LNX.2.00.1306262026380.19790@nippy.intranet>
 <CAMuHMdX7WMDC9XXZrWYdcC0NouFjrS3TK+_U-DvmUAET5JB+DA@mail.gmail.com>
 <alpine.LNX.2.00.1306290034500.1099@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from cynthia.allandria.com ([76.245.85.235]:60795 "EHLO
	cynthia.pants.nu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752786Ab3GAHhl (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 1 Jul 2013 03:37:41 -0400
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.00.1306290034500.1099@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Sat, Jun 29, 2013 at 02:47:34PM +1000, Finn Thain wrote:
> The devices attached to the IOPs are SWIM, SCC and ADB. iop_preinit() 
> places the SCC channel in bypass mode, so we don't need iop_init() to use 
> the SCC. ADB doesn't start until device_initcall(adb_init).

It could become more complicated if we started using the SCC IOP and
wanted to be able to do serial console, although I suppose we could
use bypass mode until the real driver is loaded later and switch at
runtime. It would make some things messy but might still be simpler
than complicating this part of the code.

	Brad Boyer
	flar@allandria.com
