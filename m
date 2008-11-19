From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH/RFC] atafb and panning
Date: Wed, 19 Nov 2008 09:15:57 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0811190912190.27671@anakin>
References: <Pine.LNX.4.64.0811162235251.20005@anakin>
 <alpine.DEB.1.00.0811190828090.6915@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from harold.telenet-ops.be ([195.130.133.65]:40157 "EHLO
	harold.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752029AbYKSIQA (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 19 Nov 2008 03:16:00 -0500
In-Reply-To: <alpine.DEB.1.00.0811190828090.6915@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

On Wed, 19 Nov 2008, Michael Schmitz wrote:
> > Fix panning on ARAnyM (Falcon emulation). Without this, `fbtest test011' fails
> > (for a 320x200x8 display with virtual 640x400).
> 
> Fails how, exactly? 

It shows a corrupted display (bad line length) if xoffset & 15 != 0.

> > As the original code in 2.4.x was the same, I'm wondering:
> >   o Is this a bug in the ARAnyM emulation?
> >   o xpanstep is 1, but judging from the visual output on ARAnyM, it looks like
> >     it should be 16?
> > 
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > ---
> >  drivers/video/atafb.c |    2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > --- a/drivers/video/atafb.c
> > +++ b/drivers/video/atafb.c
> > @@ -1697,8 +1697,10 @@ static int falcon_pan_display(struct fb_
> >  	}
> >  	par->hw.falcon.line_offset = bpp *
> >  		(info->var.xres_virtual - info->var.xres) / 16;
> > +#if 0
> >  	if (par->hw.falcon.xoffset)
> >  		par->hw.falcon.line_offset -= bpp;
> > +#endif;
> 
> The way I understand this code is:
> 
> If var->xoffset has the low order bits set (sub-word pixel offset) 
> par->hw.falcon.xoffset takes care of that, and xoffset takes care of the rest. 
> Since the partial word offset shifts the beginnig of the scan line into the 
> first word, the offset to the next scan line (par->hw.falcon.line_offset) has to 
> be shortened. 

Sounds reasonable. But the shortening part doesn't work on ARAnyM, nor do
small panning increments. So it really smells like an ARAnyM bug.

> I am pretty sure the pan step can be one (see par->hw.falcon.xoffset).
> 
> I'll test your patch as soon as I get fbtest to work (missing libgcc_s.so.2).

The alternative is to compile fbtest yourself (CVS module
FBdev/utlilities/fbtest from project linux-fbdev on sf.net).
I've been thinking of putting a git clone on kernel.org...

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
