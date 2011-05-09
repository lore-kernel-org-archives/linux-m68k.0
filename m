From: James Bottomley <James.Bottomley@suse.de>
Subject: Re: [git pull] m68k SLUB fix for 2.6.39
Date: Mon, 09 May 2011 17:24:04 -0500
Message-ID: <1304979845.4865.58.camel@mulgrave.site>
References: <alpine.DEB.2.00.1104282000200.1563@ayla.of.borg>
	 <alpine.DEB.2.00.1104281420140.21665@chino.kir.corp.google.com>
	 <1304026464.2598.36.camel@mulgrave.site>
	 <alpine.DEB.2.00.1104281437010.21665@chino.kir.corp.google.com>
	 <1304521355.2810.21.camel@mulgrave.site>
	 <alpine.DEB.2.00.1105041203250.22426@chino.kir.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:46835 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752455Ab1EIWYV (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Mon, 9 May 2011 18:24:21 -0400
In-Reply-To: <alpine.DEB.2.00.1105041203250.22426@chino.kir.corp.google.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: David Rientjes <rientjes@google.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Pekka Enberg <penberg@cs.helsinki.fi>, Christoph Lameter <cl@linux.com>, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 2011-05-04 at 12:07 -0700, David Rientjes wrote:
> On Wed, 4 May 2011, James Bottomley wrote:
> 
> > Yes, but I also encountered it after I applied you patch, which is why I
> > still pushed the Kconfig patch.  It's possible, since there were a huge
> > number of patches flying around that the kernel base was contaminated,
> > so I'll strip down to just linus HEAD + parisc coherence patches,
> > reverting the Kconfig one and try again.
> > 
> 
> Great, and if that works out successfully this time around I think we'll 
> either need to fix each individual arch Kconfig that we know doesn't work 
> well (at least parisc because of the scheduling issue) so that it at least 
> enables CONFIG_NUMA implicitly for discontigmem unless CONFIG_BROKEN is 
> set.

OK, I confirm that the N_NORMAL_MEMORY patch on its own fixes slub for
us.  We can revert the mark slub BROKEN in DISCONTIGMEM && !NUMA patch.

> The ideal solution is probably to rely on CONFIG_NEED_MULTIPLE_NODES 
> rather than CONFIG_NUMA, which is why it was introduced in the first place 
> since it was duplicating data structures for both NUMA and discontigmem.  
> That's apparently broken somewhere in the kernel that turned your SMP box 
> into an UP.

Sure ... either that or accelerate a conversion to something like
SPARSEMEM.

James
