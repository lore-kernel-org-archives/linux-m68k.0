From: David Rientjes <rientjes@google.com>
Subject: Re: [git pull] m68k SLUB fix for 2.6.39
Date: Wed, 4 May 2011 12:07:56 -0700 (PDT)
Message-ID: <alpine.DEB.2.00.1105041203250.22426@chino.kir.corp.google.com>
References: <alpine.DEB.2.00.1104282000200.1563@ayla.of.borg> <alpine.DEB.2.00.1104281420140.21665@chino.kir.corp.google.com> <1304026464.2598.36.camel@mulgrave.site> <alpine.DEB.2.00.1104281437010.21665@chino.kir.corp.google.com>
 <1304521355.2810.21.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp-out.google.com ([216.239.44.51]:4702 "EHLO
	smtp-out.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753999Ab1EDTIA (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 4 May 2011 15:08:00 -0400
Received: from kpbe13.cbf.corp.google.com (kpbe13.cbf.corp.google.com [172.25.105.77])
	by smtp-out.google.com with ESMTP id p44J7xWh004184
	for <linux-m68k@vger.kernel.org>; Wed, 4 May 2011 12:07:59 -0700
Received: from pvg7 (pvg7.prod.google.com [10.241.210.135])
	by kpbe13.cbf.corp.google.com with ESMTP id p44J72Ll019010
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=NOT)
	for <linux-m68k@vger.kernel.org>; Wed, 4 May 2011 12:07:58 -0700
Received: by pvg7 with SMTP id 7so647101pvg.9
        for <linux-m68k@vger.kernel.org>; Wed, 04 May 2011 12:07:58 -0700 (PDT)
In-Reply-To: <1304521355.2810.21.camel@mulgrave.site>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: James Bottomley <James.Bottomley@suse.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Pekka Enberg <penberg@cs.helsinki.fi>, Christoph Lameter <cl@linux.com>, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 4 May 2011, James Bottomley wrote:

> Yes, but I also encountered it after I applied you patch, which is why I
> still pushed the Kconfig patch.  It's possible, since there were a huge
> number of patches flying around that the kernel base was contaminated,
> so I'll strip down to just linus HEAD + parisc coherence patches,
> reverting the Kconfig one and try again.
> 

Great, and if that works out successfully this time around I think we'll 
either need to fix each individual arch Kconfig that we know doesn't work 
well (at least parisc because of the scheduling issue) so that it at least 
enables CONFIG_NUMA implicitly for discontigmem unless CONFIG_BROKEN is 
set.

The ideal solution is probably to rely on CONFIG_NEED_MULTIPLE_NODES 
rather than CONFIG_NUMA, which is why it was introduced in the first place 
since it was duplicating data structures for both NUMA and discontigmem.  
That's apparently broken somewhere in the kernel that turned your SMP box 
into an UP.
