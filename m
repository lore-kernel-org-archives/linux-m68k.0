From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: Re: [PATCH] m68k/coldfire: flush cache when creating the signal stack frame
Date: Tue, 30 Jul 2013 16:12:56 +0200
Message-ID: <8366284.jmWuEafP7M@ws-stein>
References: <1370432559-31711-1-git-send-email-alexander.stein@systec-electronic.com> <51F76027.604@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <51F76027.604@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@uclinux.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org

Hello Greg,

On Tuesday 30 July 2013 16:41:43, Greg Ungerer wrote:
> Hi Alexander,
> 
> On 05/06/13 21:42, Alexander Stein wrote:
> > When the signal stack frame is created, it must be flushed in order to
> > make sure the cache fetches the correct data.
> > Without cache flush the icache might pick up old cached data from an older
> > signal stack frame if the signal is raised again very fast.
> > In case of copyback the data cache muist be pushed first, but is untested.
> > 
> > Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
> 
> Sorry for the delay.
> 
> I haven't been able to actually test it, I can't get the M5475 to
> boot in copyback cache mode at the moment. I need to debug it and
> figure out why it is broken.
> 
> For now I think the best is if I push it into for-next on the
> m68knommu git tree.
> 
> (Aside it looks like the clear_cf_icache call here is a bit bogus.
> It takes cache line number args, not virtual addresses - it works
> here because clear_cf_cache invalidates the whole icache... :-(

Yep, the problem is that IIRC coldfire can only invalidate the whole cache, or single cache lines where I think it is impossible to find out which one to invalidate.

Best regards,
Alexander
