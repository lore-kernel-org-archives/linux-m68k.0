From: David Rientjes <rientjes@google.com>
Subject: Re: [git pull] m68k SLUB fix for 2.6.39
Date: Wed, 4 May 2011 12:03:08 -0700 (PDT)
Message-ID: <alpine.DEB.2.00.1105041158020.22426@chino.kir.corp.google.com>
References: <alpine.DEB.2.00.1104282000200.1563@ayla.of.borg> <alpine.DEB.2.00.1104281420140.21665@chino.kir.corp.google.com> <1304026464.2598.36.camel@mulgrave.site> <alpine.DEB.2.00.1104281437010.21665@chino.kir.corp.google.com>
 <BANLkTimT4899xDF99Fj37u_CgnkeBzoFzQ@mail.gmail.com> <alpine.DEB.2.00.1105031538470.27795@chino.kir.corp.google.com> <alpine.DEB.2.00.1105040851090.5495@router.home>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp-out.google.com ([74.125.121.67]:9696 "EHLO
	smtp-out.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754870Ab1EDTDO (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 4 May 2011 15:03:14 -0400
Received: from wpaz21.hot.corp.google.com (wpaz21.hot.corp.google.com [172.24.198.85])
	by smtp-out.google.com with ESMTP id p44J3CvX015240
	for <linux-m68k@vger.kernel.org>; Wed, 4 May 2011 12:03:12 -0700
Received: from pwi5 (pwi5.prod.google.com [10.241.219.5])
	by wpaz21.hot.corp.google.com with ESMTP id p44J3Au6027676
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=NOT)
	for <linux-m68k@vger.kernel.org>; Wed, 4 May 2011 12:03:11 -0700
Received: by pwi5 with SMTP id 5so714597pwi.3
        for <linux-m68k@vger.kernel.org>; Wed, 04 May 2011 12:03:10 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.00.1105040851090.5495@router.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Christoph Lameter <cl@linux.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, James Bottomley <James.Bottomley@suse.de>, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Pekka Enberg <penberg@cs.helsinki.fi>, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 4 May 2011, Christoph Lameter wrote:

> As i have explained multiple times before: This is a generic issue with a
> kernel configuration that has DISCONTIGMEM on and NUMA configured off.
> Core code in various subsystems makes various assumptions in the !NUMA
> case. F.e. page_to_nid(page) == 0. Slub is one of them.
> 

Agreed, but James is still reporting that there is a slub oops with at 
least parisc even with the N_NORMAL_MEMORY fix applied.  He's currently 
retrying on a clean kernel with the latest git (and presumably 
CONFIG_BROKEN to enable CONFIG_SLUB).  If he reports that slub is no 
longer an issue with such a configuration, then I agree that we can remove 
the Kconfig change for slub so it no longer forces CONFIG_NUMA for 
CONFIG_DISCONTIGMEM (or CONFIG_BROKEN).

If that's the case, and we'll have to wait for James' report back first, 
then we can probably make adjustments in the per-arch Kconfigs that enable 
discontigmem without NUMA and then make it a strict requirement (or 
CONFIG_BROKEN) until the additional problems are solved in other places in 
the kernel.
