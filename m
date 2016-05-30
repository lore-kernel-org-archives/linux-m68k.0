From: Mel Gorman <mgorman@techsingularity.net>
Subject: Re: BUG: scheduling while atomic: cron/668/0x10c9a0c0 (was: Re: mm,
 page_alloc: avoid looking up the first zone in a zonelist twice)
Date: Mon, 30 May 2016 19:56:16 +0100
Message-ID: <20160530185616.GQ2527__30748.8969564021$1464634607$gmane$org@techsingularity.net>
References: <CAMuHMdV00vJJxoA7XABw+mFF+2QUd1MuQbPKKgkmGnK_NySZpg@mail.gmail.com>
 <20160530155644.GP2527@techsingularity.net>
 <CAMuHMdWioTRo1PGymqCEv+3CoQYH8qnhP2T__orSbMw1q-CBMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdWioTRo1PGymqCEv+3CoQYH8qnhP2T__orSbMw1q-CBMA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>

On Mon, May 30, 2016 at 07:37:39PM +0200, Geert Uytterhoeven wrote:
> > diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> > index dba8cfd0b2d6..f2c1e47adc11 100644
> > --- a/mm/page_alloc.c
> > +++ b/mm/page_alloc.c
> > @@ -3232,6 +3232,9 @@ __alloc_pages_slowpath(gfp_t gfp_mask, unsigned int order,
> >                  * allocations are system rather than user orientated
> >                  */
> >                 ac->zonelist = node_zonelist(numa_node_id(), gfp_mask);
> > +               ac->preferred_zoneref = first_zones_zonelist(ac->zonelist,
> > +                                       ac->high_zoneidx, ac->nodemask);
> > +               ac->classzone_idx = zonelist_zone_idx(ac->preferred_zoneref);
> >                 page = get_page_from_freelist(gfp_mask, order,
> >                                                 ALLOC_NO_WATERMARKS, ac);
> >                 if (page)
> 
> Thanks, but unfortunately it doesn't help.
> 

Thanks. Please try the following instead

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index bb320cde4d6d..557549c81083 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -3024,6 +3024,7 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
 		apply_fair = false;
 		fair_skipped = false;
 		reset_alloc_batches(ac->preferred_zoneref->zone);
+		z = ac->preferred_zoneref;
 		goto zonelist_scan;
 	}
 

-- 
Mel Gorman
SUSE Labs
