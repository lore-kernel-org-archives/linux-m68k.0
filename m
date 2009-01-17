From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Falcon IDE breakage
Date: Sat, 17 Jan 2009 12:58:54 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0901171258170.25319@anakin>
References: <1b1304130901131349n6b67eac5j1c17f4791dd6718e@mail.gmail.com>
 <20090114003245.GA4419@cynthia.pants.nu> <Pine.LNX.4.64.0901141224080.16246@loopy.telegraphics.com.au>
 <alpine.DEB.1.00.0901170022250.27520@zirkon.biophys.uni-duesseldorf.de>
 <alpine.DEB.1.00.0901170354200.1528@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from wilson.telenet-ops.be ([195.130.132.42]:50391 "EHLO
	wilson.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760756AbZAQL7A (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 17 Jan 2009 06:59:00 -0500
In-Reply-To: <alpine.DEB.1.00.0901170354200.1528@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, linux-m68k@vger.kernel.org

On Sat, 17 Jan 2009, Michael Schmitz wrote:
> your commit 5b31f855f10d0053e738baa6d91fb6a3fad35119 (introduction of IDE lock 
> helpers) breaks Atari Falcon IDE on the first request going out to the drive, if 
> I remove the request_irq() call from ide-probe.c (as it should be).

I assume this is on real hardware, as I didn't notice on ARAnyM?

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
