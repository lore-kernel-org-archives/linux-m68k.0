From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH 0171/1529] Fix typo
Date: Sat, 21 May 2016 23:34:56 +1000 (AEST)
Message-ID: <alpine.LNX.2.00.1605212334490.9375@nippy.intranet>
References: <20160521115830.8693-1-andrea.gelmini@gelma.net>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20160521115830.8693-1-andrea.gelmini@gelma.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andrea Gelmini <andrea.gelmini@gelma.net>
Cc: trivial@kernel.org, geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org


On Sat, 21 May 2016, Andrea Gelmini wrote:

> Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
> ---
>  arch/m68k/q40/q40ints.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/m68k/q40/q40ints.c b/arch/m68k/q40/q40ints.c
> index 513f9bb..51991bc 100644
> --- a/arch/m68k/q40/q40ints.c
> +++ b/arch/m68k/q40/q40ints.c
> @@ -287,7 +287,7 @@ static void q40_irq_handler(unsigned int irq, struct pt_regs *fp)
>  	}
>   iirq:
>  	mir = master_inb(IIRQ_REG);
> -	/* should test whether keyboard irq is really enabled, doing it in defhand */
> +	/* should test whether keyboard irq is really enabled, doing it in defend */
>  	if (mir & Q40_IRQ_KEYB_MASK)
>  		do_IRQ(Q40_IRQ_KEYBOARD, fp);
>  
> 

That change doesn't make sense. And "defhand" is not a typo. It refers 
to the default handler q40_defhand() which was removed in commit 
77dda339e512.

-- 
