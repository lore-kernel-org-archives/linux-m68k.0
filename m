From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] m68k: fix recursive dependency in Kconfig
Date: Sun, 28 Dec 2008 20:42:05 +0100
Message-ID: <20081228194205.GA22825@uranus.ravnborg.org>
References: <20081226214643.GA17590@uranus.ravnborg.org> <Pine.LNX.4.64.0812282011390.20983@anakin>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:38135 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751733AbYL1Tkb (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 28 Dec 2008 14:40:31 -0500
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0812282011390.20983@anakin>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Roman Zippel <zippel@linux-m68k.org>, linux-m68k@vger.kernel.org

On Sun, Dec 28, 2008 at 08:12:27PM +0100, Geert Uytterhoeven wrote:
> On Fri, 26 Dec 2008, Sam Ravnborg wrote:
> > We had a recursive dependency between MMU_MOTOROLA and MMU_SUN3
> > Fix it by dropping the unused dependencies on MMU_MOTOROLA.
> > 
> > MMU_MOTOROLA is set to y only using select so any dependencies
> > are anyway ignored.
> > 
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> > Cc: Roman Zippel <zippel@linux-m68k.org>
> > ---
> > 
> > I hit this recursive dependency with a patched version
> > of kconfig so you may not see it today.
> > The fix is obvious - please apply.
> 
> Queued in for-next.
> 
> I guess you want this in Linus' tree for 2.6.29?

Yes please. I plan to submit the improved dependency check in my second
kbuild update if Roman do not nack it.

	Sam
