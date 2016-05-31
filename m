From: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: BUG: scheduling while atomic: cron/668/0x10c9a0c0 (was: Re: mm,
 page_alloc: avoid looking up the first zone in a zonelist twice)
Date: Tue, 31 May 2016 23:44:24 +0200
Message-ID: <574E05B8.3060009__25904.3487058536$1464731282$gmane$org@suse.cz>
References: <CAMuHMdV00vJJxoA7XABw+mFF+2QUd1MuQbPKKgkmGnK_NySZpg@mail.gmail.com>
 <20160530155644.GP2527@techsingularity.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20160530155644.GP2527@techsingularity.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Mel Gorman <mgorman@techsingularity.net>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>

On 05/30/2016 05:56 PM, Mel Gorman wrote:
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index dba8cfd0b2d6..f2c1e47adc11 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -3232,6 +3232,9 @@ __alloc_pages_slowpath(gfp_t gfp_mask, unsigned int order,
>  		 * allocations are system rather than user orientated
>  		 */
>  		ac->zonelist = node_zonelist(numa_node_id(), gfp_mask);
> +		ac->preferred_zoneref = first_zones_zonelist(ac->zonelist,
> +					ac->high_zoneidx, ac->nodemask);
> +		ac->classzone_idx = zonelist_zone_idx(ac->preferred_zoneref);
>  		page = get_page_from_freelist(gfp_mask, order,
>  						ALLOC_NO_WATERMARKS, ac);
>  		if (page)
> 

Even if that didn't help for this report, I think it's needed too
(except the classzone_idx which doesn't exist anymore?).

And I think the following as well. (the changed comment could be also
just deleted).


diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index f8f3bfc435ee..0a8d8e2bf331 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -3808,7 +3808,7 @@ __alloc_pages_nodemask(gfp_t gfp_mask, unsigned
int order,
        /* Dirty zone balancing only done in the fast path */
        ac.spread_dirty_pages = (gfp_mask & __GFP_WRITE);

-       /* The preferred zone is used for statistics later */
+       /* The preferred zone is crucial for get_page_from_freelist */
        ac.preferred_zoneref = first_zones_zonelist(ac.zonelist,
                                        ac.high_zoneidx, ac.nodemask);
        if (!ac.preferred_zoneref) {
@@ -3832,8 +3832,11 @@ __alloc_pages_nodemask(gfp_t gfp_mask, unsigned
int order,
         * Restore the original nodemask if it was potentially replaced with
         * &cpuset_current_mems_allowed to optimize the fast-path attempt.
         */
-       if (cpusets_enabled())
+       if (cpusets_enabled()) {
                ac.nodemask = nodemask;
+               ac.preferred_zoneref = first_zones_zonelist(ac.zonelist,
+                                       ac.high_zoneidx, ac.nodemask);
+       }
        page = __alloc_pages_slowpath(alloc_mask, order, &ac);
