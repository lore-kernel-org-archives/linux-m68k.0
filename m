From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: fix recursive dependency in Kconfig
Date: Mon, 29 Dec 2008 11:18:45 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0812291117540.20983@anakin>
References: <20081226214643.GA17590@uranus.ravnborg.org>
 <Pine.LNX.4.64.0812282011390.20983@anakin> <20081228194205.GA22825@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from monty.telenet-ops.be ([195.130.132.56]:49490 "EHLO
	monty.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752217AbYL2KSs (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 29 Dec 2008 05:18:48 -0500
In-Reply-To: <20081228194205.GA22825@uranus.ravnborg.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Roman Zippel <zippel@linux-m68k.org>, linux-m68k@vger.kernel.org

On Sun, 28 Dec 2008, Sam Ravnborg wrote:
> On Sun, Dec 28, 2008 at 08:12:27PM +0100, Geert Uytterhoeven wrote:
> > On Fri, 26 Dec 2008, Sam Ravnborg wrote:
> > > We had a recursive dependency between MMU_MOTOROLA and MMU_SUN3
> > > Fix it by dropping the unused dependencies on MMU_MOTOROLA.
> > > 
> > > MMU_MOTOROLA is set to y only using select so any dependencies
> > > are anyway ignored.
> > > 
> > > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > > Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> > > Cc: Roman Zippel <zippel@linux-m68k.org>
> > > ---
> > > 
> > > I hit this recursive dependency with a patched version
> > > of kconfig so you may not see it today.
> > > The fix is obvious - please apply.
> > 
> > Queued in for-next.
> > 
> > I guess you want this in Linus' tree for 2.6.29?
> 
> Yes please. I plan to submit the improved dependency check in my second
> kbuild update if Roman do not nack it.

As Linus just pulled from the m68k tree, it may take a while before I have
some more stuff ready. So please feel free to add it to the kbuild tree
before submitting the improved dependency check.

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Thanks!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
