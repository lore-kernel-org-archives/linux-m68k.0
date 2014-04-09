From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH 0/4] Atari kernel-in-FastRAM patches, take three
Date: Wed, 9 Apr 2014 16:44:39 +1000 (EST)
Message-ID: <alpine.LNX.2.00.1404091628270.17330@nippy.intranet>
References: <1396137686-32678-1-git-send-email-schmitz@debian.org> <8761mvl3jb.fsf@igel.home> <CAOmrzkLWKq_qxmL5wKsGQGvAwNEQCP1QHhkd70vxViAyBoP98g@mail.gmail.com> <87a9c63x1c.fsf@igel.home> <CAOmrzkLbnUYjaEYa3MAccs03J46OWWKtndA3zyE8Kc+Ckr2eEg@mail.gmail.com>
 <87txae2dt4.fsf@igel.home> <20140331235216.GA2109@mail.biophys.uni-duesseldorf.de> <CAMuHMdUeMv1R69vSLv0HZpKEgVpRUG_iMs=61JWVubBsSN7VVA@mail.gmail.com> <alpine.LNX.2.00.1404012153360.16187@nippy.intranet> <CAOmrzk+GSRe6TjzqbnCqwZuBR10HwC47dJ6TBF+MJBvgAvkhjA@mail.gmail.com>
 <alpine.LNX.2.00.1404041704430.29768@nippy.intranet>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:34468 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750841AbaDIGpE (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 9 Apr 2014 02:45:04 -0400
In-Reply-To: <alpine.LNX.2.00.1404041704430.29768@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Michael Schmitz <schmitz@mail.biophys.uni-duesseldorf.de>, Andreas Schwab <schwab@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>, debian m68k <debian-68k@lists.debian.org>


On Fri, 4 Apr 2014, I wrote:

> On Wed, 2 Apr 2014, Michael Schmitz wrote:
> 
> > > It may be possible to boot Linux with MacOS running in 24-bit mode, 
> > > and ISTR that this leads to a large number of memory chunks.
> > 
> > The chunk size would still be 16 MB, perhaps?
> 
> Looking at the Penguin source, findRAM() in Source/mmu_support.c sorts 
> the boot info memory mappings so that the largest chunk comes first. In 
> 32-bit mode, it will probably be the only chunk.

... but not always: Designing Cards & Drivers 3ed. p.28 says, "In the 
Macintosh IIci and the Macintosh IIsi, physical memory is not in one 
contiguous block, so the MMU of the 68030 joins the blocks of physical 
memory to present contiguous logical memory to application software."

-- 
