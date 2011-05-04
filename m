From: Christoph Lameter <cl@linux.com>
Subject: Re: [git pull] m68k SLUB fix for 2.6.39
Date: Wed, 4 May 2011 08:59:28 -0500 (CDT)
Message-ID: <alpine.DEB.2.00.1105040851090.5495@router.home>
References: <alpine.DEB.2.00.1104282000200.1563@ayla.of.borg> <alpine.DEB.2.00.1104281420140.21665@chino.kir.corp.google.com> <1304026464.2598.36.camel@mulgrave.site> <alpine.DEB.2.00.1104281437010.21665@chino.kir.corp.google.com>
 <BANLkTimT4899xDF99Fj37u_CgnkeBzoFzQ@mail.gmail.com> <alpine.DEB.2.00.1105031538470.27795@chino.kir.corp.google.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp110.prem.mail.ac4.yahoo.com ([76.13.13.93]:43770 "HELO
	smtp110.prem.mail.ac4.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1752961Ab1EDN7c (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 4 May 2011 09:59:32 -0400
In-Reply-To: <alpine.DEB.2.00.1105031538470.27795@chino.kir.corp.google.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: David Rientjes <rientjes@google.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, James Bottomley <James.Bottomley@suse.de>, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Pekka Enberg <penberg@cs.helsinki.fi>, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 3 May 2011, David Rientjes wrote:

> So we're in the unfortunate position where slub works fine for some
> architectures with DISCONTIGMEM and not with others.  It seems like the
> problems originating on James' hppa aren't related to slab allocation at
> all, though, so I'm wondering if we should rethink disallowing SLUB as it
> sits in Linus' tree right now for everything that uses DISCONTINGMEM
> without NUMA and not force them to enable CONFIG_BROKEN?
>
> Perhaps change the kconfig entry to only block slub for parisc instead?

As i have explained multiple times before: This is a generic issue with a
kernel configuration that has DISCONTIGMEM on and NUMA configured off.
Core code in various subsystems makes various assumptions in the !NUMA
case. F.e. page_to_nid(page) == 0. Slub is one of them.

DISCONTIGMEM works fine on !NUMA if it just has a single node which is 0.
But in James' hppa we have multiple nodes and thus a fundamental problem
with node 1 existing in a non NUMA environment. We then have a strange
mixture of NUMA nodes existing in DISCONTIGMEM code and the core code
assuming there are none. This can lead to numerous weird problems.

IMHO A config broken for DISCONTIG and !NUMA for arches that can actually
use multiple DISCONTIG nodes would be the proper thing.
