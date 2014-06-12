From: Greg Ungerer <gerg@uclinux.org>
Subject: Re: [PATCH V2] m68knommu: refactor mcfgpio.h to check for defines
 instead of CONFIG_ symbols.
Date: Thu, 12 Jun 2014 16:35:13 +1000
Message-ID: <53994A21.6060800@uclinux.org>
References: <201405301905.37911.sfking@fdwdc.com> <538C1E18.8010600@uclinux.org> <201406112000.40962.sfking@fdwdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out1.external.iinet.net.au ([203.59.1.210]:24008
	"EHLO icp-osb-irony-out1.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752757AbaFLGfU (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Thu, 12 Jun 2014 02:35:20 -0400
In-Reply-To: <201406112000.40962.sfking@fdwdc.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Steven King <sfking@fdwdc.com>, linux-m68k@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>

Hi Steven,

On 12/06/14 13:00, Steven King wrote:
> While the various Coldfire parts use several different methods for implementing
> GPIO, we can use the common aspects shared between the different parts as
> defined in the m5xxxsim.h files rather than relying on CONFIG_ symbols.  This
> should reduce the clutter and should make it more portable for other Coldfire
> devices.
>
> V2: leave the blank lines seperating the sections in the headers.
>
> Signed-off-by: Steven King <sfking@fdwdc.com>
> ---
> [snip]
> --- a/arch/m68k/include/asm/m5272sim.h
> +++ b/arch/m68k/include/asm/m5272sim.h
> @@ -135,6 +135,7 @@
>   #define MCFGPIO_PIN_MAX		48
>   #define MCFGPIO_IRQ_MAX		-1
>   #define MCFGPIO_IRQ_VECBASE	-1
> +#define MCFGPIO_PORTSIZE	16
>   
>   /****************************************************************************/
>   #endif	/* m5272sim_h */
> diff --git a/arch/m68k/include/asm/m527xsim.h b/arch/m68k/include/asm/m527xsim.h
> index 1bebbe7..86be5b9 100644
> --- a/arch/m68k/include/asm/m527xsim.h
> +++ b/arch/m68k/include/asm/m527xsim.h
> @@ -193,7 +193,7 @@
>   #define MCFGPIO_PIN_MAX		100
>   #define MCFGPIO_IRQ_MAX		8
>   #define MCFGPIO_IRQ_VECBASE	MCFINT_VECBASE
> -
> +#define MCFGPIO_PORTSIZE	8
>   /*

Can you leave the blank line in here?


> [snip]
> diff --git a/arch/m68k/include/asm/m54xxsim.h b/arch/m68k/include/asm/m54xxsim.h
> index a5fbd17..3f1ecfa 100644
> --- a/arch/m68k/include/asm/m54xxsim.h
> +++ b/arch/m68k/include/asm/m54xxsim.h
> @@ -64,7 +64,7 @@
>   #define MCFGPIO_PIN_MAX		136	/* 128 gpio + 8 eport */
>   #define MCFGPIO_IRQ_MAX		8
>   #define MCFGPIO_IRQ_VECBASE	MCFINT_VECBASE
> -
> +#define MCFGPIO_PORTSIZE	8
>   /*

And here too...

Regards
Greg
