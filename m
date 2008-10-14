From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] reinstate mac rtc
Date: Tue, 14 Oct 2008 09:30:34 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0810140929450.6220@anakin>
References: <Pine.LNX.4.64.0810061855300.28882@loopy.telegraphics.com.au>
 <Pine.LNX.4.64.0810132114590.6220@anakin> <Pine.LNX.4.64.0810141315010.4862@loopy.telegraphics.com.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from harold.telenet-ops.be ([195.130.133.65]:54479 "EHLO
	harold.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760573AbYJNHaf (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 14 Oct 2008 03:30:35 -0400
In-Reply-To: <Pine.LNX.4.64.0810141315010.4862@loopy.telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k@vger.kernel.org

On Tue, 14 Oct 2008, Finn Thain wrote:
> On Mon, 13 Oct 2008, Geert Uytterhoeven wrote:
> > Any of these I should still try to get into 2.6.28? Or is queueing for 
> > 2.6.29 OK?
> > 
> > Not that there's any risk in breaking non-m68k stuff, but I'm just 
> > feeling a bit like the bastard-maintainer-from-hell who's pointing out 
> > people about merge windows and such ;-)
> > 
> > I hope to find some time soon to push the stuff queued for 2.6.28 to 
> > Linus...
> 
> I don't mind.
> 
> I guess, if you think that there is something in there that might lead to 
> merge conflicts later, perhaps you should send it now?

I'm not that worried about merge conflicts, now we have linux-next.
I don't want to rush in very recent patches.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
