From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] m68k: fix recursive dependency in Kconfig
Date: Mon, 29 Dec 2008 15:02:02 +0100
Message-ID: <20081229140202.GA7327@uranus.ravnborg.org>
References: <20081226214643.GA17590@uranus.ravnborg.org> <Pine.LNX.4.64.0812282011390.20983@anakin> <20081228194205.GA22825@uranus.ravnborg.org> <Pine.LNX.4.64.0812291117540.20983@anakin>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:33368 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753341AbYL2OA3 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 29 Dec 2008 09:00:29 -0500
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0812291117540.20983@anakin>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Roman Zippel <zippel@linux-m68k.org>, linux-m68k@vger.kernel.org

On Mon, Dec 29, 2008 at 11:18:45AM +0100, Geert Uytterhoeven wrote:
> On Sun, 28 Dec 2008, Sam Ravnborg wrote:
> > On Sun, Dec 28, 2008 at 08:12:27PM +0100, Geert Uytterhoeven wrote:
> > > On Fri, 26 Dec 2008, Sam Ravnborg wrote:
> > > > We had a recursive dependency between MMU_MOTOROLA and MMU_SUN3
> > > > Fix it by dropping the unused dependencies on MMU_MOTOROLA.
> > > > 
> > > > MMU_MOTOROLA is set to y only using select so any dependencies
> > > > are anyway ignored.
> > > > 
> > > > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > > > Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> > > > Cc: Roman Zippel <zippel@linux-m68k.org>
> > > > ---
> > > > 
> > > > I hit this recursive dependency with a patched version
> > > > of kconfig so you may not see it today.
> > > > The fix is obvious - please apply.
> > > 
> > > Queued in for-next.
> > > 
> > > I guess you want this in Linus' tree for 2.6.29?
> > 
> > Yes please. I plan to submit the improved dependency check in my second
> > kbuild update if Roman do not nack it.
> 
> As Linus just pulled from the m68k tree, it may take a while before I have
> some more stuff ready. So please feel free to add it to the kbuild tree
> before submitting the improved dependency check.
> 
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

OK - I added it to kbuild with your ack - thanks.

	Sam
