From: Brad Boyer <flar@allandria.com>
Subject: Re: iop_msg_pool
Date: Mon, 1 Jul 2013 00:39:54 -0700
Message-ID: <20130701073954.GC8425@cynthia.pants.nu>
References: <CAMuHMdUCMUkoDbTFFXnVp-6E0LO5Y=4t64E13cWSpS1jVr2D_w@mail.gmail.com>
 <alpine.LNX.2.00.1306262026380.19790@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from cynthia.allandria.com ([76.245.85.235]:60798 "EHLO
	cynthia.pants.nu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752734Ab3GAHj6 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 1 Jul 2013 03:39:58 -0400
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.00.1306262026380.19790@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Wed, Jun 26, 2013 at 08:48:14PM +1000, Finn Thain wrote:
> On Wed, 26 Jun 2013, Geert Uytterhoeven wrote:
> > Do all Macs use the IOP functionality?
> 
> No. iop_scc_present and iop_ism_present are accurate.

In fact, very few Macs use the IOP chips. Only three models used
them, and they are some of the rarest models on top of that. These
chips can be found on the IIfx, the Quadra 900, and the Quadra 950.

> So far, the only driver to make use of this functionality is 
> drivers/macintosh/adb-iop.c:
> 
> int adb_iop_probe(void)
> {
>         if (!iop_ism_present) return -ENODEV;
>         return 0;
> }

We did have an IOP SWIM driver at one point, but it got removed
from the tree. It couldn't read or write blocks, so it wasn't
actually useful. However, it did correctly detect drives and I
think it had disk insert detection and eject as well.

The block data transfer to and from the IOP is messy, and I
couldn't get it working when I tried to fix it back then.

Like the SCC IOP, it is possible to use bypass mode to access
the SWIM chip directly. However, there is no way to have ADB
if the ISM IOP is in bypass mode.

	Brad Boyer
	flar@allandria.com
