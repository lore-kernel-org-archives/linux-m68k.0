From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: vme_scc.c breakage (was: Re: linux-next: Tree for November 21)
Date: Sat, 22 Nov 2008 16:47:38 +0000
Message-ID: <20081122164738.2226b63e@lxorguk.ukuu.org.uk>
References: <20081121181948.ee771502.sfr@canb.auug.org.au>
	<Pine.LNX.4.64.0811221558340.30025@anakin>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:41027 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1758613AbYKVQrr (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 22 Nov 2008 11:47:47 -0500
In-Reply-To: <Pine.LNX.4.64.0811221558340.30025@anakin>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>

> | -	struct scc_port *port = ptr;
> | +	struct scc_port *scc = container_of(port, struct scc_port, gs.port);
> |  	unsigned channel = port->channel;
> |  
> |  	return !!(scc_last_status_reg[channel] & SR_DCD);
> 
> Issues:
>   1. When Atari support is enabled, `scc' is defined in
>      include/asm-m68k/atari.h as:
> 
> 	# define scc ((*(volatile struct SCC*)SCC_BAS))
> 
>      However, renaming the variable `scc' doesn't help, as
> 
>   2. the variable `scc' is not used in scc_carrier_raised(),
> 
>   3. `port->channel' on line 635 still fails as `port' is not longer `struct
>      scc_port', but a 'struct tty_port', which has no member named 'channel'.

Will take a look at this, but gs is going to away so at some point
someone with hardware is going to have to admit to owning this driver or
just mark it BROKEN..

Alan
