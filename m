From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: Fix atarimouse init
Date: Mon, 29 Dec 2008 11:57:57 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0812291151200.20983@anakin>
References: <20081217165557.b4898a4b.sfr@canb.auug.org.au>
 <Pine.LNX.4.64.0812170915400.29433@anakin> <Pine.LNX.4.64.0812211205270.3499@anakin>
 <alpine.DEB.1.00.0812282252230.10733@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from edna.telenet-ops.be ([195.130.132.58]:38296 "EHLO
	edna.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752604AbYL2K57 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 29 Dec 2008 05:57:59 -0500
In-Reply-To: <alpine.DEB.1.00.0812282252230.10733@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

On Sun, 28 Dec 2008, Michael Schmitz wrote:
> following up on Geert's report that atarimouse does fail to load as a module 
> (with ENODEV), here's the fix. 
> 
> Brown paper bag, well and truely. Got the semantics of the atari_keyb_init 
> return reversed (not that atari_keyb_init ever returns anything but success, but 
> that's for another day).
> 
> I still get no mouse events in either /dev/input/mice or .../mouse0, though. I 
> suspect the mouse open hook never gets called. Same bug might affect amimouse 
> (though the open function does do the full hardware setup there).

Thanks, we're making progress :-)

I get events from /dev/input/mouse0 and /dev/input/mice (atari_defconfig).

The kernel says (ARAnyM, windowed mode):
| input: Atari mouse as /devices/virtual/input/input1
| Reseting weird mouse packet: 942, 379, 0
| Reseting weird mouse packet: 943, 379, 0
| Reseting weird mouse packet: 945, 378, 0
| Reseting weird mouse packet: 948, 378, 0
| Reseting weird mouse packet: 956, 376, 0

When running X under ARAnyM (depth 16), some shortcomings show up:
  - up and down are interchanged (works fine when rolling the mouse over the
    bottom surface of the table --- old arabic map style ;-)
  - the left and right mouse button are interchanged
  - the middle mouse button is dead

Please put a `---' here, so `git am' will strip the signature and the diffstat.

> 	Michael
> 
>  drivers/input/mouse/atarimouse.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/input/mouse/atarimouse.c b/drivers/input/mouse/atarimouse.c
> index a57143c..1b5f4dd 100644
> --- a/drivers/input/mouse/atarimouse.c
> +++ b/drivers/input/mouse/atarimouse.c
> @@ -118,7 +118,7 @@ static int __init atamouse_init(void)
>  	if (!MACH_IS_ATARI || !ATARIHW_PRESENT(ST_MFP))
>  		return -ENODEV;
>  
> -	if (!atari_keyb_init())
> +	if (atari_keyb_init())
>  		return -ENODEV;
>  
>  	atamouse_dev = input_allocate_device();
> 
> Signed-off-by: Michael Schmitz <schmitz@debian.org>

Please put the SoB just below the changelog, else `git am' will strip it off.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
