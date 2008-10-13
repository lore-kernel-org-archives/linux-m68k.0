From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] reinstate mac rtc
Date: Mon, 13 Oct 2008 21:21:21 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0810132114590.6220@anakin>
References: <Pine.LNX.4.64.0810061855300.28882@loopy.telegraphics.com.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from yergi.telenet-ops.be ([195.130.132.36]:59173 "EHLO
	yergi.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756696AbYJMTW6 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 13 Oct 2008 15:22:58 -0400
Received: from harold.telenet-ops.be (unknown [195.130.133.65])
	by yergi.telenet-ops.be (Postfix) with ESMTP id B0C96711776
	for <linux-m68k@vger.kernel.org>; Mon, 13 Oct 2008 21:21:47 +0200 (CEST)
In-Reply-To: <Pine.LNX.4.64.0810061855300.28882@loopy.telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k@vger.kernel.org

	Hi Finn,

Thanks, I've added:
    [PATCH] reinstate mac rtc
    [PATCH] mac via cleanup and commentry
    [PATCH] machw.h cleanup
    [PATCH] mac baboon interrupt enable/disable
    [PATCH] mac_esp asm fix
    [PATCH] macfb annotations and compiler warning fix
    [PATCH] fix trigraph ignored warning in setox.S
    [PATCH] fbcon: remove broken mac vbl handler
    [PATCH] mac_esp: fix for quadras with two esp chips
    [PATCH] m68k: Do not overflow fb_fix_screeninfo.id in macfb

Any of these I should still try to get into 2.6.28? Or is queueing for 2.6.29
OK?

Not that there's any risk in breaking non-m68k stuff, but I'm just feeling a
bit like the bastard-maintainer-from-hell who's pointing out people about
merge windows and such ;-)

I hope to find some time soon to push the stuff queued for 2.6.28 to
Linus...

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
