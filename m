From: Mel Gorman <mgorman@techsingularity.net>
Subject: Re: BUG: scheduling while atomic: cron/668/0x10c9a0c0
Date: Fri, 3 Jun 2016 17:46:25 +0100
Message-ID: <20160603164625.GB2527@techsingularity.net>
References: <20160601091921.GT2527@techsingularity.net>
 <574EB274.4030408@suse.cz>
 <20160602103936.GU2527@techsingularity.net>
 <0eb1f112-65d4-f2e5-911e-697b21324b9f@suse.cz>
 <20160602121936.GV2527@techsingularity.net>
 <20160602114341.e3b974640fc3f8cbcb54898b@linux-foundation.org>
 <CAMuHMdX07bUE+3QTbFmbxrjkXPBzFLoLQbupL=WAbLXTuN+6Ww@mail.gmail.com>
 <20160603084142.GY2527@techsingularity.net>
 <CAMuHMdWPsx0r4HMYy+prhnQaW0bkrm+FHOyzb8vBO7S70FQOog@mail.gmail.com>
 <20160603093518.09699af30ba0555847511487@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160603093518.09699af30ba0555847511487@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Vlastimil Babka <vbabka@suse.cz>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>, linux-m68k <linux-m68k@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

On Fri, Jun 03, 2016 at 09:35:18AM -0700, Andrew Morton wrote:
> On Fri, 3 Jun 2016 11:00:30 +0200 Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> 
> > In the mean time my tests completed successfully with both patches applied.
> 
> Can we please identify "both patches" with specificity?  I have the
> below one.
> 

mm, page_alloc: Reset zonelist iterator after resetting fair zone allocation policy
mm, page_alloc: Recalculate the preferred zoneref if the context can ignore memory policies

-- 
Mel Gorman
SUSE Labs
