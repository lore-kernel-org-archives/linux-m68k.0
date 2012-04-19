From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: [PATCH 1/2] m68k: correct the Atari ALLOWINT definition
Date: Thu, 19 Apr 2012 21:29:58 +1200
Message-ID: <4F8FDB16.3020502@gmail.com>
References: <20367.17904.199202.88993@pilspetsen.it.uu.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pz0-f52.google.com ([209.85.210.52]:38327 "EHLO
	mail-pz0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754271Ab2DSJa4 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 19 Apr 2012 05:30:56 -0400
Received: by dake40 with SMTP id e40so11133025dak.11
        for <linux-m68k@vger.kernel.org>; Thu, 19 Apr 2012 02:30:55 -0700 (PDT)
In-Reply-To: <20367.17904.199202.88993@pilspetsen.it.uu.se>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Mikael Pettersson <mikpe@it.uu.se>
Cc: linux-m68k@vger.kernel.org

Mikael Pettersson wrote:
> The fix is simple: define ALLOWINT as ~0x500 instead.  This makes
> arch_local_irq_enable() consistent with default_idle(), and prevents
> the !irqs_disabled() problems for ipl 3 interrupts.
>
> Tested on Atari running in an Aranym VM.
>   
Tested on my Falcon/CT60.

  Michael

> Signed-off-by: Mikael Pettersson <mikpe@it.uu.se>
> ---
> Since ipl is interpreted by HW as a numerical level, the current
> simple-minded bit masking operations in arch_local_irq_enable(),
> arch_irqs_disabled_flags(), and entry_mm.S aren't really correct,
> but only Atari is affected, and it doesn't seem to hurt in practice.
>
> --- linux-3.4-rc3/arch/m68k/include/asm/entry.h.~1~	2012-03-19 14:06:52.000000000 +0100
> +++ linux-3.4-rc3/arch/m68k/include/asm/entry.h	2012-04-18 22:07:52.000000000 +0200
> @@ -33,8 +33,8 @@
>  
>  /* the following macro is used when enabling interrupts */
>  #if defined(MACH_ATARI_ONLY)
> -	/* block out HSYNC on the atari */
> -#define ALLOWINT	(~0x400)
> +	/* block out HSYNC = ipl 2 on the atari */
> +#define ALLOWINT	(~0x500)
>  #define	MAX_NOINT_IPL	3
>  #else
>  	/* portable version */
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>   
