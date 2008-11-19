From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH/RFC] atafb line length
Date: Wed, 19 Nov 2008 09:12:14 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0811190909530.27671@anakin>
References: <Pine.LNX.4.64.0811162228270.20005@anakin>
 <alpine.DEB.1.00.0811190757430.6915@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from monty.telenet-ops.be ([195.130.132.56]:47775 "EHLO
	monty.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751187AbYKSIMS (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 19 Nov 2008 03:12:18 -0500
In-Reply-To: <alpine.DEB.1.00.0811190757430.6915@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

On Wed, 19 Nov 2008, Michael Schmitz wrote:
> > Make sure fix->line_length is always set, as some applications need it because
> > they don't have fallback code if line_length is zero.
> > 
> > Works on ARAnyM (Falcon emulation), but par->next_line is not set on any other
> > Atari variant?
> 
> You're right - while testing on the Falcon framebuffer I noticed 
> fix->line_length needs to be set, and kludged around to get it set to something 
> more or less sane, but I could not test the other code paths. 
> 
> It looks like par->next_line should be set to linelen in all other decode_var 
> variants. The quilt tree here does have fix->line_length = par->next_line 
> already, what is your patch based on? 

It was based on mainline. Yes, a part of my patch had been in my quilt series
for a while, but I wanted to post the full thing for review.

> I had 
> 
> fix->line_length = (par->hw.falcon.line_width + par->hw.falcon.line_offset) *
> 		par->hw.falcon.bpp / 8;
> 
> originally - I suppose this had to change with your cfb fixes? 

That should be OK. Strange, it's not what I got from you, cfr. atafb in
mainline.

Cfb16 needed
  1. fix->line_length to be valid (it was zero)
  2. info->pseudo_palette

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
