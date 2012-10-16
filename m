From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 4/4 V2] Set ACR1 cache mode depending on kernel configuration.
Date: Tue, 16 Oct 2012 15:27:26 +1000
Message-ID: <507CF03E.1000609@snapgear.com>
References: <1350305680-5441-4-git-send-email-stany.marcel@novasys-ingenierie.com> <1350307377-7459-1-git-send-email-stany.marcel@novasys-ingenierie.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:39916 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753125Ab2JPFYb (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 16 Oct 2012 01:24:31 -0400
In-Reply-To: <1350307377-7459-1-git-send-email-stany.marcel@novasys-ingenierie.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Stany MARCEL <stany.marcel@novasys-ingenierie.com>
Cc: linux-m68k@vger.kernel.org, gerg@uclinux.org

Hi Stany,

On 15/10/12 23:22, Stany MARCEL wrote:
> For coldfire with MMU enabled, data cache did not follow the configuration but
> was configured in writethrough mode.
>
> Signed-off-by: Stany MARCEL <stany.marcel@novasys-ingenierie.com>

Looks good, thanks. Applied without the white space changes.

Regards
Greg


> ---
>
> Changes:
>    V2: This patch is now independant from the previous one
>
>   arch/m68k/include/asm/m54xxacr.h |   10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/arch/m68k/include/asm/m54xxacr.h b/arch/m68k/include/asm/m54xxacr.h
> index 192bbfe..8f932be 100644
> --- a/arch/m68k/include/asm/m54xxacr.h
> +++ b/arch/m68k/include/asm/m54xxacr.h
> @@ -94,14 +94,18 @@
>    *	register region as non-cacheable. And then we map all our RAM as
>    *	cacheable and supervisor access only.
>    */
> -#define ACR0_MODE	(ACR_BA(CONFIG_MBAR)+ACR_ADMSK(0x1000000)+ \
> +#define ACR0_MODE	(ACR_BA(CONFIG_MBAR)+ACR_ADMSK(0x1000000)+	\
>   			 ACR_ENABLE+ACR_SUPER+ACR_CM_OFF_PRE+ACR_SP)
> +#if defined(CONFIG_CACHE_COPYBACK)
>   #define ACR1_MODE	(ACR_BA(CONFIG_RAMBASE)+ACR_ADMSK(CONFIG_RAMSIZE)+ \
> -			 ACR_ENABLE+ACR_SUPER+ACR_SP)
> +			 ACR_ENABLE+ACR_SUPER+ACR_SP+ACR_CM_CP)
> +#else
> +#define ACR1_MODE	(ACR_BA(CONFIG_RAMBASE)+ACR_ADMSK(CONFIG_RAMSIZE)+ \
> +			 ACR_ENABLE+ACR_SUPER+ACR_SP+ACR_CM_WT)
> +#endif
>   #define ACR2_MODE	0
>   #define ACR3_MODE	(ACR_BA(CONFIG_RAMBASE)+ACR_ADMSK(CONFIG_RAMSIZE)+ \
>   			 ACR_ENABLE+ACR_SUPER+ACR_SP)
> -
>   #else
>
>   /*
> --
> 1.7.9.5
>
>
>
>


-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
