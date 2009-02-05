From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Fix support for console port other than ttyS0 on mcf.c
Date: Thu, 5 Feb 2009 17:36:10 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0902051734500.5127@anakin>
References: <20090204201518.GH26064@csclub.uwaterloo.ca>
 <20090204202009.GI26064@csclub.uwaterloo.ca> <Pine.LNX.4.64.0902042200340.25136@anakin>
 <20090205152751.GL26064@csclub.uwaterloo.ca> <Pine.LNX.4.64.0902051652080.5127@anakin>
 <20090205155700.GO26064@csclub.uwaterloo.ca>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from gerard.telenet-ops.be ([195.130.132.48]:56060 "EHLO
	gerard.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753703AbZBEQgN (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 5 Feb 2009 11:36:13 -0500
In-Reply-To: <20090205155700.GO26064@csclub.uwaterloo.ca>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Lennart Sorensen <lsorense@csclub.uwaterloo.ca>
Cc: Linux Kernel Development <linux-kernel@vger.kernel.org>, linux-m68k@vger.kernel.org, uClinux list <uclinux-dev@uclinux.org>

On Thu, 5 Feb 2009, Lennart Sorensen wrote:
> On Thu, Feb 05, 2009 at 04:53:50PM +0100, Geert Uytterhoeven wrote:
> > linux-m68k@lists.linux-m68k.org handles m68k (with MMU) only.
> > uclinux-dev@uclinux.org handles m68knommu.
> 
> Oh.  I think I got confused by the fact the same arch/m68k/include is
> used for both. so I looked up m68k in MAINTAINERS.

Yeah, we just merged it a few day ago :-)

The goal is to merge arch/m68k{,nommu}, too (eventually)...

> I will start bothering uclinux-dev@uclinux.org instead.
> 
> So by uclinux driver you meant m68knommu uclinux driver.  I was thinking
> uclibc for some reason.

Yes, m68knommu uclinux driver.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
