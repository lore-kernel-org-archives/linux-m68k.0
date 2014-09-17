From: Greg Ungerer <gregungerer@westnet.com.au>
Subject: Re: [PATCH 1/1 linux-next] m68k/coldfire: remove second asm/mcfclk.h
 inclusion in m54xx.c
Date: Wed, 17 Sep 2014 11:25:47 +1000
Message-ID: <5418E31B.9020103@westnet.com.au>
References: <1410893014-32665-1-git-send-email-fabf@skynet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1410893014-32665-1-git-send-email-fabf@skynet.be>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Fabian Frederick <fabf@skynet.be>, linux-kernel@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org

Hi Fabian,

On 17/09/14 04:43, Fabian Frederick wrote:
> asm/mcfclk.h was included twice.
> 
> Signed-off-by: Fabian Frederick <fabf@skynet.be>

Looks good, thanks. I have added it to the for-next branch
of the m68knommu git tree.

Regards
Greg


> ---
>  arch/m68k/coldfire/m54xx.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/m68k/coldfire/m54xx.c b/arch/m68k/coldfire/m54xx.c
> index eec7f71..075aaab 100644
> --- a/arch/m68k/coldfire/m54xx.c
> +++ b/arch/m68k/coldfire/m54xx.c
> @@ -23,7 +23,6 @@
>  #include <asm/mcfuart.h>
>  #include <asm/mcfclk.h>
>  #include <asm/m54xxgpt.h>
> -#include <asm/mcfclk.h>
>  #ifdef CONFIG_MMU
>  #include <asm/mmu_context.h>
>  #endif
> 
