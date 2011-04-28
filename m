From: David Rientjes <rientjes@google.com>
Subject: Re: [git pull] m68k SLUB fix for 2.6.39
Date: Thu, 28 Apr 2011 14:41:50 -0700 (PDT)
Message-ID: <alpine.DEB.2.00.1104281437010.21665@chino.kir.corp.google.com>
References: <alpine.DEB.2.00.1104282000200.1563@ayla.of.borg> <alpine.DEB.2.00.1104281420140.21665@chino.kir.corp.google.com> <1304026464.2598.36.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp-out.google.com ([216.239.44.51]:57148 "EHLO
	smtp-out.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754259Ab1D1Vlx (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 28 Apr 2011 17:41:53 -0400
Received: from wpaz37.hot.corp.google.com (wpaz37.hot.corp.google.com [172.24.198.101])
	by smtp-out.google.com with ESMTP id p3SLfrXr025061
	for <linux-m68k@vger.kernel.org>; Thu, 28 Apr 2011 14:41:53 -0700
Received: from pve37 (pve37.prod.google.com [10.241.210.37])
	by wpaz37.hot.corp.google.com with ESMTP id p3SLfgpW012372
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=NOT)
	for <linux-m68k@vger.kernel.org>; Thu, 28 Apr 2011 14:41:51 -0700
Received: by pve37 with SMTP id 37so2667408pve.21
        for <linux-m68k@vger.kernel.org>; Thu, 28 Apr 2011 14:41:51 -0700 (PDT)
In-Reply-To: <1304026464.2598.36.camel@mulgrave.site>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: James Bottomley <James.Bottomley@suse.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Pekka Enberg <penberg@cs.helsinki.fi>, Christoph Lameter <cl@linux.com>, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 28 Apr 2011, James Bottomley wrote:

> > Since 4a5fa3590f09 ([PARISC] slub: fix panic with DISCONTIGMEM) from 
> > 2.6.39-rc4, you can't actually select slub on m68k without CONFIG_ADVANCED 
> > and CONFIG_SINGLE_MEMORY_CHUNK because it otherwises defaults to 
> > discontigmem.
> > 
> > James tested hppa64 with my N_NORMAL_MEMORY fix and found that it turned 
> > an SMP box into UP.  If you've tested slub on m68k without regressions, 
> > then perhaps you'd like to add a "|| M68K" to CONFIG_SLUB?
> 
> To be honest, I really don't see that fixing it.  As soon as you
> allocate memory beyond range zero, you move onto a non-zero node as far
> as slub is concerned, and that will oops.
> 

Possible nodes are represented in slub with N_NORMAL_MEMORY, so the 
kmem_cache_node structures are allocated and initialized based on this 
nodemask.  As long as the memory ranges map to nodes set in the nodemask, 
this should be fine.

> I think what the N_NORMAL_MEMORY patch did is just make it take a whiile
> before you start allocating from that range.  Try executing a memory
> balloon on the platform; that was how we first demonstrated the problem
> on parisc.
> 

With parisc, you encountered an oops in add_partial() because the 
kmem_cache_node structure for the memory range returned by page_to_nid() 
was not allocated.  init_kmem_cache_nodes() takes care of this for all 
memory ranges set in N_NORMAL_MEMORY.

Adding Christoph and Pekka to the cc if there is additional concerns about 
slub on this architecture.
