From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [uClinux-dev] [PATCH] m68k: Unify arch/m68k/include/asm/unistd.h
Date: Sun, 1 Feb 2009 23:39:11 +0100
Message-ID: <20090201223911.GA30935@uranus.ravnborg.org>
References: <Pine.LNX.4.64.0902011114410.30504@anakin> <498599A6.7080202@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:34885 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752410AbZBAWh2 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 1 Feb 2009 17:37:28 -0500
Content-Disposition: inline
In-Reply-To: <498599A6.7080202@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: uClinux development list <uclinux-dev@uclinux.org>, Greg Ungerer <gerg@uclinux.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>

On Sun, Feb 01, 2009 at 10:46:30PM +1000, Greg Ungerer wrote:
> Hi Geert,
> 
> Geert Uytterhoeven wrote:
> >>From b708bab9dbc93bc80bd06c9222ab34530736f737 Mon Sep 17 00:00:00 2001
> >From: Geert Uytterhoeven <geert@linux-m68k.org>
> >Date: Thu, 29 Jan 2009 21:21:40 +0100
> >Subject: [PATCH] m68k: Unify arch/m68k/include/asm/unistd.h
> >
> >arch/m68k/include/asm/unistd_{no,mm}.h are identical, except for whitespace
> >differences, so unify them.
> >
> >Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> >---
> 
> Looks good to me.
> 
> I started down the track of merging similar headers on Friday too.
> 
> So far I have about 12 or so for review at in the git tree below.
> (One of which is exactly this unistd.h merge :-)  Still plenty of
> easy merges amongst the other files too...

Glad to see this. When we merged sparc we likewise identified
more that was relatively easy to merge than at least I initially anticipated.

I am not able to help at least not the next month or so.
After that I hope to be able to have mroe Linux time again.

	Sam
