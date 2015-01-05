From: Greg Ungerer <gerg@uclinux.org>
Subject: Re: [PATCH] arch: m68k: 68360: config:  Remove unused function
Date: Mon, 05 Jan 2015 10:29:35 +1000
Message-ID: <54A9DAEF.1020008@uclinux.org>
References: <1420232714-3989-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1420232714-3989-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Hi Rickard,

On 03/01/15 07:05, Rickard Strandqvist wrote:
> Remove the function BSP_set_clock_mmss() that is not used anywhere.
> 
> This was partially found by using a static code analysis program called cppcheck.
> 
> Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>

Thanks, I'll add it to the m68knommu git tree.

Regards
Greg


> ---
>  arch/m68k/68360/config.c |   13 -------------
>  1 file changed, 13 deletions(-)
> 
> diff --git a/arch/m68k/68360/config.c b/arch/m68k/68360/config.c
> index 17ec416..fd1f948 100644
> --- a/arch/m68k/68360/config.c
> +++ b/arch/m68k/68360/config.c
> @@ -106,19 +106,6 @@ void hw_timer_init(irq_handler_t handler)
>    pquicc->timer_tgcr  = tgcr_save;
>  }
>  
> -int BSP_set_clock_mmss(unsigned long nowtime)
> -{
> -#if 0
> -  short real_seconds = nowtime % 60, real_minutes = (nowtime / 60) % 60;
> -
> -  tod->second1 = real_seconds / 10;
> -  tod->second2 = real_seconds % 10;
> -  tod->minute1 = real_minutes / 10;
> -  tod->minute2 = real_minutes % 10;
> -#endif
> -  return 0;
> -}
> -
>  void BSP_reset (void)
>  {
>    local_irq_disable();
> 
