From: Brad Boyer <flar@allandria.com>
Subject: Re: [uClinux-dev] [PATCH] m68k: reorganize Kconfig options to
 improve mmu/non-mmu selections
Date: Mon, 15 Aug 2011 15:17:05 -0700
Message-ID: <20110815221705.GA31022@cynthia.pants.nu>
References: <1313039421-26075-1-git-send-email-gerg@snapgear.com>
 <20110811061522.GC21757@merkur.ravnborg.org>
 <4E437A0B.3030201@snapgear.com>
 <20110812043022.GB4940@cynthia.pants.nu>
 <4E486E0F.3080601@snapgear.com>
 <20110815154942.GA15310@caffeine.csclub.uwaterloo.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from cynthia.allandria.com ([76.245.85.235]:48366 "EHLO
	cynthia.pants.nu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753251Ab1HOWRO (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 15 Aug 2011 18:17:14 -0400
Content-Disposition: inline
In-Reply-To: <20110815154942.GA15310@caffeine.csclub.uwaterloo.ca>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Lennart Sorensen <lsorense@csclub.uwaterloo.ca>
Cc: uClinux development list <uclinux-dev@uclinux.org>, linux-m68k@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>

On Mon, Aug 15, 2011 at 11:49:42AM -0400, Lennart Sorensen wrote:
> On Mon, Aug 15, 2011 at 10:53:35AM +1000, Greg Ungerer wrote:
> > Even if we remove these options now they can always be re-introduced
> > if and when a driver that needs them is ready for mainline.
> 
> Didn't the Amiga 600 and 1200 have PCMCIA slots?  I have no idea if
> those are supported.  I certainly don't have either of those (only some
> 500s and a 2000).

If I've read the code correctly, the apne driver supports an 8390 based
(normally used with pcnet_cs) PCMCIA card in the slots in those models.
However, it's not written to use the common PCMCIA framework. This is
why you have to use a specific list of supported cards rather than
anything normally supported by Linux. I remember someone complaining
that all they had was a 3Com Etherlink card which had worked in AmigaOS
but didn't work in Linux.

I get the impression that the Amiga slots are about as bad as what Apple
did in their first Macintosh PCMCIA implementation in terms of being
hard to support generically, but perhaps an Amiga slot driver could
eventually be written that would use the common PCMCIA framework.

	Brad Boyer
	flar@allandria.com
