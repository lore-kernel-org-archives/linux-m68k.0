From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: fbtest (was: Re: [PATCH/RFC] atafb and panning)
Date: Sun, 23 Nov 2008 11:34:43 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0811231133580.30025@anakin>
References: <Pine.LNX.4.64.0811162235251.20005@anakin>
 <alpine.DEB.1.00.0811190828090.6915@zirkon.biophys.uni-duesseldorf.de>
 <Pine.LNX.4.64.0811190912190.27671@anakin>
 <alpine.DEB.1.00.0811230336120.8478@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from winston.telenet-ops.be ([195.130.137.75]:40069 "EHLO
	winston.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755883AbYKWKeq (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 23 Nov 2008 05:34:46 -0500
In-Reply-To: <alpine.DEB.1.00.0811230336120.8478@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Linux Frame Buffer Device Development <linux-fbdev-devel@lists.sourceforge.net>

On Sun, 23 Nov 2008, Michael Schmitz wrote:
> > > I'll test your patch as soon as I get fbtest to work (missing libgcc_s.so.2).
> > The alternative is to compile fbtest yourself (CVS module
> > FBdev/utlilities/fbtest from project linux-fbdev on sf.net).
> 
> Logging in to :pserver:anonymous@cvs.sourceforge.net:2401/cvsroot/linux-fbdev
> CVS password: 
> cvs [login aborted]: connect to cvs.sourceforge.net(216.34.181.96):2401 failed: 
> Connection refused
> 
> cvsweb access is down as well. 

I put a git clone at
git://git.kernel.org/pub/scm/linux/kernel/git/geert/fbtest.git

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
