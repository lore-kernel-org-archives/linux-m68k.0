From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/3] m68k: section mismatch fixes: DMAsound
Date: Fri, 30 Jan 2009 19:37:42 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0901301935300.23582@anakin>
References: <1b1304130901131349n6b67eac5j1c17f4791dd6718e@mail.gmail.com>
 <20090114003245.GA4419@cynthia.pants.nu> <Pine.LNX.4.64.0901141224080.16246@loopy.telegraphics.com.au>
 <alpine.DEB.1.00.0901170022250.27520@zirkon.biophys.uni-duesseldorf.de>
 <alpine.DEB.1.00.0901170354200.1528@zirkon.biophys.uni-duesseldorf.de>
 <Pine.LNX.4.64.0901171258170.25319@anakin>
 <alpine.DEB.1.00.0901180302190.9820@zirkon.biophys.uni-duesseldorf.de>
 <alpine.DEB.1.00.0901180312240.9820@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from harold.telenet-ops.be ([195.130.133.65]:60382 "EHLO
	harold.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751738AbZA3Shp (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 30 Jan 2009 13:37:45 -0500
In-Reply-To: <alpine.DEB.1.00.0901180312240.9820@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: linux-m68k@vger.kernel.org

On Sun, 18 Jan 2009, Michael Schmitz wrote:
> commit 277d9bd7a6198e50fdaa841d3383a46a5cf2d185
> Author: Michael Schmitz <schmitz@xplor.waratah.dyndns.org>
> Date:   Fri Jan 2 08:06:17 2009 +0100
> 
>     [m68k] section mismatch fixes: add __initdata to driver presets struct

I don't get section mismatch warnings for dmasound_atari?

>     Signed-off-By: Michael Schmitz <schmitz@debian.org>
> ---
> diff --git a/sound/oss/dmasound/dmasound_atari.c b/sound/oss/dmasound/dmasound_atari.c
> index 4d45bd6..43b10b1 100644
> --- a/sound/oss/dmasound/dmasound_atari.c
> +++ b/sound/oss/dmasound/dmasound_atari.c
> @@ -1523,7 +1523,7 @@ static SETTINGS def_soft = {
>  	.speed	= 8000
>  } ;
>  
> -static MACHINE machTT = {
> +static __initdata MACHINE machTT = {
>  	.name		= "Atari",
>  	.name2		= "TT",
>  	.owner		= THIS_MODULE,
> @@ -1552,7 +1552,7 @@ static MACHINE machTT = {
>  	.capabilities	=  DSP_CAP_BATCH	/* As per SNDCTL_DSP_GETCAPS */
>  };
>  
> -static MACHINE machFalcon = {
> +static __initdata MACHINE machFalcon = {
>  	.name		= "Atari",
>  	.name2		= "FALCON",
>  	.dma_alloc	= AtaAlloc,

But these are OK, as mach{TT,Falcon} are copied in dmasound_atari_init().

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
