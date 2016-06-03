From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: BUG: scheduling while atomic: cron/668/0x10c9a0c0
Date: Fri, 3 Jun 2016 13:52:38 +1000
Message-ID: <20160603135238.2657c1b7@canb.auug.org.au>
References: <CAMuHMdV00vJJxoA7XABw+mFF+2QUd1MuQbPKKgkmGnK_NySZpg@mail.gmail.com>
	<20160530155644.GP2527@techsingularity.net>
	<574E05B8.3060009@suse.cz>
	<20160601091921.GT2527@techsingularity.net>
	<574EB274.4030408@suse.cz>
	<20160602103936.GU2527@techsingularity.net>
	<0eb1f112-65d4-f2e5-911e-697b21324b9f@suse.cz>
	<20160602121936.GV2527@techsingularity.net>
	<20160602114341.e3b974640fc3f8cbcb54898b@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36886 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751138AbcFCDwl (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Thu, 2 Jun 2016 23:52:41 -0400
In-Reply-To: <20160602114341.e3b974640fc3f8cbcb54898b@linux-foundation.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mel Gorman <mgorman@techsingularity.net>, Vlastimil Babka <vbabka@suse.cz>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>, linux-m68k <linux-m68k@vger.kernel.org>

Hi Andrew,

On Thu, 2 Jun 2016 11:43:41 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Thu, 2 Jun 2016 13:19:36 +0100 Mel Gorman <mgorman@techsingularity.net> wrote:
> 
> > > >Signed-off-by: Mel Gorman <mgorman@techsingularity.net>  
> > > 
> > > Acked-by: Vlastimil Babka <vbabka@suse.cz>
> > >   
> > 
> > Thanks.  
> 
> I queued this.  A tested-by:Geert would be nice?
> 
> 
> From: Mel Gorman <mgorman@techsingularity.net>
> Subject: mm, page_alloc: recalculate the preferred zoneref if the context can ignore memory policies

I dumped that into linux-next today as well.

-- 
Cheers,
Stephen Rothwell
