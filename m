From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH] macfb: Do not overflow fb_fix_screeninfo.id
Date: Tue, 28 Oct 2008 19:58:00 +1100 (EST)
Message-ID: <Pine.LNX.4.64.0810281845250.31382@loopy.telegraphics.com.au>
References: <Pine.LNX.4.64.0810270822540.15317@anakin>
 <20081027220957.42cac1db.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from loopy.telegraphics.com.au ([202.45.126.152]:37367 "EHLO
	loopy.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751575AbYJ1I6E (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 28 Oct 2008 04:58:04 -0400
In-Reply-To: <20081027220957.42cac1db.akpm@linux-foundation.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux Frame Buffer Device Development <linux-fbdev-devel@lists.sourceforge.net>, Linux/m68k <linux-m68k@vger.kernel.org>, stable@kernel.org



On Mon, 27 Oct 2008, Andrew Morton wrote:

> On Mon, 27 Oct 2008 08:23:43 +0100 (CET) Geert Uytterhoeven 
> <geert@linux-m68k.org> wrote:
> 
> > From: Finn Thain <fthain@telegraphics.com.au>
> > 
> > Don't overflow the 16-character fb_fix_screeninfo id string (fixes 
> > some console erasing and blanking artifacts). Have the ID default to 
> > "Unknown" on machines with no built-in video and no nubus devices. 
> > Check for fb_alloc_cmap failure.
> 
> The patch applies OK to 2.6.27, 2.6.26 and 2.6.25 (at least).
> 
> Should we backport it and if so, how far?

Please do. The problem was introduced somewhere in the 2.5 series.

Thanks,

Finn

> 
> Thanks. -- To unsubscribe from this list: send the line "unsubscribe 
> linux-m68k" in the body of a message to majordomo@vger.kernel.org More 
> majordomo info at http://vger.kernel.org/majordomo-info.html
> 
