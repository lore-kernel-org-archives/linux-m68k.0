From: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: BUG: scheduling while atomic: cron/668/0x10c9a0c0
Date: Thu, 2 Jun 2016 14:04:42 +0200
Message-ID: <0eb1f112-65d4-f2e5-911e-697b21324b9f@suse.cz>
References: <CAMuHMdV00vJJxoA7XABw+mFF+2QUd1MuQbPKKgkmGnK_NySZpg@mail.gmail.com>
 <20160530155644.GP2527@techsingularity.net> <574E05B8.3060009@suse.cz>
 <20160601091921.GT2527@techsingularity.net> <574EB274.4030408@suse.cz>
 <20160602103936.GU2527@techsingularity.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20160602103936.GU2527@techsingularity.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Mel Gorman <mgorman@techsingularity.net>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>

On 06/02/2016 12:39 PM, Mel Gorman wrote:
> On Wed, Jun 01, 2016 at 12:01:24PM +0200, Vlastimil Babka wrote:
>>> Why?
>>>
>>> The comment is fine but I do not see why the recalculation would occur.
>>>
>>> In the original code, the preferred_zoneref for statistics is calculated
>>> based on either the supplied nodemask or cpuset_current_mems_allowed during
>>> the initial attempt. It then relies on the cpuset checks in the slowpath
>>> to encorce mems_allowed but the preferred zone doesn't change.
>>>
>>> With your proposed change, it's possible that the
>>> preferred_zoneref recalculation points to a zoneref disallowed by
>>> cpuset_current_mems_sllowed. While it'll be skipped during allocation,
>>> the statistics will still be against a zone that is potentially outside
>>> what is allowed.
>>
>> Hmm that's true and I was ready to agree. But then I noticed  that
>> gfp_to_alloc_flags() can mask out ALLOC_CPUSET for GFP_ATOMIC. So it's
>> like a lighter version of the ALLOC_NO_WATERMARKS situation. In that
>> case it's wrong if we leave ac->preferred_zoneref at a position that has
>> skipped some zones due to mempolicies?
>>
>
> So both options are wrong then. How about this?

I wonder if the original patch we're fixing was worth all this trouble 
(and more
for my compaction priority series :), but yeah this should work.

> ---8<---
> mm, page_alloc: Recalculate the preferred zoneref if the context can ignore memory policies
>
> The optimistic fast path may use cpuset_current_mems_allowed instead of
> of a NULL nodemask supplied by the caller for cpuset allocations. The
> preferred zone is calculated on this basis for statistic purposes and
> as a starting point in the zonelist iterator.
>
> However, if the context can ignore memory policies due to being atomic or
> being able to ignore watermarks then the starting point in the zonelist
> iterator is no longer correct. This patch resets the zonelist iterator in
> the allocator slowpath if the context can ignore memory policies. This will
> alter the zone used for statistics but only after it is known that it makes
> sense for that context. Resetting it before entering the slowpath would
> potentially allow an ALLOC_CPUSET allocation to be accounted for against
> the wrong zone. Note that while nodemask is not explicitly set to the
> original nodemask, it would only have been overwritten if cpuset_enabled()
> and it was reset before the slowpath was entered.
>
> Signed-off-by: Mel Gorman <mgorman@techsingularity.net>

Acked-by: Vlastimil Babka <vbabka@suse.cz>
