From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 3/3] m68k: section mismatch fixes: Atari SCSI
Date: Fri, 30 Jan 2009 19:38:20 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0901301937550.23582@anakin>
References: <1b1304130901131349n6b67eac5j1c17f4791dd6718e@mail.gmail.com>
 <20090114003245.GA4419@cynthia.pants.nu> <Pine.LNX.4.64.0901141224080.16246@loopy.telegraphics.com.au>
 <alpine.DEB.1.00.0901170022250.27520@zirkon.biophys.uni-duesseldorf.de>
 <alpine.DEB.1.00.0901170354200.1528@zirkon.biophys.uni-duesseldorf.de>
 <Pine.LNX.4.64.0901171258170.25319@anakin>
 <alpine.DEB.1.00.0901180302190.9820@zirkon.biophys.uni-duesseldorf.de>
 <alpine.DEB.1.00.0901180319130.9820@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from edna.telenet-ops.be ([195.130.132.58]:59704 "EHLO
	edna.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752288AbZA3SiW (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 30 Jan 2009 13:38:22 -0500
In-Reply-To: <alpine.DEB.1.00.0901180319130.9820@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: linux-m68k@vger.kernel.org

On Sun, 18 Jan 2009, Michael Schmitz wrote:
> There's one remaining section mismatch that I cannot fix:
> 
> WARNING: vmlinux.o(.text+0x69fc): Section mismatch in reference from the 
> function atari_stram_alloc() to the function .init.text:__alloc_bootmem_low()
> The function atari_stram_alloc() references
> the function __init __alloc_bootmem_low().
> This is often because atari_stram_alloc lacks a __init 
> annotation or the annotation of __alloc_bootmem_low is wrong.
> 
> atari_stram_alloc() is needed after kernel init, and __alloc_bootmem_low is 
> never called after MMU init, so that seems harmless.

Yep, I went through the same logic before...

> commit 0937bf535329004b055dacdaf4d06fa424f716a2
> Author: Michael Schmitz <schmitz@xplor.waratah.dyndns.org>
> Date:   Fri Jan 2 23:44:01 2009 +0100
> 
>     [m68k] Atari SCSI: add __init annotations to probe routines

OK, thx.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
