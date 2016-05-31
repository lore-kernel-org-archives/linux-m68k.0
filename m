From: Mel Gorman <mgorman@techsingularity.net>
Subject: Re: BUG: scheduling while atomic: cron/668/0x10c9a0c0 (was: Re: mm,
 page_alloc: avoid looking up the first zone in a zonelist twice)
Date: Tue, 31 May 2016 11:13:56 +0100
Message-ID: <20160531101356.GS2527@techsingularity.net>
References: <CAMuHMdV00vJJxoA7XABw+mFF+2QUd1MuQbPKKgkmGnK_NySZpg@mail.gmail.com>
 <20160530155644.GP2527@techsingularity.net>
 <CAMuHMdWioTRo1PGymqCEv+3CoQYH8qnhP2T__orSbMw1q-CBMA@mail.gmail.com>
 <20160530185616.GQ2527@techsingularity.net>
 <CAMuHMdXCN5LeNCNJ9=B5sGAtdd81JeRNrUMSCOjSL_Bx1-tDvA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdXCN5LeNCNJ9=B5sGAtdd81JeRNrUMSCOjSL_Bx1-tDvA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>

On Tue, May 31, 2016 at 11:28:05AM +0200, Geert Uytterhoeven wrote:
> Hi Mel,
> 
> On Mon, May 30, 2016 at 8:56 PM, Mel Gorman <mgorman@techsingularity.net> wrote:
> > Thanks. Please try the following instead
> >
> > diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> > index bb320cde4d6d..557549c81083 100644
> > --- a/mm/page_alloc.c
> > +++ b/mm/page_alloc.c
> > @@ -3024,6 +3024,7 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
> >                 apply_fair = false;
> >                 fair_skipped = false;
> >                 reset_alloc_batches(ac->preferred_zoneref->zone);
> > +               z = ac->preferred_zoneref;
> >                 goto zonelist_scan;
> >         }
> 
> Thanks a lot, that seems to fix the issue!.
> 
> Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> 
> JFTR, without the fix, sometimes I get a different, but equally obscure, crash
> than the one I posted before:
> 

I'm afraid I don't recognise it. Given the nature of the previous bug
though, I have a vague suspicion that someone is not handling a page
allocation failure properly and goes boom later.

-- 
Mel Gorman
SUSE Labs
