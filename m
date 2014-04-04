From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH 0/4] Atari kernel-in-FastRAM patches, take three
Date: Fri, 4 Apr 2014 17:12:09 +1100 (EST)
Message-ID: <alpine.LNX.2.00.1404041704430.29768@nippy.intranet>
References: <1396137686-32678-1-git-send-email-schmitz@debian.org> <8761mvl3jb.fsf@igel.home> <CAOmrzkLWKq_qxmL5wKsGQGvAwNEQCP1QHhkd70vxViAyBoP98g@mail.gmail.com> <87a9c63x1c.fsf@igel.home> <CAOmrzkLbnUYjaEYa3MAccs03J46OWWKtndA3zyE8Kc+Ckr2eEg@mail.gmail.com>
 <87txae2dt4.fsf@igel.home> <20140331235216.GA2109@mail.biophys.uni-duesseldorf.de> <CAMuHMdUeMv1R69vSLv0HZpKEgVpRUG_iMs=61JWVubBsSN7VVA@mail.gmail.com> <alpine.LNX.2.00.1404012153360.16187@nippy.intranet>
 <CAOmrzk+GSRe6TjzqbnCqwZuBR10HwC47dJ6TBF+MJBvgAvkhjA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:48178 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751965AbaDDGMd (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 4 Apr 2014 02:12:33 -0400
In-Reply-To: <CAOmrzk+GSRe6TjzqbnCqwZuBR10HwC47dJ6TBF+MJBvgAvkhjA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Michael Schmitz <schmitz@mail.biophys.uni-duesseldorf.de>, Andreas Schwab <schwab@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>, debian m68k <debian-68k@lists.debian.org>


On Wed, 2 Apr 2014, Michael Schmitz wrote:

> Hi Finn,
> 
> > It may be possible to boot Linux with MacOS running in 24-bit mode, 
> > and ISTR that this leads to a large number of memory chunks. The 
> > Penguin
> 
> The chunk size would still be 16 MB, perhaps?

Looking at the Penguin source, findRAM() in Source/mmu_support.c sorts the 
boot info memory mappings so that the largest chunk comes first. In 32-bit 
mode, it will probably be the only chunk. Regardless of 24-bit mode or 
32-bit mode, it may not be a 16 MB chunk.

Finn
