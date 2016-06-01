From: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: BUG: scheduling while atomic: cron/668/0x10c9a0c0
Date: Wed, 1 Jun 2016 12:01:24 +0200
Message-ID: <574EB274.4030408__7169.49492129988$1464775309$gmane$org@suse.cz>
References: <CAMuHMdV00vJJxoA7XABw+mFF+2QUd1MuQbPKKgkmGnK_NySZpg@mail.gmail.com>
 <20160530155644.GP2527@techsingularity.net> <574E05B8.3060009@suse.cz>
 <20160601091921.GT2527@techsingularity.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20160601091921.GT2527@techsingularity.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Mel Gorman <mgorman@techsingularity.net>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>

On 06/01/2016 11:19 AM, Mel Gorman wrote:
> On Tue, May 31, 2016 at 11:44:24PM +0200, Vlastimil Babka wrote:
>> On 05/30/2016 05:56 PM, Mel Gorman wrote:
>>> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
>>> index dba8cfd0b2d6..f2c1e47adc11 100644
>>> --- a/mm/page_alloc.c
>>> +++ b/mm/page_alloc.c
>>> @@ -3232,6 +3232,9 @@ __alloc_pages_slowpath(gfp_t gfp_mask, unsigned int order,
>>>  		 * allocations are system rather than user orientated
>>>  		 */
>>>  		ac->zonelist = node_zonelist(numa_node_id(), gfp_mask);
>>> +		ac->preferred_zoneref = first_zones_zonelist(ac->zonelist,
>>> +					ac->high_zoneidx, ac->nodemask);
>>> +		ac->classzone_idx = zonelist_zone_idx(ac->preferred_zoneref);
>>>  		page = get_page_from_freelist(gfp_mask, order,
>>>  						ALLOC_NO_WATERMARKS, ac);
>>>  		if (page)
>>>
>>
>> Even if that didn't help for this report, I think it's needed too
>> (except the classzone_idx which doesn't exist anymore?).

But you agree that the hunk above should be merged?

>> And I think the following as well. (the changed comment could be also
>> just deleted).
>>
> 
> Why?
> 
> The comment is fine but I do not see why the recalculation would occur.
> 
> In the original code, the preferred_zoneref for statistics is calculated
> based on either the supplied nodemask or cpuset_current_mems_allowed during
> the initial attempt. It then relies on the cpuset checks in the slowpath
> to encorce mems_allowed but the preferred zone doesn't change.
> 
> With your proposed change, it's possible that the
> preferred_zoneref recalculation points to a zoneref disallowed by
> cpuset_current_mems_sllowed. While it'll be skipped during allocation,
> the statistics will still be against a zone that is potentially outside
> what is allowed.

Hmm that's true and I was ready to agree. But then I noticed  that
gfp_to_alloc_flags() can mask out ALLOC_CPUSET for GFP_ATOMIC. So it's
like a lighter version of the ALLOC_NO_WATERMARKS situation. In that
case it's wrong if we leave ac->preferred_zoneref at a position that has
skipped some zones due to mempolicies?
