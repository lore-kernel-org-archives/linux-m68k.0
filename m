From: Greg Ungerer <gerg@linux-m68k.org>
Subject: Re: [PATCH] m68knommu: Fix typos in Coldfire 5272 DMA debug code
Date: Fri, 10 Feb 2017 22:50:00 +1000
Message-ID: <cb83d128-5012-8902-1094-4f9a1d99c27d@linux-m68k.org>
References: <1486644269-7571-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1486644269-7571-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: uclinux-dev@uclinux.org, linux-m68k@lists.linux-m68k.org

Hi Geert,

On 09/02/17 22:44, Geert Uytterhoeven wrote:
> If DEBUG_DMA is defined:
>
>     include/asm/dma.h: In function ‘set_dma_mode’:
>     include/asm/dma.h:392: error: ‘dmabp’ undeclared (first use in this function)
>     include/asm/dma.h:392: error: (Each undeclared identifier is reported only once
>     include/asm/dma.h:392: error: for each function it appears in.)
>     include/asm/dma.h: In function ‘set_dma_addr’:
>     include/asm/dma.h:423: error: ‘dmawp’ undeclared (first use in this function)
>
> Reported-by: kbuild test robot <fengguang.wu@intel.com>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Acked-by: Greg Ungerer <gerg@linux-m68k.org>

Ultimately I think that all the DEBUG_DMA could just be removed.
There is only 4 cases of it, and it doesn't look particularly
useful as-is.

Regards
Greg


> ---
>  arch/m68k/include/asm/dma.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/m68k/include/asm/dma.h b/arch/m68k/include/asm/dma.h
> index 208b4daa14b334f4..e74b55a690f44eb1 100644
> --- a/arch/m68k/include/asm/dma.h
> +++ b/arch/m68k/include/asm/dma.h
> @@ -389,7 +389,7 @@ static __inline__ void set_dma_mode(unsigned int dmanr, char mode)
>
>  #ifdef DEBUG_DMA
>    printk("%s(%d): dmanr=%d DMR[%x]=%x DIR[%x]=%x\n", __FILE__, __LINE__,
> -         dmanr, (int) &dmalp[MCFDMA_DMR], dmabp[MCFDMA_DMR],
> +	 dmanr, (int) &dmalp[MCFDMA_DMR], dmalp[MCFDMA_DMR],
>  	 (int) &dmawp[MCFDMA_DIR], dmawp[MCFDMA_DIR]);
>  #endif
>  }
> @@ -420,7 +420,7 @@ static __inline__ void set_dma_addr(unsigned int dmanr, unsigned int a)
>
>  #ifdef DEBUG_DMA
>    printk("%s(%d): dmanr=%d DMR[%x]=%x SAR[%x]=%08x DAR[%x]=%08x\n",
> -	__FILE__, __LINE__, dmanr, (int) &dmawp[MCFDMA_DMR], dmawp[MCFDMA_DMR],
> +	__FILE__, __LINE__, dmanr, (int) &dmalp[MCFDMA_DMR], dmalp[MCFDMA_DMR],
>  	(int) &dmalp[MCFDMA_DSAR], dmalp[MCFDMA_DSAR],
>  	(int) &dmalp[MCFDMA_DDAR], dmalp[MCFDMA_DDAR]);
>  #endif
>
