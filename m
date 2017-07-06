From: Greg Ungerer <gerg@linux-m68k.org>
Subject: Re: [PATCH 08/18] m68k: coldfire: Move inline before return type
Date: Thu, 6 Jul 2017 10:45:52 +1000
Message-ID: <cd8c349a-232e-a657-34db-1dc205b35a47@linux-m68k.org>
References: <cover.1499284835.git.joe@perches.com>
 <14db9c166d5b68efa77e337cfe49bb9b29bca3f7.1499284835.git.joe@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <14db9c166d5b68efa77e337cfe49bb9b29bca3f7.1499284835.git.joe@perches.com>
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

On 06/07/17 06:02, Joe Perches wrote:
> Make the code like the rest of the kernel.
> 
> Signed-off-by: Joe Perches <joe@perches.com>

Acked-by: Greg Ungerer <gerg@linux-m68k.org>


> ---
>  arch/m68k/coldfire/intc-simr.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/m68k/coldfire/intc-simr.c b/arch/m68k/coldfire/intc-simr.c
> index 7cf2c156f72d..15c4b7a6e38f 100644
> --- a/arch/m68k/coldfire/intc-simr.c
> +++ b/arch/m68k/coldfire/intc-simr.c
> @@ -35,7 +35,7 @@
>  #define	EINT7	67	/* EDGE Port interrupt 7 */
>  
>  static unsigned int irqebitmap[] = { 0, 1, 4, 7 };
> -static unsigned int inline irq2ebit(unsigned int irq)
> +static inline unsigned int irq2ebit(unsigned int irq)
>  {
>  	return irqebitmap[irq - EINT0];
>  }
> @@ -51,7 +51,7 @@ static unsigned int inline irq2ebit(unsigned int irq)
>  #define	EINT1	65	/* EDGE Port interrupt 1 */
>  #define	EINT7	71	/* EDGE Port interrupt 7 */
>  
> -static unsigned int inline irq2ebit(unsigned int irq)
> +static inline unsigned int irq2ebit(unsigned int irq)
>  {
>  	return irq - EINT0;
>  }
> 
