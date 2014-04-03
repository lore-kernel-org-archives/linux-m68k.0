From: Greg Ungerer <gregungerer00@gmail.com>
Subject: Re: [PATCH 1/2] Add correct PLL settings for DragonBall VZ.
Date: Thu, 03 Apr 2014 22:41:51 +1000
Message-ID: <533D570F.8080000@gmail.com>
References: <1396449792-5121-1-git-send-email-danieruru@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1396449792-5121-1-git-send-email-danieruru@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Daniel Palmer <danieruru@gmail.com>, linux-m68k@lists.linux-m68k.org

Hi Daniel,

Looks good, nice and small, a single fix.

Can I suggest that you add an arch name to the patch title, so:

   [PATCH 1/2] m68k: Add correct PLL settings for DragonBall VZ

Obviously on this email list we know it is for m68k, but when merged
up stream it makes it much easier from the title to know what it
applies to.


On 03/04/14 00:43, Daniel Palmer wrote:
> Signed-off-by: Daniel Palmer <danieruru@gmail.com>
> ---
>   arch/m68k/platform/68000/head.S | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/arch/m68k/platform/68000/head.S b/arch/m68k/platform/68000/head.S
> index 536ef96..0d00489 100644
> --- a/arch/m68k/platform/68000/head.S
> +++ b/arch/m68k/platform/68000/head.S
> @@ -91,12 +91,18 @@ _start:
>   	movew	#0xe100, 0xfffff900		/* enable */
>   #endif /* DEBUG_HEAD */
>
> -#ifdef CONFIG_PILOT
> +#if defined(CONFIG_PILOT)
>   	movew	#0x2410, 0xfffff200		/* PLLCR */
> +#elif defined(CONFIG_M68VZ328)
> +	movew	#0x2493, 0xfffff200		/* PLLCR */

Would it be cleaner to have a defined value here instead?
This moves the #ifdef'ery to just the PLLCR value, and keeps the
code instructions here cleaner. So something like this at the top of
this head.S:

#if defined(CONFIG_PILOT)
#define PLLCR	0x2410
#elif defined(CONFIG_M68VZ328)
#define PLLCR	0x2493
#else
#define PLLCR	0x2400
#endif

and then just

	movew	#PLLCR, 0xfffff200		/* PLLCR */

Regards
Greg


>   #else
>   	movew	#0x2400, 0xfffff200		/* PLLCR */
>   #endif
> +#if defined(CONFIG_M68VZ328)
> +	movew	#0x0347, 0xfffff202		/* PLLFSR */
> +#else
>   	movew	#0x0123, 0xfffff202		/* PLLFSR */
> +#endif
>   	moveq	#0, %d0
>   	movew	#16384, %d0			/* PLL settle wait loop */
>   _pll_settle:
>
