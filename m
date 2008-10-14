From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [patch 3/2] m68k: Atari EtherNAT - add writew_be for data push
Date: Tue, 14 Oct 2008 21:47:31 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0810142146480.25759@anakin>
References: <20080903071542.615137611@mail.of.borg> <20080903071741.424551678@mail.of.borg>
 <20080903073629.GD4104@cs181140183.pp.htv.fi> <Pine.LNX.4.64.0809032114590.23421@anakin>
 <alpine.DEB.1.00.0809042347400.3429@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from wilson.telenet-ops.be ([195.130.132.42]:43665 "EHLO
	wilson.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750812AbYJNTre (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 14 Oct 2008 15:47:34 -0400
In-Reply-To: <alpine.DEB.1.00.0809042347400.3429@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: linux-m68k@vger.kernel.org, debian-68k@lists.debian.org

	Hi Michael,

On Thu, 4 Sep 2008, Michael Schmitz wrote:
> as you've probably noticed, my previous EtherNAT patch does not compile
> without this one being applied as well.
> 
> Comments welcome (is there anyone on this list with access to an EtherNAT
> card,
> besides cts and myself?).
> 
> Regarding performance afforded by having a 100 Mbit PHY instead of a 10 Mbit
> one:
> 
> EtherNAT: 210 KB/s out, 140 KB/s in (scp of a 35 MB vmlinux file)
> EtherNEC: 175 KB/s out, 128 KB/s in (same file)
> 
> Hardly worth it, eh?

That's slower than my Ariadne?

BTW, do you have a patch for this?

| drivers/net/atari_91C111.c:2317: error: 'struct smc91x_platdata' has no member named 'irq_flags'
| drivers/net/atari_91C111.c:2361: error: 'struct smc91x_platdata' has no member named 'irq_flags'
| drivers/net/atari_91C111.c:2371: error: 'struct smc91x_platdata' has no member named 'irq_flags'
| drivers/net/atari_91C111.c:2411: error: 'struct smc91x_platdata' has no member named 'irq_flags'

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
