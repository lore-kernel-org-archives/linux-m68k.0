From: David Rientjes <rientjes@google.com>
Subject: [patch] slub: Revert "[PARISC] slub: fix panic with DISCONTIGMEM"
Date: Tue, 10 May 2011 17:08:54 -0700 (PDT)
Message-ID: <alpine.DEB.2.00.1105101656310.15037@chino.kir.corp.google.com>
References: <alpine.DEB.2.00.1104282000200.1563@ayla.of.borg> <alpine.DEB.2.00.1104281420140.21665@chino.kir.corp.google.com> <1304026464.2598.36.camel@mulgrave.site> <alpine.DEB.2.00.1104281437010.21665@chino.kir.corp.google.com> <1304521355.2810.21.camel@mulgrave.site>
 <alpine.DEB.2.00.1105041203250.22426@chino.kir.corp.google.com> <1304979845.4865.58.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp-out.google.com ([74.125.121.67]:9831 "EHLO
	smtp-out.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753462Ab1EKAJB (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 10 May 2011 20:09:01 -0400
Received: from kpbe17.cbf.corp.google.com (kpbe17.cbf.corp.google.com [172.25.105.81])
	by smtp-out.google.com with ESMTP id p4B08xfj025511
	for <linux-m68k@vger.kernel.org>; Tue, 10 May 2011 17:08:59 -0700
Received: from pwi4 (pwi4.prod.google.com [10.241.219.4])
	by kpbe17.cbf.corp.google.com with ESMTP id p4B08ugQ032453
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=NOT)
	for <linux-m68k@vger.kernel.org>; Tue, 10 May 2011 17:08:57 -0700
Received: by pwi4 with SMTP id 4so12722pwi.25
        for <linux-m68k@vger.kernel.org>; Tue, 10 May 2011 17:08:55 -0700 (PDT)
In-Reply-To: <1304979845.4865.58.camel@mulgrave.site>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: James Bottomley <James.Bottomley@suse.de>, Pekka Enberg <penberg@cs.helsinki.fi>, Greg Kroah-Hartman <gregkh@suse.de>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Andrew Morton <akpm@linux-foundation.org>, Christoph Lameter <cl@linux.com>, stable@kernel.org, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 9 May 2011, James Bottomley wrote:

> > Great, and if that works out successfully this time around I think we'll 
> > either need to fix each individual arch Kconfig that we know doesn't work 
> > well (at least parisc because of the scheduling issue) so that it at least 
> > enables CONFIG_NUMA implicitly for discontigmem unless CONFIG_BROKEN is 
> > set.
> 
> OK, I confirm that the N_NORMAL_MEMORY patch on its own fixes slub for
> us.  We can revert the mark slub BROKEN in DISCONTIGMEM && !NUMA patch.
> 

Ok, so we need to revert 4a5fa3590f09 ([PARISC] slub: fix panic with 
DISCONTIGMEM) that did not allow CONFIG_SLUB to be set for architectures 
that use DISCONTIGMEM without NUMA support unless they have CONFIG_BROKEN 
set from Linus' tree _and_ from the stable trees.



slub: Revert "[PARISC] slub: fix panic with DISCONTIGMEM"

4a5fa3590f09 ([PARISC] slub: fix panic with DISCONTIGMEM) did not allow 
SLUB to be used on architectures that use DISCONTIGMEM without compiling 
NUMA support without CONFIG_BROKEN also set.

The slub panic that it was intended to prevent is addressed by 
d9b41e0b54fd ([PARISC] set memory ranges in N_NORMAL_MEMORY when onlined) 
on parisc so there is no further slub issues with such a configuration.

This reverts the former commit so that SLUB may now be used on such 
architectures since there haven't been any reports of additional errors.

Cc: James Bottomley <James.Bottomley@suse.de>
Signed-off-by: David Rientjes <rientjes@google.com>
---
 init/Kconfig |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1226,7 +1226,6 @@ config SLAB
 	  per cpu and per node queues.
 
 config SLUB
-	depends on BROKEN || NUMA || !DISCONTIGMEM
 	bool "SLUB (Unqueued Allocator)"
 	help
 	   SLUB is a slab allocator that minimizes cache line usage
