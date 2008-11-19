From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [PATCH/RFC] atafb and panning
Date: Wed, 19 Nov 2008 08:37:59 +0100 (CET)
Message-ID: <alpine.DEB.1.00.0811190828090.6915@zirkon.biophys.uni-duesseldorf.de>
References: <Pine.LNX.4.64.0811162235251.20005@anakin>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailout-hades.uni-duesseldorf.de ([134.99.128.34]:64556 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751769AbYKSHiB (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Wed, 19 Nov 2008 02:38:01 -0500
Received: from pmxchannel-daemon.mail.rz.uni-duesseldorf.de by
 mail.rz.uni-duesseldorf.de
 (Sun Java(tm) System Messaging Server 6.3-6.03 (built Mar 14 2008; 32bit))
 id <0KAK00600L7CQ500@mail.rz.uni-duesseldorf.de> for
 linux-m68k@vger.kernel.org; Wed, 19 Nov 2008 08:38:00 +0100 (MET)
In-reply-to: <Pine.LNX.4.64.0811162235251.20005@anakin>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Geert,

> Fix panning on ARAnyM (Falcon emulation). Without this, `fbtest test011' fails
> (for a 320x200x8 display with virtual 640x400).

Fails how, exactly? 
 
> As the original code in 2.4.x was the same, I'm wondering:
>   o Is this a bug in the ARAnyM emulation?
>   o xpanstep is 1, but judging from the visual output on ARAnyM, it looks like
>     it should be 16?
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  drivers/video/atafb.c |    2 ++
>  1 file changed, 2 insertions(+)
> 
> --- a/drivers/video/atafb.c
> +++ b/drivers/video/atafb.c
> @@ -1697,8 +1697,10 @@ static int falcon_pan_display(struct fb_
>  	}
>  	par->hw.falcon.line_offset = bpp *
>  		(info->var.xres_virtual - info->var.xres) / 16;
> +#if 0
>  	if (par->hw.falcon.xoffset)
>  		par->hw.falcon.line_offset -= bpp;
> +#endif;

The way I understand this code is:

If var->xoffset has the low order bits set (sub-word pixel offset) 
par->hw.falcon.xoffset takes care of that, and xoffset takes care of the rest. 
Since the partial word offset shifts the beginnig of the scan line into the 
first word, the offset to the next scan line (par->hw.falcon.line_offset) has to 
be shortened. 

I am pretty sure the pan step can be one (see par->hw.falcon.xoffset).

I'll test your patch as soon as I get fbtest to work (missing libgcc_s.so.2).

	Michael

