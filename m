From: Rob Landley <rob@landley.net>
Subject: Re: m68k with mmu doesn't compile after 66d857b08b8c3ed
Date: Sat, 20 Aug 2011 15:14:10 -0500
Message-ID: <4E501592.4080907__8478.89051442525$1313874364$gmane$org@landley.net>
References: <4E5008A1.8070105@landley.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <4E5008A1.8070105@landley.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-kernel@vger.kernel.org, gerg@uclinux.org, linux-m68k@lists.linux-m68k.org, geert@linux-m68k.org

On 08/20/2011 02:18 PM, Rob Landley wrote:
> The m68k build in 3.0 dies with this:
> 
>   CC      arch/m68k/kernel/dma.o
> In file included from arch/m68k/kernel/dma.c:4:
> arch/m68k/kernel/dma_no.c: In function 'dma_sync_single_for_cpu':
> arch/m68k/kernel/dma_no.c:44: error: implicit declaration of function
> 'flush_dcache_range'
> make[1]: *** [arch/m68k/kernel/dma.o] Error 1
> make: *** [arch/m68k/kernel] Error 2
> 
> That file includes <asm/cacheflush.h>, which for m68k is:
> 
> #ifdef __uClinux__
> #include "cacheflush_no.h"
> #else
> #include "cacheflush_mm.h"
> #endif
> 
> The nommu header (cacheflush_no.h) does #define flush_dcache_range(),
> but the clacheflush_mm.h version does not.  I.E. you can only currently
> build m68k for Coldfire, you can no longer build it for an actual m68k.
> 
> (A git log of Linus' tree shows cacheflush_mm.h hasn't been touched
> since 2010, and I pulled earlier today.)
> 
> Rob

I worked around the above problem with this rather disgusting hack:

--- a/arch/m68k/include/asm/cacheflush_mm.h
+++ b/arch/m68k/include/asm/cacheflush_mm.h
@@ -129,6 +129,7 @@ static inline void __flush_page_to_ram(void *vaddr)
 }

 #define ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE 1
+#define flush_dcache_range(page, len)  __flush_cache_all()
 #define flush_dcache_page(page)
__flush_page_to_ram(page_address(page))
 #define flush_dcache_mmap_lock(mapping)                do { } while (0)
 #define flush_dcache_mmap_unlock(mapping)      do { } while (0)

And then it died with:

  AS      arch/m68k/kernel/entry.o
arch/m68k/kernel/entry_no.S: Assembler messages:
arch/m68k/kernel/entry_no.S:46: Error: Unknown operator -- statement
`save_all' ignored
arch/m68k/kernel/entry_no.S:55: Error: Unknown operator -- statement
`save_all' ignored

This is because arch/m68k/include/asm/entry_no.h has this:

#else /* !CONFIG_COLDFIRE */

/*
 * Standard 68k interrupt entry and exit macros.
 */
.macro SAVE_ALL
        clrl    %sp@-                   /* stkadj */
        movel   %d0,%sp@-               /* orig d0 */
        movel   %d0,%sp@-               /* d0 */
        moveml  %d1-%d5/%a0-%a2,%sp@-
.endm

And arch/m68k/include/asm/entry_mm.h does not.

Rob
