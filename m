From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [uClinux-dev] [PATCH] m68k: Unify arch/m68k/include/asm/unistd.h
Date: Tue, 03 Feb 2009 16:41:43 +1000
Message-ID: <4987E727.4010708@snapgear.com>
References: <Pine.LNX.4.64.0902011114410.30504@anakin> <498599A6.7080202@snapgear.com> <Pine.LNX.4.64.0902022246320.15898@anakin>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from rex.securecomputing.com ([203.24.151.4]:48223 "EHLO
	cyberguard.com.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751726AbZBCGlr (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 3 Feb 2009 01:41:47 -0500
In-Reply-To: <Pine.LNX.4.64.0902022246320.15898@anakin>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: uClinux development list <uclinux-dev@uclinux.org>, Sam Ravnborg <sam@ravnborg.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>


Hi Geert,

Geert Uytterhoeven wrote:
> On Sun, 1 Feb 2009, Greg Ungerer wrote:
>>       m68k: use non-mmu version of unaligned.h for all m68k
> 
> And another one. The rest looks OK.

I applied that to the m68knommu git tree too.

Thanks
Greg


>>From f94c9409356de883fd343cc7c0f25dd955bcad42 Mon Sep 17 00:00:00 2001
> From: Geert Uytterhoeven <geert@linux-m68k.org>
> Date: Mon, 2 Feb 2009 22:12:36 +0100
> Subject: [PATCH] m68k: Restore correct include guards for <asm/unaligned.h>
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  arch/m68k/include/asm/unaligned.h |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/m68k/include/asm/unaligned.h b/arch/m68k/include/asm/unaligned.h
> index eb1ea4c..019caa7 100644
> --- a/arch/m68k/include/asm/unaligned.h
> +++ b/arch/m68k/include/asm/unaligned.h
> @@ -1,5 +1,5 @@
> -#ifndef _ASM_M68KNOMMU_UNALIGNED_H
> -#define _ASM_M68KNOMMU_UNALIGNED_H
> +#ifndef _ASM_M68K_UNALIGNED_H
> +#define _ASM_M68K_UNALIGNED_H
>  
>  
>  #ifdef CONFIG_COLDFIRE
> @@ -22,4 +22,4 @@
>  
>  #endif
>  
> -#endif /* _ASM_M68KNOMMU_UNALIGNED_H */
> +#endif /* _ASM_M68K_UNALIGNED_H */


-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear, a McAfee Company                  PHONE:       +61 7 3435 2888
825 Stanley St,                             FAX:         +61 7 3891 3630
Woolloongabba, QLD, 4102, Australia         WEB: http://www.SnapGear.com
