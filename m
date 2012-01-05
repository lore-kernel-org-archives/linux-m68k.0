From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [RFC] m68k: Update defconfigs
Date: Thu, 5 Jan 2012 22:11:35 +1100 (EST)
Message-ID: <alpine.LNX.2.00.1201052201200.6601@nippy.intranet>
References: <alpine.DEB.2.00.1201042252450.15625@ayla.of.borg> <Pine.BSM.4.64L.1201042220180.16408@herc.mirbsd.org> <CAMuHMdVN470=RBQMHZ9PQ_rNCVbS4gD0+5P654YdxrBR3aqotA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from vm4.telegraphics.com.au ([98.124.60.149]:52526 "EHLO
	vps4.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754898Ab2AELLj (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 5 Jan 2012 06:11:39 -0500
In-Reply-To: <CAMuHMdVN470=RBQMHZ9PQ_rNCVbS4gD0+5P654YdxrBR3aqotA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thorsten Glaser <tg@mirbsd.de>, Michael Schmitz <schmitzmic@googlemail.com>, linux-m68k@vger.kernel.org, debian-68k@lists.debian.org


On Thu, 5 Jan 2012, Geert Uytterhoeven wrote:

> Finn, Michael: as pmaczilog uses platform devices, it can be made to 
> work on Atari, too?

I would think so. I don't recall anything peculiar about the platform 
device variant though the overlapping MMIO address ranges in the platform 
resources for the mac are a bit strange. You may need to add suitable 
delays to the register access routines. If you do any work on this driver, 
you should probably base it on Ben's tree as the recent changes are fairly 
significant.

Finn
