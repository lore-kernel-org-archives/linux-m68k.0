From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/3] m68k: section mismatch fixes: EtherNAT
Date: Mon, 2 Feb 2009 08:43:04 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0902020841490.11930@anakin>
References: <1b1304130901131349n6b67eac5j1c17f4791dd6718e@mail.gmail.com>
 <20090114003245.GA4419@cynthia.pants.nu> <Pine.LNX.4.64.0901141224080.16246@loopy.telegraphics.com.au>
 <alpine.DEB.1.00.0901170022250.27520@zirkon.biophys.uni-duesseldorf.de>
 <alpine.DEB.1.00.0901170354200.1528@zirkon.biophys.uni-duesseldorf.de>
 <Pine.LNX.4.64.0901171258170.25319@anakin>
 <alpine.DEB.1.00.0901180302190.9820@zirkon.biophys.uni-duesseldorf.de>
 <Pine.LNX.4.64.0901301934430.23582@anakin>
 <alpine.DEB.1.00.0902010110530.2001@zirkon.biophys.uni-duesseldorf.de>
 <357469.86134.qm@web52404.mail.re2.yahoo.com>
 <alpine.DEB.1.00.0902020431040.19384@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nelson.telenet-ops.be ([195.130.133.66]:59948 "EHLO
	nelson.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752695AbZBBHnI (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 2 Feb 2009 02:43:08 -0500
In-Reply-To: <alpine.DEB.1.00.0902020431040.19384@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: "David D. Kilzer" <ddkilzer@yahoo.com>, linux-m68k@vger.kernel.org

	Hi Michael,

On Mon, 2 Feb 2009, Michael Schmitz wrote:
> > > (My git tree is in a rough state after I've started to play 
> > > with switching Atari SCSI to NCR5380.c, or at least a fresh
> > > clone of that!)
> > 
> > Have you tried "git stash" yet?
> 
> Obviously not :-) Might be just what I need, thanks. So far I've been working on 
> a local branch while pulling from Geert's master branch but that may be getting 
> a bit tricky.

If you use `git pull --rebase' it will rebase your changes against my tree,
and all patches you sent and I integrated will automatically be detected.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
