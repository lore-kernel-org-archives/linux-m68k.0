From: David Rientjes <rientjes@google.com>
Subject: Re: [git pull] m68k SLUB fix for 2.6.39
Date: Thu, 28 Apr 2011 14:25:25 -0700 (PDT)
Message-ID: <alpine.DEB.2.00.1104281420140.21665@chino.kir.corp.google.com>
References: <alpine.DEB.2.00.1104282000200.1563@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp-out.google.com ([216.239.44.51]:44666 "EHLO
	smtp-out.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751245Ab1D1VZb (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 28 Apr 2011 17:25:31 -0400
Received: from hpaq1.eem.corp.google.com (hpaq1.eem.corp.google.com [172.25.149.1])
	by smtp-out.google.com with ESMTP id p3SLPUpw005051
	for <linux-m68k@vger.kernel.org>; Thu, 28 Apr 2011 14:25:30 -0700
In-Reply-To: <alpine.DEB.2.00.1104282000200.1563@ayla.of.borg>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, James Bottomley <James.Bottomley@suse.de>, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 28 Apr 2011, Geert Uytterhoeven wrote:

> 	Hi Linus,
> 
> This is the SLUB fix for m68k, which also applies to stable.
> 
> The following changes since commit 8e10cd74342c7f5ce259cceca36f6eba084f5d58:
>   Linus Torvalds (1):
>         Linux 2.6.39-rc5
> 
> are available in the git repository at:
> 
>   master.kernel.org:/pub/scm/linux/kernel/git/geert/linux-m68k.git for-2.6.39
> 
> Michael Schmitz (1):
>       m68k/mm: Set all online nodes in N_NORMAL_MEMORY
> 
>  arch/m68k/mm/motorola.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 

Thanks for pushing this, Geert.

Since 4a5fa3590f09 ([PARISC] slub: fix panic with DISCONTIGMEM) from 
2.6.39-rc4, you can't actually select slub on m68k without CONFIG_ADVANCED 
and CONFIG_SINGLE_MEMORY_CHUNK because it otherwises defaults to 
discontigmem.

James tested hppa64 with my N_NORMAL_MEMORY fix and found that it turned 
an SMP box into UP.  If you've tested slub on m68k without regressions, 
then perhaps you'd like to add a "|| M68K" to CONFIG_SLUB?
